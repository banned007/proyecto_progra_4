<%-- 
    Document   : CompraImprimir
    Created on : 07-jun-2017, 23:13:47
    Author     : kerly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ImprimirRecibo</title>
        <%@ include file="Imports.jspf" %> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js"></script>
        <script type="text/javascript" src="js/html2canvas.js"></script> 
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <br><br><br><br>
        <div>
            <button class="btn btn-success btn-lg btn-block" type="button" onclick="exportar()">IMPRIMIR</button>
        </div>
        <div class="container" id="c1">
        <div class="panel panel-default">
        <div class="panel-body" id="c2">
            <div id="c3">
            </div>
                <table class="grid" id="t2">
                    <thead><tr><th>N° Tiquete</th><th>Pasajero</th><th>Origen</th><th>Destino</th><th>Hora-Salida</th><th>Duración</th><th>Precio</th></thead>
                    <tbody id="listado2"></tbody>
                </table>
        </div>
        </div>
        </div>
        <% Cliente cliente3 = (Cliente) request.getSession().getAttribute("client");%>
        <input type="hidden" id="idCliente" value="<%=cliente3.getId()%>" />
        <input type="hidden" id="nombreCliente" value="<%=cliente3.getNombre()+" "+cliente3.getApellido()%>" />
        <input type="hidden" id="correoCliente" value="<%=cliente3.getCorreo_electronico()%>" />
        <input type="hidden" id="celularCliente" value="<%=cliente3.getCelular()%>" />
         

    
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
        },
        cargarTiquetes: function(){
            var view = this.view;
            Proxy.getTiquetes(sessionStorage.getItem("numeroCompra"), function(result){
                model.imprimir = result;
                view.mostrarTiquetes();
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
            console.log(sessionStorage.getItem("numeroCompra"));
            
            controller.cargarTiquetes();
            //sessionStorage.clear();
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
        
        function mostrarTiquetes(){
            var model = this.model;
            var c2 = document.getElementById("c3");
            var div = document.createElement("div");
            var h1 = document.createElement("h3");
            h1.className='titulo4';
            var t = document.createTextNode("Aerolineas EXODUS");
            h1.appendChild(t);
            var br=document.createElement("br");
            var h2 = document.createElement("h4");
            var t2 = document.createTextNode("ID: " + document.getElementById("idCliente").value );
            h2.appendChild(t2);
            var h3 = document.createElement("h4");
            var t3 = document.createTextNode("Nombre: " + document.getElementById("nombreCliente").value );
            h3.appendChild(t3);
            var h4 = document.createElement("h4");
            var t4 = document.createTextNode("Correo Electrónico: " + document.getElementById("correoCliente").value );
            h4.appendChild(t4);
            var h5 = document.createElement("h4");
            var t5 = document.createTextNode("Celular: " + document.getElementById("celularCliente").value );
            h5.appendChild(t5);
            var h6 = document.createElement("h4");
            var t6 = document.createTextNode("TotalCompra: " + sessionStorage.getItem("totalCompra") );
            h6.appendChild(t6);
            var img = document.createElement("img");
            img.src = "img/" + model.imprimir[0].viaje.vuelo.ruta.numero + ".jpg";
            img.id = "imgTiquete";
            div.appendChild(h1);
            div.appendChild(img);
            div.appendChild(br);
            div.appendChild(h2);
            div.appendChild(h3);
            div.appendChild(h4);
            div.appendChild(h5);
            div.appendChild(h6);
            c2.appendChild(div);
            for(var i=0; i< model.imprimir.length; i++){
                mostrarTiquete(model.imprimir[i]);
            }
        }
        
        function mostrarTiquete(tiquete){
            var t = document.getElementById("listado2");
            var tr = document.createElement("tr");
                var td;
                td = document.createElement("td");
                td.appendChild(document.createTextNode(tiquete.numero_tiquete));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(tiquete.datos_persona));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(tiquete.viaje.vuelo.ruta.origen.nombre));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(tiquete.viaje.vuelo.ruta.destino.nombre));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(tiquete.viaje.vuelo.hora));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(tiquete.viaje.vuelo.ruta.duracion));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(tiquete.viaje.vuelo.precio));
                tr.appendChild(td);

                
                

                listado2.appendChild(tr);
           
        }
        
        document.addEventListener("DOMContentLoaded", pageLoad);
    </script>
    </body>
</html>
