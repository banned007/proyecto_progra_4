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
    
                    <form method="POST" name="formulario" id="formulario" action="javascript:doSubmit();">
                        
                            Usuario*</td><td><input type="text" id="usuario" required>
                            Contraseña*</td><td><input type="password" id="pass" required>
                            Nombre*</td><td><input type="text" id="nombre" required>
                            Apellido*</td><td><input type="text" id="apellido" required>
                            Correo electrónico*</td><td><input type="text" id="correo" required>
                            Fecha de nacimiento*</td><td><input type="text" id="fechaN" required>
                            Dirección*</td><td><input type="text" class="paragraph" id="direccion" required>
                            Telefono de trabajo*</td><td><input type="text" id="telefono" required>
                            Celular*</td><td><input type="text" id="celular"required>
                        
                    
                    <div class="container text-center"><input class="btn btn-info btn-block login" type="submit" value="Registrar"></div>
                    </form>


                    <br>
<div id="map" style="width:100%;height:400px;"></div> 
                </div>
<br>
 </div> </div> 

  
<script>
    function initMap() {
        var uluru = {lat:10.0000000, lng:-84.0000000};
        var map = new google.maps.Map(document.getElementById("map"),{zoom:4,center: uluru});
        var marker = new google.maps.Marker({position: uluru, map: map, title:'Click to zoom'});
        marker.addListener('click',function () {
            map.setZoom(8);
            marker.setPosition(uluru);
            map.setCenter(marker.getPosition());
        });
        google.maps.event.addListener(map,'click',function (e) {
            placeMarker(e.latLng, map, marker);});
    }

    function placeMarker(position,map, marker) {
        var geocoder= new google.maps.Geocoder;
        var infowindow= new google.maps.InfoWindow({content:'An InfoWindow'});
        infowindow.close();
        marker.setPosition(position);
        geocodeLatLng(geocoder, map, infowindow, position, marker);
        map.panTo(position);
    }

    function geocodeLatLng(geocoder,map, infowindow, position,marker) {
        geocoder.geocode({'location':position}, function (results,status) {
            if (status=== 'OK') {
                if (results[1]) {
                    infowindow.setContent(results[0].formatted_address);
                    infowindow.open(map, marker);
                    document.getElementById("direccion").value= results[0].formatted_address;
                } 
                else {
                    window.alert('No results found');
                }
            } 
            else {
                window.alert('Geocoder failed due to: '+ status);
            }
        });
    }
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6Gh_5v5HN4-TRBMNs2UeU88vmeAmk_n8&callback=initMap"></script>                 
 
        
        
<script>
    //Modell
    function AirModel() {
        this.AirModel();
    }

    AirModel.prototype = {
        AirModel: function () {
        }

    };
</script>
<script>
    //Controller
    function AirController(model, view) {
        this.AirController(model, view);
    }

    AirController.prototype = {
        AirController: function (model, view) {
            this.model = model;
            this.view = view;

        },
        login: function () {
            var view = this.view;
            usuario = new Usuario(document.getElementById("id").value, document.getElementById("clave").value, 0);
            console.log(usuario);
            Proxy.userLogin(usuario,
                    function (usuario) {
                        switch (usuario.tipo) {
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

        userAdd: function (usuario, cliente) {
            Proxy.userAdd(usuario,
                    function (status) {
                      //usuario no disponible
                       
                    });
            
            Proxy.clientAdd(cliente, function (result) {
                     //redireccionar
        });
    }
    }
        
    
    
</script>

<script>
    //View
    var model;
    var controller;

    function pageLoad(event) {
        model = new AirModel();
        controller = new AirController(model, window);       

        
    }
    function showErrorMessage() {
        window.alert("Usuario incorrecto...");
    }  

   function doSubmit(){
    var usuario = new Usuario(document.getElementById("usuario").value, document.getElementById("pass").value, 1);
    var cliente = new Cliente(document.getElementById("usuario").value, document.getElementById("nombre").value, 
    document.getElementById("apellido").value, document.getElementById("correo").value, document.getElementById("fechaN").value, 
    document.getElementById("direccion").value, document.getElementById("telefono").value, document.getElementById("celular").value);
    controller.userAdd(usuario, cliente);
   }
  
    document.addEventListener("DOMContentLoaded", pageLoad);
</script>




</body>


</html>