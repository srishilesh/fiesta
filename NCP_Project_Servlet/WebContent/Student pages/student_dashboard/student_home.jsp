<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Dashboard</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  	<script>$(function(){
  	  $("#nav-placeholder").load("<%=request.getContextPath()%>/Navbar/studentPageNavbar.jsp");
  	});</script>  
</head>
<style>
  #ahe1 {
    padding-left: 5%;
  }
</style>

<body>
  <div id="nav-placeholder"></div>

  <div class="columns container">
		<div class="column is-9 ml-4">
			<h1 class="title is-1">Upcoming events</h1>
			<%  
			ArrayList<ArrayList<String>> listEvents = (ArrayList<ArrayList<String>>) request.getAttribute("upcomingEvents");
			
			// print the information about every category of the list
			for(ArrayList<String> event : listEvents) {%>
				 <div class="card mt-3">
				<header class="card-header">
					<p class="card-header-title is-size-4">
						<%=event.get(1)%>
					</p>
				</header>
				<div class="card-content">
					<div class="content">
						<p class="is-size-5 has-text-weight-semibold">
							<%=event.get(2)%>
						</p>
						<br>
						<div class="columns is-bordered mt-1">
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Start Date & Time: </span><%=event.get(5)%>>
								<br>
								<span class="has-text-weight-bold has-text-link">End Date & Time: </span><%=event.get(6)%>
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Venue: </span> <%=event.get(3)%>
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Organizer College: </span> <%=event.get(7)%>
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Event Size: </span> <%=event.get(4)%>
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Event ID: </span> <%=event.get(0)%>
							</div>
						</div>

					</div>
				</div>
				<footer class="card-footer">
					<a href="../Students Event Registration/event_registration_team.html" class="card-footer-item has-text-success has-text-weight-bold">Apply</a>
					<a href="../Events/view_event.html" class="card-footer-item has-text-success has-text-weight-bold">View Event</a>
				</footer>
			</div>
				 <%
			}
			%>
			<div class="card mt-3">
				<header class="card-header">
					<p class="card-header-title is-size-4">
						Let us hear! My School
					</p>
				</header>
				<div class="card-content">
					<div class="content">
						It is understood and accepted that in any profession to be successful there are three key
						elements.
						They are Skills, Knowledge and Attitude. Skills and Knowledge can be attained through our
						educational system.
						A positive attitude makes an individual groomed to 100%.
						<br>
						<div class="columns is-bordered mt-1">
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Date & Time: </span>11:09 PM - 1 Jan
								2016
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Venue: </span> Amrita University
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Event Type: </span> Inter college
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Event Size: </span> 2
							</div>
						</div>

					</div>
				</div>
				<footer class="card-footer">
					<a href="../Students Event Registration/event_registration_team.html" class="card-footer-item has-text-success has-text-weight-bold">Apply</a>
					<a href="../Student Events/view_event.html" class="card-footer-item has-text-success has-text-weight-bold">View Event</a>
				</footer>
			</div>
			<div class="card mt-3">
				<header class="card-header">
					<p class="card-header-title is-size-4">
						Let us hear! My School
					</p>
				</header>
				<div class="card-content">
					<div class="content">
						It is understood and accepted that in any profession to be successful there are three key
						elements.
						They are Skills, Knowledge and Attitude. Skills and Knowledge can be attained through our
						educational system.
						A positive attitude makes an individual groomed to 100%.
						<br>
						<div class="columns is-bordered mt-1"> 
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Date & Time: </span>11:09 PM - 1 Jan
								2016
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Venue: </span> Amrita University
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Event Type: </span> Inter college
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Event Size: </span> 2
							</div>
						</div>

					</div>
				</div>
				<footer class="card-footer">
					<a href="" class="card-footer-item has-text-success has-text-weight-bold">Apply</a>
					<a href="../Student Events/view_event_winners.html" class="card-footer-item has-text-success has-text-weight-bold">View Event</a>
				</footer>
			</div>
			<div class="card mt-3">
				<header class="card-header">
					<p class="card-header-title is-size-4">
						Let us hear! My School
					</p>
				</header>
				<div class="card-content">
					<div class="content">
						It is understood and accepted that in any profession to be successful there are three key
						elements.
						They are Skills, Knowledge and Attitude. Skills and Knowledge can be attained through our
						educational system.
						A positive attitude makes an individual groomed to 100%.
						<br>
						<div class="columns is-bordered mt-1">
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Date & Time: </span>11:09 PM - 1 Jan
								2016
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Venue: </span> Amrita University
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Event Type: </span> Inter college
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Event Size: </span> 2
							</div>
						</div>

					</div>
				</div>
				<footer class="card-footer">
					<a href="" class="card-footer-item has-text-success has-text-weight-bold">Apply</a>
					<a href="../Student Events/view_event.html" class="card-footer-item has-text-success has-text-weight-bold">View Event</a>
				</footer>
			</div>
			<div class="card mt-3">
				<header class="card-header">
					<p class="card-header-title is-size-4">
						Let us hear! My School
					</p>
				</header>
				<div class="card-content">
					<div class="content">
						It is understood and accepted that in any profession to be successful there are three key
						elements.
						They are Skills, Knowledge and Attitude. Skills and Knowledge can be attained through our
						educational system.
						A positive attitude makes an individual groomed to 100%.
						<br>
						<div class="columns is-bordered mt-1">
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Date & Time: </span>11:09 PM - 1 Jan
								2016
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Venue: </span> Amrita University
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Event Type: </span> Inter college
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Event Size: </span> 2
							</div>
						</div>

					</div>
				</div>
				<footer class="card-footer">
					<a href="" class="card-footer-item has-text-success has-text-weight-bold">Apply</a>
					<a href="../Student Events/view_event.html" class="card-footer-item has-text-success has-text-weight-bold">View Event</a>
				</footer>
			</div>
			<div class="card mt-3">
				<header class="card-header">
					<p class="card-header-title is-size-4">
						Let us hear! My School
					</p>
				</header>
				<div class="card-content">
					<div class="content">
						It is understood and accepted that in any profession to be successful there are three key
						elements.
						They are Skills, Knowledge and Attitude. Skills and Knowledge can be attained through our
						educational system.
						A positive attitude makes an individual groomed to 100%.
						<br>
						<div class="columns is-bordered mt-1">
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Date & Time: </span>11:09 PM - 1 Jan
								2016
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Venue: </span> Amrita University
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Event Type: </span> Inter college
							</div>
							<div class="column">
								<span class="has-text-weight-bold has-text-link">Event Size: </span> 2
							</div>
						</div>

					</div>
				</div>
				<footer class="card-footer">
          <a href="" class="card-footer-item has-text-success has-text-weight-bold">Apply</a>
					<a href="#" class="card-footer-item has-text-success has-text-weight-bold">View Event</a>
				</footer>
			</div>
		</div>
		<div class="column is-4">
			<article class="message announce-class">
				<div class="message-header ">
					<p>Announcements!</p>
				</div>
				<div class="message-body">
				<%  
					ArrayList<ArrayList<String>> list = (ArrayList<ArrayList<String>>) request.getAttribute("announcements");
					
					// print the information about every category of the list
					for(ArrayList<String> ann : list) {%>
						 <div class="notification is-link">
							<p class="title is-4"><%=ann.get(2)%></p>
							<p> <%=ann.get(1)%></p>
							<p> Event ID:<%=ann.get(3)%></p>
							<br>
							<a href="../Events/view_event.html"><span class="tag is-warning">Go to Event</span></a>
							<span class="is-primary is-link is-light ann_id "><%=ann.get(0)%></span>
	
						</div>
						 <%
					}
					%>
					<div class="notification is-link">
						<p class="title is-4">Winner of Asphalt</p>

						<p> Primar lorem ipsum dolor sit amet, consectetur
							adipiscing elit lorem ipsum dolor. <strong>Pellentesque risus mi</strong>, tempus quis pls
							diam,
							et dictum <a>felis venenatis</a> efficitur. Sit amet,
							consectetur adipiscing elit</p>
						<br>
						<a href="../Student Events/view_event.html"><span class="tag is-warning">Go to Event</span></a>
						<span class="is-primary is-link is-light ann_id ">1</span>

					</div>
					<div class="notification is-link">
						<p class="title is-4">Webinar dates</p>
						<p>Amrita Center for Cyber Security Systems and Networks, located at the Amrita Vishwa
							Vidyapeetham's
							Amritapuri Campus, promotes partnership between industry, academia and the government to
							foster...</p>
						<br>
						<a href="../Student Events/view_event.html"><span class="tag is-warning">Go to event</span></a>
						<span class="is-primary is-link is-light ann_id ">2</span>
					</div>
					<div class="notification is-link">
						<p class="title is-4">Lorem</p>
						<p>Primar lorem ipsum dolor sit amet, consectetur
							adipiscing elit lorem ipsum dolor. <strong>Pellentesque risus mi</strong>, tempus quis
							placerat
							ut,fringilla. Nullam gravida purus diam, et dictum <a>felis venenatis</a> efficitur. Sit
							amet,
							consectetur adipiscing elit</p>
						<br>
						<a href="../Student Events/view_event.html"><span class="tag is-warning">Go to event</span></a>
						<span class="is-primary is-link is-light ann_id ">3</span>
					</div>
					<div class="notification is-link">
						<p class="title is-4">Cyber Security</p>
						<p>The Technology Information, Forecasting and Assessment Council (TIFAC) of the Department of
							Science
							and Technology, Government of India, launched Mission REACH (Relevance and Excellence in
							Achieving
							New Heights in Educational Institutions) in 2000 as a part of its Technology...</p>
						<br>
						<a href="../Student Events/view_event.html"><span class="tag is-warning">Go to event</span></a>
						<span class="is-primary is-link is-light ann_id ">4</span>
					</div>
				</div>
			</article>
		</div>
	</div>
</body>

</html>