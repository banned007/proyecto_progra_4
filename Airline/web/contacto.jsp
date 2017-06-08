<%-- 
    Document   : contacto
    Created on : 20-may-2017, 18:39:26
    Author     : kerly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contactenos</title>
        <%@ include file="Imports.jspf" %> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js"></script>
        <script type="text/javascript" src="js/html2canvas.js"></script> 
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <div class="container" id="c1">
    <div class="panel panel-default">
    <div class="panel-body">
        <br><br>
        <h1 class="titulo1">Contáctenos &nbsp <span class="glyphicon glyphicon-send"></span></h1>
        <hr>
        <h2 class="titulo2">
            <span class="glyphicon glyphicon-phone-alt"></span> &nbsp 7072-4345 &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
            <span class="glyphicon glyphicon-phone"></span> &nbsp +506 7072-4345
        </h2>
        <p class="texto">
            Comuniquese con nosotros. &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Desde fuera del país.
        </p>
        <hr>
        <img class="iconn" src="img/facebook.png"><img class="iconn" src="img/twitter.png"><img class="iconn" src="img/instagram.png">
        <button class="btn btn-success btn-lg btn-block" type="button" onclick="exportar()"></button>
        
    </div>
    </div>
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
                            document.location = "/Airline/contacto.jsp";
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
        
        function exportar(){
            var compra = document.getElementById("c1");  
            html2canvas(compra, {
                onrendered: function(canvas) {
                  var img = canvas.toDataURL("image/png");
                  var doc = new jsPDF({
                    unit:'px',
                    format:'a4'
                  });
                  doc.addImage(img,'PNG', 0, 0);
                  doc.save("tiquete.pdf");

                }
            });
        }
        
        document.addEventListener("DOMContentLoaded", pageLoad);
    </script>
    </body>
</html>
