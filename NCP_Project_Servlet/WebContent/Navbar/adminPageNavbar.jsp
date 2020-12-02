<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
	<nav class="navbar" role="navigation" aria-label="main navigation">
		<div class="navbar-brand">
			<a class="navbar-item" href="<%= request.getContextPath() %>/adminHome">
				<img src="<%=request.getContextPath()%>/Logo/Fiesta.PNG" width="112" height="28">
			</a>
		</div>

		<div id="navbarBasicExample" class="navbar-menu">
			<div class="navbar-start">

				<div class="navbar-item has-dropdown is-hoverable">
					<a class="navbar-link">
						Announcements
					</a>

					<div class="navbar-dropdown">
						<a class="navbar-item" href="<%= request.getContextPath() %>/addAnnouncement">
							Create New Announcement
						</a>
						<a class="navbar-item" href="<%= request.getContextPath() %>/deleteUpdateAnnouncement">
							Update/Delete Announcement
						</a>
						<a class="navbar-item" href="<%= request.getContextPath() %>/latestNews">
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
						<a class="navbar-item" href="<%= request.getContextPath() %>/addEvent">
							Create New Event
						</a>
						<a class="navbar-item" href="<%= request.getContextPath() %>/updateWinners">
							Update Event Winners
						</a>
						<a class="navbar-item" href="<%= request.getContextPath() %>/updateEventID">
							Update Event Details
						</a>
						<a class="navbar-item" href="<%= request.getContextPath() %>/adminViewAllEvents">
							View All Events
						</a>
						<a class="navbar-item" href="<%= request.getContextPath() %>/adminViewAllStudents">
							View Student Registrations
						</a>

					</div>
				</div>
				<div class="navbar-item has-dropdown is-hoverable">
					<a class="navbar-link">
						Generate Report
					</a>

					<div class="navbar-dropdown">
						
						<a class="navbar-item" href="<%= request.getContextPath() %>/generateReportInput">
							Based on Input
						</a>
						<a class="navbar-item" href="<%= request.getContextPath() %>/generateReportDurationForm">
							Based on Duration
						</a>
						

					</div>
			</div>
				<a class="navbar-item" href="<%= request.getContextPath() %>/adminSearch">
					Search
				</a>
				<a class="navbar-item" href="<%= request.getContextPath() %>/adminLeaderboard">
					Leaderboard
				</a>
				
			</div>

			<div class="navbar-end">
				<div class="navbar-item">
					<div class="buttons">
						<p id="ha"><b>Hello Admin:) &ensp;&ensp; </b></p>
						<a href="<%= request.getContextPath() %>/home" id="ab1" class="button is-danger">
							<strong>LOG OUT</strong>
						</a>
					</div>
				</div>
			</div>
		</div>
	</nav>