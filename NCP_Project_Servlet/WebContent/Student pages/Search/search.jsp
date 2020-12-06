<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
    <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script>
  $(function(){
  	  $("#nav-placeholder").load("<%=request.getContextPath()%>/Navbar/studentPageNavbar.jsp");
  	});
  </script>
</head>

<body>

    <div id="nav-placeholder"></div>
    <section class="hero is-info">
        <div class="hero-body">
            <div class="container">
                <h1 class="title">
                    Search Students based on Tags
                </h1>
                <h2 class="subtitle">
                    Enter the tags in the search box
                </h2>
            </div>
        </div>
    </section>

    <div class="container">
        <div class="field"></div>
        <div class="field is-horizontal">
            <input class="input" type="text" id="myInput" onkeyup="myFunction()" placeholder="Type tags"
                title="Type in a name">
            &nbsp;
            <p class="control has-icons-left">
                <span class="select">
                    <select id="filteroption">
                        <option selected value=2>Tag</option>
                        <option value=0>Student Name</option>
                        <option value=1> Student ID</option>
                    </select>
                </span>
                <span class="icon is-small is-left">
                    <i class="fas fa-filter"></i>
                </span>
            </p>

        </div>
        <table class="table is-hoverable is-fullwidth" id="myTable">
            <tr class="header">
                <th style="width:40%;">Student Name</th>
                <th style="width:40%;">Student ID</th>
                <th style="width:30%;">Tags</th>
            </tr>
            <%  
			ArrayList<ArrayList<String>> listLeads = (ArrayList<ArrayList<String>>) request.getAttribute("search");
			
			// print the information about every category of the list
			for(ArrayList<String> lead : listLeads) {%>
				<tr>
		            <td><%=lead.get(1) %></td>
		            <td><%=lead.get(0) %></td>
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
                <td>
                    <span class="tag">Competitive coding</span>
                    <span class="tag">Football</span>
                </td>
            </tr>
            <tr>
                <td>Neeraj Kumar</td>
                <td>11</td>
                <td>
                    <span class="tag">Web designing</span>
                </td>
            </tr>
            <tr>
                <td>Gayathri</td>
                <td>12</td>
                <td>
                    <span class="tag">PHP</span>
                    <span class="tag">Drawing</span>
                </td>
            </tr>
            <tr>
                <td>Prathyusha</td>
                <td>13</td>
                <td>
                    <span class="tag">Competitive Coding</span>
                </td>
            </tr>
            <tr>
                <td>Srishilesh</td>
                <td>14</td>
                <td>
                    <span class="tag">Karate</span>
                </td>
            </tr>
        </table>
    </div>

    <script>
        function myFunction() {
            var input, filter, table, tr, td, i, txtValue, filter_option, filter;
            var f = 2;
            filter_option = document.getElementById("filteroption");
            filter = filter_option.options[filter_option.selectedIndex].value;
            if (filter == 0)
                f = 0
            else if (filter == 1)
                f = 1;
            else
                f = 2;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[f];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>

</body>

</html>