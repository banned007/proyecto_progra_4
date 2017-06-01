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
import airline.model.Horario;
import airline.model.Jsonable;
import airline.model.Ruta;
import airline.model.Usuario;
import airline.model.Viaje;
import airline.model.Vuelo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.typeadapters.RuntimeTypeAdapterFactory;
import java.io.IOException;
import java.io.PrintWriter;
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
                    .registerSubtype(Avion.class,"Avion");
            Gson gson = new GsonBuilder().registerTypeAdapterFactory(rta).setDateFormat("dd/MM/yyyy").create();
            String json;
            String accion = request.getParameter("action");
            System.out.println(accion);
            List<Ciudad> ciudades;
            List<Vuelo> vuelos;
            List<Viaje> viajes;
            Cliente client;
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
                    viajes = AirlineModel.getBusquedaViajes(origen,destino, fecha);
                    json = gson.toJson(viajes);
                    out.write(json);
                    break;
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






