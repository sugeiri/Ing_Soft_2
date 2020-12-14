-- Facturas a credito
create table facturas_credito
   (documento		char(12),
	cliente			char(5),
	empleado		char(5),
	fecha			datetime,
	sub_total		decimal(12, 2),
	impuesto		decimal(12, 2),
	estado			char(1)

	primary key (documento)
);

grant all on facturas_credito to public;

-- Pagos CXC
create table pagos
   (documento	char(12),
	cliente		char(5),
	empleado	char(5),
	fecha		datetime,
	monto_total	decimal(12, 2),
	total		char(1),
	tipo		char(1)

	primary key (documento),
	
);

grant all on pagos to public;

-- Detalle Pago CXC
create table detalle_pago
   (documento	char(12),
	factura		char(12),
	monto		decimal(12, 2),

	primary key (documento),
	foreign key (documento) references pagos(documento),
	foreign key (factura) references facturas_credito(documento)
);

grant all on detalle_pago to public;


-------------------------------- NUEVO -----------------------------------------------------
create table orden_cobro
(
	documento		char(12),
	cliente			char(5),
	fecha_registro	datetime,
	fecha_cobro 	char(1),
	hora_ini		time,
	hora_fin		time,
	monto			decimal(12,2),
	estado			char(1)

	primary key (documento)
);

grant all on orden_cobro to public;


create table orden_vs_cobrador
(
	documento	char(12),
	cobrador	char(5),
	orden		int

	primary key (documento),
	foreign key (documento) references orden_cobro(documento)
);

grant all on orden_vs_cobrador to public;


create table monto_recibido
(
	documento	char(12),
	monto		decimal(12,2)

	primary key (documento),
	foreign key (documento) references orden_cobro(documento)
);

grant all on monto_recibido to public;

create table orden_vs_pagos
(
	NL				  int,
	documento_orden   char(12),
	documento_pago    char(12)
	
	primary key (NL),
	foreign key (documento_orden) references orden_cobro(documento),
	foreign key (documento_pago) references pagos(documento)
);
grant all on orden_vs_pagos to public;