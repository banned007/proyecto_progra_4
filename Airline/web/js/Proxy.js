var Proxy = Proxy || {};

Proxy.getCiudades = function(callBack){
	var AJAX_req = new XMLHttpRequest();
	url = "/Airline/AirlineService?action=ciudadListAll";
        console.log(1);
        
	AJAX_req.open("GET", url, true);
        console.log(2);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        console.log(3);
	AJAX_req.onreadystatechange = function(){
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
			var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
                        
                        callBack(object);
		}
	};
        console.log(4);
	AJAX_req.send();
};

Proxy.getPromo = function(callBack){
	var AJAX_req = new XMLHttpRequest();
	url = "/Airline/AirlineService?action=viajeListPromo";
	AJAX_req.open("GET", url, true);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	AJAX_req.onreadystatechange = function(){
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
			var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
                        
			callBack(object);
		}
	}
	AJAX_req.send();
};

Proxy.viajesSearch = function(origen, destino, fecha, pasajeros, callBack){
	var AJAX_req = new XMLHttpRequest();
	url = "/Airline/AirlineService?action=viajeListSearch";
	AJAX_req.open("POST", url, true);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	AJAX_req.onreadystatechange = function(){
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
			var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
                        console.log(object);
			callBack(object);
		}
	}
	AJAX_req.send("origen="+origen+"&destino="+destino+"&fecha="+fecha+"&pasajeros="+pasajeros);
};

Proxy.getViaje = function (codigo, callBack){
	var AJAX_req = new XMLHttpRequest();
	url = "/Airline/AirlineService?action=viajeSearch";
	AJAX_req.open("POST", url, true);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	AJAX_req.onreadystatechange = function(){
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
			var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
                        console.log(object);
			callBack(object);
		}
	}
	AJAX_req.send("codigo="+codigo);
};


Proxy.userLogin = function(user,callBack){
    jsonText = JSON.stringify(user,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    url="/Airline/AirlineService?action=userLogin";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
            console.log(jsonText);
            var object = JSON.parse( jsonText,JsonUtils.revive );
            callBack(object);
        }
    };
    AJAX_req.send("user="+jsonText);   
};

Proxy.userLogout = function(callBack){
    var AJAX_req = new XMLHttpRequest();
    url="/Airline/AirlineService?action=userLogout";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            callBack();
        }
    };
    AJAX_req.send();   
};

Proxy.userAdd = function(usuario,callBack){
    var jsonUsuario = JSON.stringify(usuario,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    console.log(jsonUsuario); 
 
    url="/Airline/AirlineService?action=UserAdd";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");      
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 )
                callBack(parseInt(AJAX_req.responseText));     
    };
    AJAX_req.send("usuario="+jsonUsuario); 
};

Proxy.compraAdd = function(compra, callBack){
    var jsonCompra = JSON.stringify(compra,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    console.log(jsonCompra); 
 
    url="/Airline/AirlineService?action=CompraAdd";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");      
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            callBack(parseInt(AJAX_req.responseText)); 
        }
    };
    AJAX_req.send("compra="+jsonCompra);
};

Proxy.tiqueteAdd = function(tiquete,asiento, callBack){
    var jsonTiquete = JSON.stringify(tiquete,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    console.log(jsonTiquete); 
 
    url="/Airline/AirlineService?action=TiqueteAdd";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");      
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            callBack(parseInt(AJAX_req.responseText)); 
        }
    };
    AJAX_req.send("tiquete="+jsonTiquete+"&asiento="+asiento);
};

Proxy.getTiquetes = function(codigo,callBack){
	var AJAX_req = new XMLHttpRequest();
	url = "/Airline/AirlineService?action=tiquetesSearch";
	AJAX_req.open("POST", url, true);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	AJAX_req.onreadystatechange = function(){
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
			var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
                        console.log(codigo);
                        console.log(object);
			callBack(object);
		}
	}
	AJAX_req.send("codigo="+codigo);
};

Proxy.getTiquetesById = function(codigo,callBack){
	var AJAX_req = new XMLHttpRequest();
	url = "/Airline/AirlineService?action=tiquetesSearchById";
	AJAX_req.open("POST", url, true);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	AJAX_req.onreadystatechange = function(){
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
			var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
                        console.log(codigo);
                        console.log(object);
			callBack(object);
		}
	}
	AJAX_req.send("codigo="+codigo);
};

Proxy.getAsientosNoDisponibles = function(codigo, callBack){
    var AJAX_req = new XMLHttpRequest();
	url = "/Airline/AirlineService?action=asientosSearch";
	AJAX_req.open("POST", url, true);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	AJAX_req.onreadystatechange = function(){
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
			var object = JSON.parse(AJAX_req.responseText);   
                        console.log(object);
			callBack(object);
		}
	};
	AJAX_req.send("codigo="+codigo);
};

Proxy.asientoAdd = function(tiquete, avion, asiento, callBack){
    var jsonTiquete = JSON.stringify(tiquete,JsonUtils.replacer);
    var jsonAvion = JSON.stringify(avion,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();

 
    url="/Airline/AirlineService?action=AsientoAdd";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");      
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            callBack(parseInt(AJAX_req.responseText)); 
        }
    };
    AJAX_req.send("tiquete="+jsonTiquete+"&avion="+jsonAvion+"&asiento="+asiento);
};


Proxy.clientAdd = function(cliente,callBack){
    var jsonCliente = JSON.stringify(cliente,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    console.log(jsonCliente);
    url="/Airline/AirlineService?action=ClientAdd";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");      
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 )
                callBack(parseInt(AJAX_req.responseText)); 
        
        
    };
    AJAX_req.send("cliente="+jsonCliente); 
};


Proxy.userUpdate = function(usuario,callBack){
    var jsonUsuario = JSON.stringify(usuario,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    console.log(jsonUsuario); 
 
    url="/Airline/AirlineService?action=UserUpdate";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");      
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 )
                callBack(parseInt(AJAX_req.responseText));     
    };
    AJAX_req.send("usuario="+jsonUsuario); 
};

Proxy.clientUpdate = function(cliente,callBack){
    var jsonCliente = JSON.stringify(cliente,JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    console.log(jsonCliente);
    url="/Airline/AirlineService?action=ClientUpdate";
    AJAX_req.open( "POST", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");      
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 )
                callBack(parseInt(AJAX_req.responseText)); 
        
        
    };
    AJAX_req.send("cliente="+jsonCliente); 
};

Proxy.avionAdd = function(avion, callBack){
    var jsonAvion = JSON.stringify(avion, JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    
    console.log(jsonAvion);
    url="/Airline/AirlineService?action=AvionInsert";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if(AJAX_req.readyState===4 && AJAX_req.status === 200)
            callBack(parseInt(AJAX_req.responseText));
    };
    AJAX_req.send("avion="+jsonAvion);
};

Proxy.avionSearch = function (callBack)
{
    var AJAX_req = new XMLHttpRequest();
    url = "/Airline/AirlineService?action=avionList";
    AJAX_req.open("GET", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function () {
        if (AJAX_req.readyState === 4 && AJAX_req.status === 200) {
            var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
            callBack(object);
        }
    };
    AJAX_req.send();
};

Proxy.avionUpdate = function(avion, callBack)
{
    var jsonAvion = JSON.stringify(avion, JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    
    console.log(jsonAvion);
    url="/Airline/AirlineService?action=AvionUpdate";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if(AJAX_req.readyState===4 && AJAX_req.status === 200)
            callBack(parseInt(AJAX_req.responseText));
    };
    AJAX_req.send("avion="+jsonAvion);
};

Proxy.avionDelete = function(avion, callBack)
{
    var jsonAvion = JSON.stringify(avion, JsonUtils.replacer);
    var AJAX_req = new XMLHttpRequest();
    
    console.log(jsonAvion);
    url="/Airline/AirlineService?action=AvionDelete";
    AJAX_req.open("POST", url, true);
    AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    AJAX_req.onreadystatechange = function(){
        if(AJAX_req.readyState===4 && AJAX_req.status === 200)
            callBack(parseInt(AJAX_req.responseText));
    };
    AJAX_req.send("avion="+jsonAvion);
};
