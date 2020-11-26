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
  <script src="../../js/studentPageNavbar.js"></script>
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
        This Is the public Profile Page.
      </p>
    </div>
    <section class="container" id="about">
    <div class="has-background-info-light box cta section-heading">
      <h3 class="title is-3">About Michael Phelps</h3>
      <h4 class="subtitle is-5">Most decorated Olympian of all time, with a total of 28 medals.</h4>
      <div class="has-background-white-bis container box">
        <h5 class="subtitle is-6">Short Info:</h5>
        <p class="container has-text-centered">Michael Fred Phelps <strong>(born June 30, 1985)</strong>is an American former competitive swimmer and the most <strong>successful and most decorated Olympian</strong> of all time, with a total of <strong>28 medals</strong>. Phelps also holds the all-time records for <strong>[23 Olympic gold medals]</strong></p>
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
                  <td>Address:</td>
                  <td>Michael Phelps Foundation, 7 Ocean Street, 2nd Floor, South Portland Maine 04106</td>
                </tr>
                <tr>
                  <td>Phone:</td>
                  <td>+1 972 385 1021</td>
                </tr>
                <tr>
                  <td>Email:</td>
                  <td>@michaelphelpsfoundation.org</td>
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
              <img src="phelps.PNG" alt="Placeholder image">
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
                      <strong>Swimming:</strong>
                      <br>
                      <progress class="progress is-primary" value="100" max="100"></progress>
                    </p>
                  </div>
                </div>
              </article>
              <article class="media">
                <div class="media-content">
                  <div class="content">
                    <p>
                      <strong>Golf:</strong>
                      <br>
                      <progress class="progress is-primary" value="70" max="100"></progress>
                    </p>
                  </div>
                </div>
              </article>
              <article class="media">
                <div class="media-content">
                  <div class="content">
                    <p>
                      <strong>Diving:</strong>
                      <br>
                      <progress class="progress is-primary" value="55" max="100"></progress>
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
      <h3 class="title is-3">Previous Achievements:</h3>
    </div>
    <div class="container">
      <div class="columns">
        <div class="column">
          <div class="box">
            <div class="content">
              <h4 class="title is-5">Achievement 1</h4>
              Enter Details.
            </div>
          </div>
        </div>
        <div class="column">
          <div class="box">
            <div class="content">
              <h4 class="title is-5">Achievement 2</h4>
              Enter Details.
              </div>
          </div>
        </div>
      </div>
</body>
</html>
