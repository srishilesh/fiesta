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
    </head>

    <body>

        <nav class="navbar is-fixed-top" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a class="navbar-item" href="#">
        <img src="../Logo/Fiesta.PNG" width="112" height="28">
            </a>
            <a id="navbar-burger" role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="menubar">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>

    <div id="navbarBasicExample" class="navbar-menu">
      <div class="navbar-start">
        <a class="navbar-item">
          View Students
        </a>
  
        <a class="navbar-item">
          News
        </a>
  
        <div class="navbar-item has-dropdown is-hoverable">
          <a class="navbar-link">
            More
          </a>
  
          <div class="navbar-dropdown">
            <a class="navbar-item">
              About
            </a>
            <a class="navbar-item">
              Add Events
            </a>
            <a class="navbar-item">
              Contact
            </a>
            <hr class="navbar-divider">
            <a class="navbar-item">
              Report an issue
            </a>
          </div>
        </div>
        </div>
        <div id="navbarBasicExample" class="navbar-menu">
            <div class="navbar-end">
                <a class="navbar-item" href="#details" data-target="details">Student Details</a>
                <a class="navbar-item" href="#achievements" data-target="achievements">Achievements</a>
                <a class="navbar-item" href="#contact" data-target="contact">Contact Details</a>
            </div>
        </div>
    </div>
    </nav>

    <!-- STUDENT DETAILS -->
    <section id="details" class="section">
        <div class="notification is-info" style="height:45em"><h2 class="subtitle is-2">Student details</h2>



<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">Student</label>
  </div>
  <div class="field-body">

    <div class="field">
      <p class="control is-expanded has-icons-left">
        <input class="input" type="text" placeholder="Name">
        <span class="icon is-small is-left">
          <i class="fas fa-user"></i>
        </span>
      </p>
    </div>

    <div class="field">
      <p class="control is-expanded has-icons-left ">
        <input class="input" type="date" placeholder="Date of brith">
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
              <input class="input" type="text" placeholder="Registration number">
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
              <input class="input" type="month" placeholder="Select the month and year of graduation">
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
          <select>
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
          <input type="radio" name="member">
          Yes
        </label>
        <label class="radio">
          <input type="radio" name="member">
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
        <input class="input" type="text" placeholder="e.g. Tennis Football Basketball (Enter with spaces)">
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
        <textarea class="textarea" placeholder="Tell us more about you :) "></textarea>
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

        </div>
    </section>


    <!-- ACHIEVEMENTS -->
    <section id="achievements" class="section">
        <div class="notification is-info" style="height:45em"><h2 class="subtitle is-2"> Achievements</h2>


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


        </div>
    </section>


    <!--CONTACT STUDENTS -->
    <section id="contact" class="section">
        <div class="notification is-info" style="height:20em"><h2 class="subtitle is-2"> Contact details</h2>



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

        </div>
    </section>

    </body>
</html>




