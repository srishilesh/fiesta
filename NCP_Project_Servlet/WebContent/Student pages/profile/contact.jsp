<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Profile - Contact</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
        <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
        <!-- <style type="text/css">
          .college_mail:invalid, .primary_mail:invalid, 
          .primary_phone:invalid, 
          .alternate_phone:invalid, 
          .media1:invalid, .media2:invalid, .media3:invalid
           {
            border: 1px solid #ff4d4d;
           }
          
        </style> -->
        <!-- After connecting backend, show red boxes only after submit button gets clicked -->
          <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script src="../../js/studentPageNavbar.js"></script>
    </head>

    <body class="has-background-info">

      <div id="nav-placeholder"></div>


    <!--CONTACT STUDENTS -->
    <section id="contact" class="section container is-centered">
      <div class="notification" style="margin: 3% 5% 0.1% 5%;"><h2 class="subtitle is-2"> Contact details</h2>

<form name="contact_details" method="post" action="<%=request.getContextPath() %>/addContact">

<div class="field is-horizontal">
<div class="field-label is-normal">
  <label class="label">E-mail</label>
</div>
<div class="field-body">

  <div class="field">
    <p class="control is-expanded has-icons-left ">
      <input class="input primary_mail" name="email" type="email" 
      placeholder="Primary E-mail" required>
      <span class="icon is-small is-left">
        <i class="fas fa-envelope"></i>
      </span>
    </p>
  </div>
</div>
</div>

<div class="field is-horizontal">
<div class="field-label is-normal">
  <label class="label">Contact number</label>
</div>
<div class="field-body">

  <div class="field">
    <div class="field has-addons">
      <p class="control">
        <a class="button is-static">
          +91
        </a>
      </p>
      <p class="control is-expanded">
        <input class="input primary_phone" name="phone" type="tel" 
        placeholder="Your phone number[10 digits]" 
        pattern="[0-9]{9}[0-9]{1}" maxlength="10" required>
      </p>
    </div>
    <p class="help">Do not enter the first zero. Enter ten digits number.</p>
  </div>

</div>
</div>


<div class="field is-horizontal">
<div class="field-label is-normal">
  <label class="label">Social Media #1</label>
</div>
<div class="field-body">

  <div class="field">
    <p class="control is-expanded has-icons-left">
          <input class="input media1" name="media1" type="url" 
          placeholder="copy & paste the link of your profile"
          required>
      <span class="icon is-small is-left">
        <i class="fas fa-user-circle"></i>
      </span>
    </p>
  </div>
</div>
</div>
<div class="field is-horizontal">
<div class="field-label is-normal">
  <label class="label">Social Media #2</label>
</div>
<div class="field-body">

  <div class="field">
    <p class="control is-expanded has-icons-left">
          <input class="input media2" name="media2" type="url" 
          placeholder="copy & paste the link of your profile"
          >
      <span class="icon is-small is-left">
        <i class="fas fa-user-circle"></i>
      </span>
    </p>
  </div>
</div>
</div>


<div class="field is-horizontal">
<div class="field-label">
  <!-- Left empty for spacing -->
</div>
        <div class="field" id="create-container">
        </div>
        <div class="field is-grouped is-grouped-right">
          <p class="control">
            <input type="submit" class="button is-link is-medium" value="Submit">
          </p>
          <p class="control">
            <input type="reset" class="button is-link is-medium" value="Reset">
          </p>
        </div>
</div>



      </div>
  </section>
    <footer class="footer">
      <div class="container">
        <div class="columns">
          <div class="column is-4 has-text-centered is-hidden-tablet"><a class="title is-3" href="#">fiesta</a></div>
          <div class="column is-4">
            <div class="level"><a class="level-item" href="#">About us</a></div>
          </div>
          <div class="column is-4 has-text-centered is-hidden-mobile"><a class="title is-3" href="#">fiesta</a></div>
          <div class="column is-4 has-text-right">
            <div class="level"><a class="level-item" href="../Contact Us/contactus.html">Contact us</a></div>
          </div>
        </div>
        
        <p class="subtitle has-text-centered is-6">&copy; 2020 Fiesta. All rights reserved.</p>
        
        <!-- Amrita LOGO -->
        <!--
        <div class="has-text-centered">
            <figure class="image is-128x128 is-inline-block"><img class="level-item" src="avv.jpg">
            </figure>
        </div>
         -->
      </div>
    </footer>
    </body>
</html>




