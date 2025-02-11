from flask import Flask, render_template, request, redirect, session, flash
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash, check_password_hash
import MySQLdb.cursors

app = Flask(__name__, static_url_path='/static')

app.secret_key = 'your_secret_key'

# MySQL Configurations
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''  # Add your MySQL password
app.config['MYSQL_DB'] = 'user_db'

mysql = MySQL(app)

# Home Route
def is_logged_in():
    return 'loggedin' in session

def is_admin():
    return session.get('role') == 'admin'

@app.route('/')
def home():
    if is_logged_in():
        return redirect('/dashboard')
    return render_template('home.html')

# Registration Route
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = generate_password_hash(request.form['password'])
        role = request.form.get('role', 'user')
        cursor = mysql.connection.cursor()
        cursor.execute('INSERT INTO users (username, email, password, role) VALUES (%s, %s, %s, %s)', (username, email, password, role))
        mysql.connection.commit()
        cursor.close()
        return redirect('/login')
    return render_template('register.html')

# Login Route
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM users WHERE email = %s', (email,))
        user = cursor.fetchone()
        cursor.close()

        if user and check_password_hash(user['password'], password):
            session['loggedin'] = True
            session['id'] = user['id']
            session['username'] = user['username']
            session['role'] = user['role']

            # Redirect based on role
            if user['role'] == 'admin':
                return redirect('/admin')
            else:
                return redirect('/dashboard')

        # ✅ The "else" should be properly aligned with "if user and check_password_hash"
        flash('Invalid email or password!', 'danger')

    return render_template('login.html')



# Dashboard Route
@app.route('/dashboard')
def dashboard():
    if not is_logged_in():
        return redirect('/login')
    
    return render_template('dashboard.html')


# Admin Dashboard Route
# Admin Dashboard Route with Add User Option
@app.route('/admin', methods=['GET', 'POST'])  # Ensure this route supports both GET and POST
def admin():
    if not is_logged_in() or not is_admin():
        return redirect('/login')

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    # Handle adding new user
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = generate_password_hash(request.form['password'])
        role = request.form.get('role', 'user')  # Default role is 'user'
        
        cursor.execute(
            'INSERT INTO users (username, email, password, role) VALUES (%s, %s, %s, %s)', 
            (username, email, password, role)
        )
        mysql.connection.commit()

    # Count unseen posts
    cursor.execute('SELECT COUNT(*) AS new_posts FROM posts WHERE notification = 0')
    new_posts = cursor.fetchone()['new_posts']

    # Fetch all users
    cursor.execute('SELECT * FROM users')
    users = cursor.fetchall()

    cursor.close()

    return render_template('admin.html', users=users, new_posts=new_posts)



# Delete User Route
@app.route('/delete_user/<int:user_id>')
def delete_user(user_id):
    if not is_logged_in() or not is_admin():
        return redirect('/login')
    cursor = mysql.connection.cursor()
    cursor.execute('DELETE FROM users WHERE id = %s', (user_id,))
    mysql.connection.commit()
    cursor.close()
    return redirect('/admin')

# Edit User Route
@app.route('/edit_user/<int:user_id>', methods=['GET', 'POST'])
def edit_user(user_id):
    if not is_logged_in() or not is_admin():
        return redirect('/login')
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        role = request.form['role']
        cursor.execute('UPDATE users SET username = %s, email = %s, role = %s WHERE id = %s', (username, email, role, user_id))
        mysql.connection.commit()
        cursor.close()
        return redirect('/admin')
    cursor.execute('SELECT * FROM users WHERE id = %s', (user_id,))
    user = cursor.fetchone()
    cursor.close()
    return render_template('edit_user.html', user=user)

import os
from werkzeug.utils import secure_filename

# Define allowed image extensions and upload folder
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}
UPLOAD_FOLDER = 'static/uploads'

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Function to check if the file is an allowed image type
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

import os
from werkzeug.utils import secure_filename

ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}
UPLOAD_FOLDER = 'static/uploads'

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/create_post', methods=['GET', 'POST'])
def create_post():
    if not is_logged_in():
        return redirect('/login')
    
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']
        author_id = session['id']
        author_name = session['username']
        
        image = request.files.get('image')  # Get image from the form

        image_filename = None
        if image and allowed_file(image.filename):
            # Secure the filename
            image_filename = secure_filename(image.filename)
            # Save the file
            image.save(os.path.join(app.config['UPLOAD_FOLDER'], image_filename))
            print(f"Image uploaded: {image_filename}")  # Debug print
        
        # Insert post into the database, including image filename if available
        cursor = mysql.connection.cursor()
        cursor.execute(
            'INSERT INTO posts (title, content, author_id, author_name, status, notification, image) VALUES (%s, %s, %s, %s, %s, %s, %s)',
            (title, content, author_id, author_name, "pending", 0, image_filename)
        )
        mysql.connection.commit()
        cursor.close()
        
        flash('Post submitted for admin review!', 'info')
        return redirect('/dashboard')

    return render_template('create_post.html')




@app.route('/admin/posts')
def admin_posts():
    if not is_logged_in() or not is_admin():
        return redirect('/login')

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM posts')
    posts = cursor.fetchall()
     # Mark all new posts as "seen"
    cursor.execute('UPDATE posts SET notification = 1 WHERE notification = 0')
    mysql.connection.commit()
    
    cursor.close()

    return render_template('admin_posts.html', posts=posts)

@app.route('/publish_post/<int:post_id>')
def publish_post(post_id):
    if not is_logged_in() or not is_admin():
        return redirect('/login')

    cursor = mysql.connection.cursor()
    cursor.execute('UPDATE posts SET status = "published" WHERE id = %s', (post_id,))
    mysql.connection.commit()
    cursor.close()

    return redirect('/admin/posts')

@app.route('/unpublish_post/<int:post_id>')
def unpublish_post(post_id):
    if not is_logged_in() or not is_admin():
        return redirect('/login')

    cursor = mysql.connection.cursor()
    cursor.execute('UPDATE posts SET status = "pending" WHERE id = %s', (post_id,))
    mysql.connection.commit()
    cursor.close()

    return redirect('/admin/posts')



@app.route('/blog')
def blog():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM posts WHERE status = "published" ORDER BY created_at DESC')
    posts = cursor.fetchall()
    cursor.close()

    return render_template('blog.html', posts=posts)


@app.route('/post/<int:post_id>')
def post_detail(post_id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM posts WHERE id = %s', (post_id,))
    post = cursor.fetchone()
    cursor.close()

    return render_template('post_detail.html', post=post)



# Logout Route
@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')

if __name__ == '__main__':
    app.run(debug=True)
