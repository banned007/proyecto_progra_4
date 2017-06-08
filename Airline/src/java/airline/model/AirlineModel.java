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
    
    private static Ciudad toOrigen(ResultSet rs) throws Exception{
        Ciudad obj= new Ciudad();
        obj.setCodigo(rs.getString("codigo_ciudad_origen"));
        obj.setNombre(rs.getString("nombre_ciudad_origen"));
        obj.setPais(rs.getString("pais_origen"));
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
        obj.setOrigen(toOrigen(rs));
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
    
    public static int registrarCompra(Compra compra) throws SQLException{
        String sql="insert into compras "+
                    "(usuario, datos_compra, totalCompra) "+
                    "values('"+compra.getUsuario().getId()+"', '"+compra.getDatosCompra()+"', "+compra.getTotalCompra()+")";
            System.out.println(sql);
            ResultSet keys =airline.executeUpdateWithKeys(sql);
            keys.next();
            return keys.getInt(1);
       
           
    }
    public static int registrarTiquete(Tiquete tiquete, String asiento) throws SQLException{
        String sql="insert into tiquetes "+
                    "(datos_persona, compra, viaje) "+
                    "values('"+tiquete.getDatos_persona()+"', "+tiquete.getCompra().getNumero_compra()+", "+tiquete.getViaje().getNumero_viaje()+")";
            System.out.println(sql);
            ResultSet keys =airline.executeUpdateWithKeys(sql);
            keys.next();
            int v = registrarAsiento(keys.getInt(1), tiquete.getViaje().getVuelo().getAvion(), asiento);
        String sql2="update viajes set asientos_disponibles=asientos_disponibles-1 where viajes.numero_viaje="+tiquete.getViaje().getNumero_viaje();
        airline.executeUpdateWithKeys(sql2);
            return keys.getInt(1);
       
           
    }
    
    private static Compra toCompra(ResultSet rs) throws SQLException, Exception{
        Compra obj= new Compra();
        obj.setNumero_compra(rs.getInt("numero_compra"));
        obj.setUsuario(toUser(rs));
        obj.setDatosCompra(rs.getString("datos_compra"));
        obj.setTotalCompra(rs.getFloat("totalCompra"));
        return obj;
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
            String sql="select numero_viaje, vuelo, dia_especifico, asientos_disponibles, promocion, numero_vuelo, dia, hora, precio, ruta, avion, codigo_avion, annio, modelo, marca, cant_pasajeros, cant_filas, cant_asientos_fila, numero_ruta, origen, destino, duracion, ciudades.codigo_ciudad as codigo_ciudad_origen, ciudades.nombre_ciudad as nombre_ciudad_origen, ciudades.pais as pais_origen, c2.codigo_ciudad, c2.nombre_ciudad, c2.pais from viajes, vuelos, aviones, rutas, ciudades, ciudades as c2\n" +
"                    where viajes.vuelo=vuelos.numero_vuelo\n" +
"                    and vuelos.avion=codigo_avion\n" +
"                    and vuelos.ruta=rutas.numero_ruta\n" +
"                    and rutas.origen=ciudades.codigo_ciudad\n" +
"                    and rutas.destino=c2.codigo_ciudad\n" +
"                    and promocion=1";           
            ResultSet rs =  airline.executeQuery(sql);
            while (rs.next()) {
                viajes.add(toViaje(rs));
            }
        } catch (SQLException ex) {
            System.err.print(ex);
        }
       return viajes;
    }
    
    public static List<Viaje> getBusquedaViajes(String origen, String destino, String fecha, String pasajeros) throws Exception {
        List<Viaje> viajes;
        viajes= new ArrayList();
        try {
            String sql="select numero_viaje, vuelo, dia_especifico, asientos_disponibles, promocion, numero_vuelo, dia, hora, precio, ruta, avion, codigo_avion, annio, modelo, marca, cant_pasajeros, cant_filas, cant_asientos_fila, numero_ruta, origen, destino, duracion, ciudades.codigo_ciudad as codigo_ciudad_origen, ciudades.nombre_ciudad as nombre_ciudad_origen, ciudades.pais as pais_origen, c2.codigo_ciudad, c2.nombre_ciudad, c2.pais from viajes, vuelos, aviones, rutas, ciudades, ciudades as c2\n" +
"                    where viajes.vuelo=vuelos.numero_vuelo\n" +
"                    and vuelos.avion=codigo_avion\n" +
"                    and vuelos.ruta=rutas.numero_ruta\n" +
"                    and rutas.origen=ciudades.codigo_ciudad\n" +
"                    and rutas.destino=c2.codigo_ciudad\n" +
"                    and origen='%s'\n" +
"                    and destino='%s'\n"+ 
                    "and dia_especifico='%s' and asientos_disponibles>=%s";  
            System.out.println(sql);
            sql=String.format(sql, origen, destino, fecha, pasajeros);
            ResultSet rs =  airline.executeQuery(sql);
            while (rs.next()) {
                viajes.add(toViaje(rs));
            }
        } catch (SQLException ex) {
            System.err.print(ex);
        }
       return viajes;
    }
    
    public static Viaje getViaje(String codigo) throws Exception {
        Viaje viaje = new Viaje();
        
        try {
            String sql="select numero_viaje, vuelo, dia_especifico, asientos_disponibles, promocion, numero_vuelo, dia, hora, precio, ruta, avion, codigo_avion, annio, modelo, marca, cant_pasajeros, cant_filas, cant_asientos_fila, numero_ruta, origen, destino, duracion, ciudades.codigo_ciudad as codigo_ciudad_origen, ciudades.nombre_ciudad as nombre_ciudad_origen, ciudades.pais as pais_origen, c2.codigo_ciudad, c2.nombre_ciudad, c2.pais from viajes, vuelos, aviones, rutas, ciudades, ciudades as c2\n" +
"                    where viajes.vuelo=vuelos.numero_vuelo\n" +
"                    and vuelos.avion=codigo_avion\n" +
"                    and vuelos.ruta=rutas.numero_ruta\n" +
"                    and rutas.origen=ciudades.codigo_ciudad\n" +
"                    and rutas.destino=c2.codigo_ciudad\n" +
"                    and numero_viaje='%s'\n"; 
            System.out.println(sql);
            sql=String.format(sql, codigo);
            ResultSet rs =  airline.executeQuery(sql);
            while (rs.next()) {
                viaje =toViaje(rs);
            }
        } catch (SQLException ex) {
            System.err.print(ex);
        }
       return viaje;
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
    
    public static int registrarAsiento(int tiquete, Avion avion, String asiento) {
        int a;
        a = Integer.parseInt(asiento);
         String sql="insert into aviones_tiquetes "+
                    "(tiquete, avion, numero_asiento) "+
                    "values (%d,%d,%d)";
            sql=String.format(sql,tiquete,avion.getCodigo_avion(),a);
            return airline.executeUpdate(sql);
    }
    
    
    public static List<Integer> getAsientosNoDisponibles(String codigo){
        List<Integer> array;
        array = new ArrayList();
        int a;
        a = Integer.parseInt(codigo);
        try {
            String sql="select numero_asiento from aviones_tiquetes, tiquetes "
                    + "where aviones_tiquetes.tiquete = tiquetes.numero_tiquete "
                    + "and tiquetes.viaje="+a;  
            System.out.println(sql);
            ResultSet rs =  airline.executeQuery(sql);
            while (rs.next()) {
                array.add(rs.getInt("numero_asiento"));
            }
        } catch (SQLException ex) {
            System.err.print(ex);
        }
        System.out.println(array);
        return array;
    }
    
    public static List<Tiquete> getBusquedaTiquetes(String codigo) throws Exception {
        List<Tiquete> tiquetes;
        int a = Integer.parseInt(codigo);
        tiquetes= new ArrayList();
        try {
            String sql="select numero_tiquete, id, clave, tipo, datos_persona,numero_compra, datos_compra, totalCompra, numero_viaje, vuelo, dia_especifico, asientos_disponibles, promocion, numero_vuelo, dia, hora, precio, ruta, avion, codigo_avion, annio, modelo, marca, cant_pasajeros, cant_filas, cant_asientos_fila, numero_ruta, origen, destino, duracion, ciudades.codigo_ciudad as codigo_ciudad_origen, ciudades.nombre_ciudad as nombre_ciudad_origen, ciudades.pais as pais_origen, c2.codigo_ciudad, c2.nombre_ciudad, c2.pais from tiquetes, compras, usuarios, viajes, vuelos, aviones, rutas, ciudades, ciudades as c2\n" +
"                    where tiquetes.viaje = viajes.numero_viaje "
                    + "and tiquetes.compra = compras.numero_compra "
                    + "and compras.usuario = usuarios.id "
                    + "and viajes.vuelo=vuelos.numero_vuelo\n" +
"                    and vuelos.avion=codigo_avion\n" +
"                    and vuelos.ruta=rutas.numero_ruta\n" +
"                    and rutas.origen=ciudades.codigo_ciudad\n" +
"                    and rutas.destino=c2.codigo_ciudad\n" +
"                    and numero_compra="+a; 
            System.out.println(sql);
          
            ResultSet rs =  airline.executeQuery(sql);
            while (rs.next()) {
                tiquetes.add(toTiquete(rs));
            }
        } catch (SQLException ex) {
            System.err.print(ex);
        }
       return tiquetes;
    }
    
    public static List<Tiquete> getBusquedaTiquetesById(String codigo) throws Exception {
        List<Tiquete> tiquetes;
        int a = Integer.parseInt(codigo);
        tiquetes= new ArrayList();
        try {
            String sql="select numero_tiquete, id, clave, tipo, datos_persona,numero_compra, datos_compra, totalCompra, numero_viaje, vuelo, dia_especifico, asientos_disponibles, promocion, numero_vuelo, dia, hora, precio, ruta, avion, codigo_avion, annio, modelo, marca, cant_pasajeros, cant_filas, cant_asientos_fila, numero_ruta, origen, destino, duracion, ciudades.codigo_ciudad as codigo_ciudad_origen, ciudades.nombre_ciudad as nombre_ciudad_origen, ciudades.pais as pais_origen, c2.codigo_ciudad, c2.nombre_ciudad, c2.pais from tiquetes, compras, usuarios, viajes, vuelos, aviones, rutas, ciudades, ciudades as c2\n" +
"                    where tiquetes.viaje = viajes.numero_viaje "
                    + "and tiquetes.compra = compras.numero_compra "
                    + "and compras.usuario = usuarios.id "
                    + "and viajes.vuelo=vuelos.numero_vuelo\n" +
"                    and vuelos.avion=codigo_avion\n" +
"                    and vuelos.ruta=rutas.numero_ruta\n" +
"                    and rutas.origen=ciudades.codigo_ciudad\n" +
"                    and rutas.destino=c2.codigo_ciudad\n" +
"                    and id="+a; 
            System.out.println(sql);
          
            ResultSet rs =  airline.executeQuery(sql);
            while (rs.next()) {
                tiquetes.add(toTiquete(rs));
            }
        } catch (SQLException ex) {
            System.err.print(ex);
        }
       return tiquetes;
    }
    

    private static Tiquete toTiquete(ResultSet rs) throws SQLException, Exception {
        Tiquete obj= new Tiquete();
        obj.setNumero_tiquete(rs.getInt("numero_tiquete"));
        obj.setDatos_persona(rs.getString("datos_persona"));
        obj.setCompra(toCompra(rs));
        obj.setViaje(toViaje(rs));
        return obj;
    }
    
    
    public static int avionAdd(Avion avion) {
        String sql = "insert into aviones "
                + "(codigo_avion, annio, modelo, marca, cant_pasajeros, cant_filas, cant_asientos_fila) "
                + "values (%d,'%s','%s','%s',%d, %d, %d)";
        sql = String.format(sql, avion.getCodigo_avion(), avion.getAnnio(), avion.getModelo(), avion.getMarca(), avion.getCant_pasajeros(), avion.getCant_filas(), avion.getCant_asientos_fila());
        return airline.executeUpdate(sql);
    }
 
    public static int avionUpdate(Avion avion)
    {
        String sql = "update aviones "
                + " set annio = \""+avion.annio+"\", modelo = \""+avion.modelo+"\", marca = \""+avion.marca+"\", cant_pasajeros = "+Integer.toString(avion.cant_pasajeros)+", cant_filas = "+Integer.toString(avion.cant_filas)+", cant_asientos_fila = "+Integer.toString(avion.cant_asientos_fila)
                + " where codigo_avion = "+Integer.toString(avion.codigo_avion);
        int i=airline.executeUpdate(sql);
        return i;
    }
    
    public static int avionDelete(Avion avion)
    {
        String sql = "delete from aviones "
                + "where codigo_avion = "+Integer.toString(avion.codigo_avion);
        int i = airline.executeUpdate(sql);
        return i;
    }
   
}



	
