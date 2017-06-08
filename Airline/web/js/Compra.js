/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function Compra(numero_compra, usuario, datosCompra, totalCompra){
    this.Compra(numero_compra, usuario, datosCompra, totalCompra);
}

Compra.prototype={
    Compra: function(numero_compra, usuario, datosCompra, totalCompra){
        this.numero_compra=numero_compra;
        this.usuario=usuario;
        this.datosCompra=datosCompra;
        this.totalCompra=totalCompra;
    }
};
