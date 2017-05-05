/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Horario(numero, ruta, dia, hora, precio){
    this.Horario(numero, ruta, dia, hora, precio);
}

Horario.prototype={
    Horario: function(numero, ruta, dia, hora, precio){
        this.numero=numero;
        this.ruta=ruta;
        this.dia=dia;
        this.hora=hora;
        this.precio=precio;
    }
};

