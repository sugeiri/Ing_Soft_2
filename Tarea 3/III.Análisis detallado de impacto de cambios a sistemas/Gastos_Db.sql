create table producto
(
	id_producto int not null primary key,
	descr_producto varchar(max) not null,
	estado_producto char(1) not null
)
grant all on producto to public;
create table material
(
	id_material int not null primary key,
	descr_material varchar(max) not null,
	estado_material char(1) not null
)
grant all on material to public;
create table tipo_equipo
(
	id_t_equipo int not null primary key,
	descr_t_equipo varchar(max) not null,
	estado_t_equipo char(1) not null,
)
grant all on tipo_equipo to public;

create table equipo
(
	id_equipo int not null primary key,
	descr_equipo varchar(max) not null,
	estado_equipo char(1) not null,
	en_uso_equipo char(1) not null,
	id_tequipo int not null  Constraint t_equipo_pm FOREIGN KEY REFERENCES tipo_equipo(id_t_equipo)
)
grant all on equipo to public;


create table producto_material
(
	id_producto_pm int not null  Constraint producto_pm FOREIGN KEY REFERENCES producto(id_producto),
	id_material_pm int not null  Constraint material_pm FOREIGN KEY REFERENCES material(id_material),
	cant_pm decimal(12,2) not null,
	estado_pm char(1) not null,
	primary key(id_producto_pm,id_material_pm)
)

create table producto_t_equipo
(
	id_producto_pte int not null  Constraint producto_pte FOREIGN KEY REFERENCES producto(id_producto),
	id_t_equipo_pte int not null  Constraint t_equipo_pte FOREIGN KEY REFERENCES tipo_equipo(id_t_equipo),
	tiempo_pte decimal(12,2) not null,
	estado_pte char(1) not null,
	primary key(id_producto_pte,id_t_equipo_pte)
)
grant all on producto_t_equipo to public;

create table Produccion
(
	id_produccion int not null ,
	id_producto_produccion     int not null Constraint producto_prod FOREIGN KEY REFERENCES producto(id_producto),
	estado_produccion char(1) not null,
	fecha_produccion datetime not null,
	PRIMARY KEY(id_produccion)
)
grant all on Produccion to public;
create table produccion_uso_mat
(
	id_produccion_pum int not null Constraint produc_pum FOREIGN KEY REFERENCES Produccion(id_produccion),
	id_material_pum   int not null Constraint material_pum FOREIGN KEY REFERENCES material(id_material),
	cant_rec_pum	  decimal(12,2) not null,
	cant_usada_pum	  decimal(12,2) not null,
	motivo_ex_pum	  varchar(max) not null,
	primary key(id_produccion_pum,id_material_pum)
)
grant all on produccion_uso_mat to public;

create table produccion_uso_equipo
(
	id_produccion_pue   int not null Constraint produc_pue FOREIGN KEY REFERENCES Produccion(id_produccion),
	id_equipo_pue		int not null Constraint material_pue FOREIGN KEY REFERENCES equipo(id_equipo),
	primary key(id_produccion_pue,id_equipo_pue)
)
grant all on produccion_uso_equipo to public;
