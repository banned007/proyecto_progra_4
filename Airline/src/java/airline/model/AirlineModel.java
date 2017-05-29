package airline.model;

import airline.database.Database;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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



    public static List<Ciudad> getCiudades(){
		Ciudad[] ciudades = {
			new Ciudad("SJO-", "San José", "Costa Rica", "GMT-6"),
			new Ciudad("MIA-", "Miami", "USA", "GMT-4"),
			new Ciudad("GYA-", "Guayaquil", "Ecuador", "GMT-5"),
			new Ciudad("BTA-", "Bogotá", "Colombia", "UTC-5")
		};
		return  new ArrayList(Arrays.asList(ciudades));
	}
	
	public static List<Vuelo> getPromo(){

		Vuelo[] promos = {
			new Vuelo("00001", new Horario("00001",new Ruta("00001", new Ciudad("SJO-", "San José", "Costa Rica", "GMT-6"), new Ciudad("MIA-", "Miami", "USA", "GMT-4"), 130), "L", "08:30", 200), "24-04-2017", 50),
                        new Vuelo("00002", new Horario("00002",new Ruta("00002", new Ciudad("MIA-", "Miami", "USA", "GMT-4"), new Ciudad("SJO-", "San José", "Costa Rica", "GMT-6"), 130), "M", "09:30", 300), "25-04-2017", 50),
                        new Vuelo("00003", new Horario("00003",new Ruta("00003", new Ciudad("GYA-", "Guayaquil", "Ecuador", "GMT-5"), new Ciudad("BTA-", "Bogotá", "Colombia", "UTC-5"), 130), "J", "10:30", 400), "27-04-2017", 50),
                        new Vuelo("00004", new Horario("00004",new Ruta("00004", new Ciudad("BTA-", "Bogotá", "Colombia", "UTC-5"), new Ciudad("GYA-", "Guayaquil", "Ecuador", "GMT-5"), 130), "V", "11:30", 500), "28-04-2017", 50)
		};
		return  new ArrayList(Arrays.asList(promos));
	}
        
        public static List<Vuelo> getVuelos(){
                Vuelo[] vuelos = {
			new Vuelo("00001", new Horario("00001",new Ruta("00001", new Ciudad("SJO-", "San José", "Costa Rica", "GMT-6"), new Ciudad("MIA-", "Miami", "USA", "GMT-4"), 130), "L", "08:30", 200), "24-04-2017", 50),
                        new Vuelo("00002", new Horario("00002",new Ruta("00002", new Ciudad("MIA-", "Miami", "USA", "GMT-4"), new Ciudad("SJO-", "San José", "Costa Rica", "GMT-6"), 130), "M", "09:30", 300), "25-04-2017", 50),
                        new Vuelo("00003", new Horario("00003",new Ruta("00003", new Ciudad("GYA-", "Guayaquil", "Ecuador", "GMT-5"), new Ciudad("BTA-", "Bogotá", "Colombia", "UTC-5"), 130), "J", "10:30", 400), "27-04-2017", 50),
                        new Vuelo("00004", new Horario("00004",new Ruta("00004", new Ciudad("BTA-", "Bogotá", "Colombia", "UTC-5"), new Ciudad("GYA-", "Guayaquil", "Ecuador", "GMT-5"), 130), "V", "11:30", 500), "28-04-2017", 50)
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
   
}



	
