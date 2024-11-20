CREATE SCHEMA IF NOT EXISTS practica_huamani;
USE practica_huamani;

DROP TABLE IF EXISTS cliente;
create table cliente(dni VARCHAR(8) PRIMARY KEY, nombre_cliente VARCHAR(20), apellidos VARCHAR(50), email VARCHAR(50), tipo_cliente VARCHAR(20), localidad VARCHAR(20), direccion_cl VARCHAR(30));
DROP TABLE IF EXISTS departamento;
create table departamento (nombre_departamento VARCHAR(20) PRIMARY KEY, email VARCHAR(20));
DROP TABLE IF EXISTS empleado;
create table empleado (dni VARCHAR(8) PRIMARY KEY, nombre VARCHAR(20), apellidos VARCHAR(20), email VARCHAR(30), telefono VARCHAR(9), direccion_emp VARCHAR(50), salario DOUBLE, departamento VARCHAR(20), FOREIGN KEY(departamento) REFERENCES departamento(nombre_departamento) ON DELETE CASCADE ON UPDATE CASCADE);
DROP TABLE IF EXISTS producto;
create table producto (nombre_producto VARCHAR(20), descripcion VARCHAR(30), tamaño_producto VARCHAR(20), tipo_papel VARCHAR(20), impresion VARCHAR(20), acabado VARCHAR(20), empleado VARCHAR(8), FOREIGN KEY(empleado) REFERENCES empleado(dni) ON DELETE CASCADE ON UPDATE CASCADE);
DROP TABLE IF EXISTS factura;
create table factura(n_factura INT PRIMARY KEY, pago VARCHAR(20), importe DOUBLE, envio VARCHAR(20), cliente VARCHAR(8), producto VARCHAR(20), FOREIGN KEY(cliente) REFERENCES cliente(nombre_cliente) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY(producto) REFERENCES producto(nombre_producto ON DELETE CASCADE ON UPDATE CASCADE);

insert into cliente values('78559966', 'Sofia', 'Diaz Perez', 'sofdp@gmail.com', 'FRECUENTE', 'Santa', 'ca. 23 mz. 2 lt. 3'), ('78229966', 'Carlos', 'Maza Acuña', 'car44@gmail.com', 'FRECUENTE', 'Nvo. Chimbote', 'av. pacifico mz. A2 lt. 23'), ('32449966', 'Ana', 'Alva Bueno', 'anaab@gmail.com', 'POCO FRECUENTE', 'Nv. Chimbote', 'Cipreces mz. T lt. 2');

insert into departamento values('INVESTIGACION', 'inve@emp.com'), ('REPORTES', 'inve@emp.com'), ('TAREAS', 'inve@emp.com');

insert into empleado values('78559911', 'Alan', 'Morales Diaz', 'alan@gmail.com', '987654321', 'Santa ca.23 lt. 23',1200, 'INVESTIGACION'), ('78119911', 'Amanda', 'Mora Lia', 'mora@gmail.com', '922654321', 'Av. Pacifico 123',1200, 'TAREAS'), ('22459911', 'Karla', 'Caceres Bueno', 'karc@gmail.com', '987225321', 'Av. Pacifico 553',1100, 'INVESTIGACION');

insert into producto values('PRODUCTO1', 'Tarea2', 'pequeño', 'A4', '2', 'Liso', '78559911'), ('PRODUCTO2', 'Tarea3', 'pequeño', 'A4', '2', 'Mate', '78559911'), ('PRODUCTO3', 'Investigacion3', 'mediano', 'carta', '3', 'Liso', '22459911');

insert into factura values('11', 'EFECTIVO', 50, 'LUNES', '78559966', 'PRODUCTO1'), ('21', 'EFECTIVO', 70, 'LUNES', '78559966', 'PRODUCTO2'), ('22', 'EFECTIVO', 90, 'MARTES', '32449966', 'PRODUCTO3');

COMMIT;
