<%-- 
    Document   : DatosAgregados
    Created on : 28-may-2017, 14:41:18
    Author     : kerly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contactenos</title>
        <%@ include file="Imports.jspf" %>        
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <div class="container">
    <div class="panel panel-default">
    <div class="panel-body">
        <br><br>
        <h1 class="titulo1">Usuario Registrado!!! Inicie Sesión!!! &nbsp <span class="glyphicon glyphicon-send"></span></h1>
        <hr>

        
    </div>
    </div>
</div>
    </body>
    
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
        document.addEventListener("DOMContentLoaded", pageLoad);
    </script>
</html>

