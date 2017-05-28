/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

  function Cliente(id,nombre,apellido, correo_electronico,fecha_nacimiento,direccion,telefono_trabajo,celular) {
    this.Cliente(id,nombre,apellido, correo_electronico,fecha_nacimiento,direccion,telefono_trabajo,celular);
  }
  
  Cliente.prototype={
	Cliente: function(id,nombre,apellido, correo_electronico,fecha_nacimiento,direccion,telefono_trabajo,celular){
		this.id = id;
                this.nombre = nombre;
                this.apellido = apellido;
                this.correo_electronico = correo_electronico;
                this.fecha_nacimiento = fecha_nacimiento;
                this.direccion = direccion;
                this.telefono_trabajo = telefono_trabajo;
                this.celular = celular;
	},
	toString:function(){
	  return this.id;
	}
  }
