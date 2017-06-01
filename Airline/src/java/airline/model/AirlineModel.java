package airline.model;

import airline.database.Database;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AirlineModel {
    static Database airline;
    
    static {
        initAirline();
    }
    private static void initAirline(){
       airline= new Database(null, null, null);        
    }

 
   public static Usuario userLogin(Usuario usuario) throws Exception{
        try {
            String sql="select * from "+
                    "usuarios  u  "+
                    "where u.id = '%s' and u.clave='%s'";
            sql=String.format(sql,usuario.id,usuario.clave);
            
            ResultSet rs =  airline.executeQuery(sql);
            if (rs.next()) {
                return toUser(rs);
            }
            else{
                return new Usuario(usuario.id,usuario.clave,0);
            }
        } catch (SQLException ex) {
        }
        return null;
   }
 private static Usuario toUser(ResultSet rs) throws Exception{
        Usuario obj= new Usuario();
        obj.setId(rs.getString("id"));
        obj.setClave(rs.getString("clave"));
        obj.setTipo(rs.getInt("tipo"));
        return obj;
    }
 
 public static Cliente clientGet(String id) throws Exception{
    String sql="select * from "+
            "clientes  c  "+
            "where c.id = '%s'";
    sql=String.format(sql,id);

    ResultSet rs =  airline.executeQuery(sql);
    if (rs.next()) {
        return toClient(rs);
    }
    else{
        throw new Exception("Cliente no existe");
    }
}
 private static Cliente toClient(ResultSet rs) throws Exception{
        Cliente obj= new Cliente();
        obj.setId(rs.getString("id"));
        obj.setNombre(rs.getString("nombre"));
        obj.setCorreo_electronico(rs.getString("correo_electronico"));
        obj.setDireccion(rs.getString("direccion"));
        obj.setTelefono_trabajo(rs.getString("telefono_trabajo"));
        obj.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
        obj.setApellido(rs.getString("apellido"));
        obj.setCelular(rs.getString("celular"));
        return obj;
    }



    public static List<Ciudad> getCiudades() throws Exception{
        List<Ciudad> ciudades;
       ciudades= new ArrayList();
        try {
            String sql="select * from "+
                    "ciudades";
            ResultSet rs =  airline.executeQuery(sql);
            while (rs.next()) {
                ciudades.add(toCity(rs));
            }
        } catch (SQLException ex) {
        }
       return ciudades;
    }
    
    private static Ciudad toCity(ResultSet rs) throws Exception{
        Ciudad obj= new Ciudad();
        obj.setCodigo(rs.getString("codigo_ciudad"));
        obj.setNombre(rs.getString("nombre_ciudad"));
        obj.setPais(rs.getString("pais"));
        return obj;
    }
    
    public static List<Ruta> getRutas() throws Exception {
        List<Ruta> rutas;
       rutas= new ArrayList();
        try {
            String sql="select * from "+
                    "rutas";
            ResultSet rs =  airline.executeQuery(sql);
            while (rs.next()) {
                rutas.add(toRuta(rs));
            }
        } catch (SQLException ex) {
        }
       return rutas;
    }
    
    private static Ruta toRuta(ResultSet rs) throws SQLException, Exception{
        Ruta obj= new Ruta();
        obj.setNumero(rs.getInt("numero_ruta"));
        obj.setOrigen(toCity(rs));
        obj.setDestino(toCity(rs));
        obj.setDuracion(rs.getFloat("duracion"));
        return obj;
    }
    
    public static List<Vuelo> getVuelos() throws Exception {
        List<Vuelo> vuelos;
       vuelos= new ArrayList();
        try {
            String sql="select * from "+
                    "vuelos";
            ResultSet rs =  airline.executeQuery(sql);
            while (rs.next()) {
                vuelos.add(toVuelo(rs));
            }
        } catch (SQLException ex) {
        }
       return vuelos;
    }
    
    private static Vuelo toVuelo(ResultSet rs) throws SQLException, Exception{
        Vuelo obj= new Vuelo();
        System.out.print(rs.getInt(1));
        System.out.print(rs.getString(2));
        System.out.print(rs.getString(3));
        System.out.print(rs.getFloat(4));
        System.out.print(toRuta(rs));
        System.out.println(rs.getInt("numero_vuelo"));
        obj.setNumero_vuelo(rs.getInt(1));
        obj.setDia(rs.getString("dia"));
        obj.setHora(rs.getString("hora"));
        obj.setPrecio(rs.getFloat("precio"));
        obj.setRuta(toRuta(rs));
        obj.setAvion(toAvion(rs));
        return obj;
    }
    
    public static List<Viaje> getViajes() throws Exception {
        List<Viaje> viajes;
        viajes= new ArrayList();
        try {
            String sql="select * from "+
                    "viajes";
            ResultSet rs =  airline.executeQuery(sql);
            while (rs.next()) {
                viajes.add(toViaje(rs));
            }
        } catch (SQLException ex) {
        }
       return viajes;
    }
    public static List<Viaje> getPromo() throws Exception {
        List<Viaje> viajes;
        viajes= new ArrayList();
        try {
            String sql="select * from viajes v "
                    + "inner join vuelos vu on v.vuelo=vu.numero_vuelo";
            ResultSet rs =  airline.executeQuery(sql);
            System.out.print(rs);
            System.out.println("uuu");
            while (rs.next()) {
                viajes.add(toViaje(rs));
            }
        } catch (SQLException ex) {
            System.err.print(ex);
        }
       return viajes;
    }
    
    private static Viaje toViaje(ResultSet rs) throws SQLException, Exception{
        Viaje obj= new Viaje();
        obj.setNumero_viaje(rs.getInt("numero_viaje"));
        obj.setVuelo(toVuelo(rs));
        obj.setDia_especifico(rs.getDate("dia_especifico"));
        obj.setAsientos_disponibles(rs.getInt("asientos_disponibles"));
        obj.setPromocion(rs.getInt("promocion"));
        return obj;
    }
    
    public static List<Avion> getAviones() throws Exception {
        List<Avion> aviones;
        aviones= new ArrayList();
        try {
            String sql="select * from "+
                    "aviones";
            ResultSet rs =  airline.executeQuery(sql);
            while (rs.next()) {
                aviones.add(toAvion(rs));
            }
        } catch (SQLException ex) {
        }
       return aviones;
    }
    
    private static Avion toAvion(ResultSet rs) throws SQLException, Exception{
        Avion obj= new Avion();
        obj.setCodigo_avion(rs.getInt("codigo_avion"));
        obj.setAnnio(rs.getString("annio"));
        obj.setModelo(rs.getString("modelo"));
        obj.setMarca(rs.getString("marca"));
        obj.setCant_pasajeros(rs.getInt("cant_pasajeros"));
        obj.setCant_filas(rs.getInt("cant_filas"));
        obj.setCant_asientos_fila(rs.getInt("cant_asientos_fila"));
        return obj;
    }
	

        
        

    public static int userAdd(Usuario usuario) {
         String sql="insert into usuarios "+
                    "(id, clave, tipo) "+
                    "values ('%s','%s',%d)";
            sql=String.format(sql,usuario.getId(),usuario.getClave(),usuario.getTipo());
            return airline.executeUpdate(sql);
    }

    public static int clientAdd(Cliente cliente) {
         String sql="insert into clientes "+
                    "(id,nombre,apellido, correo_electronico,fecha_nacimiento,direccion,telefono_trabajo,celular) "+
                    "values ('%s','%s','%s','%s','%s','%s','%s','%s')";
            sql=String.format(sql,cliente.getId(),cliente.getNombre(),cliente.getApellido(), cliente.getCorreo_electronico(), cliente.getFecha_nacimiento(), cliente.getDireccion(), cliente.getTelefono_trabajo(), cliente.getCelular());
            return airline.executeUpdate(sql);
    }

    public static int userUpdate(Usuario usuario) {
        String sql="update usuarios "+
                    "set clave='%s'"+
                    "where id='%s'";
            sql=String.format(sql,usuario.getClave(),usuario.getId());
            return airline.executeUpdate(sql);
    }

    public static int clientUpdate(Cliente cliente) {
        String sql="update clientes "+
                    "set nombre='%s',apellido='%s', correo_electronico='%s',fecha_nacimiento='%s',direccion='%s',telefono_trabajo='%s',celular='%s'"+
                    "where id='%s'";
            sql=String.format(sql,cliente.getNombre(),cliente.getApellido(), cliente.getCorreo_electronico(), cliente.getFecha_nacimiento(), cliente.getDireccion(), cliente.getTelefono_trabajo(), cliente.getCelular(),cliente.getId());
            return airline.executeUpdate(sql);
    }
   
}



	
