<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Leaderboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
    <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
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

    <section class="hero is-info">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">
                    Leaderboard
                </h1>
                <h2 class="subtitle">
                    View the scores of the students based on the events that they have participated
                </h2>
            </div>
        </div>
    </section>
    
    <table class="table is-hoverable is-fullwidth" id="myTable">
        <thead>
            <tr class="header">
                <th style="width:30%;">Student Name</th>
                <th style="width:30%;">Student ID</th>
                <th style="width:10%;">Student Score</th>
                <th style="width:30%;">Tags</th>
            </tr>
        </thead>
        <tr>
            <td>Sanjay Tharagesh R S</td>
            <td>@sanjay</td>
            <td>5</td>
            <td>
                <span class="tag">Competitive coding</span>
                <span class="tag">Football</span>
            </td>
        </tr>
        <tr>
            <td>Neeraj Kumar</td>
            <td>@Neeraj</td>
            <td>2</td>
            <td>
                <span class="tag">Web designing</span>
            </td>
        </tr>
        <tr>
            <td>Gayathri</td>
            <td>@Gayathri</td>
            <td>4</td>
            <td>
                <span class="tag">PHP</span>
                <span class="tag">Drawing</span>
            </td>
        </tr>
        <tr>
            <td>Prathyusha</td>
            <td>@Prathyusha</td>
            <td>3</td>
            <td>
                <span class="tag">Competitive Coding</span>
            </td>
        </tr>
        <tr>
            <td>Srishilesh</td>
            <td>@Srishilesh</td>
            <td>1</td>
            <td>
                <span class="tag">Karate</span>
            </td>
        </tr>
    </table>
    <script>
        sortTable();
        function sortTable() {
            var table, rows, switching, i, x, y, shouldSwitch;
            table = document.getElementById("myTable");
            switching = true;
            /*Make a loop that will continue until
            no switching has been done:*/
            while (switching) {
                //start by saying: no switching is done:
                switching = false;
                rows = table.rows;
                /*Loop through all table rows (except the
                first, which contains table headers):*/
                for (i = 1; i < (rows.length - 1); i++) { 
                    // start by saying there should be no switching: 
                    shouldSwitch=false;
                    /*Get the two elements you want to compare, 
                    one from current row and one from the next: */
                    x = rows[i].getElementsByTagName("td")[2];
                    y = rows[i + 1].getElementsByTagName("td")[2]; 
                    //check if the two rows should switch place: 
                    if (Number(x.innerHTML) < Number(y.innerHTML)) {
                        //if so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                }
                if (shouldSwitch) {
                    /*If a switch has been marked, make the switch
                    and mark that a switch has been done:*/
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                }
            }
        }
    </script>
</body>

</html>