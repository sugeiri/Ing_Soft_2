create table Categoria_Queja
(
	id_categoria int not null primary key,
	descr_categoria varchar(100) not null,
	estado_categoria char(1) not null,
	importancia_categoria int not null, --1- Leve, 2-Media, 3-Mucha
)
grant all on Categoria_Queja to public;
create table Actividad_Solucion
(
	id_actividad_s     int not null primary key,
	descr_actividad_s  varchar(100) not null,
	estado_actividad_s char(1) not null,
	tiempo_actividad_s decimal(12,2) not null,
)
grant all on Actividad_Solucion to public;

create table Categoria_Actividad
(
	id_categoria_ca int not null Constraint FK_cat_ca_categoria FOREIGN KEY REFERENCES Categoria_Queja(id_categoria),
	id_actividad_ca     int not null Constraint act_ca_actividad FOREIGN KEY REFERENCES Actividad_Solucion(id_actividad_s),
	estado_actividad_ca char(1) not null,
	PRIMARY KEY(id_categoria_ca,id_actividad_ca)
)
grant all on Categoria_Actividad to public;

--id_tu_usuario int not null Constraint FK_tusuario_usuario FOREIGN KEY REFERENCES tipo_usuario(id_t_usuario),
	