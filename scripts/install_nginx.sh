<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Multipage Website</title>
  <style>
    /* General Styles */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      background-color: #f4f4f4;
    }

    /* Navigation Bar */
    nav {
      background-color: #333;
      color: #fff;
      padding: 15px;
      text-align: center;
    }

    nav a {
      color: #fff;
      text-decoration: none;
      font-size: 18px;
      margin: 0 15px;
    }

    nav a:hover {
      color: #f4f4f4;
    }

    /* Content Sections */
    .content-section {
      display: none; /* Hide sections by default */
      padding: 20px;
      text-align: center;
    }

    /* Display active page */
    .active {
      display: block;
    }

    /* Footer */
    footer {
      background-color: #333;
      color: #fff;
      text-align: center;
      padding: 10px;
      margin-top: 20px;
    }

    /* Responsive Design */
    @media screen and (max-width: 768px) {
      nav a {
        display: block;
        margin: 10px 0;
      }
    }

    /* Add some styling for the form in the Contact section */
    .contact-form input, .contact-form textarea {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .contact-form button {
      padding: 10px 20px;
      background-color: #333;
      color: white;
      border: none;
      cursor: pointer;
    }

    .contact-form button:hover {
      background-color: #555;
    }
  </style>
</head>
<body>

  <!-- Navigation Bar -->
  <nav>
    <a href="javascript:void(0);" onclick="showPage('home')">Home</a>
    <a href="javascript:void(0);" onclick="showPage('about')">About</a>
    <a href="javascript:void(0);" onclick="showPage('contact')">Contact</a>
  </nav>

  <!-- Home Section -->
  <div id="home" class="content-section active">
    <h1>Welcome to the Home Page</h1>
    <p>This is the home page of our multipage website built using a single HTML file.</p>
    <p>Click on the navigation links above to switch between pages.</p>
  </div>

  <!-- About Section -->
  <div id="about" class="content-section">
    <h1>About Us</h1>
    <p>We are a team of developers passionate about creating simple websites and web applications.</p>
    <p>Learn more about our work on this page.</p>
  </div>

  <!-- Contact Section -->
  <div id="contact" class="content-section">
    <h1>Contact Us</h1>
    <p>You can reach us at <a href="mailto:contact@example.com">contact@example.com</a>.</p>
    <p>Feel free to ask any questions!</p>

    <!-- Contact Form -->
    <div class="contact-form">
      <input type="text" id="name" placeholder="Your Name" />
      <input type="email" id="email" placeholder="Your Email" />
      <textarea id="message" placeholder="Your Message"></textarea>
      <button onclick="sendMessage()">Send Message</button>
    </div>
  </div>

  <!-- Footer -->
  <footer>
    <p>&copy; 2025 My Multipage Website</p>
  </footer>

  <script>
    // Function to display the active page and hide others
    function showPage(pageId) {
      // Hide all pages
      const pages = document.querySelectorAll('.content-section');
      pages.forEach(page => {
        page.classList.remove('active');
      });

      // Show the selected page
      const activePage = document.getElementById(pageId);
      activePage.classList.add('active');
    }

    // Function to handle form submission
    function sendMessage() {
      const name = document.getElementById('name').value;
      const email = document.getElementById('email').value;
      const message = document.getElementById('message').value;

      if (name && email && message) {
        alert(`Message sent!\nName: ${name}\nEmail: ${email}\nMessage: ${message}`);
      } else {
        alert('Please fill in all fields.');
      }
    }
  </script>

</body>
</html>
