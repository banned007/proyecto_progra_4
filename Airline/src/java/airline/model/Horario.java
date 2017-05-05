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
public class Horario {

    public Horario(String numero, Ruta ruta, String dia, String hora, float precio) {
        this.numero = numero;
        this.ruta = ruta;
        this.dia = dia;
        this.hora = hora;
        this.precio = precio;
    }
    String numero;
    Ruta ruta;
    String dia;
    String hora;
    float precio;
}
