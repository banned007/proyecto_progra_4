/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

  function Usuario(id,clave,tipo) {
    this.Usuario(id,clave,tipo);
  }
  
  Usuario.prototype={
	Usuario: function(id,clave,tipo){
		this.id=id;
		this.clave=clave;
		this.tipo=tipo;
	},
	toString:function(){
	  return this.id;
	}
  };
