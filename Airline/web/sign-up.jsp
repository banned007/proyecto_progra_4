<%-- 
    Document   : sign-up
    Created on : 20-may-2017, 18:51:00
    Author     : kerly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <%@ include file="Imports.jspf" %>        
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-body">
                    <br><br>
                    <h1 class="titulo1">Registro a Aerolíneas EXODUS</h1>
                    <table class="log">
                        <tbody>
                            <tr class="inn"><td class="texto col-sm-7">Usuario*</td><td><input type="text" id="usuario"></td></tr>
                            <tr class="inn"><td class="texto col-sm-7">Contraseña*</td><td><input type="password" id="pass"></td><tr>
                            <tr class="inn"><td class="texto col-sm-7">Nombre*</td><td><input type="text" id="nombre"></td></tr>
                            <tr class="inn"><td class="texto col-sm-7">Apellido*</td><td><input type="text" id="apellido"></td></tr>
                            <tr class="inn"><td class="texto col-sm-7">Correo electrónico*</td><td><input type="text" id="correo"></td></tr>
                            <tr class="inn"><td class="texto col-sm-7">Fecha de nacimiento*</td><td><input type="text" id="fechaN"></td></tr>
                            <tr class="inn"><td class="texto col-sm-7">Dirección*</td><td><input type="text" class="paragraph" id="direccion"></td></tr>
                            <tr class="inn"><td class="texto col-sm-7">Telefono de trabajo*</td><td><input type="text" id="telefono"></td></tr>
                            <tr class="inn"><td class="texto col-sm-7">Celular*</td><td><input type="text" id="celular"></td>
                        </tbody>
                    </table>
                    <div class="container text-center"><a href="#" class="buybtn">Registrarse</a></div>
                </div>
            </div>
        </div>
    </body>
</html>
