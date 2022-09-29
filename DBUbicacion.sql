create database DBUbicacion;
	use DBUbicacion;

	create table Pais(
		IdPais int(253) not null auto_increment,
		Pais varchar(25) not null,
		primary key(IdPais)
		);
	create table Departamento(
		IdDepartamento int(253) not null auto_increment,
		Departamento varchar(25) not null,
		IdPais int(253) not null ,
		primary key(IdDepartamento),
		FOREIGN KEY (IdPais) REFERENCES Pais(IdPais)
		);

	create table Ciudad(
		IdCiudad int(253) not null auto_increment,
		Ciudad varchar(25) not null,
		IdDepartamento int(253) not null,
		PRIMARY KEY(IdCiudad),
		FOREIGN KEY (IdDepartamento) REFERENCES Departamento(IdDepartamento)
		);


);