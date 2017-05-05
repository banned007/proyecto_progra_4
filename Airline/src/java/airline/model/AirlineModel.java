package airline.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AirlineModel {
	public List<Ciudad> getCiudades(){
		Ciudad[] ciudades = {
			new Ciudad("SJO-", "San José", "Costa Rica", "GMT-6"),
			new Ciudad("MIA-", "Miami", "USA", "GMT-4"),
			new Ciudad("GYA-", "Guayaquil", "Ecuador", "GMT-5"),
			new Ciudad("BTA-", "Bogotá", "Colombia", "UTC-5")
		};
		return  new ArrayList(Arrays.asList(ciudades));
	}
	
	public List<Vuelo> getPromo(){

		Vuelo[] promos = {
			new Vuelo("00001", new Horario("00001",new Ruta("00001", new Ciudad("SJO-", "San José", "Costa Rica", "GMT-6"), new Ciudad("MIA-", "Miami", "USA", "GMT-4"), 130), "L", "08:30", 200), "24-04-2017", 50),
                        new Vuelo("00002", new Horario("00002",new Ruta("00002", new Ciudad("MIA-", "Miami", "USA", "GMT-4"), new Ciudad("SJO-", "San José", "Costa Rica", "GMT-6"), 130), "M", "09:30", 300), "25-04-2017", 50),
                        new Vuelo("00003", new Horario("00003",new Ruta("00003", new Ciudad("GYA-", "Guayaquil", "Ecuador", "GMT-5"), new Ciudad("BTA-", "Bogotá", "Colombia", "UTC-5"), 130), "J", "10:30", 400), "27-04-2017", 50),
                        new Vuelo("00004", new Horario("00004",new Ruta("00004", new Ciudad("BTA-", "Bogotá", "Colombia", "UTC-5"), new Ciudad("GYA-", "Guayaquil", "Ecuador", "GMT-5"), 130), "V", "11:30", 500), "28-04-2017", 50)
		};
		return  new ArrayList(Arrays.asList(promos));
	}
        
        public List<Vuelo> getVuelos(){
                Vuelo[] vuelos = {
			new Vuelo("00001", new Horario("00001",new Ruta("00001", new Ciudad("SJO-", "San José", "Costa Rica", "GMT-6"), new Ciudad("MIA-", "Miami", "USA", "GMT-4"), 130), "L", "08:30", 200), "24-04-2017", 50),
                        new Vuelo("00002", new Horario("00002",new Ruta("00002", new Ciudad("MIA-", "Miami", "USA", "GMT-4"), new Ciudad("SJO-", "San José", "Costa Rica", "GMT-6"), 130), "M", "09:30", 300), "25-04-2017", 50),
                        new Vuelo("00003", new Horario("00003",new Ruta("00003", new Ciudad("GYA-", "Guayaquil", "Ecuador", "GMT-5"), new Ciudad("BTA-", "Bogotá", "Colombia", "UTC-5"), 130), "J", "10:30", 400), "27-04-2017", 50),
                        new Vuelo("00004", new Horario("00004",new Ruta("00004", new Ciudad("BTA-", "Bogotá", "Colombia", "UTC-5"), new Ciudad("GYA-", "Guayaquil", "Ecuador", "GMT-5"), 130), "V", "11:30", 500), "28-04-2017", 50)
		};
		return  new ArrayList(Arrays.asList(vuelos));
        }
        
        public List<Vuelo> getVuelos(String origen, String destino){
            ArrayList<Vuelo> result = new ArrayList();
            for(Vuelo v: this.getVuelos()){
                if(v.horario.ruta.origen.codigo.contains(origen) && v.horario.ruta.destino.codigo.contains(destino)) 
                    result.add(v);
            }
            return result;
        }
}