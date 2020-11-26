<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<nav class="navbar" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
      <a class="navbar-item" href="<%= request.getContextPath() %>/home">
        <img src="../Logo/Fiesta.PNG" width="112" height="28">
      </a>

      <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false"
        data-target="navbarBasicExample">
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </a>
    </div>

    <div id="navbarBasicExample" class="navbar-menu">
      <div class="navbar-start">
        <a class="navbar-item">
          About Us
        </a>

        <a class="navbar-item" href="<%= request.getContextPath() %>/contactus">
          Contact Us
        </a>

        <a class="navbar-item" href="<%= request.getContextPath() %>/adminLogin">
          Admin Login
        </a>
      </div>

      <div class="navbar-end">
        <div class="navbar-item">
          <div class="buttons">
            <a class="button is-primary" href="<%= request.getContextPath() %>/registration">
              <strong>Sign up</strong>
            </a>
            <a class="button is-light" href="<%= request.getContextPath() %>/studentLogin">
              Log in
            </a>
          </div>
        </div>
      </div>
    </div>
  </nav>
  



