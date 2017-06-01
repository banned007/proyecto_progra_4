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
public class Vuelo implements Jsonable{

    public Vuelo(int numero_vuelo, String dia, String hora, float precio, Ruta ruta, Avion avion) {
        this.numero_vuelo = numero_vuelo;
        this.dia = dia;
        this.hora = hora;
        this.precio = precio;
        this.ruta = ruta;
        this.avion = avion;
    }
    public Vuelo() {
        this.numero_vuelo = 0;
        this.dia = "";
        this.precio = 0;
        this.ruta = new Ruta();
        this.avion = new Avion();
    }

    public int getNumero_vuelo() {
        return numero_vuelo;
    }

    public void setNumero_vuelo(int numero_vuelo) {
        this.numero_vuelo = numero_vuelo;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public Ruta getRuta() {
        return ruta;
    }

    public void setRuta(Ruta ruta) {
        this.ruta = ruta;
    }

    public Avion getAvion() {
        return avion;
    }

    public void setAvion(Avion avion) {
        this.avion = avion;
    }

    int numero_vuelo;
    String dia;
    String hora;
    float precio;
    Ruta ruta;
    Avion avion;
}
