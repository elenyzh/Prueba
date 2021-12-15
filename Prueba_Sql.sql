CREATE TABLE aerolineas (
id_aerolinea SERIAL,
nombre_aerolinea  VARCHAR(20),
PRIMARY KEY (id_aerolinea)
);

CREATE TABLE aeropuertos (
id_aeropuerto SERIAL,
nombre_aeropuerto VARCHAR(20),
PRIMARY KEY (id_aeropuerto)
);

CREATE TABLE movimientos (
id_movimiento SERIAL,
descripcion  VARCHAR(10),
PRIMARY KEY (id_movimiento)
);

CREATE TABLE vuelos (
id_aerolinea INT,
id_aeropuerto INT,
id_movimiento INT,
dia DATE,
CONSTRAINT id_aerolinea FOREIGN KEY(id_aerolinea) REFERENCES aerolineas(id_aerolinea),
CONSTRAINT id_aeropuerto FOREIGN KEY(id_aeropuerto) REFERENCES aeropuertos(id_aeropuerto),
CONSTRAINT id_movimiento FOREIGN KEY(id_movimiento) REFERENCES movimientos(id_movimiento)
);

SELECT * FROM aerolineas;
SELECT * FROM aeropuertos;
SELECT * FROM movimientos;
SELECT * FROM vuelos;


INSERT INTO aerolineas(nombre_aerolinea) VALUES ('Volaris');
INSERT INTO aerolineas(nombre_aerolinea) VALUES ('Aeromar');
INSERT INTO aerolineas(nombre_aerolinea) VALUES ('Interjet');
INSERT INTO aerolineas(nombre_aerolinea) VALUES ('Aeromexico');

INSERT INTO aeropuertos (nombre_aeropuerto) VALUES ('Benito Juarez');
INSERT INTO aeropuertos (nombre_aeropuerto) VALUES ('Guanajuato');
INSERT INTO aeropuertos (nombre_aeropuerto) VALUES ('La Paz');
INSERT INTO aeropuertos (nombre_aeropuerto) VALUES ('Oaxaca');

INSERT INTO movimientos (descripcion) VALUES ('Salida');
INSERT INTO movimientos (descripcion) VALUES ('Llegadas');

INSERT INTO vuelos VALUES (1,1,1,'2021-05-02');
INSERT INTO vuelos VALUES (2,1,1,'2021-05-02');
INSERT INTO vuelos VALUES (3,2,2,'2021-05-02');
INSERT INTO vuelos VALUES (4,3,2,'2021-05-02');
INSERT INTO vuelos VALUES (1,3,2,'2021-05-02');
INSERT INTO vuelos VALUES (2,1,1,'2021-05-02');
INSERT INTO vuelos VALUES (2,3,1,'2021-05-04');
INSERT INTO vuelos VALUES (3,4,1,'2021-05-04');
INSERT INTO vuelos VALUES (3,4,1,'2021-05-04');


SELECT id_aerolinea, count(dia) FROM vuelos group by id_aerolinea
 HAVING count(dia) = (SELECT MAX(cont) FROM (select id_aerolinea, count(dia) cont from vuelos group by id_aerolinea)t)

SELECT id_aeropuerto, count (dia) FROM vuelos GROUP BY id_aeropuerto ORDER BY COUNT(dia) DESC; 

SELECT id_aerolinea, count (*) FROM vuelos GROUP BY id_aerolinea ORDER BY COUNT(*) DESC; 

select dia, count(*) from vuelos group by dia ;

SELECT id_aerolinea, count(*) FROM vuelos group by id_aerolinea
HAVING count(*) = (SELECT MAX(cont) FROM (select id_aerolinea, count(*) cont from vuelos group by id_aerolinea)t)


SELECT  MAX(cont) FROM
    ( SELECT dia, COUNT(*) cont
      FROM vuelos
      GROUP BY dia ) t;


SELECT id_aerolinea, count (*) FROM vuelos 
 GROUP BY id_aerolinea  HAVING count(*) > 2;

 
SELECT id_aerolinea, dia, count(dia) FROM vuelos 
 GROUP BY id_aerolinea having count(dia) >2

 
SELECT id_aerolinea from (select id_aerolinea,dia, count(*)  from vuelos group by id_aerolinea,dia having count(*) >=2) t  group by id_aerolinea 
select id_aerolinea,dia, count(dia) cont from vuelos group by id_aerolinea,dia

 /*Respuesta a la Pregunta numero 1 aeropuerto mayor movimiento durante el año*/
  SELECT nombre_aeropuerto from aeropuertos where id_aeropuerto in (SELECT id_aeropuerto FROM vuelos group by id_aeropuerto
 HAVING count(dia) = (SELECT MAX(cont) FROM (select id_aeropuerto, count(dia) cont from vuelos group by id_aeropuerto)t))

 /*Resuesta a la Pregunta numero 2 aerolinea mayor movimiento durante el año*/
   SELECT nombre_aerolinea from aerolineas where id_aerolinea in (SELECT id_aerolinea FROM vuelos group by id_aerolinea
 HAVING count(dia) = (SELECT MAX(cont) FROM (select id_aerolinea, count(dia) cont from vuelos group by id_aerolinea)t))
  
/*Respuesta a la Pregunta numero 3 dia con mayor numero de vuelos*/
SELECT dia FROM vuelos group by dia
 HAVING count(*) = (SELECT MAX(cont) FROM (SELECT dia, count(*) cont FROM vuelos GROUP BY dia)t)

/*Respuesta a la Pregunta numero 4 erolineas que tienen más de dos vuelos por dia*/
SELECT nombre_aerolinea FROM aerolineas WHERE id_aerolinea IN (SELECT id_aerolinea from 
       (select id_aerolinea,dia, count(*)  from vuelos group by id_aerolinea,dia having count(*) > 2) t  group by id_aerolinea );

