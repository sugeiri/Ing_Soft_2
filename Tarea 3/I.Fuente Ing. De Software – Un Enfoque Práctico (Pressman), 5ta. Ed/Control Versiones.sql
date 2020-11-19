create table persona
(
	id_persona int not null primary key,
	nombre_persona varchar(50) not null,
	estado_persona char(1)
)
grant all on persona to public
create table tipo_usuario
(
	id_t_usuario int not null primary key,
	descr_t_usuario varchar(30) not null,
	estado_t_usuario char(1) not null,
	nivel_acceso_t_usuario int not null,
)
grant all on tipo_usuario  to public
create table usuario
(
	id_usuario int not null primary key,
	id_persona_usuario int not null Constraint FK_persona_usuario FOREIGN KEY REFERENCES persona(id_persona),
	id_tu_usuario int not null Constraint FK_tusuario_usuario FOREIGN KEY REFERENCES tipo_usuario(id_t_usuario),
	clave_usuario varchar(100) not null
)
grant all on usuario to public
create table proyecto
(
	id_proyecto int not null primary key,
	descr_proyecto varchar(MAX) not null,
	estado_proyecto char(1) not null,
	f_inicio_proyecto date not null,
	f_fin_proyecto date not null
)
grant all on proyecto to public
create table proyecto_Equipo
(
	id_proyecto_pe int not null Constraint FK_proyecto_pe FOREIGN KEY REFERENCES proyecto(id_proyecto),
	id_usuario_pe int not null  Constraint FK_usuario_pe FOREIGN KEY REFERENCES usuario(id_usuario),
	encargado_pe char(1) not null
	primary key(id_proyecto_pe,id_usuario_pe)
)
grant all on proyecto_Equipo to public
create table modulo
(
	id_modulo int not null primary key,
	descr_modulo varchar(MAX) not null,
	estado_modulo char(1) not null
)
grant all on modulo to public
create table programa
(
	id_programa int not null primary key,
	descr_programa varchar(MAX) not null,
	estado_programa char(1) not null,
	modulo_programa int not null Constraint FK_modulo_programa FOREIGN KEY REFERENCES modulo(id_modulo)
)
grant all on programa to public
create table modulo_proyecto
(
	id_proyecto_mp int not null Constraint FK_proyecto_mp FOREIGN KEY REFERENCES proyecto(id_proyecto),
	id_modulo_mp int not null Constraint FK_modulo_mp FOREIGN KEY REFERENCES modulo(id_modulo),
	estado_mp char(1) not null
)
grant all on modulo_proyecto  to public
create table configuracion
(
	id_configuracion int not null primary key,
	descr_configuracion varchar(MAX) not null,
	estado_configuracion char(1) not null,
)
grant all on configuracion to public
create table configuracion_programa
(
	id_configuracion_cp int not null Constraint FK_configuracion_cp FOREIGN KEY REFERENCES configuracion(id_configuracion),
	id_programa_cp int not null   Constraint FK_programa_cp FOREIGN KEY REFERENCES programa(id_programa),
	estado_cp char(1) not null
)
grant all on configuracion_programa to public
create table Documento
(
	id_documento int not null primary key,
	descr_documento varchar(MAX) not null,
	estado_documento char(1) not null,
)
grant all on Documento to public

create table programa_documento
(
	id_programa_pd int not null Constraint FK_programa_pd FOREIGN KEY REFERENCES programa(id_programa),
	id_documento_pd int not null   Constraint FK_documento_pd FOREIGN KEY REFERENCES Documento(id_documento),
	estado_pd char(1) not null
)
grant all on programa_documento to public

create table Cambio
(
	id_cambio					int not null primary key,
	id_conf_cambio				int not null Constraint FK_configuracion_cambio FOREIGN KEY REFERENCES configuracion(id_configuracion),
	id_programa_cambio			int not null Constraint FK_programa_cambio FOREIGN KEY REFERENCES programa(id_programa),
	id_usuario_cambio			int not null Constraint FK_usuario_cambio FOREIGN KEY REFERENCES usuario(id_usuario),
	id_usuario_autoriza_cambio  int not null Constraint FK_usuario_Aut_cambio FOREIGN KEY REFERENCES usuario(id_usuario),
	motivo_cambio				varchar(MAX) not null,
	fecha_cambio				datetime not null,
	version_ant					int not null,
	version_act					int not null
)
grant all on Cambio to public