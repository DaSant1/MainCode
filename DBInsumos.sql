create database Insumos;
	use Insumos;

	create table TipoMedida(
		IdTipoMedida int(253) not null auto_increment,
		TipoMedida varchar(25) not null,
		primary key(IdTipoMedida),
		);

	
	create table InsumoPadre(
		IdInsumo int(253) not null auto_increment,
		IdTipoMedida int(253) not null,
		primary key(IdInsumo),
		);



#Foreign key insumo padre y tipo medida
	Alter table InsumoPadre add Constraint FkMedidaPadre foreign key(IdTipoMedida)
	references TipoMedida(IdTipoMedida);

	create table InsumoHijo(
		IdInsumoHijo int(253) not null auto_increment,
		IdPadre int(253) not null,
		IdDescripcion int(253) not null, #viene de la base de datos de productos
		IdTipoMedida int(253) not null,
		Insumo varchar(35) not null,
		primary key(IdInsumo)
		); 
#Foreign key Insumo Padre 
	Alter table InsumoHijo Add Constraint FKInsumoHijo foreign key(IdPadre)
	references InsumoPadre(IdInsumo);

#foreign ket tipo medida
	alter table InsumoHijo add Constraint FkTipoMedidaHijo foreign key(IdTipoMedida)
	reference(s TipoMedida(IdTipoMedida);
	
		create table Proveedor(
			IdProveedor int(253) not null,
			Nit  Bigint(253) not null,
			NombreProveedor varchar(40) not null,
			IdCiudad int(253) not null,
			Direccion varchar(60) not null,
			Telefono varchar(15) not null,
			primary key(IdProveedor)
		);

	create table EstandarCompraInsumosProveedor(
		IdEstandarCompraInsumosProveedor int(253) not null auto_increment,
		IdInsumoHijo int(253) not null,
		IdProveedor int(253) not null,
		primary key(IdEstandar),
		foreign key	IdInsumoHijo references InsumoHijo (IdInsumoHijo),
		foreign key( IdProveedor) references Proveedor(IdProveedor)
		);


	create table CompraMateriaPrimaEmpresa(
		IdCompraEmpresa int(253) not null auto_increment,
		Cantidad int(253) not null,
		IdEstandarCompraInsumosProveedor int(253) not null,
		CostoUnitario Bigint not null,
		FechaCompra timestamp not null,
		FechaLLegadaEstimada timestamp not null,
		CostoTotal int(253) not null,
		primary key(IdCompraEmpresa),
		foreign key IdEstandarCompraInsumosProveedor references 
		EstandarCompraInsumosProveedor(IdEstandarCompraInsumosProveedor),
		);

	create table EntregaMateriaPrimaCliente(
		IdEntregaMP int(253) not null auto_increment,
		IdCliente int(253)  not null,
		IdInsumoHijo int(253) not null,
		IdTipoMedida int(253) not null,
		Cantidad  int(253) not null,
		Fecha timestamp int not null,
		primary key(IdEntregaMP),
		foreign key (IdInsumoHijo) references InsumoHijo(IdInsumoHijo),
		foreign key (IdTipoMedida) references TipoMedida(IdTipoMedida)
		);

	create table InventarioGeneralMateriaPrima(
		IdInventarioMateriaPrima int(253) not null,
		IdCompraEmpresa int(253) not null default 0,
		IdInsumoHijoEntregaCliente int(253) not null default 0,
		Cantidad int(253) not null,
		Bodega int(253) not null,
		Fecha date not null,
		IdTipoMedida int(253) not null,
		primary key(IdInventarioMateriaPrima),
		foreign key (IdCompraEmpresa) references CompraMateriaPrimaEmpresa(IdCompraEmpresa),
		foreign key(IdInsumoHijoEntregaCliente) references EntregaMateriaPrimaCliente(IdEntregaMP),
		foreign key(IdTipoMedida) references TipoMedida(IdTipoMedida)
		);
