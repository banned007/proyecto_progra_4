/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Avion(numero, annio, modelo, marca, cantPasajeros, cantFilas, cantAscFilas){
    this.Avion(numero, annio, modelo, marca, cantPasajeros, cantFilas, cantAscFilas);
}

Avion.prototype={
    Vuelo: function(numero, annio, modelo, marca, cantPasajeros, cantFilas, cantAscFilas){
        this.numero=numero;
        this.annio=annio;
        this.modelo=modelo;
        this.marca=marca;
        this.cantPasajeros=cantPasajeros;
        this.cantFilas=cantFilas;
        this.cantAscFilas=cantAscFilas;
    }
};

