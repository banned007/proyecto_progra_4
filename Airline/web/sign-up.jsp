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
                    <h1 class="titulo3">Registro a Aerolíneas EXODUS</h1>
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
                    <div class="container text-center"><button class="btn btn-info btn-block login" type="button" onclick="controller.userAdd();">Registrarse</button></div>
                
                
            </div>
        <script>
        //Modell
    function AirModel(){
        this.AirModel();
    }
    
        AirModel.prototype = {
            AirModel: function () {
        }
   
    };
    </script>
    <script>
//Controller
    function AirController(model, view){
        this.AirController(model, view);
    }
    
    AirController.prototype={
        AirController: function(model, view){
            this.model=model;
            this.view=view;
            
        },
        login: function(){
            var view = this.view;
            usuario = new Usuario(document.getElementById("id").value,document.getElementById("clave").value,0);
            console.log(usuario);
            Proxy.userLogin(usuario,
                function(usuario){
                    switch(usuario.tipo){
                        case 0: // usuario no existe
                            window.alert("Datos Incorrectos");
                            
                            break;
                        case 1: // cliente
                            document.location = "/Airline/index.jsp";
                            break;
                        case 2: // manager
                            document.location = "/Airline/AdminMenu.jsp";
                            break;
                    }
                });
        },
        
        userAdd: function(){
            var view = this.view;
            var model = this.model;
            var usuario = new Usuario(document.getElementById("usuario").value, document.getElementById("pass").value, 1);
            var cliente = new Cliente(document.getElementById("usuario").value, document.getElementById("nombre").value, document.getElementById("apellido").value,document.getElementById("correo").value,document.getElementById("fechaN").value, document.getElementById("direccion").value, document.getElementById("telefono").value, document.getElementById("celular").value );
                Proxy.userAdd(usuario,
                    function(status){
                        switch(status){
                            case 0:
                                Proxy.clientAdd(cliente,function(result){
                                    document.location = "/Airline/DatosAgregados.jsp";
                                });
                                
                                
                                break;
                                 
                            case 1:
                                window.alert("Registro duplicado");
                        }
                    });
        }
    };
    </script>
    <script>
//View
    var model;
    var controller;
    
        function pageLoad(event) {
            model = new AirModel();
            controller = new AirController(model, window);
  
        }
        function showErrorMessage(){
            window.alert("Usuario incorrecto...");
        }
        document.addEventListener("DOMContentLoaded", pageLoad);
    </script>

</html>
