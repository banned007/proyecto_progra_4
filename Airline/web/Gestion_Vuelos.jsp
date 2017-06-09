<%-- 
    Document   : Gestion_Vuelos_Ingreso
    Created on : 1/06/2017, 03:57:34 PM
    Author     : Walter
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gestion de Vuelos</title>
        <%@ include file="Imports.jspf" %>        
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        <br>
        <br>
        <br>
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-body">

                    <h1 class="titulo3">Gestion de Vuelos</h1>
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="nombre1()">Ingresar nuevo vuelo</button>
                    <br><br>
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="form-box center_div">
                                    <form method="POST" name="formulario1" id="formulario" action="javascript:doCommit();">
                                        <div class="modal-header">
                                            <center>
                                                <h4 class="modal-title" id="header"></h4>
                                            </center>
                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numero&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <input type="text" id="numero"   class="input-lg" required>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dia&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <select class="custom-select form-control" id="dia">
                                                <option value="L">L</option>
                                                <option value="M">M</option>
                                                <option value="I">I</option>
                                                <option value="J">J</option>
                                                <option value="V">V</option>
                                                <option value="S">S</option>
                                                <option value="D">D</option>
                                            </select>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hora&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <select class="custom-select form-control" id="hora">
                                                <option value="00:00:00">00:00:00</option>
                                                <option value="00:30:00">00:30:00</option>
                                                <option value="01:00:00">01:00:00</option>
                                                <option value="01:30:00">01:30:00</option>
                                                <option value="02:00:00">02:00:00</option>
                                                <option value="02:30:00">02:30:00</option>
                                                <option value="03:00:00">03:00:00</option>
                                                <option value="03:30:00">03:30:00</option>
                                                <option value="04:00:00">04:00:00</option>
                                                <option value="04:30:00">04:30:00</option>
                                                <option value="05:00:00">05:00:00</option>
                                                <option value="05:30:00">05:30:00</option>
                                                <option value="06:00:00">06:00:00</option>
                                                <option value="06:30:00">06:30:00</option>
                                                <option value="07:00:00">07:00:00</option>
                                                <option value="07:30:00">07:30:00</option>
                                                <option value="08:00:00">08:00:00</option>
                                                <option value="08:30:00">08:30:00</option>
                                                <option value="09:00:00">09:00:00</option>
                                                <option value="09:30:00">09:30:00</option>
                                                <option value="10:00:00">10:00:00</option>
                                                <option value="10:30:00">10:30:00</option>
                                                <option value="11:00:00">11:00:00</option>
                                                <option value="11:30:00">11:30:00</option>
                                                <option value="12:00:00">12:00:00</option>
                                                <option value="12:30:00">12:30:00</option>
                                                <option value="13:00:00">13:00:00</option>
                                                <option value="13:30:00">13:30:00</option>
                                                <option value="14:00:00">14:00:00</option>
                                                <option value="14:30:00">14:30:00</option>
                                                <option value="15:00:00">15:00:00</option>
                                                <option value="15:30:00">15:30:00</option>
                                                <option value="16:00:00">16:00:00</option>
                                                <option value="16:30:00">16:30:00</option>
                                                <option value="17:00:00">17:00:00</option>
                                                <option value="17:30:00">17:30:00</option>
                                                <option value="18:00:00">18:00:00</option>
                                                <option value="18:30:00">18:30:00</option>
                                                <option value="19:00:00">19:00:00</option>
                                                <option value="19:30:00">19:30:00</option>
                                                <option value="20:00:00">20:00:00</option>
                                                <option value="20:30:00">20:30:00</option>
                                                <option value="21:00:00">21:00:00</option>
                                                <option value="21:30:00">21:30:00</option>
                                                <option value="22:00:00">22:00:00</option>
                                                <option value="22:30:00">22:30:00</option>
                                                <option value="23:00:00">23:00:00</option>
                                                <option value="23:30:00">23:30:00</option>
                                            </select>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Precio&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <input type="text" id="precio"   class="input-lg" required>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ruta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <select class="custom-select form-control" id="ruta"></select>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Avion&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <select class="custom-select form-control" id="avion"></select>
                                        </div><br>
                                        <div class="modal-footer">
                                            <center>
                                            <div>
                                                <button class="btn btn-default" type="submit" id="btnSub" display="inline-block">Agregar</button><button display="inline-block" type="button" class="btn btn-default" data-dismiss="modal" onclick="cancelar()" id="close">Cancelar</button>
                                            </div>
                                            </center>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="grid" id="t1">
                        <thead><tr><th>numero</th><th>Dia</th><th>Hora</th><th>Precio</th>><th>Ruta</th><th>Avion</th><th>&nbsp;&nbsp;&nbsp;Acción&nbsp;&nbsp;&nbsp;</th></thead>
                        <tbody id="listado"></tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="0"  style="visibility: hidden">1</div>
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
            Proxy.rutaSearch(function(result){
               model.rutas=result; 
            });
            Proxy.avionSearch(function(result){
                model.aviones=result;
            });
            view.sleep(700).then(() => {
            Proxy.vueloSearch(function (result) {
                        model.vueloes = result;
                        view.listVuelos();
                        view.llenaOpciones();
                    });
                });
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
                            document.location = "/Airline/historia.jsp";
                            break;
                        case 2: // manager
                            document.location = "/Airline/AdminMenu.jsp";
                            break;
                    }
                });
        },
        doCommit: function(){
                var numero=parseInt(document.getElementById("numero").value);
                var dia=document.getElementById("dia").value;
                var hora=document.getElementById("hora").value;
                var precio=parseFloat(document.getElementById("precio").value);
                var ruta=new Ruta(parseInt(document.getElementById("ruta").value),new Ciudad("","",""),new Ciudad("","",""),0);
                var avion=new Avion(parseInt(document.getElementById("avion").value),"","","",0,0,0);
                var vuelo = new Vuelo(numero, dia, hora, precio, ruta, avion);
                Proxy.vueloAdd(vuelo,function(result){
                    document.getElementById("0").innerHTML=result;
                });
                return vuelo;
            },
        doUpdate: function(){
                var numero=parseInt(document.getElementById("numero").value);
                var dia=document.getElementById("dia").value;
                var hora=document.getElementById("hora").value;
                var precio=parseFloat(document.getElementById("precio").value);
                var ruta=new Ruta(parseInt(document.getElementById("ruta").value),new Ciudad("","",""),new Ciudad("","",""),0);
                var avion=new Avion(parseInt(document.getElementById("avion").value),"","","",0,0,0);
                var vuelo = new Vuelo(numero, dia, hora, precio, ruta, avion);
                Proxy.vueloUpdate(vuelo, function(result){
                    document.getElementById("0").innerHTML=result;
                });
                return vuelo;
            },
        doDelete: function(numero, dia, hora, precio, ruta, avion){
                Proxy.vueloDelete(new Vuelo(numero, dia, hora, precio, ruta, avion), function(result){
                    document.getElementById("0").innerHTML=result;
                    });
            }
    };
    </script>
    <script>
//View
    var model;
    var controller;
    var padreActual;
    var vueloActual;
        function setErr(i)
        {
            controller.err=i;
        }
        function pageLoad(event) {
            model = new AirModel();
            controller = new AirController(model, window);
        }
        function llenaOpciones(){
            var opt;
            var opt1;
            var ruta=document.getElementById("ruta");
            var avion=document.getElementById("avion");
            for(var i=0; i<model.rutas.length; i++){
                opt=document.createElement("option");
                opt.value=model.rutas[i].numero;
                opt.innerHTML=model.rutas[i].numero;
                ruta.appendChild(opt);
            }
            for(var i=0; i<model.aviones.length; i++){
                opt1=document.createElement("option");
                opt1.value=model.aviones[i].codigo_avion;
                opt1.innerHTML=model.aviones[i].codigo_avion;
                avion.appendChild(opt1)
            }
        }
        function cancelar()
        {
            document.getElementById("numero").disabled = false;
            document.getElementById("numero").value="";
            document.getElementById("dia").value=document.getElementById("dia").firstChild.value;
            document.getElementById("hora").value=document.getElementById("hora").firstChild.value;
            document.getElementById("precio").value="";
            document.getElementById("ruta").value=document.getElementById("ruta").firstChild.value;
            document.getElementById("avion").value=document.getElementById("avion").firstChild.value;
            document.getElementById("btnSub").innerHTML="Agregar";
        }
        function doCommit(){
            if(document.getElementById("btnSub").innerHTML!=="Terminado"){
                this.vueloActual = controller.doCommit();
                sleep(500).then(() => {
                if(document.getElementById("0").innerHTML!=="0")
                    window.alert("¡El registro no pudo ser agregado!");
                else{
                    document.getElementById("close").click();
                    reset();
                    actualizar1();
                }});
            }
            else{
                this.vueloActual = controller.doUpdate();
                sleep(500).then(() => {
                if(document.getElementById("0").innerHTML!=="0")
                    window.alert("¡El registro no pudo ser modificado!");
                else{
                    document.getElementById("close").click();
                    reset();
                    actualizar2();
                }});
            }
            document.getElementById("0").innerHTML=1;
        }
        function actualizar2()
        {
            this.padreActual.cells[0].innerHTML=this.vueloActual.numero_vuelo;
            this.padreActual.cells[1].innerHTML =this.vueloActual.dia;
            this.padreActual.cells[2].innerHTML =this.vueloActual.hora;
            this.padreActual.cells[3].innerHTML=this.vueloActual.precio;
            this.padreActual.cells[4].innerHTML= this.vueloActual.ruta.numero;
            this.padreActual.cells[5].innerHTML= this.vueloActual.avion.codigo_avion;
        }
        function actualizar1()
        {
            model.vueloes.push(this.vueloActual);
            listVuelos();
        }
        function reset()
        {
            
            document.getElementById("numero").disabled = false;
            document.getElementById("numero").value="";
            document.getElementById("dia").value=document.getElementById("dia").firstChild.value;
            document.getElementById("hora").value=document.getElementById("hora").firstChild.value;
            document.getElementById("precio").value="";
            document.getElementById("ruta").value=document.getElementById("ruta").firstChild.value;
            document.getElementById("avion").value=document.getElementById("avion").firstChild.value;
            document.getElementById("btnSub").innerHTML="Agregar";
        }
        function nombre1(){
            
            reset();
            var header = document.getElementById("header");
            header.innerHTML="Agregar";
        }
        var table = paginacion();
        function paginacion() {
                return $('#t1').DataTable({"language": {"sProcessing": "Procesando...",
                        "sLengthMenu": "Mostrar _MENU_ boletos",
                        "sZeroRecords": "No se encontraron viajes",
                        "sEmptyTable": "No hay vuelos disponibles",
                        "sInfo": "Mostrando boletos del _START_ al _END_ de un total de _TOTAL_ boletos",
                        "sInfoEmpty": "Mostrando boletos del 0 al 0 de un total de 0 boletos",
                        "sInfoFiltered": "(filtrado de un total de _MAX_ boletos)",
                        "sInfoPostFix": "",
                        "sSearch": "Buscar:",
                        "sUrl": "",
                        "sInfoThousands": ",",
                        "sLoadingRecords": "Cargando...",
                        "oPaginate": {
                            "sFirst": "Primero",
                            "sLast": "Último",
                            "sNext": "Siguiente",
                            "sPrevious": "Anterior"
                        },
                        "oAria": {
                            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                        }
                    }});

            }
            
            function listVuelos() {
                table.destroy();
                var listado = document.getElementById("listado");
                listado.innerHTML = "";
                for (i = 0; i < model.vueloes.length; i++) {
                    listVuelo(listado, model.vueloes[i]);
                }
                table = paginacion();
            }
            
            function listVuelo(listado, vuelo) {
                var tr = document.createElement("tr");
                var td;
                td = document.createElement("td");
                td.appendChild(document.createTextNode(vuelo.numero_vuelo));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(vuelo.dia));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(vuelo.hora));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(vuelo.precio));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(vuelo.ruta.numero));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(vuelo.avion.codigo_avion));
                tr.appendChild(td);
                td = document.createElement("td");
                td.innerHTML="<button type=button id=\"button"+vuelo.numero_vuelo+"\" class=\"btn btn-default\" data-toggle=\"modal\" data-target=\"#myModal\" onclick=nombre2(\"button"+vuelo.numero_vuelo+"\") display=\"inline-block\">Edit</button><button type=\"button\" id=\"buttonE"+vuelo.numero_vuelo+"\" class=\"btn btn-default btn_derecha\" onclick=eliminar(\"buttonE"+vuelo.numero_vuelo+"\") display=\"inline-block\">Delete</button>";
                tr.appendChild(td);
                listado.appendChild(tr);
            }
            
            function nombre2(nombre)
            {
                document.getElementById("btnSub").innerHTML="Terminado";
                var parent=document.getElementById(nombre).parentNode.parentNode;
                var header = document.getElementById("header");
                document.getElementById("numero").value=parent.cells[0].innerHTML;
                document.getElementById("numero").disabled = true;
                document.getElementById("dia").value=parent.cells[1].innerHTML;
                document.getElementById("hora").value=parent.cells[2].innerHTML;
                document.getElementById("precio").value=parent.cells[3].innerHTML;
                document.getElementById("ruta").value=parent.cells[4].innerHTML;
                document.getElementById("avion").value=parent.cells[5].innerHTML;
                header.innerHTML="Modificar";
                this.padreActual = parent;
            }
            function sleep (time) {
                return new Promise((resolve) => setTimeout(resolve, time));
                }

            function eliminar(nombre)
            {
                var parent=document.getElementById(nombre).parentNode.parentNode;
                var numero=parseInt(parent.cells[0].innerHTML);
                var dia=parent.cells[1].innerHTML;
                var hora=parent.cells[2].innerHTML;
                var precio=parseFloat(parent.cells[3].innerHTML);
                var ruta=new Ruta(parseInt(parent.cells[4].innerHTML),new Ciudad("","",""),new Ciudad("","",""),0);
                var avion=new Avion(parseInt(parent.cells[5].innerHTML),"","","",0,0,0);
                controller.doDelete(numero,dia,hora,precio,ruta,avion);
                sleep(500).then(() => {
                    if(document.getElementById("0").innerHTML!=="0")
                    window.alert("¡El registro no pudo eliminarse!");
                else
                    parent.remove();
                });
                document.getElementById("0").innerHTML=1;
            }
        document.addEventListener("DOMContentLoaded", pageLoad);
    </script>
    </body>
</html>

