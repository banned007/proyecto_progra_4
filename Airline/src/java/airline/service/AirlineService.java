/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.service;

import airline.model.AirlineModel;
import airline.model.Avion;
import airline.model.Ciudad;
import airline.model.Cliente;
import airline.model.Compra;
import airline.model.Horario;
import airline.model.Jsonable;
import airline.model.Ruta;
import airline.model.Tiquete;
import airline.model.Usuario;
import airline.model.Viaje;
import airline.model.Vuelo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.typeadapters.RuntimeTypeAdapterFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kerly
 */
@WebServlet(name = "AirlineService", urlPatterns = {"/AirlineService"})
public class AirlineService extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            response.setContentType("text/xml");
            RuntimeTypeAdapterFactory<Jsonable> rta = RuntimeTypeAdapterFactory.of(Jsonable.class,"_class")
                    .registerSubtype(Ciudad.class,"Ciudad")
                    .registerSubtype(Ruta.class,"Ruta")
                    .registerSubtype(Vuelo.class,"Vuelo")
                    .registerSubtype(Usuario.class,"Usuario")
                    .registerSubtype(Cliente.class,"Cliente")
                    .registerSubtype(Viaje.class,"Viaje")
                    .registerSubtype(Avion.class,"Avion")
                    .registerSubtype(Compra.class,"Compra")
                    .registerSubtype(Tiquete.class,"Tiquete");
            Gson gson = new GsonBuilder().registerTypeAdapterFactory(rta).setDateFormat("dd/MM/yyyy").create();
            String json;
            String accion = request.getParameter("action");
            System.out.println(accion);
            List<Ciudad> ciudades;
            List<Vuelo> vuelos;
            List<Viaje> viajes;
            List<Tiquete> tiquetes;
            Cliente client;
            List<Avion> aviones;
            List<Ruta> rutas;
            switch(accion){
                case "ciudadListAll":
                    ciudades = AirlineModel.getCiudades();
                    json = gson.toJson(ciudades);
                    out.write(json);
                    break;
                case "viajeListPromo":
                    viajes = AirlineModel.getPromo();
                    json = gson.toJson(viajes);
                    out.write(json);
                        
                    break;
                case "viajeListSearch":
                    String origen = request.getParameter("origen");
                    String destino = request.getParameter("destino");
                    String fecha= request.getParameter("fecha");
                    String pasajeros= request.getParameter("pasajeros");
                    viajes = AirlineModel.getBusquedaViajes(origen,destino, fecha, pasajeros);
                    json = gson.toJson(viajes);
                    out.write(json);
                    break;
                case "viajeSearch":
                    String codigo = request.getParameter("codigo");
                    Viaje viaje = AirlineModel.getViaje(codigo);
                    json = gson.toJson(viaje);
                    out.write(json);
                    break;
                case "CompraAdd":
                    json = request.getParameter("compra");
                    Compra compra= gson.fromJson(json, Compra.class);
                    int numero;
                    numero=AirlineModel.registrarCompra(compra);
                    System.out.println(numero);
                    out.write(Integer.toString(numero));
                    break;
                case "TiqueteAdd":
                    json = request.getParameter("tiquete");
                    Tiquete tiquete= gson.fromJson(json, Tiquete.class);
                    json = request.getParameter("asiento");
                    int numero2;
                    numero2=AirlineModel.registrarTiquete(tiquete, json);
                    System.out.println(numero2);
                    out.write(Integer.toString(numero2));
                    break;
                    
                case "tiquetesSearch":
                    String codigo3 = request.getParameter("codigo");
                    tiquetes = AirlineModel.getBusquedaTiquetes(codigo3);
                    json = gson.toJson(tiquetes);
                    out.write(json);
                    break;
                case "tiquetesSearchById":
                    String codigo4 = request.getParameter("codigo");
                    tiquetes = AirlineModel.getBusquedaTiquetesById(codigo4);
                    json = gson.toJson(tiquetes);
                    out.write(json);
                    break;
                    /*
                case "AsientoAdd":
                    json = request.getParameter("tiquete");
                    Tiquete tiquete2= gson.fromJson(json, Tiquete.class);
                    json = request.getParameter("avion");
                    Avion avion2= gson.fromJson(json, Avion.class);
                    json = request.getParameter("asiento");
                    String asiento = json;
                    int numero3;
                    numero3=AirlineModel.registrarAsiento(tiquete2, avion2, asiento);
                    System.out.println(numero3);
                    out.write(1);
                    break;*/
                case "userLogin":
                    json = request.getParameter("user");
                    Usuario user= gson.fromJson(json, Usuario.class);
                    user=AirlineModel.userLogin(user);
                    if (user.getTipo()!=0){
                        request.getSession().setAttribute("user", user);
                        switch(user.getTipo()){
                            case 1: // client
                                client = AirlineModel.clientGet(user.getId());
                                request.getSession().setAttribute("client", client);
                                break;
                            case 2: // manager
                                break;
                        }
                    }
                    json = gson.toJson(user); 
               
                    out.write(json);
                    break;
                case "userLogout":
                        request.getSession().removeAttribute("user");
                        request.getSession().invalidate();
                    break;

                case "clientGet":
                    client = (Cliente)request.getSession().getAttribute("client");
                    json = gson.toJson(client); 
                    out.write(json);
                    break;
                case "UserAdd":
                    json = request.getParameter("usuario");
                    Usuario usuarioAdd= gson.fromJson(json, Usuario.class);
                    int inserted = AirlineModel.userAdd(usuarioAdd); 
                    out.write((inserted==1)?"0":"1");
                    break;
                case "ClientAdd":
                    json = request.getParameter("cliente");
                    Cliente clienteAdd= gson.fromJson(json, Cliente.class);
                    int inserted2 = AirlineModel.clientAdd(clienteAdd); 
                    out.write((inserted2==1)?"0":"1");
                    break;
                case "UserUpdate":
                    json = request.getParameter("usuario");
                    Usuario usuarioUpdate= gson.fromJson(json, Usuario.class);
                    int updated = AirlineModel.userUpdate(usuarioUpdate); 
                    out.write((updated==1)?"0":"1");
                    break;
                case "ClientUpdate":
                    json = request.getParameter("cliente");
                    Cliente clienteUpdate= gson.fromJson(json, Cliente.class);
                    int updated2 = AirlineModel.clientUpdate(clienteUpdate); 
                    out.write((updated2==1)?"0":"1");
                    break;
                case "asientosSearch":
                    json = request.getParameter("codigo");
                    List<Integer> array = AirlineModel.getAsientosNoDisponibles(json);
                    json = gson.toJson(array);
                    out.write(json);
                    break;
                case "AvionInsert":
                    json = request.getParameter("avion");
                    Avion AvionAdd= gson.fromJson(json, Avion.class);
                    out.write((AirlineModel.avionAdd(AvionAdd)==1)?"0":"1");
                    break;
                case "avionList":
                    aviones = AirlineModel.getAviones();
                    json = gson.toJson(aviones);
                    out.write(json);
                    break;
                case "AvionUpdate":
                    json = request.getParameter("avion");
                    Avion AvionUpdate= gson.fromJson(json, Avion.class);
                    out.write((AirlineModel.avionUpdate(AvionUpdate)==1)?"0":"1");
                    break;
                case "AvionDelete":
                    json = request.getParameter("avion");
                    Avion AvionDelete= gson.fromJson(json, Avion.class);
                    out.write((AirlineModel.avionDelete(AvionDelete)==1)?"0":"1");
                    break;
                case "CiudadInsert":
                    json = request.getParameter("ciudad");
                    Ciudad CiudadAdd= gson.fromJson(json, Ciudad.class);
                    out.write((AirlineModel.ciudadAdd(CiudadAdd)==1)?"0":"1");
                    break;
                case "CiudadUpdate":
                    json = request.getParameter("ciudad");
                    Ciudad CiudadUpdate= gson.fromJson(json, Ciudad.class);
                    out.write((AirlineModel.ciudadUpdate(CiudadUpdate)==1)?"0":"1");
                    break;
                case "CiudadDelete":
                    json = request.getParameter("ciudad");
                    Ciudad CiudadDelete= gson.fromJson(json, Ciudad.class);
                    out.write((AirlineModel.ciudadDelete(CiudadDelete)==1)?"0":"1");
                    break;
                case "rutaSeacrh":
                    rutas = AirlineModel.getRutas();
                    json = gson.toJson(rutas);
                    out.write(json);
                    break;
                case "RutaInsert":
                    json = request.getParameter("ruta");
                    Ruta RutaAdd= gson.fromJson(json, Ruta.class);
                    out.write((AirlineModel.rutaAdd(RutaAdd)==1)?"0":"1");
                    break;
                case "RutaDelete":
                    json = request.getParameter("ruta");
                    Ruta RutaDelete= gson.fromJson(json, Ruta.class);
                    out.write((AirlineModel.rutaDelete(RutaDelete)==1)?"0":"1");
                    break;
                case "RutaUpdate":
                    json = request.getParameter("ruta");
                    Ruta RutaUpdate= gson.fromJson(json, Ruta.class);
                    out.write((AirlineModel.rutaUpdate(RutaUpdate)==1)?"0":"1");
                    break;
                case "VueloInsert":
                    json = request.getParameter("vuelo");
                    Vuelo VueloAdd= gson.fromJson(json, Vuelo.class);
                    out.write((AirlineModel.vueloAdd(VueloAdd)==1)?"0":"1");
                    break;
                case "VueloUpdate":
                    json = request.getParameter("vuelo");
                    Vuelo VueloUpdate= gson.fromJson(json, Vuelo.class);
                    out.write((AirlineModel.vueloUpdate(VueloUpdate)==1)?"0":"1");
                    break;
                case "VueloDelete":
                    json = request.getParameter("vuelo");
                    Vuelo VueloDelete= gson.fromJson(json, Vuelo.class);
                    out.write((AirlineModel.vueloDelete(VueloDelete)==1)?"0":"1");
                    break;
                case "vueloSeacrh":
                    vuelos = AirlineModel.getVuelos();
                    json = gson.toJson(vuelos);
                    out.write(json);
                    break;
                    
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
            processRequest(request, response);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    /*
    @Override
    public void init() throws ServletException {
        super.init();
        model = new AirlineModel();
    }*/
}






