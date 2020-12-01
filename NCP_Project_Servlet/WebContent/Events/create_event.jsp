<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin - Create New Event</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
  <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript" charset="utf-8">
  </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js" type="text/javascript"
    charset="utf-8"></script>
  <script src="../js/tag-it.js" type="text/javascript" charset="utf-8"></script>
  <link href="../_static/master.css" rel="stylesheet" type="text/css">
  <link href="../css/jquery.tagit.css" rel="stylesheet" type="text/css">
  <link href="../css/tagit.ui-zendesk.css" rel="stylesheet" type="text/css">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript" charset="utf-8">
  </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js" type="text/javascript"
    charset="utf-8"></script>
  <script src="../js/tag-it.js" type="text/javascript" charset="utf-8"></script>
  <script>
    $(function () {
      var sampleTags = ['singing', 'dancing', 'sports', 'cultural', 'drama', 'indoor', 'outdoor', 'drawing'];

      $('#singleFieldTags').tagit({
        availableTags: sampleTags,
        singleField: true,
        singleFieldNode: $('#mySingleField')
      });


      $('#myULTags').tagit({
        availableTags: sampleTags,
        itemName: 'item',
        fieldName: 'tags'
      });

      var eventTags = $('#eventTags');

      var addEvent = function (text) {
        $('#events_container').append(text + '<br>');
      };

      eventTags.tagit({
        availableTags: sampleTags,
        beforeTagAdded: function (evt, ui) {
          if (!ui.duringInitialization) {
            addEvent('beforeTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
          }
        },
        afterTagAdded: function (evt, ui) {
          if (!ui.duringInitialization) {
            addEvent('afterTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
          }
        },
        beforeTagRemoved: function (evt, ui) {
          addEvent('beforeTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
        },
        afterTagRemoved: function (evt, ui) {
          addEvent('afterTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
        },
        onTagClicked: function (evt, ui) {
          addEvent('onTagClicked: ' + eventTags.tagit('tagLabel', ui.tag));
        },
        onTagExists: function (evt, ui) {
          addEvent('onTagExists: ' + eventTags.tagit('tagLabel', ui.existingTag));
        }
      });

    });
  </script>
  	<script src="../js/adminPageNavbar.js"></script>
</head>

<body>
<div id="nav-placeholder"></div>

  <section class="hero is-info">
    <div class="hero-body">
      <div class="container is-center">
        <h1 class="title ">
          Create New Event
        </h1>
        <h2 class="subtitle">
          To create a new event, fill all the required inputs
        </h2>
      </div>
    </div>
  </section>

  <form action="<%= request.getContextPath() %>/addEvent" method="post" onsubmit="return validateSubmission()">
    <div class="container mb-3">
      <div class="field">
        <label class="label">Event Name</label>
        <div class="control">
          <input class="input" name="event_name" type="text" placeholder="Event Name" required>
        </div>
      </div>

      <div class="field">
        <label class="label">Event Description</label>
        <div class="control">
          <textarea class="textarea" name="event_desc" placeholder="Description" required></textarea>
        </div>
      </div>

      <div class="field">
        <label class="label">Add Event Tags</label>
        <div class="control" id="wrapper">
          <input hidden name="event_tags" id="mySingleField">
          <ul id="singleFieldTags"></ul>
        </div>
      </div>

      <div class="columns">
        <div class="column">
          <label class="label">Type of participation</label>
          <div class="select">
            <select id="event_type_participation" name="event_type_participation" style="width:370px;" onchange="validateParticipationType()">
              <option value="0">Solo participation</option>
              <option value="1">Team participation</option>
            </select>
          </div>
        </div>

        <div class="column">
          <label class="label">Start Date of Event</label>
          <input class="input" name="event_start_datetime" type="datetime-local" id="start_date_time" required>
        </div>

        <div class="column">
          <label class="label">End Date of Event</label>
          <input class="input" name="event_end_datetime" type="datetime-local" id="end_date_time" required>
        </div>
      </div>

      <div class="columns">
        <div class="column">
          <label class="label">Venue of Event</label>
          <input class="input" name="event_venue" type="text" placeholder="Venue" required>
        </div>

        <div class="column">
          <label class="label">Max. No. of Participants in a team</label>
          <input class="input" name="event_max_participants" id="event_max_participants" type="number" value="1"
            placeholder="Number of participants" required disabled="True">
        </div>

        <div class="column">
          <label class="label">Registration Link</label>
          <input class="input" name="event_registration_link" type="url" placeholder="Enter URL here" >
        </div>
      </div>


      <div class="field">
        <div class="field is-horizontal">
          <div class="field-label is-normal">
            <label class="label">Organizer</label>
          </div>
          <div class="field-body">
            <div class="field">
              <p class="control has-icons-left">
                <span class="select">
                  <select name="event_organizer_college" required>
                    <option selected>Amrita Vishwa Vidyapeetham</option>
                    <option>Others</option>
                  </select>
                </span>
                <span class="icon is-small is-left">
                  <i class="fas fa-user-circle"></i>
                </span>
              </p>
            </div>

            <div class="field">
              <p class="control has-icons-left">
                <span class="select">
                  <select name="event_organizer_campus">
                    <option selected>Coimbatore</option>
                    <option>Amritapuri</option>
                    <option>Bangalore</option>
                    <option>Chennai</option>
                  </select>
                </span>
                <span class="icon is-small is-left">
                  <i class="fas fa-globe"></i>
                </span>
              </p>
            </div>
          </div>
        </div>
        <div class="field is-horizontal">
          <div class="field-label is-normal">
            <label class="label">If Others, please specify the address</label>
          </div>
          <div class="field-body">
            <div class="field">
              <p class="control has-icons-left">
                <div class="control has-icons-left">
                  <input class="input" name="event_organizer_other" type="text" placeholder="Address">
                  <span class="icon is-small is-left">
                    <i class="fas fa-address-card"></i>
                  </span>
                </div>
              </p>
            </div>
          </div>
        </div>
        <div class="field is-horizontal">
          <div class="field-label is-normal">
            <label class="label">Organizer Name</label>
          </div>
          <div class="field-body">
            <div class="field control has-icons-left">
              <input class="input" name="event_organizer_name" type="text" placeholder="Contact Name" required multiple>
              <span class="icon is-small is-left">
                <i class="fas fa-user-circle"></i>
              </span>
            </div>
          </div>
        </div>
        <div class="field is-horizontal">
          <div class="field-label is-normal">
            <label class="label">Organizer Email</label>
          </div>
          <div class="field-body">
            <div class="field">
              <div class="control has-icons-left has-icons-right">
                <input class="input" name="event_organizer_email" id="event_organizer_email" type="email" placeholder="Contact Email" multiple
                  required>
                <span class="icon is-small is-left">
                  <i class="fas fa-envelope"></i>
                </span>
              </div>
            </div>
          </div>
        </div>
        <div class="field is-horizontal">
          <div class="field-label is-normal">
            <label class="label">Organizer Phone</label>
          </div>
          <div class="field-body">
            <div class="field is-expanded">
              <div class="field has-addons">
                <p class="control">
                  <a class="button is-static">
                    +91
                  </a>
                </p>
                <p class="control is-expanded">
                  <input class="input" name="event_organizer_phone" id="event_organizer_phone" type="tel" pattern="[0-9]{10}"
                    placeholder="Contact Number" required>
                </p>
              </div>
            </div>
          </div>
        </div>
        <div class="field is-horizontal">
          <div class="field-label is-normal">
            <label class="label">Other Organizer Details</label>
          </div>
          <div class="field-body">
            <div class="field">
              <div class="control">
                <textarea class="textarea" name="event_organizer_details" placeholder="Details" required></textarea>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="field">
        <label class="label">Upload Poster</label>
        <div class="file has-name">
          <label class="file-label">
            <input class="file-input" type="file" name="event_organizer_poster">
            <span class="file-cta">
              <span class="file-icon">
                <i class="fas fa-upload"></i>
              </span>
              <span class="file-label">
                Choose a file
              </span>
            </span>
            <span class="file-name">
              Filename
            </span>
          </label>
        </div>
      </div>

      <div class="field is-grouped is-grouped-centered">
        <p class="control">
          <!-- <a class="button is-primary">
            Create
          </a> -->
          <input type="submit" class="button is-primary" value="Create">
        </p>
        <p class="control">
          <!-- <a class="button is-light">
            Reset
          </a> -->
          <input type="reset" class="button is-light" value="Reset">
        </p>
      </div>
    </div>
  </form>

  <script>
  	function validateParticipationType() {
  		var participation_type = document.getElementById('event_type_participation')
        var team_size = document.getElementsByName('event_max_participants')
        
        if ((participation_type.value).toString() === "0") {
        	console.log(participation_type.value)
      	  document.getElementById('event_max_participants').innerHTML = "1";
      	  document.getElementById('event_max_participants').disabled = true;
         }
        else {
        	document.getElementById('event_max_participants').disabled = false;
        }
  	}
    function validateSubmission() {
      var email = document.getElementById('event_organizer_email').value
      var phone = document.getElementById('event_organizer_phone').value
    	  
      if (validateEmailAddress(email)) {
        if (validatePhone(phone)) {
        	console.log("Event Created")
          alert("Event Created Successfully!!")
          return true;
        }
      }
      else {
    	  alert("Cannot create new event!! Retry")
    	  return false;
      }
    }

    function validateEmailAddress(email) {
      var re =
        /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      if (!email.value.match(re)) {
        alert("Invalid Email address")
        email.focus()
        return false
      }
      return true
    }

    function validatePhone(phone) {
      var re = /^([0|\+[0-9]{1,5})?([7-9][0-9]{9})$/
      if (!phone.value.match(re)) {
        alert("Invalid Phone number")
        phone.focus()
        return false
      }
      return true
    }
  </script>
</body>

</html>