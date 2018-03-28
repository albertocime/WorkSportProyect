create database pruebas28marzode18;
use pruebas28marzode18;
create table convocatoria ( 
idconvocatoria int(3) not null auto_increment,
Nombre varchar(25) not null,
Fecha_inicio date not null, 
Fecha_fin date not null, 
Num_equipos int (3) not null,
tipo_Categoria bit not null,
tipo_convocatoria varchar(25) not null,
Num_torneos int(2) not null,
primary key (idconvocatoria));
 
 
create table equipo(
idequipo int(3) not null auto_increment,
Nombre varchar(25) not null,
Cantidad_Jugadores int(2) not null,
partidos_jugados int(2) not null,
Goleador varchar (25),
ranking int (2) not null,
partidos_ganados int (2),
partidos_perdidos int (2),
Idconvocatoria int(3),
Nombre_expulsado varchar(20),
primary key (idequipo),
foreign key (Idconvocatoria) references convocatoria(idconvocatoria));




create table usuario(
Id_usuario int (3) not null auto_increment,
username varchar (30) not null,
contraseña varchar (25),
primary key (Id_usuario));





create table persona (
matricula int(8) not null,
Nombre varchar(20) not null,
Apelido_Paterno varchar(25) not null,
Apelido_Materno varchar(25)not null,
Correo_Electronico varchar(40),
Telefono varchar(16),
Genero bit not null,
tipo_persona int(3),
id_usuario int (3) not null,
Idequipo int(3) not null,
Idconvocatoria int(3) not null,
primary key (matricula),
foreign key (Idequipo) references equipo(idequipo),
foreign key (id_usuario) references usuario(Id_usuario),
foreign key (Idconvocatoria) references convocatoria(idconvocatoria));

create table division(
iddivision int(3) not null auto_increment,
Nombre varchar(25) not null,
Tipo_division varchar(30) not null,
primary key (iddivision));

create table carrera(
idcarrera int(3) not null auto_increment,
Nombre varchar(25) not null,
Edificio varchar(15) not null,
Iddivision int(3) not null,
primary key (idcarrera),
foreign key (Iddivision) references division(iddivision));

create table jugadores(
matricula int(8) not null,
Nombre varchar(25) not null,
Apelido_Paterno varchar(30) not null,
Apelido_Materno varchar(30) not null,
Posicion varchar(15) not null,
Dorsal int(2) not null,
Genero bit not null,
Condicion bit not null,
Partidos_Jugados int(10),
Idequipo int(3) not null,
Iddivision int(3) not null,
primary key (matricula),
foreign key (Idequipo) references equipo(idequipo),
foreign key (Iddivision) references division(iddivision));

create table estadisticas(
idestadisticas int(3) not null auto_increment,
Total_Goles int(2),
Total_Faltas int(2),
Total_Penales int(2),
Expulsados int(2),
primary key (idestadisticas));

create table Estadisticas_Equipos(
Idestadisticas int(3) not null,
Idequipo int(3) not null,
primary key (Idestadisticas,Idequipo),
foreign key (Idestadisticas) references estadisticas(idestadisticas),
foreign key (Idequipo) references equipo(idequipo));

create table instalaciones(
idinstalacion int(3) not null auto_increment,
Nombre varchar(25) not null,
Ubicacion varchar(60) not null,
Tipo_Cancha varchar(20),
primary key (idinstalacion));

create table arbitro(
idarbitro int(3) not null auto_increment,
Nombre varchar(25) not null,
Apelido_Paterno varchar(30) not null,
Apelido_Materno varchar(30) not null,
Genero bit not null,
primary key (idarbitro));

create table partido(
idpartido int(3) not null auto_increment,
Duracion datetime,
Hora_Inicio datetime,
Hora_Fin datetime,
Dia_Partido date,
Resultado varchar(10),
Idarbitro int(3) not null,
primary key (idpartido),
foreign key (Idarbitro) references arbitro(idarbitro));

create table Instalacion_Partidos(
Idinstalacion int(3) not null,
Idpartido int(3) not null,
primary key (Idinstalacion, Idpartido),
foreign key (Idinstalacion) references instalaciones(idinstalacion),
foreign key (Idpartido) references partido(idpartido));

create table Equipo_Partido(
Idequipo int(3) not null,
Idpartido int(3) not null,
primary key (Idequipo, Idpartido),
foreign key (Idequipo) references equipo(idequipo),
foreign key (Idpartido) references partido(idpartido));

create table Estadistica_Partido(
Idestadisticas int(3) not null,
Idpartido int(3) not null,
primary key (Idestadisticas, Idpartido),
foreign key(Idestadisticas) references estadisticas(idestadisticas),
foreign key (Idpartido) references partido(idpartido));

create table torneo (
idtorneo int(3) not null auto_increment,
Nombre varchar(20) not null,
Fecha_inicio date, 
Fecha_fin date, 
Num_Equipos int(2),
Idconvocatoria int(3) not null,
primary key (idtorneo),
foreign key(Idconvocatoria) references convocatoria(idconvocatoria));

create table Torneo_Instalacion(
Idinstalacion int(3) not null,
Nom_Insta varchar(20) not null,
Idtorneo int(3) not null,
primary key (Idinstalacion, Idtorneo),
foreign key (Idinstalacion) references instalaciones(idinstalacion),
foreign key (Idtorneo) references torneo(idtorneo));

create table Estadisticas_Jugador(
Idestadisticas int(3) not null,
Idjugador int(8) not null,
primary key (Idestadisticas,Idjugador),
foreign key (Idestadisticas) references estadisticas(idestadisticas),
foreign key (Idjugador) references jugadores(matricula));
