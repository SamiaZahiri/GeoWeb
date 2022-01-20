<%-- 
    Document   : index
    Created on : 18 déc. 2020, 21:29:26
    Author     : Samia
--%>

<%@page import="ma.metier.SmartPhoneImpl"%>
<%@page import="ma.entites.SmartPhone"%>
<%@page import="ma.metier.SmartPhoneLocal"%>
<%@page import="ma.entites.Utilisateur"%>
<%@page import="ma.metier.UserImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ma template</title>
        <%@include file="./contenu/css.jsp" %>
        </script><script src="script/jquery-3.5.1.min.js" type="text/javascript"></script>
		<script src="script/position.js" type="text/javascript"></script>

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
                        <div class="col-md-5" >
                             
<!--                                    <form>
                                     
                                </tbody>-->
                                                <h4 class="header-title" style="color: #26446d">Informations Position</h4>
                                                <form >
                                               
                                                <fieldset > 
                                  
                                                <div class="form-group">
                                                    <label class="bmd-label-floating" style="color: #26446d"><b>Latitude:</b></label>
                                                     <input type="text" id="latitude" name="latitude" class="form-control" placeholder="Entrer latitude">

                                                </div>
                                                <div class="form-group">
                                                    <label class="bmd-label-floating" style="color: #26446d"><b>Langitude:</b></label>
                                                     <input type="text" id="langitude" name="langitude" class="form-control" placeholder="Entrer langitude">

                                                </div>
                                                <div class="form-group">
                                                    <label class="bmd-label-floating" style="color: #26446d"><b>Date:</b></label>
                                                     <input type="date" id="date" name="date" class="form-control" placeholder="Entrer la date">

                                                </div>
                                               
                                               
                                                <div class="form-group">
                                                    <label class="bmd-label-floating" style="color: #26446d; "><b>SmartPhone:</b></label>
                                                    <select style="margin-bottom: 5%" class="form-control" id="smartphone" name="smartphone">
                                                        <option selected disabled>Choisir votre SmartPhone</option>
                                                         
                                                        
                                                     <option value="">imei1</option>
                                                      <option value="">imei2</option>
                                                       <option value="">imei3</option>
                                                        
                                                    </select>
                                                    
                                                </div>
                                                    </fieldset >
                                                <!-- <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">Ajouter</button>-->
                                                <button  class="btn btn-round btn-rose " type="submit" id="add"> Ajouter</button>
                                            </form>
<!--                                        </div>
                                    </div>
                                </div>-->
                         

                        </div>





                        <!--<div class="col-lg-6 col-md-12" style="background-color: #66CDAA">-->
                        <div class="card">
                           <div class="card-header card-header-info">
                                <h4 class="card-title" >Liste des Positions</h4>
                               
                            </div>
                            <div class="card-body table-responsive" >
                                <table class="table table-hover" >
                                    <thead class="text-info">
                                    <th>ID</th>
                                    <th>Latitude</th>
                                    <th>Langitude</th>
                                 	<th>Date</th>
                                 	<th>Imei</th>
                                    <th>Supprimer</th>
                                    <th>Modifier</th>
                                    </thead>
                                    <tbody id="content">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--</div>-->
                    </div>
                </div>
            </div>


            <%@include file="./contenu/footer.jsp" %>

    </body>
    <%@include file="./contenu/js.jsp" %>
</html>
