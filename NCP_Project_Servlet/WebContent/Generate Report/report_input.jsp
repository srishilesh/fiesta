<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Report Generation - Input</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  	<script>$(function(){
  	  $("#nav-placeholder").load("<%=request.getContextPath()%>/Navbar/adminPageNavbar.jsp");
  	});</script>

  </head>
  <style>
  body {
  overflow-x: auto;}
    .for {
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
    .for h1{
        padding: 34px !important;
        text-align: center !important;
        font-size: 100% !important;
    }

    .for input{
        margin-left: 3% !important;
        width: 200px;
    } 

    label{
        width: 100px !important ;
    }
    #inp{
        margin-top: 2%;
    }
    /* body{
      background: url("redreport.jpg");
      background-position: center center;
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      width: 100%;
    } */
    #ahe2{
        padding-left: 42%;
        font-size: larger !important;
    }
    table{
        border: 1px solid black;
        
    }
    table, th, td {
     border: 1px solid black;
     border-collapse: collapse;
}

#ahe1{
    font-size: xx-large !important;
    padding-left: 31%;
}



  </style>
  <body>
    <div id="nav-placeholder"></div>
        <h1 id="ahe1"> <b>Generating report based on Input</b> </h1>
        
           <h2 id="ahe2"> <b>Report Generated</b> </h2>
           <br>
           
           <table style="width: 70%;">
    <tr>
        <th>Event ID</th>
        <th>Event name</th>
        <th>Start Date</th>
        <th>Venue</th>
        <th>Participation</th>
        <th>Type</th>
         <th>Registration link</th>
        <th>Skills</th>
        <th>Student Name</th>
        <th>Winner</th>
        <th>Student ID</th>
        <th>Student Email</th>
        <th>Student Phone</th>
        <th>Social media link 1</th>
         <th>Social media link 2</th>
        <th>Student ID</th>
        <th>Student DOB</th>
        <th>Year of Study</th>
        <th>Department</th>
        <th>Details</th>
        <th>School</th>
        <th>Address</th>
         <th>Registration Number</th>
        <th>Skill 1</th>
        <th>Skill 2</th>
        <th>Skill 1 Rating</th>
        <th>Skill 2 Rating</th>
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
		        <td><%=report.get(9) %></td>
		        <td><%=report.get(10) %></td>
		        <td><%=report.get(11) %></td>
		        <td><%=report.get(12) %></td>
		        <td><%=report.get(13) %></td>
		        <td><%=report.get(14) %></td>
		        <td><%=report.get(15) %></td>
		        <td><%=report.get(16) %></td>
		        <td><%=report.get(17) %></td>
		        <td><%=report.get(18) %></td>
		        <td><%=report.get(19) %></td>
		        <td><%=report.get(20) %></td>
		        <td><%=report.get(21) %></td>
		        <td><%=report.get(22) %></td>
		        <td><%=report.get(23) %></td>
		        <td><%=report.get(24) %></td>
		        <td><%=report.get(25) %></td>
		        <td><%=report.get(26) %></td>
		
		    </tr>
			
				 <%
			}
			%>
			
</table>    
          
  </body>
</html>
