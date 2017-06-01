<%-- 
    Document   : index
    Created on : 20-may-2017, 18:27:10
    Author     : kerly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Aerolineas EXODUS</title>
        <%@ include file="Imports.jspf" %>        
    </head>
    <body>
        <%@ include file="Header.jspf" %>

        <div class="carousel slide" data-ride="carousel" data-type="multi" data-interval="3000" id="productscarousel">

            <div class="carousel-inner" id="carousel">
            </div>
            <a class="left carousel-control" href="#productscarousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
            <a class="right carousel-control" href="#productscarousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a> 
        </div>        


        <div class="container">
            <div class="panel panel-default">
                <div class="panel-body" >
                    <center><div id="formularioDiv" >
                        <form method="POST" name="formulario" id="formulario" action="javascript:doSearch();" >
                            <div class="form-group" style="display: inline-block;"><label>-  Origen -</label><select id="origen" class="form-control" ></select></div>
                            <div class="form-group" style="display: inline-block;"><label>- Destino -</label><select id="destino" class="form-control" ></select></div>
                            <div class="form-group" style="display: inline-block;"><label>-  Salida -</label><div class="input-append date" id="salida"  data-date-format="dd-mm-yyyy">
                                    <input class="span2" size="16" type="text" />
                                    <span class="add-on"><i class="icon-th"></i></span>
                                </div></div>
                            <div class="form-group" style="display: inline-block;"><label id="lbllegada">- Llegada -</label>
                                <div class="input-append date" id="llegada"  data-date-format="dd-mm-yyyy">
                                    <input class="span2" size="16" type="text" /> 
                                    <span class="add-on"><i class="icon-th"></i></span>
                                </div></div>
                            <div class="form-group" style="display: inline-block;"><label>-Pasajeros-</label><select id="pasajeros" class="form-control" ></select></div>
                            <label>Solo ida</label><input type="checkbox" id="soloIda" name="soloIda" >
                            <input class="btn btn-default" type="submit" value="Buscar" >   
                        </form>
                    </div></center>                    
                </div>
            </div>
        </div>
            <div class="panel panel-default" id="panel2">
                            <div id="listadoDiv" style="display: block; vertical-align:top;">
                                <table class="grid" id="t1">
                                    <thead><tr><th>Código</th><th>Origen</th><th>Destino</th><th>Duración</th><th>Precio</th></thead>
                                    <tbody id="listado"></tbody>
                                </table>

                            </div>
            </div>
      
            
        

        <script> //Modell
            function AirModel() {
                this.AirModel();
            }

            AirModel.prototype = {
                AirModel: function () {
                }

            };
        </script>
        <script> //Controller
            function AirController(model, view) {
                this.AirController(model, view);
            }

            AirController.prototype = {
                AirController: function (model, view) {
                    this.model = model;
                    this.view = view;
                    console.log('wjkfjwelf');
                    Proxy.getCiudades(function (result) {
                        console.log('wjkfjwelf');
                        model.ciudades = result;
                        view.fillCombo();
                    });
                    Proxy.getPromo(function (result) {
                        model.promo = result;
                        view.showPromos();
                    });
                    model.buscados = [];

                },

                buscar: function () {
                    var origen = this.view.$("#origen").val();
                    var destino = this.view.$("#destino").val();
                    var model = this.model;
                    var view = this.view;
                    Proxy.vuelosSearch(origen, destino, function (result) {
                        model.buscados = result;
                        view.showBuscados();
                    });
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
                                        document.location = "/Airline/index.jsp";
                                        break;
                                    case 2: // manager
                                        document.location = "/Airline/AdminMenu.jsp";
                                        break;
                                }
                            });
                }
            };
        </script>
        <script> //View
            var model;
            var controller;

            function pageLoad(event) {
                model = new AirModel();
                controller = new AirController(model, window);
                //showPromos(); //llenar el carousel  


                $('#salida').datepicker({autoclose: true, language: 'es'});
                $('#salida').datepicker('update', new Date());
                $('#llegada').datepicker({autoclose: true, language: 'es'});
                $('#llegada').datepicker('update', new Date());


                fillComboPasajeros();
                //listVuelos(model.buscados);
                var ida = document.getElementById("soloIda");
                $('input[name="soloIda"]').change(function () {
                    if ($(this).is(':checked'))
                    {
                        document.getElementById("llegada").hidden = true;
                        document.getElementById("lbllegada").hidden = true;

                    } else
                    {
                        document.getElementById("llegada").hidden = false;
                        document.getElementById("lbllegada").hidden = false;
                    }

                });



            }

            function showPromos() {
                for (var a = 0; a < model.promo.length; a++)
                {
                    addCarousel(model.promo[a]);
                }

            }

            function addCarousel(viaje) {
                var c = document.getElementById("carousel");
                var item = "";
                item = c.childElementCount == 0 ? "item active" : "item";
                var a = "";
                a += "<div class=\"imagen-ofertaD\">";
                a += "<img src=\"img/" + viaje.vuelo.ruta.numero + ".jpg\" alt=\"\" class=\"imagen-ofertaI\" >";//link de imagen
                a += "</div>";
                a += "<div class=\"carousel-caption\">";
                a += "<h1 class=\"titulo3\">" + viaje.vuelo.ruta.origen.nombre + " - " + viaje.vuelo.ruta.destino.nombre + "    $" + viaje.vuelo.precio + "</h3>";//encabezado de producto
                a += "<button type=\"submit\" href=\"#\" class=\"buybtn\">Comprar</button>";
                a += "</div>";

                var b = document.createElement("div");
                b.className = item;
                b.innerHTML = a;

                c.appendChild(b);
            }


            function fillCombo()
            {
                var origen = document.getElementById("origen");
                var destino = document.getElementById("destino");
                var i;
                for (i = 0; i < model.ciudades.length; i++) {
                    origen.options[i] = new Option(model.ciudades[i].nombre, model.ciudades[i].codigo);
                    destino.options[i] = new Option(model.ciudades[i].nombre, model.ciudades[i].codigo);
                }

                origen.options[i] = new Option("Todas", "-");
                destino.options[i] = new Option("Todas", "-");

                ;
            }

            function fillComboPasajeros() {
                var pasajeros = document.getElementById("pasajeros");
                for (var i = 1; i < 21; i++) {
                    pasajeros.options[i] = new Option(i, i);

                }
            }
            function doSearch() {
                controller.buscar();
            }
            function showBuscados() {
                listVuelos();

            }

            function listVuelos() {
                table.destroy();
                var listado = document.getElementById("listado");
                listado.innerHTML = "";
                for (i = 0; i < model.buscados.length; i++) {
                    listVuelo(listado, model.buscados[i]);
                }
                table = paginacion();
            }

            var table = paginacion();
            function paginacion() {
                return $('#t1').DataTable({"language": {"sProcessing": "Procesando...",
                        "sLengthMenu": "Mostrar _MENU_ boletos",
                        "sZeroRecords": "No se encontraron vuelos",
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


            function listVuelo(listado, vuelo) {
                var tr = document.createElement("tr");
                var td;
                td = document.createElement("td");
                td.appendChild(document.createTextNode(vuelo.numero));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(vuelo.horario.ruta.origen.nombre));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(vuelo.horario.ruta.destino.nombre));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(vuelo.horario.ruta.duracion));
                tr.appendChild(td);
                td = document.createElement("td");
                td.appendChild(document.createTextNode(vuelo.horario.precio));
                tr.appendChild(td);

                listado.appendChild(tr);
            }

            document.addEventListener("DOMContentLoaded", pageLoad)
        </script>        



    </body>
</html>

