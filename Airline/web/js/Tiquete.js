/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Tiquete(numero_tiquete, datos_persona, compra, viaje){
    this.Tiquete(numero_tiquete, datos_persona, compra, viaje);
}

Tiquete.prototype={
    Tiquete: function(numero_tiquete, datos_persona, compra, viaje){
        this.numero_tiquete=numero_tiquete;
        this.datos_persona=datos_persona;
        this.compra=compra;
        this.viaje=viaje;
    },
    setCompra: function(compra){
        this.compra=compra;
    },
    setNumero_tiquete: function(numero_tiquete){
        this.numero_tiquete=numero_tiquete;
    }
};


