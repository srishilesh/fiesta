<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin - Update Event</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
        <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
        <script>
		 	$(function(){
		  	  $("#nav-placeholder").load("<%=request.getContextPath()%>/Navbar/adminPageNavbar.jsp");
		  	});
 		</script>  
    </head>

    <body>
    	<div id="nav-placeholder"></div>
    	
    	<section class="hero is-info">
		    <div class="hero-body">
		      <div class="container is-center">
		        <h1 class="title ">
		          Create New Event
		        </h1>
		        <h2 class="subtitle">
		          Select Event ID
		        </h2>
		      </div>
		    </div>
		  </section>
  
    	<form action="<%=request.getContextPath() %>/updateEvent" method="get">
    		<br>
    		<div class="field is-horizontal is-grouped is-grouped-centered">
				<div class="field-label is-normal">
				  <label class="label">Select Event ID</label>
				</div>
				<div class="field-body">
						<div class="select">
						  <select name="event_id" id="event_id">
						  <option>Select Event ID</option>
						<%  
						ArrayList<ArrayList<String>> list_ids = (ArrayList<ArrayList<String>>) request.getAttribute("event_ids");
						
						// print the information about every category of the list
						for(ArrayList<String> list : list_ids) {%>
							 <option value="<%=list.get(0)%>"><%=list.get(0) %> - <%=list.get(1) %></option>
							 <%
						}
						%>
						  </select>
						</div>
				</div>
			</div>
			<div class="field is-grouped is-grouped-centered">
			<input class="button is-link is-medium" type="submit" value="Submit">
			</div>
		</form>
    </body>
</html>       
        