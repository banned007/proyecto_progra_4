<%-- 
    Document   : AdminMenu
    Created on : 27-may-2017, 20:02:20
    Author     : kerly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="Imports.jspf" %>
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <div class="container" id="c1">
    <div class="panel panel-default">
    <div class="panel-body">
        <br><br>
        <h1 class="titulo1">Administración &nbsp <span class="glyphicon glyphicon-plane"></span></h1>
        <hr>
        
       
        <a href="/Airline/Gestion_Aviones.jsp" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-edit"></span> Gestion de Aviones
        </a>
        <br><br>
        <a href="/Airline/Gestion_Ciudades.jsp" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-edit"></span> Gestion de Ciudades
        </a>
        <br><br>
        <a href="/Airline/Gestion_Rutas.jsp" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-edit"></span> Gestion de Rutas
        </a>
        <br><br>
        <a href="/Airline/Gestion_Vuelos.jsp" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-edit"></span> Gestion de Vuelos
        </a>
        <br><br>
        <a href="#" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-edit"></span> Gestion de Viajes
        </a>
        
    </div>
    </div>
</div>
    </body>
</html>
