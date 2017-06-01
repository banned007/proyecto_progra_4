var JsonUtils = JsonUtils || {};

JsonUtils.revive = function (k, v){
	if(v instanceof Object && v._class == 'Ciudad'){
		return new Ciudad(v.codigo, v.nombre, v.pais, v.zona);
	}
	if(v instanceof Object && v._class == 'Ruta'){
		return new Ruta(v.numero, v.origen, v.destino, v.duracion);
	}
	if(v instanceof Object && v._class == 'Vuelo'){
		return new Vuelo(v.numero_vuelo, v.dia, v.hora, v.precio, v.ruta, v.avion);
	}
        if(v instanceof Object && v._class == 'Viaje'){
		return new Viaje(v.numero_viaje, v.vuelo, v.dia_especifico, v.asientos_disponibles, v.promocion);
	}
        if(v instanceof Object && v._class == 'Avion'){
		return new Avion(v.codigo_avion, v.annio, v.modelo, v.marca, v.cant_pasajeros, v.cant_filas, v.cant_asientos_fila);
	}
        
        if (v instanceof Object && v._class == 'Usuario') {
		return new Usuario(v.id,v.clave,v.tipo);
	}    
	if (v instanceof Object && v._class == 'Cliente') {
		return new Cliente(v.id,v.nombre,v.apellido, v.correo_electronico,v.fecha_nacimiento,v.direccion,v.telefono_trabajo,v.celular);
	} 
       return v;
}

JsonUtils.replacer = function (k, v){
	if (v instanceof Ciudad){
		v._class="Ciudad";
	}
	if (v instanceof Ruta){
		v._class="Ruta";
	}
	if (v instanceof Viaje){
		v._class="Viaje";
	}
        if (v instanceof Vuelo){
		v._class="Vuelo";
	}
        if (v instanceof Usuario) {
		v._class = "Usuario";
	}
	if (v instanceof Cliente) {
		v._class = "Cliente";
	}
        if (v instanceof Avion) {
		v._class = "Avion";
	}
	return v;
}

