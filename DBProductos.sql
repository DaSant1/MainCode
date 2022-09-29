#Base de datos productos

create database Productos;
	use Productos;

	create table DescripcionProducto(
		IdDescripcion int(253) not null auto_increment,
		Descripcion varchar(50)not null default "no aplica",
		primary key(IdDescripcion)
		);

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
		IdDescripcion int(253) not null default 0,
		primary key(IdProducto),
		Foreign key	(IdTipoFamilia) REFERENCES TipoFamilia(IdTipoFamilia),
		Foreign key(IdTipoLinea) REFERENCES TipoLinea(IdTipoLinea),
		Foreign key (IdDescripcion) references DescripcionProducto(IdDescripcion)
		);
	create table ValProductClient(
		IdValor int(253) not null,
		IdCliente int(253) not null,
		IdProducto int(253) not null,
		Precio Bigint(253) not null,
		primary key(IdValor),
		Foreign key(IdProducto) REFERENCES Productos(IdProducto)
		);