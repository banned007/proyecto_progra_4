
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function Ciudad(codigo, nombre, pais){
    this.Ciudad(codigo, nombre, pais);
}

Ciudad.prototype={
    Ciudad: function(codigo, nombre, pais){
        this.codigo=codigo;
        this.nombre=nombre;
        this.pais=pais;
    }
};


