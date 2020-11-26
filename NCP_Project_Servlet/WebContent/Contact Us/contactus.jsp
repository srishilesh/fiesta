<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Contact Us</title>
	<link rel="shortcut icon" href="../images/fav_icon.png" type="image/x-icon">
	<link rel="stylesheet" href="https://unpkg.com/bulma@0.9.0/css/bulma.min.css" />
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
		integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<link rel="stylesheet" href="../css/contact.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script src="../js/landingPageNavbar.js"></script>
</head>

<body>
 <div id="nav-placeholder"></div>
  <section class="section has-background-info hero">
                <div class="hero-body">
                    <div class="container has-text-centered">
                        <div class="box cta is-primary columns is-8 is-variable ">
                            <div class=" has-background-white column is-two-thirds has-text-left">
                                <h1 class="has-text-weight-bold section title is-1">Contact Us</h1>
                                <p class="has-text-weight-semibold is-size-4">Enter your details so we can clear any of your querires or you can contact us in future if needed.</p>
                                <div class="social-media">
                                    <a href="https://facebook.com" target="_blank" class="button is-light is-large"><i class="fa fa-facebook-square" aria-hidden="true"></i></a>
                                    <a href="https://instagram.com" target="_blank" class="button is-light is-large"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                                    <a href="https://twitter.com" target="_blank" class="button is-light is-large"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                </div>
                            </div>
                            <div class="has-background-success-light box cta column is-one-third has-text-left">
                                <form id="myForm" action="<%= request.getContextPath() %>/contactus" method="post">

                                    <div class="field">
                                        <label class="label">Name</label>
                                        <div class="control ">
                                            <input class="input is-rounded" type="text" required="">
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label class="label">Phone Number</label>
                                        <div class="control">
                                            <input class="input is-rounded" type="Phone" required="">
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label class="label">Email Address</label>
                                        <div class="control">
                                            <input class="input is-rounded has-text-weight-normal" type="Email" required="">
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label class="label">Message</label>
                                        <div class="control">
                                            <textarea class="input textarea is-medium"></textarea>
                                        </div>
                                    </div>
                                    <div class="control">
                                        <button type="submit" onclick="alert('Details Submitted')" class="button is-link is-fullwidth has-text-weight-medium is-medium">Send Message</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
  </section>
</body>

</html>
