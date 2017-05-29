<%-- 
    Document   : historia
    Created on : 20-may-2017, 18:39:37
    Author     : kerly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historia</title>
    <%@ include file="Imports.jspf" %>        
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-body">
                    <img src="img/avion.jpg" class="img-thumbnail">
                    <br><br>
                    <h1 class="titulo3">Acerca de Aerolíneas EXODUS</h1>
                    <hr>
                    <p class="texto"> <img id="logoL" src="img/logoHistoria2.png" class="img-thumbnail">
                        EXODUS es la línea que nos une, la aerolínea más grande de Costa Rica. Operamos más de 600 vuelos diarios y nuestro principal centro de operaciones está localizado en la Terminal 2 del Aeropuerto Internacional Juan Santamaría. Nuestra red de destinos alcanza más de 80 ciudades en tres continentes: 2 en Costa Rica, 16 en el resto de Latinoamérica, 16 en Estados Unidos, tres en Canadá, tres en Europa y dos en Asia.
                        La flota actual del Grupo suma más de 120 aviones Boeing 787, 777, 737, así como Embraer 145, 170, 175 y 190 de última generación. En 2012, anunciamos el plan de inversión más importante en la historia de la aviación en Costa Rica, la compra de 100 aviones Boeing conformados por 90 equipos 737 MAX y 10 equipos 787-8 y 787-9 Dreamliner.
                        Como socio fundador de SkyTeam, en EXODUS ofrecemos más de 1,000 destinos en 177 países, a través de las 20 aerolíneas socias que integran la alianza, por medio del cual tú puedes obtener diferentes beneficios y disfrutar de 636 salas VIP alrededor del mundo. Al mismo tiempo que, gracias a los códigos compartidos que tiene con Delta Air Lines, Alaska Airlines, Avianca, y GOL, te ofrecemos una amplia conectividad dentro de países como Estados Unidos, Brasil, Canadá, Chile, Colombia, y Perú.</P>
                    <hr>
                    <h1 class="titulo3">Historia</h1>
                    <p>
                        El 25 de diciembre de 2016, emprendimos nuestro primer vuelo entre la San José y Miami operado por el capitán Walter Chávez, a bordo de un equipo Stinson SR con matrícula XB-AJI. El siguiente día, Aerolineas EXODUS fue establecida por Kerly Gómez Toaza. Otras fechas claves:<br>
                          -   2017(Enero): Delta y Aerolíneas EXODUS buscan una asociación en vuelos (joint venture) entre Estados Unidos y Costa Rica.<br>
                          -   2017(Marzo): Delta Air Lines informa que es su intención de adquirir hasta un total de un 49% del capital social de Grupo Aerolíneas EXODUS.<br>
                    </p>
                    <h1 class="titulo3">Premios y Reconocimientos</h1>
                    
                    <h2 class="titulo2">2017</h2>
                    <p class="texto"> <img id="logoR" src="img/logoHistoria1.png" class="img-thumbnail">
                      -   Mejor aerolinea: Food and Travel Costa Rica Reader Awards <br>
                      -   Premio a Mejor Tecnología en Vuelo por la revista Latin Trade, en donde Aerolíneas EXODUS es reconocida por los servicios que ofrecen sus equipos Boeing 787 Dreamliner.<br>
                      -   Catalogada por Interbrand como no. 16 entre las 25 mejores marcas de Latinoamérica por su estabilidad y salud financiera. <br>
                      -   Reconocidos por cuarto año consecutivo como Empresa Socialmente Responsable por el Centro Costarricense de Filantropía. <br>
                    </p>

                    <hr>
                    
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
