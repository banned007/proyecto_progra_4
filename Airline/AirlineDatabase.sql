

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
*/


create table ciudades(
codigo_ciudad varchar(12) not null,
nombre_ciudad varchar(20) not null,
pais varchar(20) not null,
constraint pk_codigo_ciudad primary key(codigo_ciudad)
);

drop table rutas;

create table rutas(
numero_ruta integer not null,
origen varchar(12) not null,
destino varchar(12) not null,
duracion float,
constraint pk_numero_ruta primary key(numero_ruta),
constraint fk_origen foreign key(origen) references ciudades(codigo_ciudad),
constraint fk_destino foreign key(destino) references ciudades(codigo_ciudad),
constraint not_equals_origen_destino check(origen!=destino)
);



create table aviones(
codigo_avion integer not null,
annio varchar(10) not null,
modelo varchar(20) not null,
marca varchar(20) not null,
cant_pasajeros integer not null,
cant_filas integer not null,
cant_asientos_fila integer not null,
constraint pk_codigo_avion primary key(codigo_avion),
constraint cant_pasajeros_check check((cant_filas*cant_asientos_fila)=cant_pasajeros)
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
constraint fk_avion foreign key(avion) references aviones(codigo_avion)
);




create table viajes(
numero_viaje integer not null,
vuelo integer not null,
dia_especifico date not null,
asientos_disponibles integer not null,
promocion varchar(1) not  null,
constraint pk_numero_viaje primary key(numero_viaje),
constraint fk_vuelo foreign key(vuelo) references vuelos(numero_vuelo)
);



/*
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


insert into ciudades values ('MIA', 'Miami', 'Estados Unidos');
insert into ciudades values ('GYE', 'Guayaquil', 'Ecuador');
insert into ciudades values ('SJO', 'San Jose', 'Costa Rica');
insert into ciudades values ('BGA', 'Bogota', 'Colombia');

insert into rutas(numero_ruta, origen, destino, duracion) values (1, 'MIA', 'GYE', 3.30);
insert into rutas(numero_ruta, origen, destino, duracion) values (2, 'MIA', 'SJO', 1.30);
insert into rutas(numero_ruta, origen, destino, duracion) values (3, 'SJO', 'GYE', 2.30);
insert into rutas(numero_ruta, origen, destino, duracion) values (4, 'BGA', 'SJO', 4.30);

insert into aviones values(1, '2012', 'AAA', 'BBB', 30, 2, 15);

insert into vuelos values (1, 'L', '2:30', 120, 1, 1);
insert into vuelos values (2, 'M', '3:30', 130, 2, 1);
insert into vuelos values (3, 'J', '4:30', 140, 3, 1);
insert into vuelos values (4, 'V', '5:30', 150, 4, 1);

insert into viajes values (1, 1, '2017/05/05', 30, 1);
insert into viajes values (2, 2, '2017/05/06', 30, 1);
insert into viajes values (3, 3, '2017/05/08', 30, 1);
insert into viajes values (4, 4, '2017/05/09', 30, 1);

