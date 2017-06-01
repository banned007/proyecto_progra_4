/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function Viaje(numero_viaje, vuelo, dia_especifico, asientos_disponibles, promocion){
    this.Viaje(numero_viaje, vuelo, dia_especifico, asientos_disponibles, promocion);
}

Viaje.prototype={
    Viaje: function(numero_viaje, vuelo, dia_especifico, asientos_disponibles, promocion){
        this.numero_viaje=numero_viaje;
        this.vuelo=vuelo;
        this.dia_especifico=dia_especifico;
        this.asientos_disponibles=asientos_disponibles;
        this.promocion=promocion;
    }
};
