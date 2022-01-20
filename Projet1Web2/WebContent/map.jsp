<%-- 
    Document   : index
    Created on : 18 déc. 2020, 21:29:26
    Author     : Samia
--%>

<%@page import="ma.entites.Utilisateur"%>
<%@page import="ma.metier.UserImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>My Google map</title>
<script src="script/jquery-3.5.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="script/map.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link href="scripte/footer.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ma template</title>
        <%@include file="./contenu/css.jsp" %>
        </script><script src="script/jquery-3.5.1.min.js" type="text/javascript"></script>
		<script src="script/smartphone.js" type="text/javascript"></script>

<!--        <style>
            input{
                margin-left: 40%;
                margin-bottom: 20%;


            }
            

           
        </style>-->
    </head>
    <body>
        <%@include file="./contenu/header.jsp" %>
        <%@include file="./contenu/sidebar.jsp" %>

        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " style="color: #26446d">
                <div class="container-fluid" >
                    <div class="navbar-wrapper" >
                        <a class="navbar-brand" href="javascript:;">Dashboard</a>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="sr-only" >Toggle navigation</span>
                        <span class="navbar-toggler-icon icon-bar"></span>
                        <span class="navbar-toggler-icon icon-bar"></span>
                        <span class="navbar-toggler-icon icon-bar"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" >
                        <form class="navbar-form">
                            <div class="input-group no-border">
                                <input type="text" value="" class="form-control" placeholder="Search...">
                                <button type="submit" class="btn btn-white btn-round btn-just-icon">
                                    <i class="material-icons">search</i>
                                    <div class="ripple-container"></div>
                                </button>
                            </div>
                        </form>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="javascript:;">
                                    <i class="material-icons">dashboard</i>
                                    <p class="d-lg-none d-md-block">
                                        Stats
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item dropdown" >
                                <a class="nav-link" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">notifications</i>
                                    <span class="notification">5</span>
                                    <p class="d-lg-none d-md-block">
                                        Some Actions
                                    </p>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">Mike John responded to your email</a>
                                    <a class="dropdown-item" href="#">You have 5 new tasks</a>
                                    <a class="dropdown-item" href="#">You're now friend with Andrew</a>
                                    <a class="dropdown-item" href="#">Another Notification</a>
                                    <a class="dropdown-item" href="#">Another One</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link" href="javascript:;" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">person</i>
                                    <p class="d-lg-none d-md-block">
                                        Account
                                    </p>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile" >
                                    <a class="dropdown-item" href="#">Profile</a>
                                    <a class="dropdown-item" href="#">Settings</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Log out</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content" >
                <div class="container" >
                    <div class="row" >
                        <div class="col-md-12" >
                        
           	<div class="container">
		
<div class="card card-outline-secondary">
			<h3 style="text-align: center;font-family: bold; color: navy;">Position Utilisateur</h3>
			
           
                                            
			<!--<button type="submit" class="btn btn-info"  id="submitt">capture
				position</button>-->
			<!--The div element for the map -->
			<div id="map"></div>
			<div class="form-row" style="margin: 20px">
				<div class="form-group col-md-6">
					<label for="inputDate">Date 1</label>
					 <input type="date" class="form-control" id="inputDate">	<label for="inputDate">Date 2</label>
						 <input type="date" class="form-control" id="inputDate2">
						 <button  class="btn btn-round btn-info " type="submit" id="submitt"> Position</button>
				</div>
			</div>
		</div>
	</div>
	
	
                             
<!--                                    
<!--                                        </div>
                                    </div>
                                </div>-->
                         

                        </div>





                        <!--<div class="col-lg-6 col-md-12" style="background-color: #66CDAA">-->
                        <div class="card">
                           
                            <div class="card-body table-responsive" >
                               
                            </div>
                        </div>
                        <!--</div>-->
                    </div>
                </div>
            </div>

<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="script/map.js">
		
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDeR8QO50fgwE-ny80ZhXT619bcGzo7aiM&callback=initMap&libraries=&v=weekly"
		async></script>
	
 <%@include file="./contenu/footer.jsp" %>

    </body>
    <%@include file="./contenu/js.jsp" %>
</html>




