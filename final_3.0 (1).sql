create database Synaps_Computing;
use Synaps_Computing;
create table cliente(
idcliente int not null auto_increment,
nombre varchar(100) not null,
gmail varchar(100) not null,
telefono varchar(20) null,
genero varchar(20) null,
constraint pk_cliente primary key (idcliente),
constraint uq_cliente_gmail unique (gmail)
) engine=InnoDB;


create table direccion(
iddireccion int not null auto_increment,
direccion varchar(100) not null,
telefono varchar(20) null,
nombre_repartidor varchar(100) null,
cliente_idcliente int not null,
constraint pk_direccion primary key (iddireccion)
)engine=InnoDB;

create table proveedor(
idproveedor int not null auto_increment,
nombre varchar(100) not null,
horarios varchar(100) null,
gmail varchar(100) null,
telefono varchar(20) null,
constraint pk_encargado_inventario primary key(idproveedor),
constraint uq_encargado_gmail unique (gmail)
)engine=InnoDB;

 create table encargado_inventario(
 idencargado int not null auto_increment,
 nombre varchar(100) not null,
 horarios varchar(100)null,
 gmail varchar(100) null,
 telefono varchar(20) null,
 constraint pk_encargado_inventario primary key(idencargado),
 constraint uq_encargado_gmail unique(gmail)
 )engine=InnoDB;

create table repartidor(
idrepartidor int not null auto_increment,
nombre varchar(100) not null,
vehiculo varchar(100) null,
horarios varchar(100)null,
telefono varchar(20)null,
encargado_idencargado int not null,
constraint pk_repartidor primary key (idrepartidor)
)engine=InnoDB;

create table producto(
idproducto int not null auto_increment,
nombreproducto varchar(100) not null,
color varchar(45) null,
precio decimal(10,2) not null,
proveedor_idproveedor int not null,
constraint pk_producto primary key (idproducto),
constraint ck_producto_precio check (precio>=0)
)engine=InnoDB;

 create table venta(
 idventa int not null auto_increment,
 fecha datetime not null default current_timestamp,
 precio_total decimal(10,2) not null,
 cliente_idcliente int not null,
 constraint pk_venta primary key (idventa),
 constraint ck_venta_precio check(precio_total >=0)
 )engine=InnoDB;
 
 
 create table factura_electronica (
 idfactura int not null auto_increment,
 venta_idventa int not null,
 numero_factura varchar(50) not null,
 total decimal (10,2) not null,
 constraint pk_factura_electronica primary key (idfactura),
 constraint uq_factura_numero unique (numero_factura),
 constraint ck_factura_total check (total >= 0)
 )engine=InnoDB;
 

USE Synaps_Computing;


#tabla por tabla

insert into cliente (idcliente,nombre,gmail,telefono,genero)values
(1,'jorge','jorge@gmail.com',3132837463,'masculino'),
(2,'juan','juan@gmail.com',3135643212,'masculino'),
(3,'carla','carla@gmail.com',2345456,'femenino'),
(4,'ramiro','ramiro@gmail.com',45653421,'masculino'),
(5,'camila','camila@gmail.com',2122311233,'femenino'),
(6,'luis','luis@gmail.com',22321332,'masculino'),
(7,'paula','paula@gmail.com',32432112,'femenino'),
(8,'daniela','daniela@gmail.com',232431212,'femenino');

insert into direccion (cliente_idcliente,direccion,telefono,nombre_repartidor) values
('1','calle22t#123a20',31223132,'julian'),
('2','calle34t#23a22',312245343,'julian'),
('3','calle1t#11a23',31234234,'julian'),
('4','calle23t#1a9',32134235,'martin'),
('5','calle7t#123a8',321445235,'martin'),
('6','calle62t#13a60',324235,'martin'),
('7','calle22t#123a270',3214525,'martin'),
('8','calle42t#15e320',32133542,'martin');

insert into proveedor (idproveedor,gmail,nombre,telefono) values
(01,'partescomputacion@gmail.com','sebastian',321343245),
(02,'partescomputacion1@gmail.com','sebastian',321343245),
(03,'partescomputacion2@gmail.com','sebastian',321343245),
(04,'partescomputacion3@gmail.com','sebastian',321343245),
(05,'partescomputacion4@gmail.com','sebastian',321343245),
(06,'partescomputacion5@gmail.com','sebastian',321343245),
(07,'partescomputacion6@gmail.com','sebastian',321343245),
(08,'partescomputacion7@gmail.com','sebastian',321343245);

insert into encargado_inventario (idencargado,nombre,horarios,gmail) values
(123,'jorge','diurno','jorge1@gmail.com'),
(124,'pablo','nocturno','pablo1@gmail.com'),
(125,'dilan','diurno','dilan@gmail.com'),
(126,'jorge','diurno','jorge2@gmail.com'),
(127,'dilan','diurno','dilan1@gmail.com'),
(128,'pablo','nocturno','pablo2@gmail.com'),
(129,'jorge','diurno','jorge3@gmail.com'),
(130,'pablo','nocturno','pablo@gmail.com');

insert into repartidor (idrepartidor,vehiculo,nombre,horarios,encargado_idencargado) values
(321,'moto','marin','diurno',123),
(322,'carro','lucas','nocturno',124),
(332,'moto','marin','diurno',125),
(333,'carro','lucas','nocturno',126),
(324,'moto','marin','diurno',127),
(325,'carro','lucas','nocturno',128),
(326,'carro','lucas','nocturno',129),
(327,'carro','lucas','nocturno',130);

insert into producto (idproducto,nombreProducto,color,precio,proveedor_idproveedor) values
(011,'ram','negro',200.000,01),
(022,'tarjeta madre','negro',600.000,02),
(033,'ventilador','negro',300.000,03),
(044,'teclado','negro',180.000,04),
(055,'refrigeracion liquida','blanca',900.500,05),
(066,'cpu','gris',900.000,06),
(077,'tarjeta grafica','negro',900.700,07),
(088,'pasta termica','gris',50.000,08);

insert into venta (idventa,precio_total,fecha,cliente_idcliente) values
(123456,900.300,'2026-02-05',1),
(123457,600.799,'2026-11-17',2),
(123458,900.000,'2026-02-12',3),
(123459,790.000,'2026-02-03',4),
(123450,500.000,'2026-01-01',5),
(123451,850.000,'2026-05-13',6),
(123452,999.999,'2026-11-30',7),
(123453,800.000,'2026-12-24',8);

insert into factura_electronica (idfactura,venta_idventa,numero_factura,total) values
(11,123456,'1111',900.30),
(22,123457,'2222',600.79),
(33,123458,'33333',900.00),
(44,123459,'4444',790.00),
(55,123450,'55555',500.00),
(66,123451,'66666',999.99),
(77,123452,'7777',800.00),
(88,123453,'88888',600.00);

#SELECT * FROM venta;--sirve para ver los registros de las tablas

SELECT 'cliente' AS tabla, COUNT(*) AS registros FROM cliente
UNION ALL SELECT 'direccion', COUNT(*) FROM direccion
UNION ALL SELECT 'proveedor', COUNT(*) FROM proveedor
UNION ALL SELECT 'encargado_inventario', COUNT(*) FROM encargado_inventario
UNION ALL SELECT 'repartidor', COUNT(*) FROM repartidor
UNION ALL SELECT 'producto', COUNT(*) FROM producto
UNION ALL SELECT 'venta', COUNT(*) FROM venta
UNION ALL SELECT 'factura_electronica', COUNT(*) FROM factura_electronica;



USE Synaps_Computing;

-- RELACION 1: CLIENTE - DIRECCION
ALTER TABLE direccion
ADD CONSTRAINT fk_direccion_cliente
FOREIGN KEY (cliente_idcliente)
REFERENCES cliente(idcliente)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- RELACION 2: ENCARGADO DE INVENTARIO - REPARTIDOR
ALTER TABLE repartidor
ADD CONSTRAINT fk_repartidor_encargado
FOREIGN KEY (encargado_idencargado)
REFERENCES encargado_inventario(idencargado)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- RELACION 3: PROVEEDOR - PRODUCTO
ALTER TABLE producto
ADD CONSTRAINT fk_producto_proveedor
FOREIGN KEY (proveedor_idproveedor)
REFERENCES proveedor(idproveedor)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- RELACION 4: CLIENTE - VENTA
ALTER TABLE venta
ADD CONSTRAINT fk_venta_cliente
FOREIGN KEY (cliente_idcliente)
REFERENCES cliente(idcliente)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- RELACION 5: VENTA - FACTURA ELECTRONICA
ALTER TABLE factura_electronica
ADD CONSTRAINT fk_factura_venta
FOREIGN KEY (venta_idventa)
REFERENCES venta(idventa)
ON UPDATE CASCADE
ON DELETE RESTRICT;

use Synaps_Computing;
show tables;

