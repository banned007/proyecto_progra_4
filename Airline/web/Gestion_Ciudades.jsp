<%-- 
    Document   : Gestion_Ciudades
    Created on : 08-jun-2017, 21:38:20
    Author     : kerly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gestion de Ciudades</title>
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

                    <h1 class="titulo3">Gestion de Ciudades</h1>
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="nombre1()">Ingresar nueva Ciudad</button>
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
                                            <input type="text" id="codigo"   class="input-lg" required>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <input type="text" id="nombre"  class="input-lg" required>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pais&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <input type="text" id="pais" class="input-lg" required>
                                        </div><br>
                                        <div class="modal-footer">
                                            <center>
                                            <div>
                                                <button class="btn btn-default" type="submit" id="btnSub" style='display:"inline-block"'>Agregar</button><button style='display:"inline-block"' type="button" class="btn btn-default" data-dismiss="modal" onclick="cancelar()" id="close">Cancelar</button>
                                            </div>
                                            </center>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="grid" id="t1">
                        <thead><tr><th>Código</th><th>Nombre</th><th>Pais</th><th>&nbsp;&nbsp;&nbsp;Acción&nbsp;&nbsp;&nbsp;</th></thead>
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
            Proxy.getCiudades(function (result) {
                        model.ciudades = result;
                        view.listCiudades();
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
                var codigo=document.getElementById("codigo").value;
                var nombre=document.getElementById("nombre").value;
                var pais=document.getElementById("pais").value;
                var ciudad=new Ciudad(codigo,nombre,pais);
                Proxy.ciudadAdd(ciudad,function(result){
                    document.getElementById("0").innerHTML=result;
                });
                return ciudad;
            },
        doUpdate: function(){
                var codigo=document.getElementById("codigo").value;
                var nombre=document.getElementById("nombre").value;
                var pais=document.getElementById("pais").value;
                var ciudad=new Ciudad(codigo,nombre,pais);
                Proxy.ciudadUpdate(ciudad, function(result){
                    document.getElementById("0").innerHTML=result;
                });
                return ciudad;
            },
        doDelete: function(codigo, nombre, pais){
                Proxy.ciudadDelete(new Ciudad(codigo,nombre,pais), function(result){
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
    var ciudadActual;
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
            document.getElementById("codigo").disabled = false;
            document.getElementById("codigo").value="";
            document.getElementById("nombre").value="";
            document.getElementById("pais").value="";
            document.getElementById("btnSub").innerHTML="Agregar";
        }
        function doCommit(){
            if(document.getElementById("btnSub").innerHTML!=="Terminado"){
                this.ciudadActual = controller.doCommit();
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
                this.ciudadActual = controller.doUpdate();
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
            this.padreActual.cells[0].innerHTML=this.ciudadActual.codigo;
            this.padreActual.cells[1].innerHTML=this.ciudadActual.nombre;
            this.padreActual.cells[2].innerHTML=this.ciudadActual.pais;
        }
        function actualizar1()
        {
            model.ciudades.push(this.ciudadActual);
            listCiudades();
        }
        function reset()
        {
            
            document.getElementById("codigo").disabled = false;
            document.getElementById("codigo").value="";
            document.getElementById("nombre").value="";
            document.getElementById("pais").value="";
            document.getElementById("btnSub").innerHTML="Agregar";
        }
        function nombre1(){
            
            reset();
            var header = document.getElementById("header").innerHTML="Agregar";
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
            
            function listCiudades() {
                table.destroy();
                var listado = document.getElementById("listado");
                listado.innerHTML = "";
                for (i = 0; i < model.ciudades.length; i++) {
                    listCiudad(listado, model.ciudades[i]);
                }
                table = paginacion();
            }
            
            function listCiudad(listado, ciudad) {
                var tr = document.createElement("tr");
                var td;
                td = document.createElement("td");
                td.appendChild(document.createTextNode(ciudad.codigo));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(ciudad.nombre));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(ciudad.pais));
                tr.appendChild(td);
                td = document.createElement("td");
                td.innerHTML="<button type=button id=\"button"+ciudad.codigo+"\" class=\"btn btn-default\" data-toggle=\"modal\" data-target=\"#myModal\" onclick=nombre2(\"button"+ciudad.codigo+"\") display=\"inline-block\">Edit</button><button type=\"button\" id=\"buttonE"+ciudad.codigo+"\" class=\"btn btn-default btn_derecha\" onclick=eliminar(\"buttonE"+ciudad.codigo+"\") display=\"inline-block\">Delete</button>";
                tr.appendChild(td);
                listado.appendChild(tr);
            }
            
            function nombre2(nombre)
            {
                document.getElementById("btnSub").innerHTML="Terminado";
                var parent=document.getElementById(nombre).parentNode.parentNode;
                var header = document.getElementById("header");
                document.getElementById("codigo").value=parent.cells[0].innerHTML;
                document.getElementById("codigo").disabled = true;
                document.getElementById("nombre").value=parent.cells[1].innerHTML;
                document.getElementById("pais").value=parent.cells[2].innerHTML;
                header.innerHTML="Modificar";
                this.padreActual = parent;
            }
            function sleep (time) {
                return new Promise((resolve) => setTimeout(resolve, time));
                }

            function eliminar(nombre)
            {
                var parent=document.getElementById(nombre).parentNode.parentNode;
                controller.doDelete(parent.cells[0].innerHTML,parent.cells[1].innerHTML,parent.cells[2].innerHTML);
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
