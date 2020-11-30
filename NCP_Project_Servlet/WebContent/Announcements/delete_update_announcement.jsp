<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Delete Update Announcement</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
    <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
    <script language="javascript" type="text/javascript">
        let form = document.getElementById("myForm")
		let reg = /^\d+$/
        function validate() {
			ann_id = document.getElementById("announce_id").value
			if(ann_id == null || ann_id == undefined || ann_id == "") {
				alert("Please Enter Announcement ID")
				return false;
			}
			else if(reg.test(ann_id) === false) {
				alert("Enter a Valid Announcement ID")
				return false;
			}
            else if (document.getElementById("update").checked) {
                let txt = document.getElementById("message").value
                if(txt == null || txt == undefined || txt == "") {
                    alert("Fil the message area")
                    return false
                }
                else {
                	alert("Announcement updated successfully")
                    return true
                }
            } else if (document.getElementById("delete").checked) {
                var r = confirm("Are you sure to delete?");
                if (r == true) {
                	alert("Announcement deleted successfully")
                    return true
                } else {
                    return false
                }
            } else {
                alert("Please select update / delete option")
                return false
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
        <p class="title">Modify the Announcement</p>
        <form id="myForm" action="<%= request.getContextPath() %>/deleteUpdateAnnouncement" method="post" onsubmit="return validate()">
            <div class="field">
                <label class="label">Announcement ID</label>
                <div>
                    
                    <div class="select">
				  <select class="input" name="announce_id" id="announce_id">
				  <option>Select Annoucement ID</option>
				<%  
				ArrayList<String> list_ids = (ArrayList<String>) request.getAttribute("ann_ids");
				
				// print the information about every category of the list
				for(String id : list_ids) {%>
					 <option value="<%=id%>"><%=id %></option>
					 <%
				}
				%>
				
				  </select>
				</div>
                </div>
            </div>
            <div class="field">
				<label class="label" for="event_id">Enter New Event ID</label>
				<input type="text" name="event_id" id="event_id" class="input">
			</div>
            <div class="field">
                <label class="label">New Title</label>
                <div class="control">
					<textarea class="textarea" id="title" name="title" placeholder="Textarea"></textarea>
                </div>
            </div>
            <div class="field">
                <label class="label">Message</label>
                <div class="control">
                    <textarea id="message" class="textarea" name = "ann" placeholder="Textarea"></textarea>
                </div>
            </div>
            <div class="field">
                <label class="radio">
                    <input type="radio" id="update" name="option" value="update">
                    Update Announcement
                </label>
                <br>    
                <label class="radio">
                    <input type="radio" id="delete" name="option" value="delete">
                    <span class="has-text-danger">Delete Announcement</span>
                </label>
            </div>
            <div class="field">
                <div class="control">
                    <button type="submit" class="button is-succes">Submit</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>