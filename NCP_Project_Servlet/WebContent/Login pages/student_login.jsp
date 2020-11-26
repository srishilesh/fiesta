<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Student Login</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.0/css/bulma.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="student_style.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script src="../js/landingPageNavbar.js"></script>
</head>	
<body>
  <div id="nav-placeholder"></div>

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
          <div class="is-size-4 has-text-centered">Student Login</div>
        </div>
        <div class="content">
          <div class="field">
            <p class="control has-icons-left has-icons-right">
              <input class="input" type="email" placeholder="Email">
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
              <input class="input" type="password" placeholder="Password">
              <span class="icon is-required is-small is-left ">
                <span class="material-icons">lock</span>
              </span>
            </p>
          </div>
          <div class="field">
            <button class="button is-fullwidth is-rounded is-success">Login</button>
          </div>
        </div>
      </div>
  </div>
</body>
</html>