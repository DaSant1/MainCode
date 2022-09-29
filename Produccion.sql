create database Produccion;
	use Produccion;

	create table EstandarProduccion(
		IdEstandarProduccion int(253) not null auto_increment,
		IdProducto int(253) not null,
		NCavidades int(4) not null default 1,
		Densidad float(100) not null,
		Volumen int(253) not null,
		CargaEstandar Bigint(253) not null,
		RelacionMezcla float(50) not null,
		primary key(IdEstandarProduccion),
		);

	create table EstandarUsoInsumosEstimado(
		IdEstandarUsoInsumo int(253) not null auto_increment,
		IdEstandarProduccion int(253) not null,
		IdInsumoHijo int(253) not null,
		RelacionUnitaria float(100) not null,
		Cantidad int(253) not null,
		IdTipoMedida int(253) not null,
		LimiteInferior int(253) not null,
		LimiteSuperior int(253) not null,
		primary key(IdEstandarUsoInsumo),
		Foreign key(IdEstandarProduccion) references EstandarProduccion(IdEstandarProduccion)
		); 

	create table OrdenProduccion(
		IdOrdenProduccion int(253) not null auto_increment,
		IdCliente int(253) not null,
		IdProducto int(253) not null,
		FechaEntrada timestamp not null,
		FechaSalidaEstimada timestamp not null,
		CantidadPedida int(253) not null,
		OrdenProduccionCliente varchar(253) not null,
		primary key (IdOrdenProduccion)
		);

	create table OrdenesAtrasadas(
		IdOrdenAtrasada int(253) not null,
		IdOrdenProduccion int(253) not null default 0,
		Razon varchar(50) not null,
		FechaAtraso timestamp not null,
		NuevaFechaReprogramacion date not null,
		primary key(IdOrdenAtrasada),
		Foreign key(IdOrdenProduccion) references OrdenProduccion(IdOrdenProduccion)
		);

	create table EmpleadoProduccion(
		IdEmpleadoProduccion int(253) not null,
		IdProduccion int(253) not null,
		Foreign key (IdProduccion) references Produccion(IdProduccion)
		);



	create table EstadoProduccion(
		IdEstado int(253) not null auto_increment,
		Estado varchar(253)not null,
		primary key(IdEstado)
		);


	create table Produccion(
		IdProduccion int(253)  not null auto_increment,
		IdOrdenProduccion int(253) not null,
		IdCliente int(253) not null,
		CantidadProducida int(253) not null,
		CantidadAProducir int(253) not null,
		FechaInicio date not null,
		FechaFin date not null,
		Lote varchar(20) not null,
		DuracionDias int(99) not null,
		IdEstado int(253) not null,
		CargaEstandar int(253) not null,
		OrdenProduccionCliente varchar(40) not null,
		primary key(IdProduccion),
		Foreign key(IdOrdenProduccion) references OrdenProduccion(IdOrdenProduccion),
		Foreign key(IdEstado) references EstadoProduccion(IdEstado) 
		);



	create table ProduccionUnitaria(
		IdProduccionUnitaria int(253) not null auto_increment,
		IdProduccion int(253) not null,
		IdCliente int(253) not null,
		Conforme boolean not null,
		Fecha timestamp not null,
		IdEmpleado int(253) not null,
		Maquina int(253) not null,
		primary key(IdProduccionUnitaria),
		Foreign key(IdProduccion) references Produccion(IdProduccion)
		);

	create table UsoInsumosReal(
		IdConsumoReal int(253) not null auto_increment,
		IdInventarioGeneralMateriaPrima int(253) not null,
		IdProduccion int(253) not null,
		IdInsumoHijo int(253) not null,
		CantidadUnitaria int(253) not null,
		CantidadTotal int(253) not null,
		Fecha timestamp not null,
		RelacionUnitaria float(50) not null,
		NumeroOrdenCliente varchar(30)  null,
		primary key(IdConsumoReal),
		Foreign key IdProduccion references Produccion(IdProduccion),
		);

	create table TiempoInyeccionEnUsoRealInsumo(
		IdTiempoInyeccion int(253) not null,
		IdProduccion int(253) not null,
		TiempoInyeccion float(50) null
		CargaMaquila int(253) not null default 0,
		Carga int(253) not null default 0,
		DiferenciaReal int(253) not null default 0,
		primary key(IdTiempoInyeccion),
		Foreign key IdProduccion references Produccion(IdProduccion)
		);

	create table RazonExceso(
		IdRazonExceso int(253) not null auto_increment,
		Razon varchar(50) not null,
		primary key (IdRazon)
		);

	create table ExcesoUsoMateriasPrimas(
		IdExceso int(253) not null auto_increment,
		IdProduccion int(253) not null,
		IdCliente int(253) not null,
		IdUsoInsumoReal int(253) not null,
		Cantidad int(253) not null,
		IdTipoMedida int(253) not null,
		IdRazonExceso int(253) not null,
		NumeroOrdenCliente varchar(40) not null,
		FechaExceso timestamp not null,
		primary key(IdExceso),
		Foreign key(IdProduccion) references Produccion(IdProduccion),
		Foreign key(IdUsoInsumoReal) references UsoInsumosReal(IdConsumoReal),
		Foreign key (IdRazonExceso) references Razon(IdRazonExceso)
		);
