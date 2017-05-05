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
public class Vuelo {

    public Vuelo(String numero, Horario horario, String dia, int asientosDisp) {
        this.numero = numero;
        this.horario = horario;
        this.dia = dia;
        this.asientosDisp = asientosDisp;
    }
   String numero;
   Horario horario;
   String dia;
   int asientosDisp;
}
