create database Despachos;
	use Despachos;


	create table AutorizacionSalida(
		IdAutorizacion int(253) not null auto_increment,
		IdCliente int(253) not null,
		IdEmpleado int(253) not null,
		IdInvProductosTerminados int(253) not null,
		FechaAutorizacion timestamp not null,
		Autorizacion boolean not null default True,
		Comentario varchar(253) not null,
		IdPedido int(253) not null,
		primary key	(IdAutorizacion) 
 		);


	create table DespachosAtrasados(
		IdAtraso int(253) not null auto_increment,
		IdInvProductosTerminados int(253) not null,
		IdCliente int(253) not null,
		CantidadRetrasada int(253) not null,
		FechaAtraso timestamp not null,
		NuevaFechaReprogramacion date not null,
		primary key(IdAtraso)
		);

	create table IdTransportadora(
		IdTransportadora int(253) not null,
		Transportadora varchar(30) not null,
		primary key(IdTransportadora)
		);

	create table DespachosClientes(
		IdDespacho int(253) not null auto_increment,
		IdAutorizacionSalida int(253) not null,
		IdInvProductosTerminados int(253) not null,
		IdValProductClient int(253) not null,
		IdCliente int(253) not null,
		CantidadPedida int(253) not null,
		ValorTotal BigInt(253) not null,
		IdTransportadora int(253) not null,
		CantidadCajas int(253) not null,
		Factura varchar(30) not null,
		Remision varchar(30) not null,
		FechaPedido date not null,
		FechaDespacho timestamp not null,
		primary key(IdDespacho),
		foreign key IdAutorizacionSalida references AutorizacionSalida(IdAutorizacion),
		Foreign key IdCliente references AutorizacionSalida(IdCliente),
		Foreign key IdInvProductosTerminados references AutorizacionSalida(IdInvProductosTerminados)
		);