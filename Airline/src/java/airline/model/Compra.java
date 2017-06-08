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
public class Compra implements Jsonable{

    public Compra(int numero_compra, Usuario usuario, String datosCompra, float totalCompra) {
        this.numero_compra = numero_compra;
        this.usuario = usuario;
        this.datosCompra = datosCompra;
        this.totalCompra = totalCompra;
    }
    public Compra(){
        this.numero_compra = 0;
        this.usuario = new Usuario();
        this.datosCompra = "";
        this.totalCompra = 0;
    }

    public int getNumero_compra() {
        return numero_compra;
    }

    public void setNumero_compra(int numero_compra) {
        this.numero_compra = numero_compra;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getDatosCompra() {
        return datosCompra;
    }

    public void setDatosCompra(String datosCompra) {
        this.datosCompra = datosCompra;
    }

    public float getTotalCompra() {
        return totalCompra;
    }

    public void setTotalCompra(float totalCompra) {
        this.totalCompra = totalCompra;
    }
    int numero_compra;
    Usuario usuario;
    String datosCompra;
    float totalCompra;
}
