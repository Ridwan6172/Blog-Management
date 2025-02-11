# Blog-Management
This project is a Post Management System built using Flask and MySQL. The system allows users to create, manage, and display posts, with a focus on providing an admin interface for effective control over the content.

Key Features:
User Authentication:

Users can register and log in using their credentials. Different roles (e.g., admin, regular users) are supported to define permissions.
Admin users have special access to manage posts and users.
Post Creation & Management:

Users can create new posts, which include a title, content, and optional image.
Posts submitted by regular users are marked as "pending" and need admin review before being published.
Admins have the ability to approve, reject, and delete posts.
Admin Dashboard:

The admin dashboard provides an interface to manage users, view submitted posts, and publish or unpublish them.
Admins can view post details, including the title and content, and take action based on the status of the post.
Image Upload:

Users can attach images to their posts, with functionality to ensure the images are stored correctly and displayed on the platform.
Post Visibility:

Published posts are visible to all users, while posts marked as "pending" are only visible to admins.
Delete Functionality:

Admin users can delete posts from the system if necessary, ensuring easy content management and moderation.
Responsive Design:

The system is designed to be responsive, ensuring it works seamlessly across different devices and screen sizes.
Technologies Used:
Flask: A lightweight Python framework used for building the web application.
MySQL: A relational database management system used for storing user data and post information.
HTML/CSS/JavaScript: Frontend technologies used to design and structure the user interface.
Werkzeug Security: For securely handling user authentication and password hashing.
Bootstrap: A front-end framework used to make the application mobile-responsive and visually appealing.
Benefits:
Efficient Content Moderation: With an admin-controlled dashboard, posts can be easily reviewed, published, or deleted.
Role-based Access Control: Different user roles (admin, regular user) ensure proper access control for post management.
User-friendly Interface: The application allows users to create and manage their posts without needing technical knowledge.
This project is a simple yet powerful post management system that can be expanded in the future with features like categories, post analytics, and advanced image management.
