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
  	<script src="../js/adminPageNavbar.js"></script>
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
<form id="for" action="">
  <label for="entrydate">From:</label>
  <input type="date" name="entrydate" id="entrydate">
  <label for="closedate">To:</label>
  <input type="date" name="closedate" id="closedate">
  <br>
  <br>
  <button class="button is-success">Generate Report</button>
</form>
<br>
<h2 id="ahe2"> <b>Report Generated</b> </h2>
<br>
<table style="width: 70%;">
    <tr>
        <th>Event ID</th>
        <th>Event name</th>
        <th>Student Name</th>
        <th>Student's University</th>
        <th>Game</th>
    </tr>
    <tr>
        <td>101</td>
        <td>Inter Campus Championship</td>
        <td>Ram</td>
        <td>PSG</td>
        <td>Football</td>

    </tr>
    <tr>
     <td>102</td>
     <td>State Level</td>
     <td>Jose</td>
     <td>Sri Krishna</td>
     <td>Basket Ball</td>

 </tr>
 <tr>
         <td>103</td>
         <td>National Level</td>
         <td>Krishna</td>
         <td>Amrita</td>
         <td>Volleyball</td>
 </tr>
 <tr>
     <tr>
         <td>104</td>
         <td>Inter Campus Championship</td>
         <td>Teja</td>
         <td>PSG</td>
         <td>Football</td>

     </tr>
 </tr>


</table>
</html>
