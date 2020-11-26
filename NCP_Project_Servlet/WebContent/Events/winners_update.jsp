<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Winners Update Page</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  	<script src="../js/adminPageNavbar.js"></script>
</head>
<style>
    #f1{
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
        margin-top: 7% !important;
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
    #f,#s,#t{
        margin-top: 10px;
    }
    #cb{
      width: fit-content !important;
    }
    body{
      background: url("123stage.jpg");
      background-position: center center;
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      width: 100%;
    }

</style>
<body>
   <div id="nav-placeholder"></div>
      <form action="" id="f1">
          <h1>Event Winners Update</h1>
          <label for="event_id">Event ID</label>
          <input type="text" name="event_id" id="event_id" placeholder="Event ID">
          <br>
          <label for="f"> 1<sup>st</sup> position:</label>
          <input type="text" name="f" id="f" placeholder="First position">
          <br>
          <label for="s">2 <sup>nd</sup> position:</label>
          <input type="text" name="s" id="s" placeholder="Second position">
          <br>
          <label for="t">3 <sup>rd</sup> position:</label>
          <input type="text" name="t" id="t" placeholder="Third position">
          <br>
          <br>
          <p><input type="checkbox" name="cb" id="cb" value="agreed"> I hereby agree to update the winners of this event.</p>
          <br>
          <button class="btn btn-md btn-success">Update</button>
          
      </form>
    
</body>
</html>
