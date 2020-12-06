<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Leaderboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
    <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script>$(function(){
  	  $("#nav-placeholder").load("<%=request.getContextPath()%>/Navbar/studentPageNavbar.jsp");
  	});</script> 
</head>

<body>

<div id="nav-placeholder"></div>

    <section class="hero is-info">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">
                    Leaderboard
                </h1>
                <h2 class="subtitle">
                    View the scores of the students based on the events that they have participated
                </h2>
            </div>
        </div>
    </section>
    
    <table class="table is-hoverable is-fullwidth" id="myTable">
        <thead>
            <tr class="header">
                <th style="width:30%;">Student Name</th>
                <th style="width:30%;">Student ID</th>
                <th style="width:10%;">Student Score</th>
                <th style="width:30%;">Skills</th>
            </tr>
        </thead>
        <%  
			ArrayList<ArrayList<String>> listLeads = (ArrayList<ArrayList<String>>) request.getAttribute("leaderboard");
			
			// print the information about every category of the list
			for(ArrayList<String> lead : listLeads) {%>
				<tr>
		            <td><%=lead.get(1) %></td>
		            <td><%=lead.get(0) %></td>
		            <td><%=lead.get(2) %></td>
		            <td>
		                <span class="tag"><%=lead.get(3) %></span>
		                <span class="tag"><%=lead.get(4) %></span>
		            </td>
		        </tr>
				 
				 <%
			}
			%>
        <tr>
            <td>Sanjay Tharagesh R S</td>
            <td>10</td>
            <td>5</td>
            <td>
                <span class="tag">Competitive coding</span>
                <span class="tag">Football</span>
            </td>
        </tr>
        <tr>
            <td>Neeraj Kumar</td>
            <td>11</td>
            <td>2</td>
            <td>
                <span class="tag">Web designing</span>
            </td>
        </tr>
        <tr>
            <td>Gayathri</td>
            <td>12</td>
            <td>4</td>
            <td>
                <span class="tag">PHP</span>
                <span class="tag">Drawing</span>
            </td>
        </tr>
        <tr>
            <td>Prathyusha</td>
            <td>13</td>
            <td>3</td>
            <td>
                <span class="tag">Competitive Coding</span>
            </td>
        </tr>
        <tr>
            <td>Srishilesh</td>
            <td>14</td>
            <td>1</td>
            <td>
                <span class="tag">Karate</span>
            </td>
        </tr>
    </table>
    <script>
        sortTable();
        function sortTable() {
            var table, rows, switching, i, x, y, shouldSwitch;
            table = document.getElementById("myTable");
            switching = true;
            /*Make a loop that will continue until
            no switching has been done:*/
            while (switching) {
                //start by saying: no switching is done:
                switching = false;
                rows = table.rows;
                /*Loop through all table rows (except the
                first, which contains table headers):*/
                for (i = 1; i < (rows.length - 1); i++) { 
                    // start by saying there should be no switching: 
                    shouldSwitch=false;
                    /*Get the two elements you want to compare, 
                    one from current row and one from the next: */
                    x = rows[i].getElementsByTagName("td")[2];
                    y = rows[i + 1].getElementsByTagName("td")[2]; 
                    //check if the two rows should switch place: 
                    if (Number(x.innerHTML) < Number(y.innerHTML)) {
                        //if so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                }
                if (shouldSwitch) {
                    /*If a switch has been marked, make the switch
                    and mark that a switch has been done:*/
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                }
            }
        }
    </script>
</body>

</html>