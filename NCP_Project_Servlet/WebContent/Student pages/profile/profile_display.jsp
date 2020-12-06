<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
    <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
    <link rel="stylesheet" href="style.css">
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script>
  $(function(){
  	  $("#nav-placeholder").load("<%=request.getContextPath()%>/Navbar/studentPageNavbar.jsp");
  	});
  </script>
</head>	

<body>
  <div id="nav-placeholder"></div>
  <section class="hero is-info is-primary">
      <div class="hero-body">      
        <div class="container has-text-centered">     
          <p class="title">
            Profile Page
          </p>
        </div>
      </div>
    </section>
    <div class="box cta is-light">
      <p class="has-text-centered">
        This is a Public Profile Page.
      </p>
    </div>
    <%ArrayList<String> lst = (ArrayList<String>) request.getAttribute("profile");%>
    <section class="container" id="about">
    <div class="has-background-info-light box cta section-heading">
      <h3 class="title is-3">About <%= lst.get(0) %></h3>
      <div class="has-background-white-bis container box">
        <p class="container has-text-centered"><%= lst.get(1) %></p>
      </div>
    </div>

    <div class="columns has-same-height">
      <div class="column is-4">
        <div class="card">
          <div class="card-content">
            <h3 class="title is-4">Contact Details:</h3>

            <div class="content">
              <table class="table-profile">
                <tr>
                  <th colspan="1"></th>
                  <th colspan="2"></th>
                </tr>
                <tr>
                  <td><strong>Address:</strong></td>
                  <td><%= lst.get(2) %></td>
                </tr>
                <tr>
                  <td><strong>Phone:</strong></td>
                  <td><%= lst.get(8) %></td>
                </tr>
                <tr>
                  <td><strong>Email:</strong></td>
                  <td><%= lst.get(7) %></td>
                </tr>
              </table>
            </div>
            <br>

          </div>
        </div>
      </div>
      <div class="column is-4">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="<%=request.getContextPath()%>/octocat.png" alt="Placeholder image">
            </figure>
          </div>
        </div>
      </div>
      <div class="column is-4">
        <div class="card">
          <div class="card-content skills-content">
            <h3 class="title is-4">Skills</h3>
            <div class="content">
              <article class="media">
                <div class="media-content">
                  <div class="content">
                    <p>
                      <strong><%= lst.get(3) %></strong>
                      <br>
                      <progress class="progress is-primary" value="<%= lst.get(5) %>" max="5"></progress>
                    </p>
                  </div>
                </div>
              </article>
              <article class="media">
                <div class="media-content">
                  <div class="content">
                    <p>
                      <strong><%= lst.get(4) %></strong>
                      <br>
                      <progress class="progress is-primary" value="<%= lst.get(6) %>" max="5"></progress>
                    </p>
                  </div>
                </div>
              </article>
            </div>
          </div>
        </div>
      </div>
    </div>      
  </section>
  <section class="has-background-info-light container section" id="about">
    <div class="box section-heading">
      <h3 class="title is-3">Top Achievement</h3>
    </div>
    <div class="container">
      <div class="columns">
        <div class="column">
          <div class="box">
            <div class="content">
              <h4 class="title is-5"><%= lst.get(9) %></h4>
              <%= lst.get(10) %>
            </div>
          </div>
        </div>
        
      </div>
</body>
</html>
