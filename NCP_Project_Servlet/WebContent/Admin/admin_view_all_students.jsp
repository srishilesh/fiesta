<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View All Registrations</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
    <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
    <script type="text/javascript">
          document.addEventListener('DOMContentLoaded', function() {
        let cardToggles = document.getElementsByClassName('card-toggle');
        for (let i = 0; i < cardToggles.length; i++) {
          cardToggles[i].addEventListener('click', e => {
            e.currentTarget.parentElement.parentElement.childNodes[3].classList.toggle('is-hidden');
          });
        }
      });
    </script>
    <style>
      /* #as1{
          width: 17%;
      } */

      body{
          margin: 0;
      }
      /* .main {
        position: fixed;
        border: red;
        top: 3%; right: 10%;
        bottom: 0; left: 20%;
        width: 100%;
        height: 100%;
              }
        #events{
        padding:0px;
        overflow:hidden;
        margin-top: 5%;
        margin-left: 2%;
        margin-right: 22%;
      } */
      .card+.card{
      margin-top: 20px;
    }

  </style>
  </head>
  </head>

  <body>
    <nav class="navbar" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <a class="navbar-item" href="../admin_dashboard/admin_dashboard.html">
          <img src="../Logo/Fiesta.PNG" width="112" height="28">
        </a>
      </div>
  
      <div id="navbarBasicExample" class="navbar-menu">
        <div class="navbar-start">
  
          <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link">
              Announcements
            </a>
  
            <div class="navbar-dropdown">
              <a class="navbar-item" href="../Announcements/Create_announcement.html">
                Create New Announcement
              </a>
              <a class="navbar-item" href="../Announcements/delete_update.html">
                Update/Delete Announcement
              </a>
              <a class="navbar-item" href="../Announcements/Latest_News.html">
                Latest News
              </a>
  
            </div>
          </div>
  
          <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link">
              Events
            </a>
  
            <div class="navbar-dropdown">
              <!-- <a class="navbar-item">
                View Events
              </a> -->
              <a class="navbar-item" href="../Events/create_event.html">
                Create New Event
              </a>
              <a class="navbar-item" href="../Events/update_winners.html">
                Update Event Winners
              </a>
              <a class="navbar-item" href="../Events/update_event.html">
                Update Event Details
              </a>
              <a class="navbar-item" href="../admin_dashboard/admin_view-events.html">
                View All Events
              </a>
              <a class="navbar-item" href="../admin_dashboard/admin_view-students.html">
                View Student Registrations
              </a>
  
            </div>
          </div>
          <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link">
              Generate Report
            </a>
  
            <div class="navbar-dropdown">
              
              <a class="navbar-item" href="../Generate Report/generate_report_based_on_input.html">
                Based on Input
              </a>
              <a class="navbar-item" href="../Generate Report/generate_report_based_on_duration.html">
                Based on Duration
              </a>
              
  
            </div>
        </div>
          <a class="navbar-item" href="../Search/search_tags.html">
            Search
          </a>
          <a class="navbar-item" href="../Leaderboard/leaderboard_table.html">
            Leaderboard
          </a>
          
        </div>
  
        <div class="navbar-end">
          <div class="navbar-item">
            <div class="buttons">
              <p id="ha"><b>Hello Admin:) &ensp;&ensp; </b></p>
              <a href="../Landing_page/home_page.html" id="ab1" class="button is-danger">
                <strong>LOG OUT</strong>
              </a>
            </div>
          </div>
        </div>
      </div>
    </nav>

<div class='main has-background-info'>
<section class="section" id="events">
  <h4 class="title has-text-centered">Student registrations - Event wise</h4>
  <div class="container">
    <div class="card is-fullwidth">
      <header class="card-header">
        <p class="card-header-title">Event #1 - eventname</p>
        <a class="card-header-icon card-toggle">
          <i class="fa fa-angle-down"></i>
        </a>
      </header>
      <div class="card-content is-hidden event_table">
        <div class="content">
          

            <div class="table-container">
                <table class="table">
                  <thead>
                    <tr>

                      <th><abbr title="team_id">t_id</abbr></th>
                      <th><abbr title="register_date_time">reg_time</abbr></th>
                      <th><abbr title="team_name">t_name</abbr></th>
                      <th><abbr title="student_id">stu_id</abbr></th>
                      <th><abbr title="student_name">stu_name</abbr></th>
                      <th><abbr title="student_roll_num">stu_roll</abbr></th>
                      <th><abbr title="student_email">stu_mail</abbr></th>
                      <th><abbr title="event_id">e_id</abbr></th>
                      <th><abbr title="event_name">e_name</abbr></th>
                  
                    </tr>
                  </thead>
                  
                  <tbody> 
                    <tr>

                      <th>3</th>
                      <td>2008-11-11 13:23:44</td>
                      <th>teAm_NaMe</th>
                      <td>11</td>
                      <td>Elina</td>
                      <td>cse17489</td>
                      <td>elina@gmail.com</td>
                      <th>1</th>
                      <td>Inter dept Basketball</td>
                    
                    </tr>

                    <tr>

                      <th>5</th>
                      <td>2008-11-11 16:23:44</td>
                      <th>TeAm_NaMe</th>
                      <td>15</td>
                      <td>Rian</td>
                      <td>cse17498</td>
                      <td>rian@gmail.com</td>
                      <th>1</th>
                      <td>Inter dept Basketball</td>
                    
                    </tr>

                  </tbody>
                </table>
              </div>


        </div>
      </div>
    </div>
    <div class="card is-fullwidth">
      <header class="card-header">
        <p class="card-header-title">Event #2 - eventname</p>
        <a class="card-header-icon card-toggle">
          <i class="fa fa-angle-down"></i>
        </a>
      </header>
      <div class="card-content is-hidden event_table">
        <div class="content">
          

            <div class="table-container">
                <table class="table">
                  <thead>
                    <tr>

                      <th><abbr title="team_id">t_id</abbr></th>
                      <th><abbr title="register_date_time">reg_time</abbr></th>
                      <th><abbr title="team_name">t_name</abbr></th>
                      <th><abbr title="student_id">stu_id</abbr></th>
                      <th><abbr title="student_name">stu_name</abbr></th>
                      <th><abbr title="student_roll_num">stu_roll</abbr></th>
                      <th><abbr title="student_email">stu_mail</abbr></th>
                      <th><abbr title="event_id">e_id</abbr></th>
                      <th><abbr title="event_name">e_name</abbr></th>
                  
                    </tr>
                  </thead>
                  
                  <tbody> 
                    
                      <tr>

                      <th>7</th>
                      <td>2008-11-11 15:23:44</td>
                      <th>teAm_NaME</th>
                      <td>22</td>
                      <td>Stefan</td>
                      <td>cse17475</td>
                      <td>stefan@gmail.com</td>
                      <th>2</th>
                      <td>Inter dept Volleyball</td>
                    
                    </tr>

                  </tbody>
                </table>
              </div>




        </div>
      </div>
    </div>
  </div>
</section>
</div>

  </body>
</html>
