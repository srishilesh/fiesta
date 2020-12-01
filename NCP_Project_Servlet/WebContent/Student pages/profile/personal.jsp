<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Profile - Personal</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
        <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
         <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
          
  <script>
  $(function(){
  	  $("#nav-placeholder").load("<%=request.getContextPath()%>/Navbar/studentPageNavbar.jsp");
  	});
  </script>
        <!-- <style type="text/css">
          .name:invalid, .stu_id:invalid, .reg_no:invalid, .year_of_stud:invalid,
          .dept:invalid, .dob:invalid, .no_of_skills:invalid, .about_myself:invalid {
            border: 1px solid #ff4d4d;
                  }
          textarea:invalid {
            border: 1px solid #ff4d4d;
                  }
        </style> -->
        <!-- After connecting backend, show red boxes only after submit button gets clicked -->
        <script>
          function addFields() {
            debugger;
            var number = document.getElementsByName("no_of_skills")[0].value;
            var container = document.getElementById("create-container");
            container.innerHTML = '';
            for (i = 0; i < number; i++) {
                    var skill = document.createTextNode("Skill " + (i + 1));
                    var skill = document.createElement("label");
                    skill.innerHTML = "Skill "+(i + 1);
                    skill.className = "label subtitle is-6";
                    container.appendChild(skill);
                    var input = document.createElement("input");
                    input.type = "text";
                    input.name = "name" + i;
                    input.className = "input";
                    container.appendChild(input);
                    container.appendChild(document.createElement("br"));
                }
            }
      </script>
    </head>

    <body class="has-background-info">

      <div id="nav-placeholder"></div>

    <!-- STUDENT DETAILS -->
    <section id="details" class="section container is-centered ">
      <div class="notification" style="margin: 3% 5% 0.1% 5%;"><h2 class="subtitle is-2">Student details</h2>
<%ArrayList<String> lst = (ArrayList<String>) request.getAttribute("personalDetails");%>
<form name="personal_details" method="post" action="<%=request.getContextPath()%>/addPersonal">

<div class="field is-horizontal">
    <div class="field-label is-normal">
    <label class="label">Registration number</label>
    </div>
    <div class="field-body">
      <div class="field">
        <div class="control">
          <p class="control is-expanded has-icons-left">
            <input class="input reg_no" name="reg_no" type="text" placeholder="Registration number"
            pattern="CB.EN.U4CSE[0-9][0-9][0-9][0-9][0-9]" value="<%=lst.get(7) %>" required="true">
            <span class="icon is-small is-left">
              <i class="fas fa-id-card"></i>
            </span>
          </p>
        </div>
        <p class="help">Format: CB.EN.U4CSEXXXXX </p>
      </div>
    </div>
</div>

<div class="field is-horizontal">
    <div class="field-label is-normal">
    <label class="label">Year of study</label>
    </div>
    <div class="field-body">
      <div class="field">
        <div class="control">
          <p class="control is-expanded">
            <input class="input year_of_stud" name="graduation"type="month" value="<%=lst.get(2) %>" placeholder="Select the month and year of graduation"
            required="true">
          </p>
        </div>
        <p class="help">Select month and year</p>
      </div>
    </div>
</div>


<div class="field is-horizontal">
<div class="field-label is-normal">
  <label class="label">Department</label>
</div>
<div class="field-body">
  <div class="field is-narrow">
    <div class="control">
      <div class="select is-fullwidth">
        <select class="dept" name="dept" required="true" value="<%=lst.get(3) %>">
          <option value="Select one department">Select one department</option>
          <option value="Computer Science & Engineering">Computer Science & Engineering</option>
          <option value="Electrical & Electronics Engineering">Electrical & Electronics Engineering</option>
          <option value="Electronics & Communication Engineering">Electronics & Communication Engineering</option>
          <option value="Mechanical Engineering">Mechanical Engineering</option>
          <option value="Chemical Engineering">Chemical Engineering</option>
          <option value="Aerospace Engineering">Aerospace Engineering</option>
        </select>
      </div>
    </div>
  </div>

  <div class="field">
    <p class="control is-expanded has-icons-left ">
      <input class="input dob" name="dob" type="date" placeholder="Date of brith" value="<%=lst.get(1) %>" required="true">
      <span class="icon is-small is-left">
        <i class="fas fa-birthday-cake"></i>
      </span>
    </p>
  </div>

</div>
</div>

<div class="field is-horizontal">
<div class="field-label is-normal">
  <label class="label">School</label>
</div>
<div class="field-body">
  <div class="field">
    <div class="control level-item">
      <input name="school" class="input" type="text" id="school" value="<%=lst.get(5) %>"  required>
      </div>
    </div>
  </div>
</div>

<div class="field is-horizontal">
<div class="field-label is-normal">
  <label class="label">Skill 1</label>
</div>
<div class="field-body">
  <div class="field">
    <div class="control level-item">
      <!--<input class="input" type="text" placeholder="e.g. Tennis Football Basketball (Enter with spaces)">-->
      <input name="skill1" class="input" type="text" id="skill1" value="<%=lst.get(8) %>" required>
      <input type="range" id="skill1_rating" name="skill1_rating" min="0" max="5" value="<%=lst.get(10) %>">
      </div>
    </div>
  </div>
</div>

<div class="field is-horizontal">
<div class="field-label is-normal">
  <label class="label">Skill 2</label>
</div>
<div class="field-body">
  <div class="field">
    <div class="control level-item">
      <!--<input class="input" type="text" placeholder="e.g. Tennis Football Basketball (Enter with spaces)">-->
      <input name="skill2" class="input" type="text" id="skill2" value="<%=lst.get(9) %>" required>
      <input type="range" id="skill2_rating" name="skill2_rating" min="0" max="5" value="<%=lst.get(11) %>">
      </div>
    </div>
  </div>
</div>



<div class="field is-horizontal">
<div class="field-label is-normal">
  <label class="label">Address</label>
</div>
<div class="field-body">
  <div class="field">
    <div class="control level-item">
      <input name="address" class="input" type="text" id="address" value="<%=lst.get(6) %>" required>
      </div>
    </div>
  </div>
</div>
  
<div class="field is-horizontal">
<div class="field-label is-normal">
  <label class="label">About myself</label>
</div>
<div class="field-body">
  <div class="field">
    <div class="control">
      <textarea class="textarea" name="aboutme" placeholder="Tell us more about you :)" required><%=lst.get(4) %></textarea>
    </div>
  </div>
</div>
</div>

<div class="field is-horizontal">
<div class="field-label">
  <!-- Left empty for spacing -->
</div>
    <form action="" method="">
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
    </form>
</div>


        </form>
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

      <script>
              function addFields() {
                debugger;
                var number = document.getElementsByName("no_of_skills")[0].value;
                var container = document.getElementById("create-container");
                container.innerHTML = '';
                for (i = 0; i < number; i++) {
                        var skill = document.createTextNode("Skill " + (i + 1));
                        var skill = document.createElement("label");
                        skill.innerHTML = "Skill "+(i + 1);
                        skill.className = "label subtitle is-6";
                        container.appendChild(skill);
                        var input = document.createElement("input");
                        input.type = "text";
                        input.name = "name" + i;
                        input.className = "input";
                        container.appendChild(input);
                        container.appendChild(document.createElement("br"));
                    }
                }
          </script>
    </body>
</html>




