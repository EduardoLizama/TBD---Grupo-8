create table if not exists COMUNA
    (ID_COMUNA int primary key,
    NOMBRE_COMUNA varchar(20));    
    
create table if not exists ADMINISTRADOR
    (ID_ADMINISTRADOR int primary key,
    NOMBRE_ADMINISTRADOR varchar(20));
    
create table if not exists GASTO_EDIFICIO
    (ID_GASTO_EDIFICIO int primary key,
    MONTO int); 

create table if not exists EDIFICIO
    (ID_EDIFICIO int primary key,
    NOMBRE_EDIFICIO varchar(20),
    ID_ADMINISTRADOR int,
    ID_COMUNA int,
    CANTIDAD_PISOS int,
    FOREIGN KEY (ID_ADMINISTRADOR) REFERENCES ADMINISTRADOR(ID_ADMINISTRADOR),
    FOREIGN KEY (ID_COMUNA) REFERENCES COMUNA(ID_COMUNA));
    
create table if not exists PAGO_GASTO_EDIFICIO
    (ID_PAGO_GASTO_EDIFICIO int primary key,
    FECHA_EMISION date,
    ID_GASTO_EDIFICIO int,
    ID_EDIFICIO int,
    MOROSIDAD boolean,
    FOREIGN KEY (ID_GASTO_EDIFICIO) REFERENCES GASTO_EDIFICIO(ID_GASTO_EDIFICIO),
    FOREIGN KEY (ID_EDIFICIO) REFERENCES EDIFICIO(ID_EDIFICIO));
   
create table if not exists TIPO_DEPTO
    (ID_TIPO_DEPTO int primary key,
    NOMBRE_TIPO_DEPTO varchar(20),
    DIMENSION int);
 
create table if not exists TIPO_GG
    (ID_TIPO_GG int primary key,
    MONTO_BASE int,
    ID_TIPO_DEPTO int,
    FOREIGN KEY (ID_TIPO_DEPTO) REFERENCES TIPO_DEPTO(ID_TIPO_DEPTO));

create table if not exists GASTO_COMUN
    (ID_GASTO_COMUN int primary key,
    ID_EDIFICIO int,
ID_TIPO_GG int,
    MONTO int,
    FOREIGN KEY (ID_EDIFICIO) REFERENCES EDIFICIO(ID_EDIFICIO),
FOREIGN KEY (ID_TIPO_GG) REFERENCES TIPO_GG(ID_TIPO_GG)); 

    
create table if not exists DEPTO
    (ID_DEPTO int primary key,
    HABITANTES int,
    PISO int,
    ID_EDIFICIO int,
    ID_TIPO_DEPTO int,
    FOREIGN KEY (ID_EDIFICIO) REFERENCES EDIFICIO(ID_EDIFICIO),
    FOREIGN KEY (ID_TIPO_DEPTO) REFERENCES TIPO_DEPTO(ID_TIPO_DEPTO));
    
create table if not exists PAGO_GG_DEPTO
    (ID_PAGO_GG_DEPTO int primary key,
    FECHA_EMISION date,
    ID_DEPTO int,
    ID_GASTO_COMUN int,
    MOROSIDAD boolean,
    FOREIGN KEY (ID_DEPTO) REFERENCES DEPTO(ID_DEPTO),
    FOREIGN KEY (ID_GASTO_COMUN) REFERENCES GASTO_COMUN(ID_GASTO_COMUN));
