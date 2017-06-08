<%-- 
    Document   : ErrorSeguridad
    Created on : 27-may-2017, 19:50:57
    Author     : kerly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Error</title>
        <%@ include file="Imports.jspf" %>
    </head>
    <body>
        <%@ include file="Header.jspf" %>
        
        <div style="text-align:center;">
           <br><br><br><br><br><br>
            <image src="img/seguridad.gif" style="display: block; margin: auto; width: 200px">
            <h1>No hay nada aquí!!!</h1>
        </div>

<script> // Model
  function AirModel() {
    this.AirModel();
  }
  
  AirModel.prototype={
	AirModel: function(){
        }
  };
</script>
<script> // Controller
  function AirController(model,view) {
    this.AirController(model,view);
  }
  
  AirController.prototype={
	AirController: function(model,view){
		this.model=model;
		this.view=view;
	}
  };
</script>
<script> // View
  var model;
  var controller;
	function pageLoad(event){
		model=new AirModel();  
		controller = new AirController(model,window);
	}
	document.addEventListener("DOMContentLoaded",pageLoad);
</script>          
        
    </body>
</html>
