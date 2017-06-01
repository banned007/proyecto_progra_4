/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Avion(codigo_avion, annio, modelo, marca, cant_pasajeros, cant_filas, cant_asientos_fila){
    this.Avion(codigo_avion, annio, modelo, marca, cant_pasajeros, cant_filas, cant_asientos_fila);
}

Avion.prototype={
    Vuelo: function(codigo_avion, annio, modelo, marca, cant_pasajeros, cant_filas, cant_asientos_fila){
        this.codigo_avion=codigo_avion;
        this.annio=annio;
        this.modelo=modelo;
        this.marca=marca;
        this.cant_pasajeros=cant_pasajeros;
        this.cant_filas=cant_filas;
        this.cant_asientos_fila=cant_asientos_fila;
    }
};

