/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function Vuelo(numero_vuelo, dia, hora, precio, ruta, avion){
    this.Vuelo(numero_vuelo, dia, hora, precio, ruta, avion);
}

Vuelo.prototype={
    Vuelo: function(numero_vuelo, dia, hora, precio, ruta, avion){
        this.numero_vuelo=numero_vuelo;
        this.dia=dia;
        this.hora=hora;
        this.precio=precio;
        this.ruta=ruta;
        this.avion=avion;
    }
};


