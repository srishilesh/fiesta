<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Event Page</title>
    <link rel="shortcut icon" href="../images/fav_icon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <!-- Bulma Version 0.9.0-->
    <link rel="stylesheet" href="https://unpkg.com/bulma@0.9.0/css/bulma.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/hero.css">
    <link rel="stylesheet" href="https://unpkg.com/bulma-modal-fx/dist/css/modal-fx.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
    <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script>$(function(){
  	  $("#nav-placeholder").load("<%=request.getContextPath()%>/Navbar/studentPageNavbar.jsp");
  	});</script> 
</head>

<body>
    <%ArrayList<String> listEventDetails = (ArrayList<String>) request.getAttribute("eventDetails"); %>
   <div id="nav-placeholder"></div>
    <section class="hero is-info  is-bold">
        <div class="hero-body has-background-primary-dark">
            <div class="container has-text-centered">
                <h1 class="title has-text-black">
                   <%=listEventDetails.get(1)%>
                </h1>
            </div>
            <figure class="image mt-3">
                <img
                    src="https://www.metabuild.io/wp-content/uploads/competition-1366x488.jpg">
            </figure>
        </div>
    </section>
    <section class="container mt-5">
        <div class="columns features">
            <div class="column is-4">
                <div class="card is-shady">
                    <div class="card-image has-text-centered">
                        <i class="fas fa-paw"></i>
                    </div>
                    <div class="card-content">
                        <div class="content">
                            <h4 class="title has-text-link">Event Descrription </h4>
                            <p><%=listEventDetails.get(2) %></p>

                        </div>
                    </div>
                </div>
            </div>
            <div class="column is-4">
                <div class="card is-shady">
                    <div class="card-image has-text-centered">
                        <i class="fa fa-question"></i>
                    </div>
                    <div class="card-content">
                        <div class="content">
                            <h4 class="title has-text-link">Event Details.</h4>
                            <p><strong>Type of partition: </strong> Team event <br>
                                <strong>Start Date: </strong> <%=listEventDetails.get(15) %><br>
                                <strong>End Date: </strong> <%=listEventDetails.get(16) %><br>
                                <strong>Venue: </strong> <%=listEventDetails.get(5) %> <br>
                                <strong>Team Size: </strong> <%=listEventDetails.get(6) %> <br>
                                <strong>Event tags:</strong>  <%=listEventDetails.get(3) %> <br>

                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="column is-4">
                <div class="card is-shady">
                    <div class="card-image has-text-centered">
                        <i class="fa fa-id-card"></i>
                    </div>
                    <div class="card-content">
                        <div class="content">
                            <h4 class="title has-text-link"> Contact Details</h4>
                            <p><strong>Organizer: </strong> <%=listEventDetails.get(7) %> <br>
                                <strong>Place: </strong> <%=listEventDetails.get(8) %><br>
                                <strong>Name: </strong> <%=listEventDetails.get(9) %> <br>
                                <strong>Email: </strong> <%=listEventDetails.get(10) %> <br>
                                <strong>Phone: </strong> <%=listEventDetails.get(11) %> <br>
                                <strong>Other Details:</strong> <%=listEventDetails.get(12) %> <br>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="container has-text-centered mt-5 mb-3">
        <button class="button is-success">Register for the event</button>
    </section>
    
    
    
</body>

</html>