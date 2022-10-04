create database usuarios;
	use usuarios;

	#creacion tipo de area
	create table TipoArea(
		IdTipoArea int(253) not null auto_increment,
		Area varchar(20) not null,
		primary key(IdTipoArea)
		);

	create table Empleado(
		Cedula Bigint(253) not null,
		IdTipoArea int(253) not null,
		IdCiudad int(253) not null,
		Edad int(253) not null,
		PrimerNombre varchar(10) not null,
		SegundoNombre varchar(10) not null,
		Eps Varchar(20)not null,
		Arl varchar(20) not null,
		FechaNacimiento date not null,
		FechaInicio date not null,
		AñosAntiguedad int(253) not null,
		Activo boolean not null default True,
		primary key(Cedula),
		Foreign key (IdTipoArea) references TipoArea(IdTipoArea)
		);	


#Creacion tabla tipo rol
	create table TipoRol(
		IdRol int not null auto_increment,
		Rol varchar(20) not null,
		primary key(IdRol)
		);	


#Creacion tabla Usuario
	create table Usuario(
		IdUsuario int(253) not null auto_increment,
		IdEmpleado Bigint(253) not null,
		Username varchar(15) not null,
		Password varchar(50) not null,
		IdTipoRol int(253) not null,
		primary key(IdUsuario),
		Foreign key (IdEmpleado) references Empleado(Cedula),
		Foreign key (IdTipoRol) references TipoRol(IdTipoRol)
		);



	create table CostoManoObraDirecta(
		IdCostoMObra int(253) not null auto_increment,
		IdEmpleado Bigint(253) not null,
		IdArea int(253) not null,
		Sueldo Bigint(253) not null,
		AuxilioTransporte Bigint(253) not null,
		OtrosIngresos Bigint(253) not null,
		ComisionesBase Bigint(253) not null,
		TotDeducido Bigint(253) not null,
		Pension Bigint(253) not null,
		Riesgos Bigint(253) not null,
		Comfaboy Bigint(253) not null,
		Cesantias Bigint(253) not null,
		InteresCesantias Bigint(253) not null default 0,
		Prima Bigint(253) not null,
		GastoTotal Bigint(253) not null,
		ValorSemana Bigint(253) not null,
		ValorDia Bigint(253) not null,
		ValorHora Bigint(253) not null,
		primary key(IdCostoMObra),
		Foreign key	(IdEmpleado) REFERENCES Empleado(Cedula),
		Foreign KEY (IdArea) references TipoArea(IdTipoArea)
		);

