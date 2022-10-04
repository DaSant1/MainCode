create database Insumos;
	use Insumos;

	create table TipoMedida(
		IdTipoMedida int(253) not null auto_increment,
		TipoMedida varchar(25) not null,
		primary key(IdTipoMedida)
		);

	
	create table InsumoPadre(
		IdInsumo int(253) not null auto_increment,
		IdTipoLinea int(253) not null,
		InsumoPadre varchar(30) not null,
		primary key(IdInsumo)
		);

	create table InsumoHijo(
		IdInsumoHijo int(253) not null auto_increment,
		IdPadre int(253) not null,
		IdDescripcion int(253) not null, #viene de la base de datos de productos
		IdTipoMedida int(253) not null,
		Insumo varchar(35) not null,
		primary key(IdInsumoHijo),
		foreign key (IdTipoMedida) references TipoMedida(IdTipoMedida),
		foreign key(IdPadre) references InsumoPadre(IdInsumo)
		); 
	
		create table Proveedor(
			IdProveedor int(253) not null auto_increment,
			Nit  Bigint(253) not null,
			NombreProveedor varchar(40) not null,
			IdCiudad int(253) not null,
			Direccion varchar(60) not null default "Desconocida",
			Telefono varchar(15) not null ,
			primary key(IdProveedor)
		);

	create table EstandarCompraInsumosProveedor(
		IdEstandarCompraInsumosProveedor int(253) not null auto_increment,
		IdInsumoHijo int(253) not null,
		IdProveedor int(253) not null,
		primary key(IdEstandarCompraInsumosProveedor),
		foreign key	(IdInsumoHijo) references InsumoHijo (IdInsumoHijo),
		foreign key(IdProveedor) references Proveedor(IdProveedor)
		);


	