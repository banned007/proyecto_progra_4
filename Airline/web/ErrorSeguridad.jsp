<%-- 
    Document   : ErrorSeguridad
    Created on : 27-may-2017, 17:04:03
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
            <h1 > Error de seguridad!</h1>
            <image src="" style="display: block; margin: auto; width: 200px">

        </div>

<script> // Model
  function Model() {
    this.Model();
  }
  
  Model.prototype={
	Model: function(){
        }
  };
</script>
<script> // Controller
  function Controller(model,view) {
    this.Controller(model,view);
  }
  
  Controller.prototype={
	Controller: function(model,view){
		this.model=model;
		this.view=view;
	}
  };
</script>
<script> // View
  var model;
  var controller;
	function pageLoad(event){
		model=new Model();  
		controller = new Controller(model,window);
	}
	document.addEventListener("DOMContentLoaded",pageLoad);
</script>          
        
    </body>
</html>
