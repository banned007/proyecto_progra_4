<%-- 
    Document   : Pago
    Created on : 05-jun-2017, 23:16:25
    Author     : kerly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pago</title>
        <%@ include file="Imports.jspf" %>        
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <br><br><br><br>
    <div class="container" id ="cn1">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">    
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Detalles de Pago
                    </h3>
                </div>
                <div class="panel-body">
                    <form role="form" method="POST" name="formulario" id="formulario" action="javascript:registrarCompra();">
                    <div class="form-group">
                        <label for="cardNumber">
                            NUMERO DE TARJETA</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="cardNumber" placeholder="Valid Card Number"
                                required autofocus />
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-7 col-md-7">
                            <div class="form-group">
                                <label for="expityMonth">
                                    FECHA DE EXPIRACIÓN</label>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" id="expityMonth" placeholder="MM" required />
                                </div>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" id="expityYear" placeholder="YY" required /></div>
                            </div>
                        </div>
                        <div class="col-xs-5 col-md-5 pull-right">
                            <div class="form-group">
                                <label for="cvCode">
                                    CV</label>
                                <input type="password" class="form-control" id="cvCode" placeholder="CV" required />
                            </div>
                        </div>
                    </div>
                    <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#"><span class="badge pull-right"><input type="text" id="lblValor"  disabled/></span> &nbsp;&nbsp;VALOR TOTAL<span class="glyphicon glyphicon-usd"></span></a>
                </li>
                    </ul>
                         <button class="btn btn-alert btn-lg btn-block" data-toggle="collapse" data-target="#demo">Ver en Colones</button>
                            <div id="demo" class="collapse">
                            <ul class="nav nav-pills nav-stacked">
                                <li class="active"><a href="#"><span class="badge pull-right"><input type="text" id="lblValorColones"  disabled/></span>&nbsp;&nbsp; VALOR en COLONES<i class="fa fa-money" style="font-size:24px"></i></a>
                            </li>
                            </ul>
                            </div> 
            <br/>
            <button class="btn btn-success btn-lg btn-block" type="submit" id="btnPagar">Pagar</button>
            </form>
                </div>
            </div>
            
        </div>
    </div>
</div>
<% Usuario user3 = (Usuario) request.getSession().getAttribute("user");%>
<input type="hidden" id="idUsuario" value="<%=user3.getId()%>" />
<input type="hidden" id="claveUsuario" value="<%=user3.getClave()%>" />
<div class="container" id="c1" style="display: none;">
    <div class="panel panel-default">
    <div class="panel-body">
        <br><br>
        <h1 class="titulo1">Gracias por su Compra &nbsp <span class="glyphicon glyphicon-send"></span></h1>
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
        <button class="btn btn-success btn-lg btn-block" type="button" onclick="window.open('/Airline/CompraImprimir.jsp');">CONTINUAR</button>
        
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
            this.model.asientos = JSON.parse("[" + sessionStorage.getItem("asientos") + "]");

            
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
        guardarCompra: function(compra){
           //return numero de compra 
           var model = this.model;
           Proxy.compraAdd(compra, function(result){
               model.numeroCompra = result;
               console.log(model.numeroCompra);
               sessionStorage.setItem("numeroCompra", model.numeroCompra);
               var usuario = new Usuario(document.getElementById("idUsuario").value, document.getElementById("claveUsuario").value, 1);
               var compra = new Compra(model.numeroCompra,usuario ,"Numero de Tarjeta: "+document.getElementById("cardNumber").value+" F/E: "+document.getElementById("expityMonth").value+"-"
            + document.getElementById("expityYear").value, sessionStorage.getItem("totalCompra"));
               this.model.tiquetes=JSON.parse(sessionStorage.getItem("Tiquetes")!=null?sessionStorage.getItem("Tiquetes"):"[]",JsonUtils.revive);
            var i;
            for(i=0; i<this.model.tiquetes.length; i++){
                   this.model.tiquetes[i].setCompra(compra);
                   var tiq = this.model.tiquetes[i];
                   var as = this.model.asientos[i];
                   console.log(tiq);
                   console.log(as);
                   Proxy.tiqueteAdd(tiq,as, function(result2){
                       
                   });
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
            document.getElementById("lblValor").value=sessionStorage.getItem("totalCompra");
            console.log(sessionStorage.getItem("tipoCambioVenta"));
            document.getElementById("lblValorColones").value=parseFloat(sessionStorage.getItem("totalCompra"))*parseFloat(sessionStorage.getItem("tipoCambioVenta"));
  
        }
        
        function registrarCompra(){
            var usuario = new Usuario(document.getElementById("idUsuario").value, document.getElementById("claveUsuario").value, 1);
            var compra = new Compra(null,usuario ,"Numero de Tarjeta: "+document.getElementById("cardNumber").value+" F/E: "+document.getElementById("expityMonth").value+"-"
            + document.getElementById("expityYear").value, sessionStorage.getItem("totalCompra"));
            controller.guardarCompra(compra);
             
             document.getElementById("cn1").style.display="none";
             document.getElementById("c1").style.display="block";
             
                       
        }
        
        
        document.addEventListener("DOMContentLoaded", pageLoad);
    </script>
    </body>
</html>
