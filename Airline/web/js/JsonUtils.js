var JsonUtils = JsonUtils || {};

JsonUtils.revive = function (k, v){
	if(v instanceof Object && v._class == 'Ciudad'){
		return new Ciudad(v.codigo, v.nombre, v.pais, v.zona);
	}
	if(v instanceof Object && v._class == 'Ruta'){
		return new Ruta(v.numero, v.origen, v.destino, v.duracion);
	}
	if(v instanceof Object && v._class == 'Horario'){
		return new Horario(v.numero, v.ruta, v.dia, v.hora, v.precio);
	}
	if(v instanceof Object && v._class == 'Vuelo'){
		return new Vuelo(v.numero, v.horario, v.dia, v.asientosDisp);
	}
}

JsonUtils.replacer = function (k, v){
	if (v instanceof Ciudad){
		v._class="Ciudad";
	}
	if (v instanceof Ruta){
		v._class="Ruta";
	}
	if (v instanceof Horario){
		v._class="Horario";
	}
        if (v instanceof Vuelo){
		v._class="Vuelo";
	}
	return v;
}

