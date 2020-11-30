create table tipo_cliente(
	id_t_cliente int not null primary key,
	descr_t_cliente varchar(40) not null,
	estado_t_cliente char(1) not null
)
grant all on tipo_cliente to public;

create table locales(
	id_local int not null primary key,
	descr_local varchar(40) not null,
	estado_local char(1) not null
)
grant all on locales to public;

create table Descuento
(
	id_descuento int not null primary key,
	id_tipo_cliente_desc_det  int not null Constraint t_cliente_desc_det FOREIGN KEY REFERENCES tipo_cliente(id_t_cliente),
	producto_desc_det		  int not null Constraint producto_desc_det  FOREIGN KEY REFERENCES producto(id_producto),
	rango_ini_desc_det		  int not null,
	rango_fin_desc_det		  int not null,
	porc_desc_det			  decimal(12,2) not null,
)
grant all on Descuento to public;

--create table Descuento_det
--(
--	id_descuento_det          int not null Constraint descuento_desc_det FOREIGN KEY REFERENCES descuento(id_descuento),
--	id_tipo_cliente_desc_det int not null Constraint t_cliente_desc_det FOREIGN KEY REFERENCES tipo_cliente(id_t_cliente),
--	producto_desc_det		  int not null Constraint producto_desc_det  FOREIGN KEY REFERENCES producto(id_producto),
--	rango_ini_desc_det		  int not null,
--	rango_fin_desc_det		  int not null,
--	porc_desc_det			  decimal(12,2) not null,
--	primary key(id_descuento_det,id_tipo_cliente_desc_det,producto_desc_det,rango_ini_desc_det,rango_fin_desc_det)
--)
--grant all on Descuento to public;

create table Descuento_local(
	id_local_dl int not null Constraint local_dl FOREIGN KEY REFERENCES locales(id_local),
	id_descuento_dl int not null Constraint descuento_dl FOREIGN KEY REFERENCES descuento(id_descuento),
)
grant all on Descuento_local to public;
