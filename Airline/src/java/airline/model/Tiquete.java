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
public class Tiquete implements Jsonable {

    public Tiquete(int numero_tiquete, String datos_persona, Compra compra, Viaje viaje) {
        this.numero_tiquete = numero_tiquete;
        this.datos_persona = datos_persona;
        this.compra = compra;
        this.viaje = viaje;
    }
    public Tiquete() {
        this.numero_tiquete = 0;
        this.datos_persona = "";
        this.compra = new Compra();
        this.viaje = new Viaje();
    }

    public int getNumero_tiquete() {
        return numero_tiquete;
    }

    public void setNumero_tiquete(int numero_tiquete) {
        this.numero_tiquete = numero_tiquete;
    }

    public String getDatos_persona() {
        return datos_persona;
    }

    public void setDatos_persona(String datos_persona) {
        this.datos_persona = datos_persona;
    }

    public Compra getCompra() {
        return compra;
    }

    public void setCompra(Compra compra) {
        this.compra = compra;
    }

    public Viaje getViaje() {
        return viaje;
    }

    public void setViaje(Viaje viaje) {
        this.viaje = viaje;
    }
    int numero_tiquete;
    String datos_persona;
    Compra compra;
    Viaje viaje;
}
