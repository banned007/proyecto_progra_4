<%-- 
    Document   : Compra
    Created on : 01-jun-2017, 18:24:31
    Author     : kerly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tiquetes</title>
        <%@ include file="Imports.jspf" %>        
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <br><br><br><br><br>
                    <h1>Registro de Pasajeros</h1>
                </div>
                <!-- panel preview -->
                <div class="col-sm-5">
                    <h4>Datos del Tiquete:</h4>
                    <div class="panel panel-default">
                        <div class="panel-body form-horizontal payment-form">
                            <form method="POST" name="formulario" id="formulario" action="javascript:buy();">
                            <div class="form-group">
                                <label for="nombre" class="col-sm-3 control-label">Nombre</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pasaporte" class="col-sm-3 control-label">N° de Pasaporte</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="pasaporte" name="pasaporte" required>
                                </div>
                            </div> 
                            <div class="form-group">
                                <label for="asientoIda" class="col-sm-3 control-label">Asiento de Ida</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                    <span class="input-group-btn">
                                    <button type="button" class="btn btn-secondary"  data-toggle="modal" data-target="#myModal">Seleccione un asiento</button>
                                    </span>
                                    <input type="text" class="form-control" id="asientoIda" name="asientoIda" required disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" id="divAsientoRegreso">
                                <label for="asientoRegreso" class="col-sm-3 control-label" >Asiento de Regreso</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-secondary"  data-toggle="modal" data-target="#myModal2">Seleccione un asiento</button>
                                    </span>
                                        <input type="text" class="form-control" id="asientoRegreso" name="asientoRegreso" required disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="amount" class="col-sm-3 control-label">Precio</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="amount" name="amount" value="0"  disabled required> <%--precio del vuelo o suma de los dos vuelos--%>
                                </div>
                            </div>   
                            <div class="form-group">
                                <div class="col-sm-12 text-right">
                                    <button type="submit" class="btn btn-default preview-add-button" id='btnAdd'>
                                        <span class="glyphicon glyphicon-plus"></span> Add
                                    </button>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>            
                </div> <!-- / panel preview -->
                <div class="col-sm-7">
                    <h4>Preview:</h4>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="table-responsive">
                                <table class="table preview-table" id="tablaTiquetes">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Pasaporte</th>
                                            <th>N° de Asiento (I)</th>
                                            <th id="thAsientoRegreso">N° de Asiento (R)</th>
                                            <th>Precio</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody> <!-- preview content goes here-->
                                </table>
                            </div>                            
                        </div>
                    </div>
                    <div class="row text-right">
                        <div class="col-xs-12">
                            <h4>Total: <strong><span class="preview-total"></span></strong></h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <hr style="border:1px dashed #dddddd;">
                            <%if(user!=null){%>
                                <button type="button" class="btn btn-primary btn-block" onclick='compra();'>Submit all and finish</button>
                            <%}else{%>
                                <button type="button" class="btn btn-primary btn-block" onclick="window.alert('Inicie Sesión');">Submit all and finish</button>
                            <%}%>
                        </div>                
                    </div>
                </div>
            </div>
        </div>
                        
        
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Seleccione un asiento de ida...</h4>
      </div>
      <div class="modal-body">
        <div class="table-responsive">
        <table id="tablaAsientosIda" style="border:1px solid #000" class="tbl">
        </table>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
                        
<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Seleccione un asiento de regreso...</h4>
      </div>
      <div class="modal-body">
        <div class="table-responsive">
        <table id="tablaAsientosRegreso" style="border:1px solid #000" class="tbl">
        </table>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


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
                    this.initTiquetes();
                    

                },
                initTiquetes(){
                    this.model.cart=JSON.parse(sessionStorage.getItem("Tiquetes")!=null?sessionStorage.getItem("Tiquetes"):"[]",JsonUtils.revive);
                    this.model.asientos=sessionStorage.getItem("asientos")!=null?sessionStorage.getItem("asientos"):[];
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
                                        compra();
                                        break;
                                    case 2: // manager
                                        document.location = "/Airline/AdminMenu.jsp";
                                        break;
                                }
                            });
                },
                getViajeIda: function (){
                    var view = this.view;
                    Proxy.getViaje(sessionStorage.getItem("viajeIda"), function (viajeIda){
                        
                        console.log("1111");
                        model.viajeIda=viajeIda;
                        view.precio(model.viajeIda.vuelo.precio);
                        view.tablaAsientosIda();
                        
                    });
                },
                getViajeRegreso: function (){
                    var view = this.view;
                    Proxy.getViaje(sessionStorage.getItem("viajeRegreso"), function (viajeRegreso){
                        console.log("2222");
                        model.viajeRegreso=viajeRegreso;
                        view.precio(model.viajeRegreso.vuelo.precio);
                        view.tablaAsientosRegreso();
                    });
                },
                addTiquete: function(tiquete, asiento){
                    this.model.cart.push(tiquete);
                    sessionStorage.setItem("Tiquetes", JSON.stringify(this.model.cart,JsonUtils.replacer));
                    this.model.asientos.push(asiento);
                    sessionStorage.setItem("asientos", this.model.asientos);
                    
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
                controller.getViajeIda();
                if(sessionStorage.getItem("viajeRegreso")){
                    controller.getViajeRegreso();
                }else{
                    $("#divAsientoRegreso").remove();
                    $("#thAsientoRegreso").remove();
                }
                
                document.getElementById("formulario").addEventListener("submit", function(event){
                    $('#tablaTiquetes tr').each(function () {

                        var nAsientoIda = $(this).children("td").eq(2).html();
                        console.log(nAsientoIda);
                        if(nAsientoIda==document.getElementById("asientoIda").value){
                            window.alert("Asiento de Ida no disponible");
                            event.preventDefault(); 
                        }
                        if(sessionStorage.getItem("viajeRegreso")){
                            var nAsientoRegreso = $(this).children("td").eq(3).html();
                            console.log(nAsientoRegreso);
                            if(nAsientoRegreso==document.getElementById("asientoRegreso").value){
                            window.alert("Asiento de Regreso no disponible");
                            event.preventDefault(); 
                        }
                        }

                    });
                    
                });
                
                
                
                
    }
            function precio(valor){
                var v = parseFloat(document.getElementById("amount").value);
                v+=valor;
                document.getElementById("amount").value=String(v);
            }
            
            function calc_total(){
    var sum = 0;
    $('.input-amount').each(function(){
        sum += parseFloat($(this).text());
    });
    $(".preview-total").text(sum);    
}
    function suma(){
        var sum = 0;
    $('.input-amount').each(function(){
        sum += parseFloat($(this).text());
    });
    return sum;
    }
$(document).on('click', '.input-remove-row', function(){ 
    var tr = $(this).closest('tr');
    tr.fadeOut(200, function(){
    	tr.remove();
	calc_total();
           var nFilas = $("#tablaTiquetes tr").length;
        if(sessionStorage.getItem("numeroPasajeros") >= nFilas ){
            $('#btnAdd').prop('disabled', false);
        }     
	});
        
});
   function buy(){
       var form_data = {};
        form_data["nombre"] = $('.payment-form input[name="nombre"]').val();
        form_data["pasaporte"] = $('.payment-form input[name="pasaporte"]').val();
        form_data["asientoIda"] = parseInt($('.payment-form input[name="asientoIda"]').val());
        if(sessionStorage.getItem("viajeRegreso"))
            form_data["asientoRegreso"] = parseInt($('.payment-form input[name="asientoRegreso"]').val());
        form_data["amount"] = parseFloat($('.payment-form input[name="amount"]').val()).toFixed(2);
        
        
        form_data["remove-row"] = '<span class="glyphicon glyphicon-remove"></span>';
        var row = $('<tr></tr>');
        $.each(form_data, function( type, value ) {
            $('<td class="input-'+type+'"></td>').html(value).appendTo(row);
        });
        $('.preview-table > tbody:last').append(row); 
        calc_total();
        var nFilas = $("#tablaTiquetes tr").length;
        if(sessionStorage.getItem("numeroPasajeros") < nFilas){
            window.alert("Máximo de Tiquetes solicitados");
            $('#btnAdd').prop('disabled', true);
        }
        
   }
   
   function compra(){
       sessionStorage.setItem("totalCompra", suma());
       console.log(sessionStorage.getItem("totalCompra"));
       if(sessionStorage.getItem("viajeRegreso")){
       $("#tablaTiquetes tbody tr").each(function (index) 
        {
            var nombre, pasaporte, asientoIda, asientoRegreso;
            $(this).children("td").each(function (index2) 
            {
                switch (index2) 
                {
                    case 0: nombre = $(this).text();
                            break;
                    case 1: pasaporte = $(this).text();
                            break;
                    case 2: asientoIda = $(this).text();
                            break;
                    case 3: asientoRegreso = $(this).text();
                            break;
                }
            });
            var tiqueteIda = new Tiquete(null,"Nombre: "+nombre+"No. Pasaporte: "+pasaporte, null, controller.model.viajeIda);
            var tiqueteRegreso = new Tiquete(null, "Nombre: "+nombre+"No. Pasaporte: "+pasaporte, null, controller.model.viajeRegreso);
            controller.addTiquete(tiqueteIda, asientoIda);
            controller.addTiquete(tiqueteRegreso, asientoRegreso);
            
            
        });
    }else{
        $("#tablaTiquetes tbody tr").each(function (index) 
        {
            var nombre, pasaporte, asientoIda;
            $(this).children("td").each(function (index2) 
            {
                switch (index2) 
                {
                    case 0: nombre = $(this).text();
                            break;
                    case 1: pasaporte = $(this).text();
                            break;
                    case 2: asientoIda = $(this).text();
                            break;
                }
            });
            var tiqueteIda = new Tiquete(null, nombre+pasaporte, null, controller.model.viajeIda);
            controller.addTiquete(tiqueteIda, asientoIda);   
        });
    }
    
    document.location = "/Airline/Pago.jsp";
  }
  
  function tablaAsientosIda(){
       var fila = model.viajeIda.vuelo.avion.cant_filas;
       var columna = model.viajeIda.vuelo.avion.cant_asientos_fila;
       Proxy.getAsientosNoDisponibles(model.viajeIda.numero_viaje, function(asientos){
           var table = document.getElementById("tablaAsientosIda");
       var k=1;
       for (var i=0; i< fila; i++){
           var tr = document.createElement("tr");
           for(var j =0; j < columna; j++){
                var td = document.createElement("td");
                var rb = document.createElement('button');
                var t = document.createTextNode(k);
               
                if(asientos.includes(k)){
                     rb.disabled = true; 
                }
                else{
                    rb.className='asDisp';
                }
                rb.id = k;
                rb.value = k;
                rb.appendChild(t);
                rb.addEventListener("click", function(event){
                    document.getElementById("asientoIda").value=event.target.id;
                });
                td.appendChild(rb);
                tr.appendChild(td);
                k++; 
                if((columna == 6 || columna == 9) && j==2){
                    var ty = document.createElement("td");
                    tr.appendChild(ty);
                }
                if(columna == 8 && j==3){
                    var ty = document.createElement("td");
                    tr.appendChild(ty);
                }
                if(columna == 9 && j==5){
                    var ty = document.createElement("td");
                    tr.appendChild(ty);
                }
           }
           table.appendChild(tr);
       }
       });
       
    }
    
    function tablaAsientosRegreso(){
       var fila = model.viajeRegreso.vuelo.avion.cant_filas;
       var columna = model.viajeRegreso.vuelo.avion.cant_asientos_fila;
       Proxy.getAsientosNoDisponibles(model.viajeRegreso.numero_viaje, function(asientos){
           var table = document.getElementById("tablaAsientosRegreso");
       var k=1;
       for (var i=0; i< fila; i++){
           var tr = document.createElement("tr");
           for(var j =0; j < columna; j++){
                var td = document.createElement("td");
                var rb = document.createElement('button');
                var t = document.createTextNode(k);
               
                if(asientos.includes(k)){
                     rb.disabled = true; 
                }
                else{
                    rb.className='asDisp';
                }
                rb.id = k;
                rb.value = k;
                rb.appendChild(t);
                rb.addEventListener("click", function(event){
                    document.getElementById("asientoRegreso").value=event.target.id;
                });
                td.appendChild(rb);
                tr.appendChild(td);
                k++; 
                if((columna == 6 || columna == 9) && j==2){
                    var ty = document.createElement("td");
                    tr.appendChild(ty);
                }
                if(columna == 8 && j==3){
                    var ty = document.createElement("td");
                    tr.appendChild(ty);
                }
                if(columna == 9 && j==5){
                    var ty = document.createElement("td");
                    tr.appendChild(ty);
                }
           }
           table.appendChild(tr);
       }
       });
       
    }

        
   

            
                            
                      
            


            

            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>
    </body>
</html>
