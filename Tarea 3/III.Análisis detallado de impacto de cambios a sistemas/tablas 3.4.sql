create table tipo_usuario
( 
   codigo			int,
   descripcion		varchar(50)
   primary key (codigo)
);
grant all on tipo_usuario to public;

create table usuario
( 
   codigo			int,
   contrasena		varchar(20),
   tipo				int,
   estado			char(1),
   fecha_modificado	datetime,
   usuario_modifico	datetime
   primary key (codigo),
   foreign key (tipo) references tipo_usuario(codigo)
);
grant all on usuario to public;

create table nivel
( 
   codigo			int,
   descripcion		varchar(50)
   
   primary key (codigo)
);
grant all on nivel to public;

create table opcion
( 
   codigo			int,
   descripcion		varchar(50)
   
   primary key (codigo)
);
grant all on opcion to public;


create table cli_conex
( 
   codigo			int,
   contrasena		varchar(20),
   nivel			int,
   estado			char(1),
   fecha_modificado	datetime,
   usuario_modifico	datetime
   primary key (codigo),
   foreign key (nivel) references nivel(codigo)
);
grant all on cli_conex to public;

create table nivel_mod_usr
( 
   tipo			int,
   nivel		int
   
   primary key (tipo,nivel),
   foreign key (tipo) references tipo_usuario(codigo),
   foreign key (nivel) references nivel(codigo)
);
grant all on nivel to public;

create table nivel_vs_opcion
( 
   nivel		int,
   opcion		int
   
   primary key (nivel,opcion),
   foreign key (nivel) references nivel(codigo),
   foreign key (opcion) references opcion(codigo)
);
grant all on nivel to public;
