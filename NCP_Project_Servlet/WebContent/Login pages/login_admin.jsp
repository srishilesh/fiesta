<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Login</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.0/css/bulma.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="admin_style.css">
</head>

<body>
  <nav class="navbar" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
      <a class="navbar-item" href="#">
        <img src="../Logo/Fiesta.PNG" width="112" height="28">
      </a>

      <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false"
        data-target="navbarBasicExample">
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </a>
    </div>

    <div id="navbarBasicExample" class="navbar-menu">
      <div class="navbar-start">
        <a class="navbar-item">
          About Us
        </a>

        <a class="navbar-item" href="../Contact Us/contactus.html">
          Contact Us
        </a>

        <a class="navbar-item" href="../Login pages/admin_login.html">
          Admin Login
        </a>
      </div>

      <div class="navbar-end">
        <div class="navbar-item">
          <div class="buttons">
            <a class="button is-primary" href="../Student Registration Page/registration page.html">
              <strong>Sign up</strong>
            </a>
            <a class="button is-light" href="../Login pages/student_login.html">
              Log in
            </a>
          </div>
        </div>
      </div>
    </div>
  </nav>

  <div id="background-image"></div>
  <div id="login-form-container">
    <div class="card" style="width: 400px">
      <div class="card-image">
        <figure class="image ">
          <img src="../Logo/Fiesta.PNG" alt="Placeholder image">
        </figure>
      </div>
      <div class="card-content">
        <div class="media">
          <div class="is-size-4 has-text-centered">Admin Login</div>
        </div>
        <form method="post" action="<%= request.getContextPath() %>/login">
        	<div class="content">
	          <div class="field">
	            <p class="control has-icons-left has-icons-right">
	              <input class="input" type="email" id="email" name="email" placeholder="Email">
	              <span class="icon is-small is-left">
	                <span class="material-icons">alternate_email</span>
	              </span>
	              <span class="icon is-required is-small is-right ">
	                <i class="fas fa-check"></i>
	              </span>
	            </p>
	          </div>
	          <div class="field">
	            <p class="control has-icons-left">
	              <input class="input" type="password" id="password" name="password" placeholder="Password">
	              <span class="icon is-required is-small is-left ">
	                <span class="material-icons">lock</span>
	              </span>
	            </p>
	          </div>
	          <div class="field">
	            <button class="button is-fullwidth is-rounded is-success" onclick="validateSubmission()">Login</button>
	          </div>
	        </div>
        </form>
      </div>
    </div>
    <script>
      function validateSubmission() {
        var emailadd = document.getElementById('email')
        var password = document.getElementById('password')
        if (validateEmailAddress(email)) {
          if (validatePass(password)) {
            alert('Logged In')
          }
        }
      }

      function validateEmailAddress(email) {
        var re =
          /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        if (!email.value.match(re)) {
          alert("Invalid Email address")
          email.focus()
          return false
        }
        return true
      }

      function validatePass(password) {
        var reg = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/
        if (!password.value.match(reg)) {
          alert("Invalid Password")
          password.focus()
          return false
        }
        return true
      }
    </script>
</body>

</html>