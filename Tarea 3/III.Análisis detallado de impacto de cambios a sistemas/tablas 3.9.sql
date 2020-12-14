-- Tipo Letrero
create table tipo_letrero
   (codigo			char(5),
	descripcion		char(30),

	primary key (codigo)
);

grant all on tipo_letrero to public;


-- Impuesto
create table impuesto
   (impuesto		char(5),
	precio			char(5),

	primary key (impuesto),
	
);

grant all on impuesto to public;

-- Letrero vs impuesto
create table letrero_vs_impuesto
   (tipo_letrero		char(5),
	impuesto			char(5),

	primary key (tipo_letrero, impuesto),
	foreign key (tipo_letrero) references tipo_letrero(codigo),
	foreign key (impuesto) references impuesto(impuesto)
);

grant all on letrero_vs_impuesto to public;


-- pago_imp

--create table pago_imp
--   (documento		char(12),
--	fecha			datetime,
--	cliente			char(5),
--	impuesto		char(5),
--	cant_letrero	decimal(12,2),
--	precio			char(5),
--	total_cobrar	decimal(12,2)

--	primary key (documento)
--	foreign key (impuesto) references impuesto(impuesto)
	
--);

--grant all on pago_imp to public;


drop table pago_imp
create table pago_imp
   (documento		char(12),
	fecha			datetime,
	cliente			char(5),
	total_cobrar	decimal(12,2)

	primary key (documento)
	
);

grant all on pago_imp to public;


-- detalle_pago_imp
create table detalle_pago_imp
   (documento		char(12),
    tipo_letrero	char(5),
	cantidad		int,
	precio			decimal(12,2)

	primary key (documento, tipo_letrero),
	foreign key (documento) references pago_imp(documento),
	foreign key (tipo_letrero) references tipo_letrero(codigo)
);

grant all on detalle_pago_imp to public;