<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Event Registration- Team participation</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
        <script src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
          <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script src="../../js/studentPageNavbar.js"></script>
    </head>

    <body>

      <div id="nav-placeholder"></div>

        <div class="container">
            <div class="field">
                <label class="label">Number of Participants (Remove this - Use backend)</label>
                <div class="control">
                  <input name="no_of_participants" class="input is-" type="number" id="no_of_participants" required>
                  <button class="button is-primary" name="participant" onclick="addFields();">Add Names</button>
                  <h4 class="title is-4">1st participant is the Team leader</h4>
                  <form action="" method="">
                    <div class="field" id="create-container">
                    </div>
                    <input type="submit" class="button is-primary is-centered" value="Submit">
                    <input type="reset" class="button is-primary is-centered" value="Reset">
                  </form>
                </div>
              </div>
        </div>
        
        <script>
              function addFields() {
                debugger;
                var number = document.getElementsByName("no_of_participants")[0].value;
                var container = document.getElementById("create-container");
                container.innerHTML = '';
                for (i = 0; i < number; i++) {
                        var participant = document.createTextNode("Participant " + (i + 1));
                        var participant = document.createElement("label");
                        participant.innerHTML = "Participant "+(i + 1);
                        participant.className = "subtitle is-4";
                        container.appendChild(participant);
                        var input = document.createElement("input");
                        input.type = "text";
                        input.name = "name" + i;
                        input.className = "input";
                        container.appendChild(input);
                        container.appendChild(document.createElement("br"));
                    }
                }
          </script>
    </body>
</html>