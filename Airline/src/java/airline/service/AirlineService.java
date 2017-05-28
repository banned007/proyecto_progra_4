/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.service;

import airline.model.AirlineModel;
import airline.model.Ciudad;
import airline.model.Cliente;
import airline.model.Horario;
import airline.model.Jsonable;
import airline.model.Ruta;
import airline.model.Usuario;
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
                    .registerSubtype(Horario.class,"Horario")
                    .registerSubtype(Vuelo.class,"Vuelo")
                    .registerSubtype(Usuario.class,"Usuario")
                    .registerSubtype(Cliente.class,"Cliente");
            Gson gson = new GsonBuilder().registerTypeAdapterFactory(rta).setDateFormat("dd/MM/yyyy").create();
            String json;
            String accion = request.getParameter("action");
            System.out.println(accion);
            List<Ciudad> ciudades;
            List<Vuelo> vuelos;
            Cliente client;
            switch(accion){
                case "ciudadListAll":
                    ciudades = AirlineModel.getCiudades();
                    json = gson.toJson(ciudades);
                    out.write(json);
                    break;
                case "vueloListPromo":
                    vuelos = AirlineModel.getPromo();
                    json = gson.toJson(vuelos);
                    out.write(json);
                    break;
                case "vueloListSearch":
                    String origen = request.getParameter("origen");
                    String destino = request.getParameter("destino");
                    vuelos = AirlineModel.getVuelos(origen,destino);
                    json = gson.toJson(vuelos);
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
                                client = new Cliente("001", "Kerly","Gomez","k.e.r.l.y013@gmail.com","12/09/1998","Heredia","111-1111","7072-4345");
                                        //AirlineModel.clientGet(user.getId());
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






