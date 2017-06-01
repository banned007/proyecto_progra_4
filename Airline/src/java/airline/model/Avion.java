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
public class Avion implements Jsonable{

    public Avion(int codigo_avion, String annio, String modelo, String marca, int cant_pasajeros, int cant_filas, int cant_asientos_fila) {
        this.codigo_avion = codigo_avion;
        this.annio = annio;
        this.modelo = modelo;
        this.marca = marca;
        this.cant_pasajeros = cant_pasajeros;
        this.cant_filas = cant_filas;
        this.cant_asientos_fila = cant_asientos_fila;
    }
    
    public Avion(){
        this.codigo_avion = 0;
        this.annio = "";
        this.modelo = "";
        this.marca = "";
        this.cant_pasajeros = 0;
        this.cant_filas = 0;
        this.cant_asientos_fila = 0;
    }

    public int getCodigo_avion() {
        return codigo_avion;
    }

    public void setCodigo_avion(int codigo_avion) {
        this.codigo_avion = codigo_avion;
    }

    public String getAnnio() {
        return annio;
    }

    public void setAnnio(String annio) {
        this.annio = annio;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getCant_pasajeros() {
        return cant_pasajeros;
    }

    public void setCant_pasajeros(int cant_pasajeros) {
        this.cant_pasajeros = cant_pasajeros;
    }

    public int getCant_filas() {
        return cant_filas;
    }

    public void setCant_filas(int cant_filas) {
        this.cant_filas = cant_filas;
    }

    public int getCant_asientos_fila() {
        return cant_asientos_fila;
    }

    public void setCant_asientos_fila(int cant_asientos_fila) {
        this.cant_asientos_fila = cant_asientos_fila;
    }
    int codigo_avion;
    String annio;
    String modelo;
    String marca;
    int cant_pasajeros;
    int cant_filas;
    int cant_asientos_fila;
    
}
