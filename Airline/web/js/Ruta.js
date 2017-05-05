/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function Ruta(numero, origen, destino, duracion){
    this.Ruta(numero, origen, destino, duracion);
}

Ruta.prototype={
    Ruta: function(numero, origen, destino, duracion){
        this.numero=numero;
        this.origen=origen;
        this.destino=destino;
        this.duracion=duracion;
    }
};


