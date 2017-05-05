/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;

/**
 *
 * @author kerly
 */
public class Ruta {

    public Ruta(String numero, Ciudad origen, Ciudad destino, float duracion) {
        this.numero = numero;
        this.origen = origen;
        this.destino = destino;
        this.duracion = duracion;
    }
    String numero;
    Ciudad origen;
    Ciudad destino;
    float duracion;
}
