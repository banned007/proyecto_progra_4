/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function Vuelo(numero, origen, destino, precio, dia, hora){
    this.Vuelo(numero, origen, destino, precio, dia, hora);
}

Vuelo.prototype={
    Vuelo: function(numero, origen, destino, precio, dia, hora){
        this.numero=numero;
        this.origen=origen;
        this.destino=destino;
        this.precio=precio;
        this.dia=dia;
        this.hora=hora;
    }
};


