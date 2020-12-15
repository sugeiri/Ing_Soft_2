create table depto
( 
   codigo			int,
   descripcion		varchar(50)
   primary key (codigo)
);
grant all on depto to public;

create table area
( 
   codigo			int,
   descripcion		varchar(50),
   departamento		int
   
   primary key (codigo),
   foreign key (departamento) references depto(codigo)
);
grant all on area to public;

create table enfermera
( 
   codigo			int,
   nombre			varchar(50),
   area 		    int,
   tipo				int,
   estado			char(1),
   if_sustituida	char(1)
   
   primary key (codigo),
   foreign key (area) references area(codigo)
);
grant all on enfermera to public;



create table equipos
( 
   codigo			int,
   descripcion		varchar(50),
   estado			char(1)
   
   primary key (codigo)
);
grant all on equipos to public;




create table enf_vs_equipo
( 
   nl			int,
   enfermera	int,
   equipo		int
   
   primary key (nl),
   foreign key (enfermera) references enfermera(codigo),
   foreign key (equipo) references equipos(codigo)
);
grant all on enf_vs_equipo to public;

