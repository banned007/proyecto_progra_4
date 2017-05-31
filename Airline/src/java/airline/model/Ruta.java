/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;

import java.time.LocalTime;

/**
 *
 * @author kerly
 */
public class Ruta implements Jsonable {

    public Ruta(int numero, Ciudad origen, Ciudad destino, float duracion) {
        this.numero = numero;
        this.origen = origen;
        this.destino = destino;
        this.duracion = duracion;
    }
    
    public Ruta() {
        this.numero = 0;
        this.origen = new Ciudad();
        this.destino = new Ciudad();
        this.duracion = 0;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public Ciudad getOrigen() {
        return origen;
    }

    public void setOrigen(Ciudad origen) {
        this.origen = origen;
    }

    public Ciudad getDestino() {
        return destino;
    }

    public void setDestino(Ciudad destino) {
        this.destino = destino;
    }

    public float getDuracion() {
        return duracion;
    }

    public void setDuracion(float duracion) {
        this.duracion = duracion;
    }
    int numero;
    Ciudad origen;
    Ciudad destino;
    float duracion;
}
