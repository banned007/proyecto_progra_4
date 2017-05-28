/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;

import java.io.Serializable;


/**
 *
 * @author kerly
 */
public class Usuario implements Serializable, Jsonable{
    public Usuario() {
        this.id = " ";
        this.clave = " ";
        this.tipo = 0;
    }
    
    public Usuario(String id, String clave, int tipo) {
        this.id = id;
        this.clave = clave;
        this.tipo = tipo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }
    
    String id;
    String clave;
    int tipo;

    
}
