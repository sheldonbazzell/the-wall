from flask import Flask, request, redirect, render_template, session, flash
import re
from mysqlconnection import MySQLConnector
from flask.ext.bcrypt import Bcrypt

app = Flask(__name__)
bcrypt = Bcrypt(app)
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
PASSWORD_REGEX = re.compile('\d.*[A-Z]|[A-Z].*\d')
app.secret_key = 'TheWallAndItsSecrets'
mysql = MySQLConnector(app,'the_wall')


@app.route('/')
def index():
	return render_template('index.html')


@app.route('/register', methods=['POST'])
def create():
	valid = True
	if len(request.form['first_name']) < 2:
		flash(u'First name is required', 'message')
		valid = False
	if len(request.form['last_name']) < 2:
		flash(u"Last name is required" ,'message')
		return redirect('/')
	if not EMAIL_REGEX.match(request.form['email']):
		flash(u"Please enter a valid email", 'message')
		return redirect('/')
	if len(request.form['password']) < 8:
		flash(u"Password must be 8+ characters \
			and contain 1 uppercase letter and 1 number.", 'message')
		return redirect('/')
	if not PASSWORD_REGEX.match(request.form['password']):
		flash(u"Password must be 8+ characters \
			and contain 1 uppercase letter and 1 number.", 'message')
		return redirect('/')
	if not valid: 
		return redirect('/')
	first_name = request.form['first_name']
	last_name = request.form['last_name']
	email = request.form['email']
	password = request.form['password']
	pw_hash = bcrypt.generate_password_hash(password)
	insert_query = "INSERT INTO users \
	(first_name, last_name, email, pw_hash, \
	created_at, updated_at) VALUES (:first_name, \
	:last_name, :email, :pw_hash, NOW(), NOW())"
	query_data = {
				'first_name': first_name,
				'last_name': last_name,
				'email': email,
				'pw_hash': pw_hash
				}
	user_id = mysql.query_db(insert_query, query_data)
	session['user_id'] = int(user_id)
	session['first_name'] = first_name
	return redirect('/wall')


@app.route('/login', methods=['POST'])
def login():
	email = request.form['email']
	password = request.form['password']
	user_query = "SELECT * FROM users WHERE email = :email LIMIT 1"
	query_data = {'email': email}
	user = mysql.query_db(user_query, query_data)
	if user == []:
		flash(u'Invalid email.', 'error')
		return redirect('/')
	if bcrypt.check_password_hash(user[0]['pw_hash'], password):
		session['user_id'] = int(user[0]['id'])
		session['first_name'] = user[0]['first_name']
		return redirect('/wall')
	else:
		flash(u'Invalid password.', 'error')
		return redirect('/')


@app.route('/logout')
def logout():
	session.pop('user_id', None)
	session.pop('first_name', None)
	return redirect('/')


@app.route('/msg', methods=['POST'])
def msg():
	if len(request.form['message']) >= 1:
		message = request.form['message']
		insert_query = "INSERT INTO messages \
		(user_id, message, created_at, updated_at) \
		VALUES (:user_id, :message, NOW(), NOW())"
		data = {
					'user_id': session['user_id'],
					'message': message
					}
		mysql.query_db(insert_query, data)
	return redirect('/wall')


@app.route('/comment', methods=['POST'])
def comment():
	if len(request.form['comment']) < 1:
		return redirect('/wall')
	message_id = request.form['message_id']
	comment = request.form['comment']
	insert_query = "INSERT INTO comments \
	(user_id, message_id, comment, created_at, \
	updated_at) VALUES (:user_id, :message_id, \
	:comment, NOW(), NOW())"
	data = {
				'user_id': session['user_id'],
				'message_id': message_id,
				'comment': comment
				}
	mysql.query_db(insert_query, data)
	return redirect('/wall')


@app.route('/msg/delete/<id>', methods=['GET'])
def delete(id):
	del_query = "DELETE FROM comments \
	WHERE comments.message_id = :id"
	data = {'id': id}
	mysql.query_db(del_query, data)
	del_query = "DELETE FROM messages \
	WHERE messages.id = :id"
	data = {'id': id}
	mysql.query_db(del_query, data)
	return redirect('/wall')


@app.route('/wall', methods=['GET'])
def wall():
	if 'user_id' in session and 'first_name' in session:
		query_msg = "SELECT users.first_name, \
		users.last_name, users.id AS creator_id, \
		messages.id, messages.message, \
		DATE_FORMAT(messages.created_at, '%M %e %Y') \
		AS created_at FROM messages JOIN users \
		ON users.id = messages.user_id \
		ORDER BY messages.created_at DESC"
		messages = mysql.query_db(query_msg)
		query_cmt = "SELECT users.first_name, \
		users.last_name, users.id AS creator_id, \
		comments.id, comments.message_id, \
		comments.comment, DATE_FORMAT(comments.created_at, \
		'%M %e %Y') AS created_at FROM comments JOIN users \
		ON users.id = comments.user_id \
		ORDER BY comments.created_at"
		comments = mysql.query_db(query_cmt)
		return render_template('profile.html', \
		messages=messages, comments=comments)
	return redirect('/')


app.run(debug=True)