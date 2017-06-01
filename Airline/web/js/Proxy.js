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

Proxy.vuelosSearch = function(origen, destino, callBack){
	var AJAX_req = new XMLHttpRequest();
	url = "/Airline/AirlineService?action=vueloListSearch";
	AJAX_req.open("POST", url, true);
	AJAX_req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	AJAX_req.onreadystatechange = function(){
		if(AJAX_req.readyState === 4 && AJAX_req.status === 200){
			var object = JSON.parse(AJAX_req.responseText, JsonUtils.revive);
                        console.log(object);
			callBack(object);
		}
	}
	AJAX_req.send("origen="+origen+"destino="+destino);
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
