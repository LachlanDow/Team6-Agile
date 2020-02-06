<%-- 
    Document   : index
    Created on : 06-Feb-2020, 11:29:32
    Author     : camer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DatabaseConnection.*"%>
<!DOCTYPE html>

<%
    DistanceCalculator dc = new DistanceCalculator();
    ListProcedures lp = new ListProcedures();
%>

<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <style>
            /* Set the size of the div element that contains the map */
            #map {
                height: 450px;  /* The height is 400 pixels */
                width: 600px;  /* The width is the width of the web page */
            }
        </style>

        <title>PROFINDER</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/shop-homepage.css" rel="stylesheet">

    </head>

    <body>

        <!-- Navigation -->
        <!--        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                    <div class="container">
                        <a class="navbar-brand" href="#">PROFINDER</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                </nav>-->

        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <div class="col-lg-3">

                    <h1 class="my-4">Search</h1>
                    <div class="list-group">
                        <div>
                            <form class="custom-range">

                                <label for="search">Search For procedure </label>
                                <input type="text" class="form-control" placeholder="Search" id="searchCode"/>
                                <br>
                                <label for="zipcode">Zipcode </label>
                                <input type="text" class="form-control" placeholder="Zipcode" id="searchZip"/>
                                <br>
                                <label for="Distance">Maximum Distance</label>
                                <input type="range" min="0" max="5000" id="Distance" class="custom-range"/>
                                <br>
                                <label for="minPice">Minimum Price</label>
                                <input type="range" min="0" max="100000" id="minPrice" class="custom-range"/>

                                <br>

                                <label for="maxPrice">Maximum Price</label>
                                <input  type="range" min="0" max="100" id ="maxPrice" class="custom-range"/>
                                <br><br>
                                <button class="btn btn-cyan" type="submit" id="subButton">Search</button>
                                <br><br>

                            </form>
                        </div>

                    </div>
                    
                    <div id="map"></div>

                </div>
                <!-- /.col-lg-3 -->

                <!--                <script>
                                    function showLiveLocation() {
                                        var locationInfo; //infoWindow to inform the user of their location on the map
                                        locationInfo = new google.maps.InfoWindow();
                
                                        // Try HTML5 geolocation.
                                        if (navigator.geolocation) {
                                            navigator.geolocation.getCurrentPosition(function (position) {
                                                var userPos = {
                                                    lat: position.coords.latitude,
                                                    lng: position.coords.longitude
                                                };
                
                                                locationInfo.setContent('Location found.');
                                                map.setCenter(userPos);
                
                                                //Sets the position/center to the user's live location
                                                locationInfo.setPosition(userPos);
                                                locationInfo.open(map);
                                                currentLocation.setPosition(userPos);
                                                currentLocation.setMap(map);
                                                distanceRadius.setCenter(userPos);
                                                //distanceRadius.setMap(map);
                
                                            }, function () {
                                                handleLocationError(true, locationInfo, map.getCenter());
                                            });
                                        } else {
                                            // Browser doesn't support Geolocation
                                            handleLocationError(false, locationInfo, map.getCenter());
                                        }
                                    }
                
                                    function handleLocationError(browserHasGeolocation, locationInfo, userPos) {
                                        locationInfo.setPosition(userPos);
                                        locationInfo.setContent(browserHasGeolocation ?
                                                'Error: The Geolocation service failed.' :
                                                'Error: Your browser doesn\'t support geolocation.');
                                        locationInfo.open(map);
                                    }
                
                
                                    function hideLiveLocation() {
                                        currentLocation.setMap(null);
                                    }
                
                                    function showDistanceRadius() {
                                        //distanceRadius.setRadius(miles * 1609.34);
                                        distanceRadius.setMap(map);
                                    }
                
                                    function hideDistanceRadius() {
                                        distanceRadius.setMap(null);
                                    }
                
                                    // Initialize and add the map
                                    function initMap() {
                
                                        // The location of providerID 10005
                                        var mapDefault = {
                                        lat: 31.23,
                                                lng: - 85.4
                                        };
                                            // The map, centered at providerID 10005
                                        var map = new google.maps.Map(
                                                document.getElementById('map'), {
                                        zoom: 8,
                                                center: mapDefault
                                        });
                                        // The marker which is used to show the user's live location
                                        var currentLocation = new google.maps.Marker({
                                        icon: {
                                        path: google.maps.SymbolPath.CIRCLE,
                                                scale: 5,
                                                strokeColor: '#0000FF',
                                                strokeOpacity: 1,
                                                strokeWeight: 1,
                                                fillColor: '#0000FF',
                                                fillOpacity: 0.7,
                                        },
                                                animation: google.maps.Animation.DROP
                                        });
                                        //The distance in miles used to mark the distance radius
                                        var miles = 40;
                                        // The circle which is used to mark a distance radius
                                        var distanceRadius = new google.maps.Circle({
                                        strokeColor: '#0000FF',
                                                strokeOpacity: 0.8,
                                                strokeWeight: 2,
                                                fillColor: '#0000FF',
                                                fillOpacity: 0.35,
                                                radius: miles * 1609.34,
                                        });
                                        //used to store provider details from the database
                                        //[[ID, Name, Lat, Long], [provider 2]] etc
                                        //use getProviderDetails() procedure
                                        var locations = <% lp.getLocations(); %>;
                                        ​
                                        //used to store the procedure details of the clicked marker?
                                        var infoString;
                                        ​
                                        //https://stackoverflow.com/questions/3059044/google-maps-js-api-v3-simple-multiple-marker-example/38113268#38113268
                                        for (i = 0; i < locations.length; i++) {
                                            marker = new google.maps.Marker({
                                            position: new google.maps.LatLng(locations[i][2], locations[i][3]),
                                            map: map,
                                            data: {
                                            id: locations[i][0],
                                                    name: locations[i][1]},
                                            title: locations[i][1],
                                            visible: true});
                //                            marker.addListener('click', function() {
                //                                if (!this.infoWindow) {
                //                                    this.infoWindow = new google.maps.InfoWindow({content: this.data.name}); //change to infoString
                //                                    this.infoWindow.open(map, this);
                //                                }
                //                            }
                                        }
                                    }
                
                                </script>-->

                

                <!-- /.row -->

            </div>
            <!-- /.col-lg-9 -->

            <table style="width:100%">
                <tr>
                    <th bgcolor="#d1d1d1" style="width:25%"> Code / Name </th>
                    <th bgcolor="#949494" style="width:25%">  </th>
                    <th bgcolor="#d1d1d1" style="width:25%">  </th>
                    <th bgcolor="#949494" style="width:25%">  </th>
                </tr>  

                <%
                    Object[][] input = lp.getLocations();
                    for (int i = 0; i < input.length; i++) { %>

                <tr>
                    <th bgcolor="#a4f28d"><%out.print(input[i][0]);%></th>
                    <th bgcolor="#d8f2d0"><%out.print(input[i][1]);%></th>
                    <th bgcolor="#a4f28d"><%out.print(input[i][2]);%></th>
                    <th bgcolor="#d8f2d0"><%out.print(input[i][3]);%></th>
                </tr>            
                <% }%>

            </table>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
    
    
    <script>
        // Initialize and add the map
        function initMap() {
          // The location of Uluru
//          var uluru = {lat: -25.344, lng: 131.036};
//          var uluru2 = {lat: -26.344, lng: 131.036};
          // The map, centered at Uluru
          
          var inLat = 31.2;
          var inLong = -85.5;
          var mapCenter = {lat: inLat, lng: inLong};
          
          var map = new google.maps.Map(
              document.getElementById('map'), {zoom: 4, center: mapCenter});
          // The marker, positioned at Uluru
          
        <% Object[][] locs = dc.getDistanceList(lp.getData("032"), 31.2, -85.5);
            for (int i = 0; i < 20; i++) {
                if (Double.parseDouble(locs[i][4].toString()) <= 500) {
          %>
                  
          var position = {lat: <% out.print(locs[i][6]); %>, lng: <% out.print(locs[i][7]); %>};
                  var marker = new google.maps.Marker({position: position, map: map});
          
          <% } 
            }         
          %>
          
          var locationInfo, userPos;
          var miles = 500;
          var currentLocation = new google.maps.Marker({
              icon: {
                  path: google.maps.SymbolPath.CIRCLE,
                  scale: 5,
                  strokeColor: '#0000FF',
                  strokeOpacity: 1,
                  strokeWeight: 1,
                  fillColor: '#0000FF',
                  fillOpacity: 0.7,},
              animation: google.maps.Animation.DROP
          });
          
          var distanceRadius = new google.maps.Circle({
              strokeColor: '#0000FF',
              strokeOpacity: 0.8,
              strokeWeight: 2,
              fillColor: '#0000FF',
              fillOpacity: 0.35,
              radius: miles * 1609.34,
          });
          
          locationInfo = new google.maps.InfoWindow();
          
          distanceRadius.setCenter(mapCenter);
          distanceRadius.setMap(map);
            
        }
    </script>
    <!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHrI2s54VaG8SwRvUWbbji0Bn7bOqXxio&callback=initMap">
    </script>

    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
        </div>
        <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    
    
</body>
</html>
