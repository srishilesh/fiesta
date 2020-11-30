<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>Add Announcement</title>
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
		<script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
		<script language="javascript" type="text/javascript">
	        function validate() {
				ann = document.getElementById("ann").value
				if(ann == null || ann == undefined || ann == "") {
					alert("Please Enter Announcement")
					return false;
				}
				else {
					alert("Announcement made successfully")
					return true
				}
	        }
	    </script>
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	  	<script>$(function(){
	  	  $("#nav-placeholder").load("<%=request.getContextPath()%>/Navbar/adminPageNavbar.jsp");
	  	});</script>  
  	
	</head>
	<body>
	<div id="nav-placeholder"></div>
			
    <div class="container column is-6 box mt-3">
        <p class="title">Add new announcement!</p>
        <form id="myForm" action="<%= request.getContextPath() %>/addAnnouncement" method="post" onsubmit="return validate()">
            <div class="field">
				<div class="select">
				  <select name="event_id" id="event_id">
				  <option>Select Event ID</option>
				<%  
				ArrayList<String> list_ids = (ArrayList<String>) request.getAttribute("event_ids");
				
				// print the information about every category of the list
				for(String id : list_ids) {%>
					 <option value="<%=id%>"><%=id %></option>
					 <%
				}
				%>
				
				  </select>
				</div>
				
			</div>
            <div class="field">
                <label class="label">Title</label>
                <div class="control">
					<textarea class="textarea" id="title" name="title" placeholder="Textarea" required></textarea>
                </div>
            </div>
            <div class="field">
                <label class="label">Message</label>
                <div class="control">
					<textarea class="textarea" id="ann" name="ann" placeholder="Textarea"></textarea>
                </div>
            </div>

            <div class="field is-grouped">
                <div class="control">
                    <button class="button is-link">Submit</button>
                </div>
                <div class="control">
                    <button class="button is-link is-light">Cancel</button>
                </div>
            </div>
        </form>
    </div>
	</body>
</html>