<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registration page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href='https://fonts.googleapis.com/css?family=Abhaya Libre' rel='stylesheet'>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script src="../js/landingPageNavbar.js"></script>
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
    body{
      background: url("redback.jpg");
    background-position: center center;
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    }

    .for h1{
        padding: 34px !important;
        text-align: center !important;
    }

    .for input{
        margin-left: 3% !important;
        width: 300px;
    } 

    label{
        width: 100px !important ;
    }
    body{

    }
    #gi, #ag, #sk{
       margin-top: 4%;
    }
    #cb{
      width: fit-content !important;
    }
    #p1, #p2{
      color: red;
    }
  </style>
  <body>
    <div id="nav-placeholder"></div>
      <form class="for" action="<%= request.getContextPath() %>/registration" method="post" name="for">
        <h1>Sign Up</h1>
        <label for="name">Name:</label>
        <input  id="name" name="name" type="text" placeholder="Name"> 
        <br>
        <br>
        <p id="p1"></p>
        <label for="email">Email:  </label>
        <input  id="email" name="email" type="email" placeholder="Email"> 
        <br>
        <br>
        <label for="password">Password:</label>
        <input  id="password" type="password" name="password" placeholder="Password">         
        <p id="p2"></p>
        <label for="roll">Roll Number:</label>
        <input id="roll" type="text" name="roll"  placeholder="CB.EN.U4CSE17000">
        <br>
        <button class="btn btn-success" >Sign Up</button>        
       </form>
       <script>
        function validateform(){
          var status=false;
          var x= document.forms['for']['Username'].value;
          if(x==""){
              document.getElementById("p1").innerHTML="        Please enter a valid username!" ;
              status=false;     
          }
          else{
            document.getElementById("p1").innerHTML="";
            status=true;
          }
          var x=document.forms['for']['Password'].value;
          var pwd=/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
          if(!x.match(pwd)){
            document.getElementById("p2").innerHTML="Password must be of 8 characters with one uppercase letter, numbers and special characters!" ;
            status=false;
          }
          else{
            document.getElementById("p2").innerHTML="";
          }
          return status;
        }
      </script>
  </body>
</html>
