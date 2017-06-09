<%-- 
    Document   : Gestion_Aviones
    Created on : 08-jun-2017, 8:30:57
    Author     : kerly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gestion de Aviones</title>
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

                    <h1 class="titulo3">Gestion de Aviones</h1>
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="nombre1()">Ingresar nuevo avion</button>
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
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Codigo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <input type="text" id="codigo_avion"   class="input-lg" required>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Año&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <input type="text" id="annio"  class="input-lg" required>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Modelo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <input type="text" id="modelo" class="input-lg" required>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Marca&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <input type="text" id="marca" class="input-lg" required>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cantidad de filas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <select class="custom-select form-control" id="cant_filas">
                                                <option value="5">5</option>
                                                <option value="7">7</option>
                                                <option value="9">9</option>
                                                <option value="11">11</option>
                                                <option value="13">13</option>
                                                <option value="16">16</option>
                                                <option value="20">20</option>
                                                <option value="24">24</option>
                                            </select>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;cantidad de asientos por fila&nbsp;</span>
                                            <select class="custom-select form-control" id="cant_asientos_fila">
                                                <option value="6">6</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                            </select>
                                        </div><br>
                                        <div class="modal-footer">
                                            <center>
                                            <div>
                                                <button class="btn btn-default" type="submit" id="btnSub" style="display:'inline-block'">Agregar</button><button style="display:'inline-block'" type="button" class="btn btn-default" data-dismiss="modal" onclick="cancelar()" id="close">Cancelar</button>
                                            </div>
                                            </center>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="grid" id="t1">
                        <thead><tr><th>Código</th><th>Año</th><th>Modelo</th><th>Marca</th><th>Asientos</th><th>Filas</th><th>Asientos por Fila</th><th>&nbsp;&nbsp;&nbsp;Acción&nbsp;&nbsp;&nbsp;</th></thead>
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
            this.err=0;
            Proxy.avionSearch(function (result) {
                        model.aviones = result;
                        view.listAviones();
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
                var codigo=parseInt(document.getElementById("codigo_avion").value);
                var annio=document.getElementById("annio").value;
                var modelo=document.getElementById("modelo").value;
                var marca=document.getElementById("marca").value;
                var cant_asientos_fila=parseInt(document.getElementById("cant_asientos_fila").value);
                var cant_filas=parseInt(document.getElementById("cant_filas").value);
                var avion=new Avion(codigo,annio,modelo,marca,(cant_filas*cant_asientos_fila),cant_filas,cant_asientos_fila);
                Proxy.avionAdd(avion,function(result){
                    document.getElementById("0").innerHTML=result;
                });
                return avion;
            },
        doUpdate: function(){
                var codigo=parseInt(document.getElementById("codigo_avion").value);
                var annio=document.getElementById("annio").value;
                var modelo=document.getElementById("modelo").value;
                var marca=document.getElementById("marca").value;
                var cant_asientos_fila=parseInt(document.getElementById("cant_asientos_fila").value);
                var cant_filas=parseInt(document.getElementById("cant_filas").value);
                var avion=new Avion(codigo,annio,modelo,marca,(cant_filas*cant_asientos_fila),cant_filas,cant_asientos_fila);
                Proxy.avionUpdate(avion, function(result){
                    document.getElementById("0").innerHTML=result;
                });
                return avion;
            },
        doDelete: function(codigo, annio, modelo, marca, cant_asientos_fila, cant_filas){
                Proxy.avionDelete(new Avion(codigo,annio,modelo,marca,(cant_filas*cant_asientos_fila),cant_filas,cant_asientos_fila), function(result){
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
    var avionActual;
        function setErr(i)
        {
            controller.err=i;
        }
        function pageLoad(event) {
            model = new AirModel();
            controller = new AirController(model, window);
        }
        function cancelar()
        {
            document.getElementById("codigo_avion").disabled = false;
            document.getElementById("codigo_avion").value="";
            document.getElementById("annio").value="";
            document.getElementById("modelo").value="";
            document.getElementById("marca").value="";
            document.getElementById("cant_asientos_fila").value="4";
            document.getElementById("cant_filas").value="6";
            document.getElementById("btnSub").innerHTML="Agregar";
        }
        function doCommit(){
            if(document.getElementById("btnSub").innerHTML!=="Terminado"){
                this.avionActual = controller.doCommit();
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
                this.avionActual = controller.doUpdate();
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
            this.padreActual.cells[0].innerHTML=this.avionActual.codigo_avion;
            this.padreActual.cells[1].innerHTML=this.avionActual.annio;
            this.padreActual.cells[2].innerHTML=this.avionActual.modelo;
            this.padreActual.cells[3].innerHTML=this.avionActual.marca;
            this.padreActual.cells[4].innerHTML=this.avionActual.cant_pasajeros;
            this.padreActual.cells[5].innerHTML=this.avionActual.cant_filas;
            this.padreActual.cells[6].innerHTML=this.avionActual.cant_asientos_fila;
        }
        function actualizar1()
        {
            model.aviones.push(this.avionActual);
            listAviones();
        }
        function reset()
        {
            
            document.getElementById("codigo_avion").disabled = false;
            document.getElementById("codigo_avion").value="";
            document.getElementById("annio").value="";
            document.getElementById("modelo").value="";
            document.getElementById("marca").value="";
            document.getElementById("cant_asientos_fila").value="6";
            document.getElementById("cant_filas").value="5";
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
            
            function listAviones() {
                table.destroy();
                var listado = document.getElementById("listado");
                listado.innerHTML = "";
                for (i = 0; i < model.aviones.length; i++) {
                    listAvion(listado, model.aviones[i]);
                }
                table = paginacion();
            }
            
            function listAvion(listado, avion) {
                var tr = document.createElement("tr");
                var td;
                td = document.createElement("td");
                td.appendChild(document.createTextNode(avion.codigo_avion));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(avion.annio));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(avion.modelo));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(avion.marca));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(avion.cant_pasajeros));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(avion.cant_filas));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(avion.cant_asientos_fila));
                tr.appendChild(td);
                td = document.createElement("td");
                td.innerHTML="<button type=button id=\"button"+avion.codigo_avion+"\" class=\"btn btn-default\" data-toggle=\"modal\" data-target=\"#myModal\" onclick=nombre2(\"button"+avion.codigo_avion+"\") display=\"inline-block\">Edit</button><button type=\"button\" id=\"buttonE"+avion.codigo_avion+"\" class=\"btn btn-default btn_derecha\" onclick=eliminar(\"buttonE"+avion.codigo_avion+"\") display=\"inline-block\">Delete</button>";
                tr.appendChild(td);
                listado.appendChild(tr);
            }
            
            function nombre2(nombre)
            {
                document.getElementById("btnSub").innerHTML="Terminado";
                var parent=document.getElementById(nombre).parentNode.parentNode;
                var header = document.getElementById("header");
                document.getElementById("codigo_avion").value=parent.cells[0].innerHTML;
                document.getElementById("codigo_avion").disabled = true;
                document.getElementById("annio").value=parent.cells[1].innerHTML;
                document.getElementById("modelo").value=parent.cells[2].innerHTML;
                document.getElementById("marca").value=parent.cells[3].innerHTML;
                document.getElementById("cant_asientos_fila").value=parent.cells[6].innerHTML;
                document.getElementById("cant_filas").value=parent.cells[5].innerHTML;
                header.innerHTML="Modificar";
                this.padreActual = parent;
            }
            function sleep (time) {
                return new Promise((resolve) => setTimeout(resolve, time));
                }

            function eliminar(nombre)
            {
                var parent=document.getElementById(nombre).parentNode.parentNode;
                controller.doDelete(parseInt(parent.cells[0].innerHTML),parent.cells[1].innerHTML,parent.cells[2].innerHTML,parent.cells[3].innerHTML,parseInt(parent.cells[6].innerHTML),parseInt(parent.cells[5].innerHTML));
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
