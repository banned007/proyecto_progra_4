/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function Vuelo(numero, horario, dia, asientosDisp){
    this.Vuelo(numero, horario, dia, asientosDisp);
}

Vuelo.prototype={
    Vuelo: function(numero, horario, dia, asientosDisp){
        this.numero=numero;
        this.horario=horario;
        this.dia=dia;
        this.asientosDisp=asientosDisp;
    }
};


