

CREATE DATABASE AirlineDatabase;
use AirlineDatabase;

create table usuarios (
  id varchar(20) not null,
  clave varchar(20),
  tipo integer,
  constraint pk_usuarios primary key(id)
);

create table clientes(
id varchar(12) not null,
nombre varchar(20),
apellido varchar(20),
correo_electronico varchar(40),
fecha_nacimiento varchar(20),
direccion varchar(120),
telefono_trabajo varchar(12),
celular varchar(12),
constraint pk_clientes primary key(id),
constraint fk_usuarios foreign key (id) references  usuarios (id)
);



/*
create table compras(
numero_compra integer not null auto_increment,
usuario varchar(12),
constraint pk_numero_compra primary key(numero_compra),
constraint fk_usuario foreign key(usuario) references usuarios(usuario)
);

create table ciudades(
codigo_ciudad varchar(12) not null,
nombre_ciudad varchar(20) not null,
pais varchar(20) not null,
zona_horarioa integer not null,
constraint pk_codigo_ciudad primary key(codigo_ciudad)
);

create table rutas(
numero_ruta integer not null,
origen varchar(12) not null,
destino varchar(12) not null,
duracion time,
constraint pk_numero_ruta primary key(numero_ruta),
constraint fk_origen foreign key(origen) references ciudades(codigo_ciudad),
constraint fk_destino foreign key(destino) references ciudades(codigo_ciudad),
constraint not_equals_origen_destino check(origen!=destino)
);

create table tipos_aviones(
codigo_avion integer not null,
annio year not null,
modelo varchar(20) not null,
marca varchar(20) not null,
cant_pasajeros integer not null,
cant_filas integer not null,
cant_asientos_fila integer not null,
constraint pk_codigo_avion primary key(codigo_avion),
constraint cant_pasajeros_check check((cant_filas*cant_asientos_fila)=cant_pasajeros)
);

create table aviones(
numero_avion integer not null,
tipo_avion integer not null,
constraint pk_numero_avion primary key(numero_avion),
constraint fk_tipo_avion foreign key(tipo_avion) references tipos_aviones(codigo_avion)
);

create table vuelos(
numero_vuelo integer not null,
dia varchar(1) not null,
hora time not null,
precio float not null,
ruta integer not null,
avion integer not null,
constraint pk_numero_vuelo primary key(numero_vuelo),
constraint fk_ruta foreign key(ruta) references rutas(numero_ruta),
constraint fk_avion foreign key(avion) references aviones(numero_avion)
);




create table viajes(
numero_viaje integer not null auto_increment,
vuelo integer not null,
dia_especifico date not null,
asientos_disponibles integer not null,
constraint pk_numero_viaje primary key(numero_viaje),
constraint fk_vuelo foreign key(vuelo) references vuelos(numero_vuelo)
);

create table tiquetes(
numero_tiquete integer not null auto_increment,
datos_persona varchar(200) not null,
compra integer not null,
viaje integer not null,
constraint pk_numero_tiquete primary key(numero_tiquete),
constraint fk_compra foreign key(compra) references compras(numero_compra),
constraint fk_viaje foreign key(viaje) references viajes(numero_viaje)
);

create table aviones_tiquetes(
tiquete integer not null,
avion integer not null,
numero_asiento integer not null,
constraint pk_tiquete_avion primary key(tiquete, avion),
constraint fk_tiquete_1 foreign key(tiquete) references tiquetes(numero_tiquete),
constraint fk_avion_2 foreign key(avion) references aviones(numero_avion)
);

*/


insert into usuarios (id,clave,tipo) values ('001','001', 1);
insert into usuarios (id,clave,tipo) values ('002','002', 2);

insert into clientes (id,nombre,apellido,correo_electronico,fecha_nacimiento,direccion,telefono_trabajo,celular) values ('001', 'Kerly','Gomez','k.e.r.l.y013@gmail.com','12/09/1998','Heredia','111-1111','7072-4345');
