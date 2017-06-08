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
        
    </div>
    </div>
</div>
    </body>
</html>
