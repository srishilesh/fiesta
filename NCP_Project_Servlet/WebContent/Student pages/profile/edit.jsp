<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Students Profile</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
        <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
          <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script src="../../js/studentPageNavbar.js"></script>
    </head>

    <body>

       <div id="nav-placeholder"></div>
    <!-- STUDENT DETAILS -->
    <section id="details" class="section">
        <div class="notification is-info" style="height:45em"><h2 class="subtitle is-2">Student details</h2>

		<form action="<%= request.getContextPath() %>/addPersonal" method="post" id="student">
			<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">Student</label>
  </div>
  <div class="field-body">

    <div class="field">
      <p class="control is-expanded has-icons-left">
        <input class="input" type="text" name="studentname" placeholder="Name">
        <span class="icon is-small is-left">
          <i class="fas fa-user"></i>
        </span>
      </p>
    </div>

    <div class="field">
      <p class="control is-expanded has-icons-left ">
        <input class="input" type="date" name="dob" placeholder="Date of brith">
        <span class="icon is-small is-left">
          <i class="fas fa-birthday-cake"></i>
        </span>
      </p>
    </div>
  </div>
</div>


<div class="field is-horizontal">
      <div class="field-label is-normal">
      <label class="label">Registration number</label>
      </div>
      <div class="field-body">
        <div class="field">
          <div class="control">
            <p class="control is-expanded">
              <input class="input" type="text" name="registrationnumber" placeholder="Registration number">
            </p>
          </div>
        </div>
      </div>
</div>

<div class="field is-horizontal">
      <div class="field-label is-normal">
      <label class="label">Year of graduation</label>
      </div>
      <div class="field-body">
        <div class="field">
          <div class="control">
            <p class="control is-expanded">
              <input class="input" type="month" name="graduation" placeholder="Select the month and year of graduation">
            </p>
          </div>
          <p class="help">Select month and year</p>
        </div>
      </div>
</div>


<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">Department</label>
  </div>
  <div class="field-body">
    <div class="field is-narrow">
      <div class="control">
        <div class="select is-fullwidth">
          <select name="dept">
            <option>Computer Science & Engineering</option>
            <option>Electrical & Electronics Engineering </option>
            <option>Electronics & Communication Engineering</option>
            <option>Mechanical Engineering</option>
            <option>Chemical Engineering</option>
            <option>Aerospace Engineering</option>
          </select>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label">
    <label class="label">Available for upcoming events?</label>
  </div>
  <div class="field-body">
    <div class="field is-narrow">
      <div class="control">
        <label class="radio">
          <input type="radio" name="member" value="1">
          Yes
        </label>
        <label class="radio">
          <input type="radio" name="member" value="0">
          No
        </label>
      </div>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">Extracurricular activities</label>
  </div>
  <div class="field-body">
    <div class="field">
      <div class="control">
        <input class="input" type="text" name="extracurricular" placeholder="e.g. Tennis Football Basketball (Enter with spaces)">
      </div>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">About myself</label>
  </div>
  <div class="field-body">
    <div class="field">
      <div class="control">
        <textarea class="textarea" name="aboutme" placeholder="Tell us more about you :) "></textarea>
      </div>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label">
    <!-- Left empty for spacing -->
  </div>
      <div class="field is-grouped is-grouped-right">
      <p class="control">
        <input class="button is-link is-medium" type="Submit" value="Submit">
        </input>
      </p>
      <p class="control">
        <input class="button is-light is-medium" type="reset" value="Reset">
          </input>
      </p>
      </div>
</div>
			
		</form>

        </div>
    </section>


    <!-- ACHIEVEMENTS -->
    <section id="achievements" class="section">
        <div class="notification is-info" style="height:45em"><h2 class="subtitle is-2"> Achievements</h2>

		<form action="<%= request.getContextPath() %>/addAchievements" method="post" id="achievements">
			<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">Name of the Event</label>
  </div>
  <div class="field-body">

    <div class="field">
      <p class="control is-expanded has-icons-left">
        <input class="input" type="text" placeholder="Name of the event">
      </p>
    </div>
    <div class="field-label is-normal">
    <label class="label">When did it take place?</label>
  </div>
    <div class="field">
      <p class="control is-expanded has-icons-left ">
        <input class="input" type="date">
        <span class="icon is-small is-left">
          <i class="fas fa-calendar-alt"></i>
        </span>
      </p>
    </div>
  </div>
</div>



<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">Location</label>
  </div>
  <div class="field-body">

    <div class="field">
      <p class="control is-expanded has-icons-left">
        <input class="input" type="text" placeholder="Where did it take place?">
        <span class="icon is-small is-left">
        <i class="fas fa-map-marker-alt"></i>
      </span>
      </p>
    </div>
    <div class="field-label is-normal">
    <label class="label">Team size(1-15)</label>
    </div>
    <div class="field">
      <p class="control is-expanded has-icons-left ">
        <input class="input" type="number" min="1" max="15">
        <span class="icon is-small is-left">
          <i class="fas fa-user-friends"></i>
        </span>
      </p>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label">
    <label class="label">Participation</label>
  </div>
  <div class="field-body">
    <div class="field is-narrow">
      <div class="control">
        <label class="radio">
          <input type="radio" name="member">
          Winner
        </label>
        <label class="radio">
          <input type="radio" name="member">
          Just participated
        </label>
      </div>
    </div>
  </div>
</div>

<div class="field is-horizontal">
      <div class="field-label is-normal">
      <label class="label">Proof of participation/winner</label>
      </div>
      <div class="field-body">
        <div class="field">
          <div class="control">
            <p class="control is-expanded">
              <input class="input" type="url" placeholder="Enter the link here (Eg: Upload certificates to your Google drive and paste link)">
            </p>
          </div>

            <p class="help is-danger">Link will be checked and appropriate proof not found, submission will not be considered.</p>

        </div>
      </div>
</div>


<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">Specialization</label>
  </div>
  <div class="field-body">

    <div class="field">
      <p class="control is-expanded has-icons-left ">
        <input class="input" type="text" placeholder="Eg: Football/ Cricket/ Basketball">
        <span class="icon is-small is-left">
          <i class="fas fa-cricket"></i>
        </span>
      </p>
    </div>

    <div class="field">
      <p class="control is-expanded has-icons-left ">
        <input class="input" type="email" placeholder="Enter team leader's name">
        <span class="icon is-small is-left">
          <i class="fas fa-envelope"></i>
        </span>
      </p>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">Team leader</label>
  </div>
  <div class="field-body">

    <div class="field">
      <p class="control is-expanded has-icons-left ">
        <input class="input" type="text" placeholder="Fill in your name if it's a solo participation">
        <span class="icon is-small is-left">
          <i class="fas fa-user"></i>
        </span>
      </p>
    </div>

    <div class="field">
      <p class="control is-expanded has-icons-left ">
        <input class="input" type="email" placeholder="Enter team leader's id or e-mail(College/Primary)">
        <span class="icon is-small is-left">
          <i class="fas fa-envelope"></i>
        </span>
      </p>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">Describe the event</label>
  </div>
  <div class="field-body">
    <div class="field">
      <div class="control">
        <textarea class="textarea" placeholder="Tell us more about the event :) "></textarea>
      </div>
    </div>
  </div>
</div>


<div class="field is-horizontal">
  <div class="field-label">
    <!-- Left empty for spacing -->
  </div>
      <div class="field is-grouped is-grouped-right">
      <p class="control">
        <a class="button is-link is-medium">
          Submit
        </a>
      </p>
      <p class="control">
        <a class="button is-light is-medium">
          Cancel
        </a>
      </p>
      </div>
</div>						
		</form>
        </div>
    </section>


    <!--CONTACT STUDENTS -->
    <section id="contact" class="section">
        <div class="notification is-info" style="height:20em"><h2 class="subtitle is-2"> Contact details</h2>


		<form action="<%= request.getContextPath() %>/addContact" method="post" id="contact">
				<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">E-mail</label>
  </div>
  <div class="field-body">

    <div class="field">
      <p class="control is-expanded has-icons-left ">
        <input class="input" type="email" placeholder="Primary E-mail">
        <span class="icon is-small is-left">
          <i class="fas fa-envelope"></i>
        </span>
      </p>
    </div>

    <div class="field">
      <p class="control is-expanded has-icons-left ">
        <input class="input" type="email" placeholder="College E-mail">
        <span class="icon is-small is-left">
          <i class="fas fa-envelope"></i>
        </span>
      </p>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">Contact number</label>
  </div>
  <div class="field-body">

    <div class="field">
      <div class="field has-addons">
        <p class="control">
          <a class="button is-static">
            +91
          </a>
        </p>
        <p class="control is-expanded">
          <input class="input" type="tel" placeholder="Your phone number">
        </p>
      </div>
      <p class="help">Do not enter the first zero</p>
    </div>

    <div class="field">
      <div class="field has-addons">
        <p class="control">
          <a class="button is-static">
            +91
          </a>
        </p>
        <p class="control is-expanded">
          <input class="input" type="tel" placeholder="Alternate phone number">
        </p>
      </div>
      <p class="help">Do not enter the first zero</p>
    </div>
  </div>
</div>



<div class="field is-horizontal">
  <div class="field-label">
    <!-- Left empty for spacing -->
  </div>
      <div class="field is-grouped is-grouped-right">
      <p class="control">
        <a class="button is-link is-medium">
          Submit
        </a>
      </p>
      <p class="control">
        <a class="button is-light is-medium">
          Cancel
        </a>
      </p>
      </div>
</div>
						
		</form>

        </div>
    </section>

    </body>
</html>
