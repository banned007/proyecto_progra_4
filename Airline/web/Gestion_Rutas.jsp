<%-- 
    Document   : Gestion_Vuelos_Ingreso
    Created on : 1/06/2017, 03:57:34 PM
    Author     : Walter
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gestion de Rutas</title>
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

                    <h1 class="titulo3">Gestion de Rutas</h1>
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="nombre1()">Ingresar nuevo ruta</button>
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
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Origen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <select class="custom-select form-control" id="origen"></select>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Destino&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <select class="custom-select form-control" id="destino"></select>
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Duracion&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <input type="text" id="duracion" class="input-lg" required>
                                        </div><br>
                                        <div class="input-group" id = "img">
                                            <p style = "display : inline-block">Imagen: </p> <input type="file" id="imagen" style="display: inline-block">
                                        </div><br>
                                        <div class="modal-footer">
                                            <center>
                                            <div>
                                                <button class="btn btn-default" type="submit" id="btnSub" >Agregar</button><button  type="button" class="btn btn-default" data-dismiss="modal" onclick="cancelar()" id="close">Cancelar</button>
                                            </div>
                                            </center>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="grid" id="t1">
                        <thead><tr><th>numero</th><th>Origen</th><th>Destino</th><th>Duracion</th><th>&nbsp;&nbsp;&nbsp;Acción&nbsp;&nbsp;&nbsp;</th></thead>
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
            Proxy.getCiudades(function(result){
               model.ciudades=result; 
            });
            view.sleep(500).then(() => {
            Proxy.rutaSearch(function (result) {
                        model.rutaes = result;
                        view.listRutas();
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
                var codigo = parseInt(document.getElementById("numero").value);
                var origen = document.getElementById("origen").value;
                var destino = document.getElementById("destino").value;
                var duracion = document.getElementById("duracion").value;
                var ruta = new Ruta(codigo,new Ciudad(origen,"",""),new Ciudad(destino,"",""),duracion);
                var imagen = document.getElementById("imagen").files[0];
                Proxy.rutaAdd(ruta, imagen, function(result){
                    document.getElementById("0").innerHTML=result;
                });
                return ruta;
            },
        doUpdate: function(){
                var codigo=parseInt(document.getElementById("numero").value);
                var origen=document.getElementById("origen").value;
                var destino=document.getElementById("destino").value;
                var duracion=document.getElementById("duracion").value;
                var ruta = new Ruta(codigo,new Ciudad(origen,"",""),new Ciudad(destino,"",""),duracion);
                //var imagen = document.getElementById("imagen").files[0];
                Proxy.rutaUpdate(ruta, function(result){
                    document.getElementById("0").innerHTML=result;
                });
                return ruta;
            },
        doDelete: function(codigo, origen, destino, duracion){
                Proxy.rutaDelete(new Ruta(codigo,origen,destino,duracion), function(result){
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
    var rutaActual;
        function setErr(i)
        {
            controller.err=i;
        }
        function pageLoad(event) {
            model = new AirModel();
            controller = new AirController(model, window);
        }
        function llenaOpciones(){
            var opt, opt1;
            var origen=document.getElementById("origen");
            var destino=document.getElementById("destino");
            for(var i=0; i<model.ciudades.length; i++){
                opt=document.createElement("option");
                opt.value=model.ciudades[i].codigo;
                opt.innerHTML=model.ciudades[i].codigo;
                opt1=document.createElement("option");
                opt1.value=model.ciudades[i].codigo;
                opt1.innerHTML=model.ciudades[i].codigo;
                origen.appendChild(opt);
                destino.appendChild(opt1);
            }
        }
        function cancelar()
        {
            document.getElementById("numero").disabled = false;
            document.getElementById("numero").value="";
            document.getElementById("origen").value=document.getElementById("origen").firstChild.value;
            document.getElementById("destino").value=document.getElementById("destino").firstChild.value;
            document.getElementById("duracion").value="";
            document.getElementById("btnSub").innerHTML="Agregar";
        }
        function doCommit(){
            if(document.getElementById("btnSub").innerHTML!=="Terminado"){
                this.rutaActual = controller.doCommit();
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
                this.rutaActual = controller.doUpdate();
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
            this.padreActual.cells[0].innerHTML=this.rutaActual.numero;
            this.padreActual.cells[1].innerHTML =this.rutaActual.origen.codigo;
            this.padreActual.cells[2].innerHTML =this.rutaActual.destino.codigo;
            this.padreActual.cells[3].innerHTML=this.rutaActual.duracion;
        }
        function actualizar1()
        {
            model.rutaes.push(this.rutaActual);
            listRutas();
        }
        function reset()
        {
            
            document.getElementById("numero").disabled = false;
            document.getElementById("numero").value="";
            document.getElementById("origen").value=document.getElementById("origen").firstChild.value;
            document.getElementById("destino").value=document.getElementById("destino").firstChild.value;
            document.getElementById("duracion").value="";
            document.getElementById("btnSub").innerHTML="Agregar";
        }
        function nombre1(){
            reset();
            document.getElementById("img").style.visibility="visible";
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
            
            function listRutas() {
                table.destroy();
                var listado = document.getElementById("listado");
                listado.innerHTML = "";
                for (i = 0; i < model.rutaes.length; i++) {
                    listRuta(listado, model.rutaes[i]);
                }
                table = paginacion();
            }
            
            function listRuta(listado, ruta) {
                var tr = document.createElement("tr");
                var td;
                td = document.createElement("td");
                td.appendChild(document.createTextNode(ruta.numero));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(ruta.origen.codigo));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(ruta.destino.codigo));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(ruta.duracion));
                tr.appendChild(td);
                td = document.createElement("td");
                td.innerHTML="<button type=button id=\"button"+ruta.numero+"\" class=\"btn btn-default\" data-toggle=\"modal\" data-target=\"#myModal\" onclick=nombre2(\"button"+ruta.numero+"\") display=\"inline-block\">Edit</button><button type=\"button\" id=\"buttonE"+ruta.numero+"\" class=\"btn btn-default btn_derecha\" onclick=eliminar(\"buttonE"+ruta.numero+"\") display=\"inline-block\">Delete</button>";
                tr.appendChild(td);
                listado.appendChild(tr);
            }
            
            function nombre2(nombre)
            {
                document.getElementById("btnSub").innerHTML="Terminado";
                document.getElementById("img").style.visibility="hidden";
                var parent=document.getElementById(nombre).parentNode.parentNode;
                var header = document.getElementById("header");
                document.getElementById("numero").value=parent.cells[0].innerHTML;
                document.getElementById("numero").disabled = true;
                document.getElementById("origen").value=parent.cells[1].innerHTML;
                document.getElementById("destino").value=parent.cells[2].innerHTML;
                document.getElementById("duracion").value=parent.cells[3].innerHTML;
                header.innerHTML="Modificar";
                this.padreActual = parent;
            }
            function sleep (time) {
                return new Promise((resolve) => setTimeout(resolve, time));
                }

            function eliminar(nombre)
            {
                var parent=document.getElementById(nombre).parentNode.parentNode;
                controller.doDelete(parseInt(parent.cells[0].innerHTML),new Ciudad(parent.cells[1].innerHTML,"",""),new Ciudad(parent.cells[2].innerHTML,"",""),parseFloat(parent.cells[3].innerHTML));
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