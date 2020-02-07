<%-- 
    Document   : index
    Created on : 06-Feb-2020, 11:29:32
    Author     : Cameron McNeill - Lachlan Dow - Nicole Orr
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
                height: 550px;  /* The height is 400 pixels */
                width: 800px;  /* The width is the width of the web page */
            }
        </style>

        <title>Craneware</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/shop-homepage.css" rel="stylesheet">

    </head>

    <body>


        <!-- Page Content -->
        <div class="container">

            <div class="row">
                <!-- Navigation -->
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                    <div class="container">
                        <a class="navbar-brand" href="#">Craneware and Team Six</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                </nav>
            </div>

            <div class="row" style="padding-top: 60px;">

                <div class="col-lg-3">

                    <h1 class="my-4">Search</h1>
                    <div class="list-group">
                        <div>
                            <form class="custom-range" action="index.jsp" method="get">

                                <label for="search">Search For procedure </label>
                                <input type="text" class="form-control" placeholder="Search" id="searchCode" name="searchCode"/>
                                <br>
                                
                                <label for="zipcode">Zipcode </label>
                                <input type="text" class="form-control" placeholder="Zipcode" id="searchZip" name="searchZip"/>
                                <br>
                                <label id="maxDist">Maximum Distance - 750</label>
                                <input type="range" min="0" max="1500" id="Distance" class="custom-range" name="distance"/>
                                <br>
                                <label id="minPriceDisp">Minimum Price - 50000</label>
                                <input type="range" min="0" max="100000" id="minPrice" class="custom-range" name="minPrice"/>
                                <br>
                                <label id="maxPriceDisp">Maximum Price - 50000</label>
                                <input  type="range" min="0" max="100000" id ="maxPrice" class="custom-range" name="maxPrice"/>
                                <br>
                                <br>
                                <button type="submit" value="submit" id="subButton">Search</button>
                                <br>
                                <br>

                                <script>

                                    document.getElementById("Distance").addEventListener("click", function () {
                                        document.getElementById("maxDist").innerHTML = "Maximum Distance - " + document.getElementById("Distance").value;
                                    });

                                    document.getElementById("minPrice").addEventListener("click", function () {
                                        document.getElementById("minPriceDisp").innerHTML = "Minimum Price - " + document.getElementById("minPrice").value;
                                        document.getElementById("maxPrice").min = document.getElementById("minPrice").value;
                                        document.getElementById("maxPriceDisp").innerHTML = "Maximum Price - " + document.getElementById("maxPrice").value;
                                    });

                                    document.getElementById("maxPrice").addEventListener("click", function () {
                                        document.getElementById("maxPriceDisp").innerHTML = "Maximum Price - " + document.getElementById("maxPrice").value;
                                    });

                                    document.getElementById("subButton").addEventListener("click", function () {
                                        var outputString = document.getElementById("searchCode").value;
                                        outputString += document.getElementById("searchZip").value;
                                        outputString += document.getElementById("Distance").value;
                                        outputString += document.getElementById("minPrice").value;
                                        outputString += document.getElementById("maxPrice").value;
                                       
                                    });

                                </script>
                                
                            </form>
                        </div>

                    </div>

                </div>
                <!-- /.col-lg-3 -->

                <div id="map"></div>

            </div>
            <!-- /.col-lg-9 -->

            <table class="table table-sm table-dark" style="width:100%">
                <tr>
                    <th style="width:40%"> Code / Name </th>
                    <th style="width:15%"> Average Price </th>
                    <th style="width:10%"> Discharges </th>
                    <th style="width:20%"> Hospital Name</th>
                    <th style="width:15%"> Distance (Miles) </th>
                </tr>  

                
                
                <%
                    Object[][] input = dc.getDistanceList(lp.getData("032"), 501);
                    for (int i = 0; i < input.length; i++) { %>

                <tr>
                    <th><%out.print(input[i][0]);%></th>
                    <th><%out.print(input[i][1]);%></th>
                    <th><%out.print(input[i][2]);%></th>
                    <th><%out.print(input[i][3]);%></th>
                    <th><%out.print(input[i][4]);%></th>
                </tr>            
                <% }%>

            </table>
            
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Craneware and Team Six</p>
        </div>
        <!-- /.container -->
    </footer>

    <script>
        // Initialize and add the map
        function initMap() {
            
            <%String code = request.getParameter("searchCode");%>
            <%int zipcode = Integer.parseInt(request.getParameter("searchZip"));%>
            <%int distance = Integer.parseInt(request.getParameter("distance"));%>
            <%int minPrice = Integer.parseInt(request.getParameter("minPrice"));%>
            <%int maxPrice = Integer.parseInt(request.getParameter("maxPrice"));%>

            <%double[] coords = dc.getLatLong(zipcode);%>
                    
            var mapCenter = {lat: <% out.print(coords[0]); %>, lng: <% out.print(coords[1]); %>}; // add zipcode values
            
            var map = new google.maps.Map(
                    document.getElementById('map'), {zoom: 4, center: mapCenter});

            var miles = <% out.print(distance); %>;
            
            var infowindow = new google.maps.InfoWindow();

            var marker = [];

        <% Object[][] locs = dc.getDistanceList(lp.getData(code, minPrice, maxPrice), zipcode);
            for (int i = 0; i < locs.length; i++) {
                if (Double.parseDouble(locs[i][4].toString()) <= distance) {
        %>

            var position = {lat: <% out.print(locs[i][6]); %>, lng: <% out.print(locs[i][7]); %>};

            marker[<%out.print(i);%>] = new google.maps.Marker({position: position, map: map});

            marker[<%out.print(i);%>].addListener('click', function () {
                infowindow.setContent("HEllo" + <%out.print(i);%>);
                infowindow.open(map, marker[<%out.print(i);%>]);
            });
        <% }
            }%>

            var locationInfo, userPos;

            var currentLocation = new google.maps.Marker({
                icon: {
                    path: google.maps.SymbolPath.CIRCLE,
                    scale: 5,
                    strokeColor: '#0000FF',
                    strokeOpacity: 1,
                    strokeWeight: 1,
                    fillColor: '#0000FF',
                    fillOpacity: 0.7, },
                    animation: google.maps.Animation.DROP,
                    position: mapCenter,
                    map: map
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

    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHrI2s54VaG8SwRvUWbbji0Bn7bOqXxio&callback=initMap">
    </script>
    

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
