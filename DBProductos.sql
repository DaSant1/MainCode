 #Base de datos productos

create database Productos;
	use Productos;


	create table TipoLinea(
		IdTipoLinea int(253) not null auto_increment,
		TipoLinea varchar(30) not null default "no aplica",
		primary key(IdTipoLinea)
		);

	create table TipoFamilia(
		IdTipoFamilia int(253) not null auto_increment,
		TipoFamilia varchar(40) not null default "no aplica",
		primary key(IdTipoFamilia)
		);

	create table Productos(
		IdProducto int(253) not null auto_increment,
		IdTipoFamilia int(253) not null default 0,
		IdTipoLinea int(253) not null default 0,
		IdDescripcion varchar() not null,
		NombreProducto varchar(50) not null,
		primary key(IdProducto),
		Foreign key	(IdTipoFamilia) REFERENCES TipoFamilia(IdTipoFamilia),
		Foreign key(IdTipoLinea) REFERENCES TipoLinea(IdTipoLinea)
		);
	create table ValProductClient(
		IdValor int(253) not null,
		IdCliente int(253) not null,
		IdProducto int(253) not null,
		Precio Bigint(253) not null,
		primary key(IdValor),
		Foreign key(IdProducto) REFERENCES Productos(IdProducto)
		);