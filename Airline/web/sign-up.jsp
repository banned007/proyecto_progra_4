<%-- 
    Document   : sign-up
    Created on : 20-may-2017, 18:51:00
    Author     : kerly
--%>

<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
                    <% Usuario user2 = (Usuario) request.getSession().getAttribute("user"); int us;%>
                    <%if(user2==null){ us=0;%>
                        <h1 class="titulo3">Sign Up</h1>
                    <%}else{us=1;%>
                        <h1 class="titulo3">Configuración de la Cuenta</h1>
                    <%}%>
                    <form method="POST" name="formulario" id="formulario2" action="javascript:doSubmit(<%=us%>);">
                        <div>
                            <div class="input-group">
                                <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Usuario&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <%if(user2==null){%>
                                <input type="text" id="usuario"   class="input-lg" required>
                                <%}else{%>
                                <input type="text" id="usuario"   class="input-lg" value="<%=user2.getId()%>" disabled required>
                                <%}%>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contraseña&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <%if(user2==null){%>
                                <input type="password" id="pass"  class="input-lg" required>
                                <%}else{%>
                                <input type="text" id="pass"  class="input-lg" value="<%=user2.getClave()%>" required>
                                <%}%>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <%if(user2==null){%>
                                <input type="text" id="nombre" class="input-lg" required>
                                <%}else{%>
                                <input type="text" id="nombre" class="input-lg" value="<%=( (Cliente) request.getSession().getAttribute("client")).getNombre()%>"  required>
                                <%}%>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Apellido&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <%if(user2==null){%>
                                <input type="text" id="apellido" class="input-lg" required>
                                <%}else{%>
                                <input type="text" id="apellido" class="input-lg" value="<%=( (Cliente) request.getSession().getAttribute("client")).getApellido()%>"  required>
                                <%}%>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">Correo Electrónico</span>
                                <%if(user2==null){%>
                                <input type="email" id="correo" class="input-lg" required>
                                <%}else{%>
                                <input type="email" id="correo" class="input-lg" value="<%=( (Cliente) request.getSession().getAttribute("client")).getCorreo_electronico()%>" required>
                                <%}%>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">&nbsp;&nbsp;&nbsp;Fecha de Nacimiento&nbsp;&nbsp;</span>
                                <div class="input-append date" id="fNac"  data-date-format="dd/mm/yyyy">
                                    <%if(user2==null){
                                        Date fecha = new Date();
                                        Format formatter = new SimpleDateFormat("dd/MM/yyyy");
                                        String s = formatter.format(fecha);%>
                                        <input class="input-lg" size="16" type="text" id="fechaN" value="<%=s%>" required/>
                                    <%}else{%>
                                    <input class="input-lg" size="16" type="text" id="fechaN" value="<%=( (Cliente) request.getSession().getAttribute("client")).getFecha_nacimiento()%>" required/>
                                    <%}%>
                                    <span class="add-on"><i class="icon-th"></i></span>
                                </div>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dirección&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <%if(user2==null){%>
                                <textarea   id="direccion" class="input-lg" placeholder="Seleccione una dirección en el mapa" required disabled></textarea>
                                <%}else{%>
                                <textarea   id="direccion" class="input-lg" placeholder="Seleccione una dirección en el mapa" required disabled><%=( (Cliente) request.getSession().getAttribute("client")).getDireccion()%></textarea>
                                <%}%>
                            </div>
                            <br>
                            <div id="map" style="width:100%;height:400px;"></div> 
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">Teléfono</span>
                                <%if(user2==null){%>
                                <input type="number" id="telefono" class="input-lg" placeholder="Teléfono de Trabajo"  required>
                                <%}else{
                                String tel=( (Cliente) request.getSession().getAttribute("client")).getTelefono_trabajo();%>
                                <input type="number" id="telefono" class="input-lg" placeholder="Teléfono de Trabajo" value="<%=tel%>" required>
                                <%}%>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">&nbsp;Celular&nbsp;</span>
                                <%if(user2==null){%>
                                <input type="number" id="celular" class="input-lg" required>
                                <%}else{%>
                                <input type="number" id="celular" class="input-lg" value="<%=( (Cliente) request.getSession().getAttribute("client")).getCelular()%>"  required>
                                <%}%>
                            </div>
                            <br>

                            <%if(user2==null){%>
                            <div class="container text-center"><input class="btn btn-info" type="submit" value="Registrar"></div>
                            <%}else{%>
                            <div class="container text-center"><input class="btn btn-info" type="submit" value="Guardar"></div>
                            <%}%>
                    
                </div>
                    </form>
                            </div>
                            </div>
                            </div>
                            
                         


                <script>
                    function initMap() {
                        var uluru = {lat: 10.0000000, lng: -84.0000000};
                        var map = new google.maps.Map(document.getElementById("map"), {zoom: 4, center: uluru});
                        var marker = new google.maps.Marker({position: uluru, map: map, title: 'Click to zoom'});
                        marker.addListener('click', function () {
                            map.setZoom(8);
                            marker.setPosition(uluru);
                            map.setCenter(marker.getPosition());
                        });
                        google.maps.event.addListener(map, 'click', function (e) {
                            placeMarker(e.latLng, map, marker);
                        });
                    }

                    function placeMarker(position, map, marker) {
                        var geocoder = new google.maps.Geocoder;
                        var infowindow = new google.maps.InfoWindow({content: 'An InfoWindow'});
                        infowindow.close();
                        marker.setPosition(position);
                        geocodeLatLng(geocoder, map, infowindow, position, marker);
                        map.panTo(position);
                    }

                    function geocodeLatLng(geocoder, map, infowindow, position, marker) {
                        geocoder.geocode({'location': position}, function (results, status) {
                            if (status === 'OK') {
                                if (results[1]) {
                                    infowindow.setContent(results[0].formatted_address);
                                    infowindow.open(map, marker);
                                    document.getElementById("direccion").value = results[0].formatted_address;
                                } else {
                                    window.alert('No results found');
                                }
                            } else {
                                window.alert('Geocoder failed due to: ' + status);
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

                                        console.log(status);
                                        switch (status) {
                                            case 0:
                                                Proxy.clientAdd(cliente, function (result) {
                                                    //redireccionar
                                                    if (result == 0)
                                                        document.location = "/Airline/DatosAgregados.jsp";

                                                });

                                                break;
                                                //usuario no disponible
                                            case 1:
                                                window.alert("Usuario duplicado!!");
                                                break;
                                        }


                                    });


                        },
                        userUpdate: function (usuario, cliente){
                            Proxy.userUpdate(usuario, 
                                    function(status){
                                        switch (status) {
                                        case 0:
                                            Proxy.clientUpdate(cliente, function (result){
                                                if(result==0)
                                                    window.alert("Datos actualizados!!");
                                                else
                                                    window.alert("Error");
                                            });
                                            break;
                                        case 1:
                                           window.alert("Error!!");
                                                break; 
                                        }
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
                        $('#fNac').datepicker({autoclose: true, language: 'es'});
                        


                    }

                    function doSubmit(us) {
                        var usuario = new Usuario(document.getElementById("usuario").value, document.getElementById("pass").value, 1);
                        var cliente = new Cliente(document.getElementById("usuario").value, document.getElementById("nombre").value,
                                document.getElementById("apellido").value, document.getElementById("correo").value, document.getElementById("fechaN").value,
                                document.getElementById("direccion").value, document.getElementById("telefono").value, document.getElementById("celular").value);
         switch(us){               
             case 0:    
                 controller.userAdd(usuario, cliente);
                 break;
             case 1:
                 controller.userUpdate(usuario, cliente);
                 break;
                }
                    }

                    document.addEventListener("DOMContentLoaded", pageLoad);
                </script>




                </body>


                </html>