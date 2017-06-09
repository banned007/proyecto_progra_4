<%-- 
    Document   : HistorialCompras
    Created on : 31-may-2017, 14:29:39
    Author     : kerly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial de Compras</title>
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
                    <thead><tr><th>N° Compra</th><th>N° Tiquete</th><th>Pasajero</th><th>Origen</th><th>Destino</th><th>Hora-Salida</th><th>Duración</th><th>Precio</th></thead>
                    <tbody id="listado2"></tbody>
                </table>
        </div>
        </div>
        </div>
        <% Cliente cliente3 = (Cliente) request.getSession().getAttribute("client");%>
        <input type="hidden" id="idCliente" value="<%=cliente3.getId()%>" />
       

    
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
                            document.location = "/Airline/HistorialCompras.jsp";
                            break;
                        case 2: // manager
                            document.location = "/Airline/AdminMenu.jsp";
                            break;
                    }
                });
        },
        cargarTiquetes: function(){
            var view = this.view;
            Proxy.getTiquetesById(document.getElementById("idCliente").value, function(result){
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
            controller.cargarTiquetes();
  
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
                  doc.save("historialDeCompras.pdf");

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
            var t2 = document.createTextNode("Historial de Compras" );
            h2.appendChild(t2);
            div.appendChild(h1);
            div.appendChild(br);
            div.appendChild(h2);
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
                td.appendChild(document.createTextNode(tiquete.compra.numero_compra));
                tr.appendChild(td);
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
