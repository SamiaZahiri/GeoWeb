<%-- 
    Document   : index
    Created on : 15 jan. 2022, 21:29:26
    Author     : Samia
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="ma.entites.Utilisateur"%>
<%@page import="ma.metier.UserImpl"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ma template</title>
        <%@include file="/contenu/css.jsp" %>
        <script src="script/jquery-3.5.1.min.js"></script>
        <script src="script/phoneparuser.js" type="text/javascript"></script>

        <style>
            input{
                margin-left: 90px;


            }
            label{
                margin-left: 40px;
                margin-top:  20px;

            }
        </style>
    </head>
    <body>
        <%@include file="/contenu/header.jsp" %>
        <%@include file="/contenu/sidebar.jsp" %>

        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <a class="navbar-brand" href="javascript:;">Dashboard</a>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="navbar-toggler-icon icon-bar"></span>
                        <span class="navbar-toggler-icon icon-bar"></span>
                        <span class="navbar-toggler-icon icon-bar"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end">
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
                            <li class="nav-item dropdown">
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
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
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
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5">
                            <input id="op" type="hidden" name="op"/>

                            <table border="0" id="mTable" >
                                
                                <tr>

                                    <td>
                                        <div class="form-group">
                                            <label class="bmd-label-floating" style="color: #26446d; "><b>Choisir_User:</b></label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <select style="margin-bottom: 5%" class="form-control" id="utilisateur" name="utilisateur">
                                                        <option selected disabled>Choisir votre user</option>
                                                        <% UserImpl ss = new UserImpl();
                                                            for (Utilisateur s : ss.findAll()) {
                                                        %>
                                                        
                                                        <option value="<%= s.getId()%>"><%=s.getNom()%></option>
                                                        <%}%>
                                                        
                                                    </select>
                                        </div>
                                    </td>


                                </tr>

                                <tr>
                                                    

                                    <td ><br>
                                        </div>
                                        <button id="recherche"  class="btn btn-round btn-success pull-right" style="background-color: #66CDAA">Chercher</button>
                                        <div class="clearfix"></div>
                                    </td>
                                </tr>
                                </tbody>
                            </table><br><br>

                        </div>





                        <!--<div class="col-lg-6 col-md-12" style="background-color: #66CDAA">-->
                        <div class="card">
                            <!-- ici pour changer la couleur du header du tableau-->
                            <div class="card-header card-header-rose">
                                <h4 class="card-title" >Liste des SmartPhones</h4>
                                <!-- <p class="card-category">New employees on 15th September, 2016</p>-->
                            </div>
                            <div class="card-body table-responsive" >
                                <table class="table table-hover" >
                                    <thead class="text-rose">
                                    <th>ID</th>
                                    <th>Imei</th>
                                  
                                    
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


            <%@include file="/contenu/footer.jsp" %>

    </body>
    <%@include file="/contenu/js.jsp" %>
</html>
