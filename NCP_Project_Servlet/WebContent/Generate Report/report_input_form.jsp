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
        margin-left: 15%;
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
        <br>
          <form class="for" action="<%=request.getContextPath()%>/generateReportInput" method="post">
            
            <br>
              <label for="inputop">Select Input:</label>
            <select name="inputop" id="inputop">
                <option value="audi">----Select input----</option>
                <option value="student_name">Student_ID</option>
                <option value="game">Game</option>
                <option value="university">University</option>
                <option value="university">Event ID</option>

              </select>
              <br>
              <label for="inp">Input:</label>
              <input type="text" name="inp" id="inp" placeholder="Enter the input">
              <br>
              <br>
              <button class="button is-success">Generate Report</button>                        
           </form>
  </body>
</html>
