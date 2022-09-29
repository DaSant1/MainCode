#Creacion de bases de datos de cliente
create database Clientes;
	use Clientes;

create table InfoTributacion(
	IdTributacion int(253) not null,
	TipoTributacion varchar(14) not null,
	primary key(IdTributacion)
);

create table CLiente(
	IdCliente int(253) not null,
	Nit Bigint(253) not null default 0,
	Nombre varchar(24) not null,
	Correo varchar(30) not null,
	IdCiudad int(253) not null
	primary key	(IdCliente)
);

create table Clientes_InfoTributacion(
	IdCliente int(253) not null,
	IdTributacion int(253) not null,
	Foreign key(IdCliente) references Cliente(IdCliente),
	Foreign key(IdTributacion) references InfoTributacion(IdTributacion)
);