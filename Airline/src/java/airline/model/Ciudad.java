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
public class Ciudad implements Jsonable {

    public Ciudad(String codigo, String nombre, String pais, String zona) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.pais = pais;
        this.zona = zona;
    }
    String codigo;
    String nombre;
    String pais;
    String zona;
}
