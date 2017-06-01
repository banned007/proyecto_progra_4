/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;

import java.util.Date;

/**
 *
 * @author kerly
 */
public class Viaje implements Jsonable{

    public Viaje(int numero_viaje, Vuelo vuelo, Date dia_especifico, int asientos_disponibles, int promocion) {
        this.numero_viaje = numero_viaje;
        this.vuelo = vuelo;
        this.dia_especifico = dia_especifico;
        this.asientos_disponibles = asientos_disponibles;
        this.promocion=promocion;
    }
    
    public Viaje(){
        this.numero_viaje = 0;
        this.vuelo = new Vuelo();
        this.dia_especifico = new Date();
        this.asientos_disponibles = 0;
        this.promocion=0;
    }

    public int getNumero_viaje() {
        return numero_viaje;
    }

    public void setNumero_viaje(int numero_viaje) {
        this.numero_viaje = numero_viaje;
    }

    public Vuelo getVuelo() {
        return vuelo;
    }

    public void setVuelo(Vuelo vuelo) {
        this.vuelo = vuelo;
    }

    public Date getDia_especifico() {
        return dia_especifico;
    }

    public void setDia_especifico(Date dia_especifico) {
        this.dia_especifico = dia_especifico;
    }

    public int getAsientos_disponibles() {
        return asientos_disponibles;
    }

    public void setAsientos_disponibles(int asientos_disponibles) {
        this.asientos_disponibles = asientos_disponibles;
    }
    
    public int getPromocion() {
        return promocion;
    }

    public void setPromocion(int promocion) {
        this.promocion = promocion;
    }
    int numero_viaje;
    Vuelo vuelo;
    Date dia_especifico;
    int asientos_disponibles;
    int promocion;
    
}
