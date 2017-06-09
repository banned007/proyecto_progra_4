<%-- 
    Document   : Gestion_Viajes_Ingreso
    Created on : 1/06/2017, 03:57:34 PM
    Author     : Walter
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gestion de Viajes</title>
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

                    <h1 class="titulo3">Gestion de Viajes</h1>
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="nombre1()">Ingresar nuevo viaje</button>
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1" onclick="nombre1()">Ingresar viajes</button>
                    <br><br>
                    <table class="grid" id="t1">
                        <thead><tr><th>numero</th><th>Vuelo</th><th>Fecha especifica</th><th>Asientos disponibles</th>><th>En promoción</th><th>&nbsp;&nbsp;&nbsp;Acción&nbsp;&nbsp;&nbsp;</th></thead>
                        <tbody id="listado"></tbody>
                    </table>
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
                                        <div class="input-group" id="img">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Numero&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <input type="text" id="numero_viaje"   class="input-lg">
                                        </div><br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vuelo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <select class="custom-select form-control" id="vuelo"></select>
                                        </div><br>
                                        <div class="input-group">
                                            <p style = "display : inline-block" style="margin-right: 5px">fecha Especifica&nbsp;&nbsp;&nbsp;</p><div class="input-append date" id="dia_especifico"  data-date-format="yyyy/mm/dd" style = "display : inline-block">
                                                <input class="span2" size="16" type="text" id="dia_input" /> 
                                                <span class="add-on"><i class="icon-th"></i></span>
                                            </div>
                                        </div><br>
                                        <div class="input-group">
                                            <p style = "display : inline-block" style="margin-right: 5px">Está en promoción:&nbsp;&nbsp;&nbsp;</p><input type="checkbox" id="promo" style = "display : inline-block" style="margin-left: 5px">
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
                </div>
                    <div class="modal fade" id="myModal1" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="form-box center_div">
                                    <form method="POST" name="formulario2" id="formulario1" action="javascript:fechas();">
                                        <div class="modal-header">
                                            <center>
                                                <h4 class="modal-title" id="header">Agregar Viajes</h4>
                                            </center>
                                        </div>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vuelo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <select class="custom-select form-control" id="vuelo1"></select>
                                        </div><br>
                                        <div class="input-group">
                                            <p style = "display : inline-block" style="margin-right: 5px">Fecha inicio&nbsp;&nbsp;&nbsp;</p><div class="input-append date" id="dia_especifico1"  data-date-format="yyyy-mm-dd" style = "display : inline-block">
                                                <input class="span2" size="16" type="text" id="dia_input1" /> 
                                                <span class="add-on"><i class="icon-th"></i></span>
                                            </div>
                                        </div>
                                        <div class="input-group">
                                            <p style = "display : inline-block" style="margin-right: 5px">Fecha final&nbsp;&nbsp;&nbsp;</p><div class="input-append date" id="dia_especifico2"  data-date-format="yyyy-mm-dd" style = "display : inline-block">
                                                <input class="span2" size="16" type="text" id="dia_input2" /> 
                                                <span class="add-on"><i class="icon-th"></i></span>
                                            </div>
                                        </div><br>
                                            <div class="input-group">
                                            <p style = "display : inline-block" style="margin-right: 5px">Está en promoción:&nbsp;&nbsp;&nbsp;</p><input type="checkbox" id="promo1" style = "display : inline-block" style="margin-left: 5px">
                                        </div><br>
                                        <div class="modal-footer">
                                            <center>
                                            <div>
                                                <button class="btn btn-default" type="submit" id="btnSub1" display="inline-block">Agregar</button><button display="inline-block" type="button" class="btn btn-default" data-dismiss="modal"  id="close1">Cancelar</button>
                                            </div>
                                            </center>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
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
            Proxy.vueloSearch(function(result){
               model.vuelos=result; 
            });
            view.sleep(700).then(() => {
            Proxy.viajeSearch(function (result) {
                        model.viajees = result;
                        view.listViajes();
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
                var numero=model.viajees.length+1;
                var vuelo=document.getElementById("vuelo").value;
                var dia=$("#dia_input").val();
                var dip1=dia.substring(0,4);
                var dip2=dia.substring(5,7);
                var dip3=dia.substring(8,10);
                dia=dip1+"-"+dip2+"-"+dip3;
                var asientos_disp;
                for(var i=0; i<model.vuelos.length; i++){
                    if(parseInt(vuelo)===model.vuelos[i].numero_vuelo){
                        asientos_disp=model.vuelos[i].avion.cant_pasajeros;
                    }
                }
                var promo=document.getElementById("promo");
                var pro1=promo.checked?1:0;
                var vuelo=new Vuelo(parseInt(vuelo),"","",0,new Ruta(0,new Ciudad("","",""), new Ciudad("","",""),0),new Avion(0, "","","", 0, 0, 0));
                var viaje = new Viaje(numero, vuelo, dia, asientos_disp, pro1);
                Proxy.viajeAdd(viaje,function(result){
                    document.getElementById("0").innerHTML=result;
                });
                return viaje;
            },
        doCommit1: function(fecha){
                var numero=model.viajees.length+1;
                var vuelo=document.getElementById("vuelo1").value;
                var dia=fecha;
                var asientos_disp;
                for(var i=0; i<model.vuelos.length; i++){
                    if(parseInt(vuelo)===model.vuelos[i].numero_vuelo){
                        asientos_disp=model.vuelos[i].avion.cant_pasajeros;
                    }
                }
                var promo=document.getElementById("promo1");
                var pro1=promo.checked?1:0;
                var vuelo=new Vuelo(parseInt(vuelo),"","",0,new Ruta(0,new Ciudad("","",""), new Ciudad("","",""),0),new Avion(0, "","","", 0, 0, 0));
                var viaje = new Viaje(numero, vuelo, dia, asientos_disp, pro1);
                Proxy.viajeAdd(viaje,function(result){
                    document.getElementById("0").innerHTML=result;
                });
                return viaje;
            },
        doUpdate: function(){
                var numero=parseInt(document.getElementById("numero_viaje").value);
                var vuelo=document.getElementById("vuelo").value;
                var dia=$("#dia_input").val();
                var dip1=dia.substring(0,4);
                var dip2=dia.substring(5,7);
                var dip3=dia.substring(8,10);
                dia=dip1+"-"+dip2+"-"+dip3;
                var asientos_disp;
                for(var i=0; i<model.vuelos.length; i++){
                    if(parseInt(vuelo)===model.vuelos[i].numero_vuelo){
                        asientos_disp=model.vuelos[i].avion.cant_pasajeros;
                    }
                }
                var promo=document.getElementById("promo");
                var pro1=promo.checked?1:0;
                var vuelo=new Vuelo(parseInt(vuelo),"","",0,new Ruta(0,new Ciudad("","",""), new Ciudad("","",""),0),new Avion(0, "","","", 0, 0, 0));
                var viaje = new Viaje(numero, vuelo, dia, asientos_disp, pro1);
                Proxy.viajeUpdate(viaje, function(result){
                    document.getElementById("0").innerHTML=result;
                });
                return viaje;
            },
        doDelete: function(numero_viaje, vuelo, dia_input, asientos_disponibles, promocion){
                Proxy.viajeDelete(new Viaje(numero_viaje, vuelo, dia_input, asientos_disponibles, promocion), function(result){
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
    var viajeActual;
        function setErr(i)
        {
            controller.err=i;
        }
        function pageLoad(event) {
            model = new AirModel();
            controller = new AirController(model, window);
            $('#dia_especifico').datepicker({autoclose: true, language: 'en'});
            $('#dia_especifico').datepicker('update', new Date());
            $('#dia_especifico1').datepicker({autoclose: true, language: 'en'});
            $('#dia_especifico1').datepicker('update', new Date());
            $('#dia_especifico2').datepicker({autoclose: true, language: 'en'});
            $('#dia_especifico2').datepicker('update', new Date());
        }
        function llenaOpciones(){
            var opt;
            var opt1;
            var vuelo=document.getElementById("vuelo");
            var vuelo1=document.getElementById("vuelo1");
            for(var i=0; i<model.vuelos.length; i++){
                opt=document.createElement("option");
                opt.value=model.vuelos[i].numero_vuelo;
                opt.innerHTML=model.vuelos[i].numero_vuelo;
                opt1=document.createElement("option");
                opt1.value=model.vuelos[i].numero_vuelo;
                opt1.innerHTML=model.vuelos[i].numero_vuelo;
                vuelo.appendChild(opt);
                vuelo1.appendChild(opt1);
            }
        }
        function cancelar()
        {
            document.getElementById("numero_viaje").disabled = false;
            document.getElementById("numero_viaje").value="";
            document.getElementById("vuelo").value=document.getElementById("vuelo").firstChild.value;
            document.getElementById("promo").checked=false;
            document.getElementById("dia_input").value="";
        }
        function doCommit(){
            if(document.getElementById("btnSub").innerHTML!=="Terminado"){
                this.viajeActual = controller.doCommit();
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
                this.viajeActual = controller.doUpdate();
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
            this.padreActual.cells[0].innerHTML=this.viajeActual.numero_viaje;
            this.padreActual.cells[1].innerHTML =this.viajeActual.vuelo.numero_vuelo;
            this.padreActual.cells[2].innerHTML =this.viajeActual.dia_especifico;
            this.padreActual.cells[3].innerHTML=this.viajeActual.asientos_disponibles;
            this.padreActual.cells[4].innerHTML= this.viajeActual.promocion===1?true:false;
        }
        function fechas()
        {
            var date1=document.getElementById("dia_input1").value;
            var date2=document.getElementById("dia_input2").value;
            console.log(date1);
            console.log(date2);
            var fecha1 = new Date(date1),
                fecha2 = new Date(date2),
                /*dia = fecha.getDate(),
                mes = fecha.getMonth() + 1,
                anio = fecha.getFullYear(),*/
                addTime = 7 * 86400; //Tiempo en segundos
            console.log(fecha1);
            console.log(fecha2);
            var vuelo=parseInt(document.getElementById("vuelo1").value);
            var dia=1;
            var diaS="";
            for(var i=0; i<model.vuelos.length; i++){
                if(vuelo===model.vuelos[i].numero_vuelo)
                    diaS=model.vuelos[i].dia;
            }
            switch (diaS){
                case "L":
                    dia=1;
                    break;
                case "M":
                    dia=2;
                    break
                case "I":
                    dia=3;
                    break;
                case "J":
                    dia=4;
                    break;
                case "V":
                    dia=5;
                    break;
                case "S":
                    dia=6;
                    break;
                case "D":
                    dia=7;
                    break;
                default:
                    dia=0;
            }
            while(dia!==fecha1.getDay())
                fecha1.setSeconds(86400);
            console.log(fecha1);
            this.viajeActual=controller.doCommit1(fecha1.getFullYear()+"-"+(fecha1.getMonth()+1)+"-"+fecha1.getDate());
            actualizar3();
            while(fecha1<fecha2){
                fecha1.setSeconds(addTime);
                this.viajeActual=controller.doCommit1(fecha1.getFullYear()+"-"+(1+fecha1.getMonth())+"-"+fecha1.getDate());
                actualizar3();
            }
            document.getElementById("close1").click();
        }
        function actualizar1()
        {
            reset();
            model.viajees.push(this.viajeActual);
            listViajes();
        }
        function actualizar3(){
            model.viajees.push(this.viajeActual);
            listViajes();
        }
        function reset()
        {
            document.getElementById("numero_viaje").disabled = false;
            document.getElementById("numero_viaje").value="";
            document.getElementById("vuelo").value=document.getElementById("vuelo").firstChild.value;
            document.getElementById("promo").checked=false;
            document.getElementById("dia_input").value="";
            document.getElementById("btnSub").innerHTML="Agregar";
        }
        function nombre1(){
            document.getElementById("img").style.visibility="hidden";
            reset();
            var header = document.getElementById("header");
            header.innerHTML="Agregar";
        }
        var table = paginacion();
        function paginacion() {
                return $('#t1').DataTable({"language": {"sProcessing": "Procesando...",
                        "sLengthMenu": "Mostrar _MENU_ boletos",
                        "sZeroRecords": "No se encontraron viajes",
                        "sEmptyTable": "No hay viajes disponibles",
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
            
            function listViajes() {
                table.destroy();
                var listado = document.getElementById("listado");
                listado.innerHTML = "";
                for (i = 0; i < model.viajees.length; i++) {
                    listViaje(listado, model.viajees[i]);
                }
                table = paginacion();
            }
            
            function listViaje(listado, viaje) {
                var tr = document.createElement("tr");
                var td;
                td = document.createElement("td");
                td.appendChild(document.createTextNode(viaje.numero_viaje));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(viaje.vuelo.numero_vuelo));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(viaje.dia_especifico));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(viaje.asientos_disponibles));
                tr.appendChild(td);
                td = document.createElement("td");
                var chk =document.createElement("checkbox");
                chk.checked=viaje.promocion===1;
                td.appendChild(document.createTextNode(chk.checked));
                tr.appendChild(td);
                td = document.createElement("td");
                td.innerHTML="<button type=button id=\"button"+viaje.numero_viaje+"\" class=\"btn btn-default\" data-toggle=\"modal\" data-target=\"#myModal\" onclick=nombre2(\"button"+viaje.numero_viaje+"\") display=\"inline-block\">Edit</button><button type=\"button\" id=\"buttonE"+viaje.numero_viaje+"\" class=\"btn btn-default btn_derecha\" onclick=eliminar(\"buttonE"+viaje.numero_viaje+"\") display=\"inline-block\">Delete</button>";
                tr.appendChild(td);
                listado.appendChild(tr);
            }
            
            function nombre2(nombre)
            {
                document.getElementById("img").style.visibility="visible";
                document.getElementById("btnSub").innerHTML="Terminado";
                var parent=document.getElementById(nombre).parentNode.parentNode;
                var header = document.getElementById("header");
                document.getElementById("numero_viaje").value=parent.cells[0].innerHTML;
                document.getElementById("numero_viaje").disabled = true;
                document.getElementById("vuelo").value=parent.cells[1].innerHTML;
                document.getElementById("dia_input").value=parent.cells[2].innerHTML;
                document.getElementById("promo").checked=(parent.cells[4].innerHTML==="true")?true:false;
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
                var vuelo=parent.cells[1].innerHTML;
                var dia=parent.cells[2].innerHTML;
                var asientos_disp;
                for(var i=0; i<model.vuelos.length; i++){
                    if(parseInt(numero)===model.vuelos[i].numero_vuelo){
                        asientos_disp=model.vuelos[i].avion.cant_pasajeros;
                    }
                }
                var promo=parent.cells[4].innerHTML;;
                var pro1=(promo==="true")?1:0;
                var vuelo=new Vuelo(parseInt(vuelo),"","",0,new Ruta(0,new Ciudad("","",""), new Ciudad("","",""),0),new Avion(0, "","","", 0, 0, 0));

                
                controller.doDelete(numero,vuelo,dia,asientos_disp,pro1);
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

