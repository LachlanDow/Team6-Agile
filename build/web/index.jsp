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

  <title>PROFINDER</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">PROFINDER</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
       <!-- <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
        </ul>-->
      </div>
    </div>
  </nav>

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
                <input type="text" class="form-control" placeholder="<% out.print(dc.getString()); %>" id="searchZip"/>
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
               <button class="btn btn-cyan" type="submit" onclick="buttonClick()" id="subButton">Search</button>
               <br><br>
               <% 
                   Object[][] input = lp.getData("023");
                   for(int i = 0; i < input.length; i++) { %>
               <h3> <% out.print(input[i][0] + " " + input[i][1]); %> </h3>
               <% } %>
            </form>
          </div>
          
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <iframe
  width="600"
  height="700"
  frameborder="0" style="border:0"
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyC7ZyEezKMEQ5y-onGLfbeYWiXG6ve--3M
    &q=Space+Needle,Seattle+WA" allowfullscreen>
</iframe>
    

          
          
          
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

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
  
  <script> 
      function buttonClick() {
              document.getElementByID('subButton').innerText = "new Test";
      }
  </script>

</body>
</html>
