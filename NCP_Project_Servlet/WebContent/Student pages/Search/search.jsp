<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
    <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
</head>

<body>

    <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <a class="navbar-item" href="../student_dashboard/student_dashboard.html">
            <img src="../../Logo/Fiesta.PNG" width="112" height="28">
          </a>
        </div>
        <div id="navbarBasicExample" class="navbar-menu">
          <div class="navbar-start">
            <div class="navbar-item has-dropdown is-hoverable">
              <a class="navbar-link">
                Profile page
              </a>
    
              <div class="navbar-dropdown">
                <a class="navbar-item" href="../Public_student_profile/Profile_Page.html">
                  View Profile
                </a>
                <a class="navbar-item" href="../Private_student_profile/student_add_personal_details.html">
                  Edit Profile - Personal
                </a>
                <a class="navbar-item" href="../Private_student_profile/student_add_achievements_details.html">
                    Edit Profile - Achievement
                </a>
                <a class="navbar-item" href="../Private_student_profile/student_add_contact_details.html">
                    Edit Profile - Contact
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
                            <p id="ha"><b>Hello Sanjay:) &ensp;&ensp; </b></p>
                            <a href="../../Landing_page/home_page.html" id="ab1" class="button is-danger">
                                <strong>LOG OUT</strong>
                            </a>
                        </div>
                    </div>
                </div>
        </div>
      </nav>
    <section class="hero is-info">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">
                    Search Students based on Tags
                </h1>
                <h2 class="subtitle">
                    Enter the tags in the search box
                </h2>
            </div>
        </div>
    </section>

    <div class="container">
        <div class="field"></div>
        <div class="field is-horizontal">
            <input class="input" type="text" id="myInput" onkeyup="myFunction()" placeholder="Type tags"
                title="Type in a name">
            &nbsp;
            <p class="control has-icons-left">
                <span class="select">
                    <select id="filteroption">
                        <option selected value=2>Tag</option>
                        <option value=0>Student Name</option>
                        <option value=1> Student ID</option>
                    </select>
                </span>
                <span class="icon is-small is-left">
                    <i class="fas fa-filter"></i>
                </span>
            </p>

        </div>
        <table class="table is-hoverable is-fullwidth" id="myTable">
            <tr class="header">
                <th style="width:40%;">Student Name</th>
                <th style="width:40%;">Student ID</th>
                <th style="width:30%;">Tags</th>
            </tr>
            <tr>
                <td>Sanjay Tharagesh R S</td>
                <td>@sanjay</td>
                <td>
                    <span class="tag">Competitive coding</span>
                    <span class="tag">Football</span>
                </td>
            </tr>
            <tr>
                <td>Neeraj Kumar</td>
                <td>@Neeraj</td>
                <td>
                    <span class="tag">Web designing</span>
                </td>
            </tr>
            <tr>
                <td>Gayathri</td>
                <td>@Gayathri</td>
                <td>
                    <span class="tag">PHP</span>
                    <span class="tag">Drawing</span>
                </td>
            </tr>
            <tr>
                <td>Prathyusha</td>
                <td>@Prathyusha</td>
                <td>
                    <span class="tag">Competitive Coding</span>
                </td>
            </tr>
            <tr>
                <td>Srishilesh</td>
                <td>@Srishilesh</td>
                <td>
                    <span class="tag">Karate</span>
                </td>
            </tr>
        </table>
    </div>

    <script>
        function myFunction() {
            var input, filter, table, tr, td, i, txtValue, filter_option, filter;
            var f = 2;
            filter_option = document.getElementById("filteroption");
            filter = filter_option.options[filter_option.selectedIndex].value;
            if (filter == 0)
                f = 0
            else if (filter == 1)
                f = 1;
            else
                f = 2;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[f];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>

</body>

</html>