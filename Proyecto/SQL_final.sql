/*En este archivo se incluye el LDD, los 150 inserts, 2 vistas y una funcion*/

create table usuario (
	id_usuario integer,
	nombre character varying(40),
	apellido_p character varying(20),
	apellido_m character varying(20),
	correo character varying(30) unique,
	contraseña character varying(20)
	
);
alter table usuario add primary key (id_usuario);

create table direccion(
	id_direccion integer,
	calle character varying(40),
	numero character varying(20),
	codigo_postal character varying(10),
	municipio character varying(20),
	estado character varying(20),
	datos_adicionales character varying(40)
);
alter table direccion add primary key (id_direccion);


create table usuario_direccion(
 	id_usuario integer,
	id_direccion integer 
);
alter table usuario_direccion add primary key (id_usuario, id_direccion);


create table factura(
	id_factura integer,
	total_costo character varying (20),
	fecha date,
	id_usuario integer
);
alter table factura add primary key (id_factura);

create table tarjeta(
	id_tarjeta integer,
	numero_tarjeta character varying (16),
	fecha_exp character varying (5),
	id_usuario integer
);
alter table tarjeta add primary key (id_tarjeta);

create table factura_tarjeta(
	id_factura integer,
	id_tarjeta integer
);
alter table factura_tarjeta add primary key (id_factura, id_tarjeta);

create table oxxo (
 id_oxxo integer,
 codigo_pago character varying (20),
 estatus boolean
);
alter table oxxo add primary key (id_oxxo);

create table factura_oxxo(
	id_factura integer,
	id_oxxo integer
);
alter table factura_oxxo add primary key ( id_factura, id_oxxo);

create table producto(
	id_producto integer,
	nombre character varying (30),
	descripcion character varying (40),
	id_marca integer,
	precio character varying (10)
);
alter table producto add primary key (id_producto);

create table factura_producto(
	id_factura integer,
	 id_producto integer
);
alter table factura_producto add primary key (id_factura, id_producto);

create table marca(
	id_marca integer,
	nombre_marca character varying (20)
);
alter table marca add primary key (id_marca);

create table accesorios(
	id_accesorios integer,
	idtipo_accesorio integer,
	tamaño character varying (20),
	iddisponibilidad integer,
	id_producto integer,
	id_color integer
);
alter table accesorios add primary key (id_accesorios);

create table tipo_accesorio (
	idtipo_accesorio integer,
	descripcion character varying (40)
);
alter table tipo_accesorio add primary key (idtipo_accesorio);


create table ropa(
	id_ropa integer,
	idtipo_prenda integer,
	talla integer,
	iddisponibilidad integer,
	id_producto integer,
	id_color integer
);
alter table ropa add primary key (id_ropa);

create table tipo_prenda(
	idtipo_prenda integer,
	tipo character varying (20)
);
alter table tipo_prenda add primary key (idtipo_prenda);

create table talla(
	talla integer,
	medida character varying (10) 

);

alter table talla add primary key (talla);

create table color(
	id_color integer,
	color  character varying (20)
);
alter table color add primary key (id_color);

create table disponibilidad(
	iddisponibilidad integer,
	estado_disponibilidad character varying (20)
);
alter table disponibilidad add primary key (iddisponibilidad);

alter table usuario_direccion add foreign key  (id_usuario) references usuario (id_usuario) on update cascade;
alter table usuario_direccion add foreign key  (id_direccion) references direccion (id_direccion) on update cascade;

alter table factura add foreign key (id_usuario)references usuario (id_usuario) on update cascade; 

alter table tarjeta add foreign key (id_usuario)references usuario (id_usuario) on update cascade; 

alter table factura_tarjeta add foreign key (id_factura) references factura(id_factura)on update cascade;
alter table factura_tarjeta add foreign key (id_tarjeta) references tarjeta(id_tarjeta) on update cascade;


alter table factura_oxxo add foreign key (id_factura) references factura(id_factura)on update cascade;
alter table factura_oxxo add foreign key (id_oxxo) references oxxo(id_oxxo) on update cascade;

alter table producto add foreign key (id_marca) references marca (id_marca) on update cascade;

alter table factura_producto add foreign key (id_factura) references factura(id_factura) on update cascade;
alter table factura_producto add foreign key (id_producto) references producto(id_producto);

alter table accesorios add foreign key (idtipo_accesorio) references tipo_accesorio(idtipo_accesorio) on update cascade;
alter table accesorios add foreign key (iddisponibilidad) references disponibilidad (iddisponibilidad) on update cascade;
alter table accesorios add foreign key (id_producto) references producto (id_producto) on update cascade;
alter table accesorios add foreign key (id_color) references color (id_color) on update cascade;

alter table ropa add foreign key (idtipo_prenda) references tipo_prenda(idtipo_prenda) on update cascade;
alter table ropa add foreign key (iddisponibilidad) references disponibilidad (iddisponibilidad) on update cascade;
alter table ropa add foreign key (id_producto) references producto (id_producto) on update cascade;
alter table ropa add foreign key (id_color) references color (id_color) on update cascade;
alter table ropa add foreign key (talla) references talla (talla) on update cascade;

--usuarios
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values (1, 'Pedro', 'Gonzalez', 'Solis', 'pgs@gmail.com', 'contraseña1');
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values ((select max(id_usuario)+1 from usuario), 'Hiram', 'Garcia', 'Gonzales', 'hgg@gmail.com', 'contraseña2');
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values ((select max(id_usuario)+1 from usuario), 'carlos', 'Garcia', 'Gonzales', 'cgg@gmail.com', 'contraseña3');
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values ((select max(id_usuario)+1 from usuario), 'Velia', 'Jimenez', 'Gomez', 'velia@gmail.com', 'contraseña4');
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values ((select max(id_usuario)+1 from usuario), 'Daniela', 'Garcia', 'Perez', 'Dany@gmail.com', 'contraseña5');
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values ((select max(id_usuario)+1 from usuario), 'Nayeli', 'Gomez', 'Alvares', 'Nanay@gmail.com', 'contraseña6');
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values ((select max(id_usuario)+1 from usuario), 'Erika', 'Perez', 'Gomez', 'kika@gmail.com', 'contraseña7');
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values ((select max(id_usuario)+1 from usuario), 'Olga Letcia', 'Gomez', 'Paramo', 'olga@gmail.com', 'contraseña8');
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values ((select max(id_usuario)+1 from usuario), 'Benjamin', 'Jimenez', 'Solis', 'benja@gmail.com', 'contraseña9');
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values ((select max(id_usuario)+1 from usuario), 'Alyne Paola', 'Alvarado', 'Arias', 'aline@gmail.com', 'contraseña10');
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values ((select max(id_usuario)+1 from usuario), 'Diego', 'Jimenez', 'Gonzalez', 'gogo@gmail.com', 'contraseña11');
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values ((select max(id_usuario)+1 from usuario), 'Mauricio', 'Lopez', 'Sanchez', 'mau@gmail.com', 'contraseña12');
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values ((select max(id_usuario)+1 from usuario), 'Daniel', 'Lopez', 'Servin', 'danilgmail.com', 'contraseña13');
insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña) values ((select max(id_usuario)+1 from usuario), 'Jesus', 'Lopez', 'Cuate', 'jesusgmail.com', 'contraseña14');

--direccion
insert into direccion (id_direccion, calle, numero,codigo_postal, municipio, estado, datos_adicionales) values (1, 'San Pedro', '20', '07656', 'Naucalpan', 'EDOMEX', NULL);
insert into direccion (id_direccion, calle, numero,codigo_postal, municipio, estado, datos_adicionales) values ((select max (id_direccion)+1 from direccion), 'San Jose', '40', '06700', 'Naucalpan', 'EDOMEX', NULL); 
insert into direccion (id_direccion, calle, numero,codigo_postal, municipio, estado, datos_adicionales) values ((select max (id_direccion)+1 from direccion), 'Villa del carbon', '205', '67200', 'Nicolas Romer', 'EDOMEX', NULL);
insert into direccion (id_direccion, calle, numero,codigo_postal, municipio, estado, datos_adicionales) values ((select max (id_direccion)+1 from direccion), 'Privada de Tenoxtapan', '20', '07200', 'GAM', 'CDMX', NULL);
insert into direccion (id_direccion, calle, numero,codigo_postal, municipio, estado, datos_adicionales) values ((select max (id_direccion)+1 from direccion), 'Privada de Tenoxtapan', '20', '07200', 'GAM', 'CDMX', NULL);
insert into direccion (id_direccion, calle, numero,codigo_postal, municipio, estado, datos_adicionales) values ((select max (id_direccion)+1 from direccion), 'Av. El Rosario', '102', '00410', 'Azcapotzalco', 'CDMX', 'A lado del CETRAM el rosario');
insert into direccion (id_direccion, calle, numero,codigo_postal, municipio, estado, datos_adicionales) values ((select max (id_direccion)+1 from direccion), 'Robles', '560', '01900', 'Tlanepantla', 'EDOMEX', NULL);
insert into direccion (id_direccion, calle, numero,codigo_postal, municipio, estado, datos_adicionales) values ((select max (id_direccion)+1 from direccion), 'Cerada de Tenoxtapa', '21', '02602', 'GAM', 'CDMX', 'Enfrente de la panificadora Lecaroz');
insert into direccion (id_direccion, calle, numero,codigo_postal, municipio, estado, datos_adicionales) values ((select max (id_direccion)+1 from direccion), 'Ucareo', '40', '06770', 'Zinapecuaro', 'Michoacan', NULL);
insert into direccion (id_direccion, calle, numero,codigo_postal, municipio, estado, datos_adicionales) values ((select max (id_direccion)+1 from direccion), 'San Jose', '40', '06700', 'Naucalpan', 'EDOMEX', NULL);
insert into direccion (id_direccion, calle, numero,codigo_postal, municipio, estado, datos_adicionales) values ((select max (id_direccion)+1 from direccion), 'Tepic', '37', '105200', 'San Jose', 'Jalisco', NULL);
insert into direccion (id_direccion, calle, numero,codigo_postal, municipio, estado, datos_adicionales) values ((select max (id_direccion)+1 from direccion), 'La sexta', '225', '050782', 'Tecamac', 'EDOMEX', NULL);
--direccion/usuario
insert into usuario_direccion (id_usuario, id_direccion) values(1, 11);
insert into usuario_direccion (id_usuario, id_direccion) values(2, 12);
insert into usuario_direccion (id_usuario, id_direccion) values(3, 10);
insert into usuario_direccion (id_usuario, id_direccion) values(4, 9);
insert into usuario_direccion (id_usuario, id_direccion) values(5, 8);
insert into usuario_direccion (id_usuario, id_direccion) values(6, 7);
insert into usuario_direccion (id_usuario, id_direccion) values(7, 6);
insert into usuario_direccion (id_usuario, id_direccion) values(8, 5);
insert into usuario_direccion (id_usuario, id_direccion) values(9, 4);
insert into usuario_direccion (id_usuario, id_direccion) values(10, 3);
insert into usuario_direccion (id_usuario, id_direccion) values(11, 2);
insert into usuario_direccion (id_usuario, id_direccion) values(12, 1);

--colores
insert into color (id_color, color) values (001, 'Rojo');
insert into color (id_color, color) values (002, 'Azul');
insert into color (id_color, color) values (003, 'Blanco');
insert into color (id_color, color) values (004, 'Negro');
insert into color (id_color, color) values (005, 'Vino');
insert into color (id_color, color) values (006, 'Rosa');
insert into color (id_color, color) values (007, 'Morado');
insert into color (id_color, color) values (008, 'Cafe');
insert into color (id_color, color) values (009, 'Mostaza');
insert into color (id_color, color) values (010, 'Gris');
insert into color (id_color, color) values (011, 'Plateado');
insert into color (id_color, color) values (012, 'Dorado');
insert into color (id_color, color) values (013, 'Amarillo');
insert into color (id_color, color) values (014, 'Verde');


--tallas infatiles
insert into talla (talla, medida) values (1,'0-3 meses');
insert into talla (talla, medida) values (2,'3-6 meses');
insert into talla (talla, medida) values (3,'6-12 meses');
insert into talla (talla, medida) values (4,'2-3 años');
insert into talla (talla, medida) values (5,'4-5 años');
insert into talla (talla, medida) values (6,'6-7 años');
insert into talla (talla, medida) values (7,'8-10 años');
insert into talla (talla, medida) values (8,'11-12 años');
insert into talla (talla, medida) values (9,'12-14 años');

--tallas Hombre/Mujer
insert into talla (talla, medida) values (10,'S');
insert into talla (talla, medida) values (11,'M');
insert into talla (talla, medida) values (12,'L');
insert into talla (talla, medida) values (13,'XL');
insert into talla (talla, medida) values (14,'XXL');

--tipo prenda
insert into tipo_prenda (idtipo_prenda, tipo) values (1, 'Ropa interior');
insert into tipo_prenda (idtipo_prenda, tipo) values (2, 'Ropa deportiva');
insert into tipo_prenda (idtipo_prenda, tipo) values (3, 'Ropa de etiqueta');
insert into tipo_prenda (idtipo_prenda, tipo) values (4, 'Ropa infantil');
insert into tipo_prenda (idtipo_prenda, tipo) values (5, 'Ropa informal');
insert into tipo_prenda (idtipo_prenda, tipo) values (6, 'Ropa de abrigo');
insert into tipo_prenda (idtipo_prenda, tipo) values (7, 'Ropa de embarazadas');

--marca
insert into marca (id_marca, nombre_marca) values (1, 'ZARA');
insert into marca (id_marca, nombre_marca) values ((select max(id_marca)+1 from marca), 'NIKE');
insert into marca (id_marca, nombre_marca) values ((select max(id_marca)+1 from marca), 'C&A');
insert into marca (id_marca, nombre_marca) values ((select max(id_marca)+1 from marca), 'INDITEX.');
insert into marca (id_marca, nombre_marca) values ((select max(id_marca)+1 from marca), 'LACOSTE');
insert into marca (id_marca, nombre_marca) values ((select max(id_marca)+1 from marca), 'PUMA');
insert into marca (id_marca, nombre_marca) values ((select max(id_marca)+1 from marca), 'GUCCI');
insert into marca (id_marca, nombre_marca) values ((select max(id_marca)+1 from marca), 'H&M');
insert into marca (id_marca, nombre_marca) values ((select max(id_marca)+1 from marca), 'CHANEL');
insert into marca (id_marca, nombre_marca) values ((select max(id_marca)+1 from marca), 'LIVERPOOL');

--disponibilidad
insert into disponibilidad (iddisponibilidad, estado_disponibilidad) values (1, 'DISPONIBLE');
insert into disponibilidad (iddisponibilidad, estado_disponibilidad) values (2, 'AGOTADO');


--- tipo_accesorio

insert into tipo_accesorio(idtipo_accesorio, descripcion) values (1, 'BISUTERIA');
insert into tipo_accesorio(idtipo_accesorio, descripcion) values ((select max(idtipo_accesorio)+1 from tipo_accesorio), 'CINTURONES');
insert into tipo_accesorio(idtipo_accesorio, descripcion) values ((select max(idtipo_accesorio)+1 from tipo_accesorio), 'BOLSOS/CARTERAS');
insert into tipo_accesorio(idtipo_accesorio, descripcion) values ((select max(idtipo_accesorio)+1 from tipo_accesorio), 'GAFAS');
insert into tipo_accesorio(idtipo_accesorio, descripcion) values ((select max(idtipo_accesorio)+1 from tipo_accesorio), 'SOMBREROS');
insert into tipo_accesorio(idtipo_accesorio, descripcion) values ((select max(idtipo_accesorio)+1 from tipo_accesorio), 'Pañuelos, Pashminas y Bufandas');
insert into tipo_accesorio(idtipo_accesorio, descripcion) values ((select max(idtipo_accesorio)+1 from tipo_accesorio), 'ZAPATOS');
insert into tipo_accesorio(idtipo_accesorio, descripcion) values ((select max(idtipo_accesorio)+1 from tipo_accesorio), 'RELOJ');

--PRODUCTO

insert into producto (id_producto, nombre, descripcion, id_marca, precio) values (1, 'vestido', 'vestido largo con estampado floral', 10, '500.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'chamarra', 'chamarra rompe vientos', 2, ' 450.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'pants', 'Pantalon deportivo, 100% algodon', 6, '600.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'blusa', 'Blusa para embarazada', 9, '300.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'saco', 'Elaborado con poliester', 10, '700.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'vestido', 'Vestido de noche', 10, '1000.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'pantalon', 'pantalon formal elborado con poliester', 9, '500.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'short', NULL, 3, '450.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'pantalon', 'pantalon de mezclilla', 3, '540.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values((select max (id_producto)+1 from producto), 'playera', '100% poliester', 5, '320.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'blusa', NULL, 5, '200.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'cinturon', 'sintetico', 3, '220.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'lentes de sol', NULL, 7, '500.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'Botas', 'material sintetico', 3, '750.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'Tenis', 'Tenis deportivos', 2, '930.00' );
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'Aretes', '14k oro', 10, '1500.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'Joyeria', 'Aretes y collar con incrustraciones', 10, '540.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'Bolsa', 'material sitetico', 9, '320.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values ((select max (id_producto)+1 from producto), 'Sansalias', 'Material sintetico', 2, '200.00');
insert into producto (id_producto, nombre, descripcion, id_marca, precio) values((select max (id_producto)+1 from producto), 'Broche', 'Broche para el cabello', 3, '70.00');



--ropa
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values (1, 5, 11, 1, 1, 1);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 11, 1, 1, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 11, 1, 1, 14);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 10, 1, 1, 1);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 10, 1, 1, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 10, 1, 1, 14);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 12, 1, 1, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 12, 1, 1, 1);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 12, 2, 1, 14);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 10, 1, 2, 10);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 10, 1, 2, 1);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 9, 1, 2, 6);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 9, 1, 2, 10);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 11, 2, 2, 10);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 11, 1, 2, 1);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 12, 1, 2, 10);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 12, 1, 2, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 13, 1, 2, 10);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 11, 1, 3, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 10, 1, 3, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 10, 1, 3, 10);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 11, 1, 3, 10);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 12, 1, 3, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 12, 1, 3, 2);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 13, 1, 3, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 13, 1, 3, 10);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 9, 1, 3, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 9, 1, 3, 2);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 4, 13, 2, 4, 2); 
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 4, 13, 1, 4, 3);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 4, 13, 1, 4, 6);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 4, 13, 1, 4, 9);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 4, 12, 1, 4, 2);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 4, 12, 1, 4, 3);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 4, 11, 1, 4, 2);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 4, 11, 1, 4, 3);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 4, 11, 2, 4, 13);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 11, 1, 5, 9);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 11, 1, 5, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 11, 1, 5, 10);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 10, 1, 5, 9);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 10, 1, 5, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 10, 1, 5, 10);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 12, 1, 5, 9);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 12, 1, 5, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 13, 1, 5, 9);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 12, 1, 6, 5);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 12, 1, 6, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 12, 1, 6, 1);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 10, 1, 6, 5);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 10, 1, 6, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 10, 1, 6, 1);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 11, 1, 6, 5);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 11, 2, 6, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 11,  1, 7, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 11,  1, 7, 10);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 10,  1, 7, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 10,  1, 7, 10);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 12,  1, 7, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 12,  1, 7, 10);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 13,  1, 7, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 11, 2, 8, 6);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 11, 1, 8, 2);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 10, 1, 8, 2);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 10, 1, 8, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 12, 2, 8, 6);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 2, 13, 2, 8, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 12, 1, 9, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 12, 1, 9, 2);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 12, 1, 9, 3);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 10, 1, 9, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 10, 1, 9, 2);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 10, 1, 9, 3);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 11, 1, 9, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 11, 1, 9, 2);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 9, 1, 9, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 9, 1, 9, 2);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 9, 1, 9, 3);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 11, 1, 10, 14);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 10, 1, 10, 14);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 9, 1, 10, 14);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 12, 1, 10, 14);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 8, 1, 10, 14);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 5, 13, 1, 10, 14);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 11, 1, 11, 1);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 9, 1, 11, 6);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 10, 1, 11, 3);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 10, 1, 11, 4);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 10, 1, 11, 1);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 12, 1, 11, 1);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 12, 1, 11, 3);
insert into ropa (id_ropa, idtipo_prenda, talla, iddisponibilidad, id_producto, id_color) values ((select max(id_ropa)+1 from ropa), 3, 12, 1, 11, 4);
--accesorios

insert into accesorios (id_accesorios, idtipo_accesorio, tamaño,iddisponibilidad, id_producto, id_color) values (1, 2, 'Mediano',1,  12, 4);
insert into accesorios (id_accesorios, idtipo_accesorio, tamaño,iddisponibilidad, id_producto, id_color) values ((select max(id_accesorios)+1 from accesorios), 4, 'UNITALLA', 1, 13, 1);
insert into accesorios (id_accesorios, idtipo_accesorio, tamaño,iddisponibilidad, id_producto, id_color) values ((select max(id_accesorios)+1 from accesorios), 7, '23', 1, 14, 9);
insert into accesorios (id_accesorios, idtipo_accesorio, tamaño,iddisponibilidad, id_producto, id_color) values ((select max(id_accesorios)+1 from accesorios), 7, '24', 1, 15, 2);
insert into accesorios (id_accesorios, idtipo_accesorio, tamaño,iddisponibilidad, id_producto, id_color) values ((select max(id_accesorios)+1 from accesorios), 1, NULL, 1, 16, 12);
insert into accesorios (id_accesorios, idtipo_accesorio, tamaño,iddisponibilidad, id_producto, id_color) values ((select max(id_accesorios)+1 from accesorios), 1, NULL, 1, 17, 14);
insert into accesorios (id_accesorios, idtipo_accesorio, tamaño,iddisponibilidad, id_producto, id_color) values ((select max(id_accesorios)+1 from accesorios), 3, 'GRANDE', 1, 18, 9);
insert into accesorios (id_accesorios, idtipo_accesorio, tamaño,iddisponibilidad, id_producto, id_color) values ((select max(id_accesorios)+1 from accesorios), 7, '22', 2, 19, 13);
insert into accesorios (id_accesorios, idtipo_accesorio, tamaño,iddisponibilidad, id_producto, id_color) values ((select max(id_accesorios)+1 from accesorios), 1, NULL, 1, 20, 11);

--tarjeta
insert into tarjeta (id_tarjeta,numero_tarjeta,fecha_exp,id_usuario) values (1,'111','07/11',1);
-- factura
insert into factura (id_factura, total_costo, fecha, id_usuario) values (1, '930.00', '2020/06/03', 1);


--fin inserts



--2 Vistas
--vista 1
CREATE VIEW usuario_nvo
 AS SELECT nombre
 FROM usuario
 WHERE nombre = 'Daniel';

--vista 2 
CREATE VIEW ususario2_nvo
 AS SELECT apellido_p
 FROM usuario
 WHERE apellido_p = 'Lopez';
 
 --Funcion
CREATE OR REPLACE FUNCTION
	unixtime(text)
RETURNS
	SETOF "usuario"
AS' 
	 DECLARE 
	 		r usuario;	
	BEGIN
			FOR r IN 
				SELECT name AS "nombre" FROM usuario
			LOOP 
				RETURN NEXT r;
			END LOOP;
RETURN;
END;'
LANGUAGE
	plpgsql;