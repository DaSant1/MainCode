create database usuarios;
	use usuarios;

	create table Empleado(
		Cedula Bigint not null,
		IdTipoArea int not null,
		IdCiudad int not null,
		Edad int not null,
		PrimerNombre varchar(10) not null,
		SegundoNombre varchar(10) not null,
		Eps Varchar(20)not null,
		Arl varchar(20) not null,
		FechaNacimiento date not null,
		FechaInicio date not null,
		AñosAntiguedad int not null,
		Activo bool not null default True,
		primary key(Cedula)
		);	


#Creacion tabla Usuario
	create table Usuario(
		IdUsuario int(253) not null,
		IdEmpleado Bigint(253) not null,
		Username varchar(15) not null,
		Password varchar(50) not null,
		IdTipoRol int not null,
		primary key(IdUsuario)
		Foreign key (IdEmpleado) references Empleado(Cedula)
		);

#Foreign key entre Cedula e IdEmpleado
Alter table Usuario add Constraint FkIdEmpleado foreign key(IdEmpleado)
references Empleado(Cedula);


#Creacion tabla tipo rol
	create table TipoRol(
		IdRol int not null,
		Rol varchar(20) not null
		primary key(IdRol)
		);	

#foreign key entre IdTipo Rol de Usuarios y IdRol de Rol
	alter table Usuario add Constraint FkIdRol foreign key(IdTipoRol)
	references TipoRol (IdRol);

#creacion tipo de area
	create table TipoArea(
		IdTipoArea int(253) not null,
		Area varchar(20) not null,
		primary key(IdTipoArea)
		);

#foreign key entre IdArea de Empleado y IdTipoArea de Area
	alter table Empleado add Constraint FkIdArea foreign key(IdTipoArea)
	references TipoArea(IdTipoArea);	
