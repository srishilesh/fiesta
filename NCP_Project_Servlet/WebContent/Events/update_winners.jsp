<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Update Winners for Event</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
	<script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
	<script language="javascript" type="text/javascript">
		let flag = false;
		let reg = /^\d+$/
		function addFields() {
			let form = document.getElementById("myForm")
			var number = document.getElementById("count").value;
			if (number == "" || number == undefined || number == null || reg.test(number) === false) {
				alert("Enter Valid Number of winners")
				return;
			}
			var container = document.getElementById("winners");
			while (container.hasChildNodes()) {
				container.removeChild(container.lastChild);
			}
			for (i = 0; i < number; i++) {
				let div_ele = document.createElement("div");
				let label = document.createElement("label");
				let input = document.createElement("input");
				div_ele.setAttribute("class", "column is-4 field");
				label.setAttribute("class", "label");
				label.setAttribute("for", "the_message");
				label.innerHTML = "Place " + (i + 1);
				input.setAttribute("name", "message"+i);
				input.setAttribute("id", "the_message");
				input.setAttribute("class", "input has-background-danger-light");
				input.setAttribute("required", true)
				input.setAttribute("pattern", "[0-9]{1,}")
				input.setAttribute("title", "Enter valid ID")
				div_ele.appendChild(label);
				div_ele.appendChild(input);
				container.appendChild(div_ele)
			}
			if (flag == false) {
				flag = true;
				let div_sub = document.createElement("div");
				let input_sub = document.createElement("input");
				div_sub.setAttribute("class", "field has-text-centered");
				div_sub.setAttribute("id", "submit_buttom");
				input_sub.setAttribute("type", "submit");
				input_sub.setAttribute("class", "button is-primary");
				div_sub.appendChild(input_sub)
				form.appendChild(div_sub)
			}

		}
		
		function validate() {
			let id = document.getElementById("event_id").value
			if(id==null || id==undefined || id=="" || reg.test(id) === false) {
				alert("Enter Valid Email-ID");
				return false;
			}

			return true;
		}
	</script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  	<script src="../js/adminPageNavbar.js"></script>
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
	<div class="columns">
		<div class="container column is-5 mt-4">
			<main class="container content box">
				<h1 class="title">Winners update form</h1>
				<div class="notification is-success">
					<ul>
						<h4>Read the instructions carefully before submitting</h4>
						<li>
							<p>Enter the details correctly</p>
						</li>
						<li>
							<p>Enter only the Team ID</p>
						</li>
						<li>
							<p>Enter valid Team information </p>
						</li>
						<li>
							<p>Verify before submitting</p>
						</li>
						<li>
							<p>On submitting, the entered details will go public</p>
						</li>
					</ul>

				</div>

				<form id="myForm" action="<%= request.getContextPath() %>/UpdateWinners" method="post" onsubmit="return validate()">
					<div class="field">
						<label class="label" for="event_id">Enter Event ID</label>
						<input type="text" name="event_id" id="event_id" class="input" required>
					</div>
					<div class="field">
						<label class="label" for="count">Enter Number of Winners (Press Enter)</label>
						<input type="text" name="count" id="count" class="input" required>
					</div>
					<div class="field has-text-centered">
						<a onclick="addFields()">Fill Details</a>
					</div>
					<div class="columns is-multiline" id="winners">
					</div>
				</form>
			</main>
		</div>
	</div>

</body>
</html>