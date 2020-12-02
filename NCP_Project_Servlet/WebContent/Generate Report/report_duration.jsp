<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Generation - Duration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  	<script>$(function(){
  	  $("#nav-placeholder").load("<%=request.getContextPath()%>/Navbar/adminPageNavbar.jsp");
  	});</script>
</head>
<style>
  #for {
        background-color: rgba(0, 0, 0, 0.3) !important;
        font-size: 100% !important;
        text-align: center !important;
        padding-top: 40px !important;
        padding-bottom: 50px !important;
        width: 550px !important; 
        margin:auto auto !important; 
        font-family: 'Aleo' ;font-size:large !important;
        color: #FFFFFF;
        text-shadow: 0px 4px 3px rgba(0,0,0,0.4),
                    0px 8px 13px rgba(0,0,0,0.1),
                    0px 18px 23px rgba(0,0,0,0.1);
    
    }
    #ahe1{
      padding-left: 30%;
      font-size: xx-large !important;
    }
    #ahe2{
        padding-left: 42%;
        font-size: larger !important;
    }
    table{
        border: 1px solid black;
        margin-left: 15%;
    }
    table, th, td {
     border: 1px solid black;
     border-collapse: collapse;
}
</style>
<body>
	<div id="nav-placeholder"></div>     
</body>
<h1 id="ahe1"> <b>Generate Report Based on Duration</b> </h1>

<br>
<h2 id="ahe2"> <b>Report Generated</b> </h2>
<br>
<table style="width: 70%;">
    <tr>
        <th>Event ID</th>
        <th>Event name</th>
        <th>Event Description</th>
        <th>Event Organizing University</th>
        <th>Event Location</th>
         <th>Event Organizer Email</th>
        <th>Event Organizer Phone</th>
        <th>Start Date</th>
        <th>End Date</th>
    </tr>
<%  
			ArrayList<ArrayList<String>> listReport = (ArrayList<ArrayList<String>>) request.getAttribute("report");
			
			// print the information about every category of the list
			for(ArrayList<String> report : listReport) {%>
				<tr>
		        <td><%=report.get(0) %></td>
		        <td><%=report.get(1) %></td>
		        <td><%=report.get(2) %></td>
		        <td><%=report.get(3) %></td>
		        <td><%=report.get(4) %></td>
		        <td><%=report.get(5) %></td>
		        <td><%=report.get(6) %></td>
		        <td><%=report.get(7) %></td>
		        <td><%=report.get(8) %></td>
		
		    </tr>
			
				 <%
			}
			%>
			
</table>
</html>
