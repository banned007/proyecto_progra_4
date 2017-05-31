package airline.model;

import airline.database.Database;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
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
    /*
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
    }*/
    /*
    private static Ruta toRuta(ResultSet rs) throws SQLException, Exception{
        Ruta obj= new Ruta();
        obj.setNumero(rs.getInt("numero_ruta"));
        obj.setOrigen(toCity(rs.getObject(2, Ciudad.class)));
        obj.setDestino(toCity(rs.getObject(3, Ciudad.class)));
        obj.setDuracion(rs.getFloat("duracion"));
        return obj;
    } */
	
	public static List<Vuelo> getPromo(){

		Vuelo[] promos = {
			new Vuelo("00001", new Horario("00001",new Ruta(00001, new Ciudad("SJO-", "San José", "Costa Rica"), new Ciudad("MIA-", "Miami", "USA"), (float) 1.30), "L", "08:30", 200), "24-04-2017", 50),
                        new Vuelo("00002", new Horario("00002",new Ruta(00002, new Ciudad("MIA-", "Miami", "USA"), new Ciudad("SJO-", "San José", "Costa Rica"), (float) 1.30), "M", "09:30", 300), "25-04-2017", 50),
                        new Vuelo("00003", new Horario("00003",new Ruta(00003, new Ciudad("GYA-", "Guayaquil", "Ecuador"), new Ciudad("BTA-", "Bogotá", "Colombia"), (float) 1.30), "J", "10:30", 400), "27-04-2017", 50),
                        new Vuelo("00004", new Horario("00004",new Ruta(00004, new Ciudad("BTA-", "Bogotá", "Colombia"), new Ciudad("GYA-", "Guayaquil", "Ecuador"), (float) 1.30), "V", "11:30", 500), "28-04-2017", 50)
		};
		return  new ArrayList(Arrays.asList(promos));
	}
        
        public static List<Vuelo> getVuelos(){
                Vuelo[] vuelos = {
//			new Vuelo("00001", new Horario("00001",new Ruta("00001", new Ciudad("SJO-", "San José", "Costa Rica", "GMT-6"), new Ciudad("MIA-", "Miami", "USA", "GMT-4"), 130), "L", "08:30", 200), "24-04-2017", 50),
//                        new Vuelo("00002", new Horario("00002",new Ruta("00002", new Ciudad("MIA-", "Miami", "USA", "GMT-4"), new Ciudad("SJO-", "San José", "Costa Rica", "GMT-6"), 130), "M", "09:30", 300), "25-04-2017", 50),
//                        new Vuelo("00003", new Horario("00003",new Ruta("00003", new Ciudad("GYA-", "Guayaquil", "Ecuador", "GMT-5"), new Ciudad("BTA-", "Bogotá", "Colombia", "UTC-5"), 130), "J", "10:30", 400), "27-04-2017", 50),
//                        new Vuelo("00004", new Horario("00004",new Ruta("00004", new Ciudad("BTA-", "Bogotá", "Colombia", "UTC-5"), new Ciudad("GYA-", "Guayaquil", "Ecuador", "GMT-5"), 130), "V", "11:30", 500), "28-04-2017", 50)
		};
		return  new ArrayList(Arrays.asList(vuelos));
        }
        
        public static List<Vuelo> getVuelos(String origen, String destino){
            ArrayList<Vuelo> result = new ArrayList();
            List<Vuelo> vuelos = AirlineModel.getVuelos();
            
            String or = origen.substring(0, 4);
            if(origen.substring(0, 1).equals("-"))
                or = "";
           
            String dest="";
            if(origen.length()>12)
                 dest = origen.substring(12);
            for(Vuelo v: vuelos){
                if(v.horario.ruta.origen.codigo.contains(or) && v.horario.ruta.destino.codigo.contains(dest)) 
                    result.add(v);
            }
            
            return result;
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



	
