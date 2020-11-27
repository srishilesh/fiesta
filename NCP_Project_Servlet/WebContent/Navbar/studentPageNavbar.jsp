<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
  <nav class="navbar" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
      <a class="navbar-item" href="<%= request.getContextPath() %>/studentHome">
        <img src="<%= request.getContextPath() %>/Logo/Fiesta.PNG" width="112" height="28">
      </a>
    </div>
    <div id="navbarBasicExample" class="navbar-menu">
      <div class="navbar-start">
        <div class="navbar-item has-dropdown is-hoverable">
          <a class="navbar-link">
            Profile page
          </a>

          <div class="navbar-dropdown">
            <a class="navbar-item" href="<%= request.getContextPath() %>/displayProfile">
              View Profile
            </a>
            <a class="navbar-item" href="<%= request.getContextPath() %>/addPersonal">
              Edit Personal Details
			</a>
			<a class="navbar-item" href="<%= request.getContextPath() %>/addAchievements">
              Edit Achievements Details
			</a>
			<a class="navbar-item" href="<%= request.getContextPath() %>/addContact">
              Edit Contact Details
			</a>
		</div>
        </div>

        <a class="navbar-item" href="<%= request.getContextPath() %>/studentSearch">
          Search
        </a>

        <a class="navbar-item" href="<%= request.getContextPath() %>/studentLeaderboard">
          Leaderboard
        </a>
      </div>
      <div class="navbar-end">
				<div class="navbar-item">
					<div class="buttons">
						<p id="ha"><b>Hello Sanjay:) &ensp;&ensp; </b></p>
						<a href="<%= request.getContextPath() %>/home" id="ab1" class="button is-danger">
							<strong>LOG OUT</strong>
						</a>
					</div>
				</div>
			</div>
    </div>
  </nav>