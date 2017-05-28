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
public class Cliente implements Serializable, Jsonable {
    public Cliente(){
        this.id = " ";
        this.nombre = " ";
        this.apellido = " ";
        this.correo_electronico = " ";
        this.fecha_nacimiento = " ";
        this.direccion = " ";
        this.telefono_trabajo = " ";
        this.celular = " ";
    }
    
    public Cliente(String id, String nombre, String apellido, String correo_electronico, String fecha_nacimiento, String direccion, String telefono_trabajo, String celular) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo_electronico = correo_electronico;
        this.fecha_nacimiento = fecha_nacimiento;
        this.direccion = direccion;
        this.telefono_trabajo = telefono_trabajo;
        this.celular = celular;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo_electronico() {
        return correo_electronico;
    }

    public void setCorreo_electronico(String correo_electronico) {
        this.correo_electronico = correo_electronico;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono_trabajo() {
        return telefono_trabajo;
    }

    public void setTelefono_trabajo(String telefono_trabajo) {
        this.telefono_trabajo = telefono_trabajo;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }
    String id ;
    String nombre ;
    String apellido ;
    String correo_electronico ;
    String fecha_nacimiento ;
    String direccion ;
    String telefono_trabajo ;
    String celular ;
}
