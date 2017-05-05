/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function Ciudad(codigo, nombre, pais, zona){
    this.Ciudad(codigo, nombre, pais, zona);
}

Ciudad.prototype={
    Ciudad: function(codigo, nombre, pais, zona){
        this.codigo=codigo;
        this.nombre=nombre;
        this.pais=pais;
        this.zona=zona;
    }
};


