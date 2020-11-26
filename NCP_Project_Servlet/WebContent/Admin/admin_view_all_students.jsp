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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  	<script src="../js/adminPageNavbar.js"></script>
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
    <div id="nav-placeholder"></div>

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
