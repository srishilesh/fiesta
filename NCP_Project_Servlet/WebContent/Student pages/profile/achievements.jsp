<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Edit Profile - Achievements</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
  <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
  <!-- <style type="text/css">
          .event_name:invalid, .event_date:invalid, .location:invalid, .team_size:invalid, 
           .proof_link:invalid, .specialization:invalid, .stu_id:invalid,
           .leader_name:invalid, .leader_mail:invalid{
            border: 1px solid #ff4d4d;
                  }
          textarea:invalid {
            border: 1px solid #ff4d4d;
                  }
        </style> -->
  <!-- After connecting backend, show red boxes only after submit button gets clicked -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script>
  $(function(){
  	  $("#nav-placeholder").load("<%=request.getContextPath()%>/Navbar/studentPageNavbar.jsp");
  	});
  </script>
</head>

<body class="has-background-info">

  <div id="nav-placeholder"></div>


  <!-- ACHIEVEMENTS -->
  <section id="achievements" class="section container is-centered">
    <div class="notification" style="margin: 3% 5% 1% 5%;">
      <h2 class="subtitle is-2"> Achievements</h2>
		<%ArrayList<String> lst = (ArrayList<String>) request.getAttribute("achievementDetails");%>
      <form name="achievement_details" method="post" action="<%= request.getContextPath()%>/addAchievements">

        <div class="field is-horizontal">
          <div class="field-label is-normal">
            <label class="label">Name of the Event</label>
          </div>
          <div class="field-body">

            <div class="field">
              <p class="control is-expanded has-icons-left">
                <input class="input event_name" name="event_name" type="text" placeholder="Name of the event"
                  pattern="[a-zA-Z0-9\s]+" value="<%= lst.get(1) %>" required="true">
                <span class="icon is-small is-left">
                  <i class="fas fa-file-signature"></i>
                </span>
              </p>
            </div>
            <div class="field-label is-normal">
              <label class="label">When did it take place?</label>
            </div>
            <div class="field">
              <p class="control is-expanded has-icons-left ">
                <input class="input event_date" name="event_date" type="date" value="<%= lst.get(2) %>" required="true">
                <span class="icon is-small is-left">
                  <i class="fas fa-calendar-alt"></i>
                </span>
              </p>
            </div>
          </div>
        </div>



        <div class="field is-horizontal">
          <div class="field-label is-normal">
            <label class="label">Location</label>
          </div>
          <div class="field-body">

            <div class="field">
              <p class="control is-expanded has-icons-left">
                <input class="input location" name="location" type="text" value="<%= lst.get(3) %>" placeholder="Where did it take place?"
                  pattern="[a-zA-Z\s]+" required="true">

                <span class="icon is-small is-left">
                  <i class="fas fa-map-marker-alt"></i>
                </span>
              </p>
            </div>
            <div class="field-label is-normal">
              <label class="label">Team size(1-15)</label>
            </div>
            <div class="field">
              <p class="control is-expanded has-icons-left ">
                <input class="input team_size" name="team_size" type="number" min="1" max="15" value="<%= lst.get(4) %>" required="true">
                <span class="icon is-small is-left">
                  <i class="fas fa-user-friends"></i>
                </span>
              </p>
            </div>
          </div>
        </div>

        <div class="field is-horizontal">
          <div class="field-label">
            <label class="label">Participation</label>
          </div>
          <div class="field-body">
            <div class="field is-narrow">
              <div class="control">
                <label class="radio">
                  <input type="radio" name="participation" value="winner">
                  Winner
                </label>
                <label class="radio">
                  <input type="radio" name="participation" value="participation" checked>
                  Just participated
                </label>
              </div>
            </div>
          </div>
        </div>

        <div class="field is-horizontal">
          <div class="field-label is-normal">
            <label class="label">Proof of participation</label>
          </div>
          <div class="field-body">
            <div class="field">
              <div class="control">
                <p class="control is-expanded has-icons-left">

                  <!--The <input type="url"> defines a field for entering a URL.
            The input value is automatically validated before the form 
            can be submitted. -->


                  <input class="input proof_link" name="proof" type="url"
                    placeholder="Enter the link here (Eg: Upload certificates to your Google drive and paste link)"
                    required="true" value="<%= lst.get(6) %>">
                  <span class="icon is-small is-left">
                    <i class="fas fa-globe"></i>
                  </span>
                </p>
              </div>

              <p class="help is-danger">Link will be checked and if appropriate proof not found, submission will not be
                considered.</p>

            </div>
          </div>
        </div>

        <!-- Each achievement has atmost 1 specialization -->
        <div class="field is-horizontal">
          <div class="field-label is-normal">
            <label class="label">Skill</label>
          </div>
          <div class="field-body">

            <div class="field">
              <p class="control is-expanded has-icons-left ">
                <input class="input specialization" name="skill" type="text"
                  placeholder="Eg: Football/ Cricket/ Basketball" pattern="[A-Za-z]+" required="true" value="<%= lst.get(7) %>">
                <span class="icon is-small is-left">
                  <i class="fas fa-chess-queen"></i>
                </span>
              </p>
              <p class="help is-info">Each achievement has atmost 1 specialization</p>
            </div>
          </div>
        </div>

        <div class="field is-horizontal">
          <div class="field-label is-normal">
            <label class="label">Team leader</label>
          </div>
          <div class="field-body">

            <div class="field">
              <p class="control is-expanded has-icons-left ">
                <input class="input leader_name" name="team_leader" type="text"
                  placeholder="Fill in your name if it's a solo participation" value="<%= lst.get(8) %>" pattern="[A-Za-z\s]+" required="true">
                <span class="icon is-small is-left">
                  <i class="fas fa-user"></i>
                </span>
              </p>
            </div>

          </div>
        </div>

        <div class="field is-horizontal">
          <div class="field-label is-normal">
            <label class="label">Describe the event</label>
          </div>
          <div class="field-body">
            <div class="field">
              <div class="control">
                <textarea class="textarea" name="desc" placeholder="Tell us more about the event :) " required="true">value="<%= lst.get(9) %>"</textarea>
              </div>
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
</body>

</html>