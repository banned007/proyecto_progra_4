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
        <title>Contactenos</title>
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
                    <div class="form-group">
                        <label for="nombre" class="col-sm-3 control-label">Nombre</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pasaporte" class="col-sm-3 control-label">N° de Pasaporte</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="pasaporte" name="pasaporte">
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="asientoIda" class="col-sm-3 control-label">Asiento de Ida</label>
                        <div class="col-sm-9">
                            <input type="number" class="form-control" id="asientoIda" name="asientoIda">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="asientoRegreso" class="col-sm-3 control-label">Asiento de Regreso</label>
                        <div class="col-sm-9">
                            <input type="number" class="form-control" id="asientoRegreso" name="asientoRegreso">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label">Precio</label>
                        <div class="col-sm-9">
                            <input type="number" class="form-control" id="amount" name="amount" disabled> <%--precio del vuelo o suma de los dos vuelos--%>
                        </div>
                    </div>   
                    <div class="form-group">
                        <div class="col-sm-12 text-right">
                            <button type="button" class="btn btn-default preview-add-button">
                                <span class="glyphicon glyphicon-plus"></span> Add
                            </button>
                        </div>
                    </div>
                </div>
            </div>            
        </div> <!-- / panel preview -->
        <div class="col-sm-7">
            <h4>Preview:</h4>
            <div class="row">
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table class="table preview-table">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Pasaporte</th>
                                    <th>N° de Asiento (I)</th>
                                    <th>N° de Asiento (R)</th>
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
                    <button type="button" class="btn btn-primary btn-block">Submit all and finish</button>
                </div>                
            </div>
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
                            document.location = "/Airline/Compra.jsp";
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
            
            
            function calc_total(){
    var sum = 0;
    $('.input-amount').each(function(){
        sum += parseFloat($(this).text());
    });
    $(".preview-total").text(sum);    
}
$(document).on('click', '.input-remove-row', function(){ 
    var tr = $(this).closest('tr');
    tr.fadeOut(200, function(){
    	tr.remove();
	   	calc_total()
	});
});

$(function(){
    $('.preview-add-button').click(function(){
        var form_data = {};
        form_data["nombre"] = $('.payment-form input[name="nombre"]').val();
        form_data["pasaporte"] = $('.payment-form input[name="pasaporte"]').val();
        form_data["asientoIda"] = parseInt($('.payment-form input[name="asientoIda"]').val());
        form_data["asientoRegreso"] = parseInt($('.payment-form input[name="asientoRegreso"]').val());
        form_data["amount"] = parseFloat($('.payment-form input[name="amount"]').val()).toFixed(2);
        
        
        form_data["remove-row"] = '<span class="glyphicon glyphicon-remove"></span>';
        var row = $('<tr></tr>');
        $.each(form_data, function( type, value ) {
            $('<td class="input-'+type+'"></td>').html(value).appendTo(row);
        });
        $('.preview-table > tbody:last').append(row); 
        calc_total();
    });  
});
  
        }
        
        /*
          <div class="form-group">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" id="email">
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" id="pwd">
  </div>
  <div class="checkbox">
    <label><input type="checkbox"> Remember me</label>
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
         */
        
        
        
        
        function camposPasajero(i){
            var div=document.createElement("div");
            div.class=""
        }
        
        function camposPasajeros(){
            for(var i =0; i < 5; i++){
                camposPasajero(i);
            }
        }
        document.addEventListener("DOMContentLoaded", pageLoad);
    </script>
    </body>
</html>
