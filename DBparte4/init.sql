/*
Realiza un bulk insert para rellenar las tablas con los siguientes datos
Categorías:

id	nombre
1	Electrónicos
2	Ropa
3	Hogar
4	Deportes
5	Juguetes
Productos:

id	nombre	marca	categoria_id	precio_unitario
1	Televisor	Sony	1	1000
2	Laptop	HP	1	800
3	Camisa	Zara	2	50
4	Pantalón	Levi's	2	70
5	Sartén	T-fal	3	30
6	Toalla	Cannon	3	20
7	Pelota	Nike	4	15
8	Raqueta	Wilson	4	50
9	Muñeca	Barbie	5	25
10	Carro	Hot Wheels	5	10
Sucursales:

id	nombre	direccion
1	Sucursal A	Calle 1
2	Sucursal B	Calle 2
3	Sucursal C	Calle 3
Clientes:

id	nombre	telefono
1	Juan	1234567890
2	María	0987654321
3	Pedro	5555555555
Órdenes:

id	cliente_id	sucursal_id	fecha	total
1	1	3	2023-06-12	575
2	2	1	2023-06-12	705
3	3	3	2023-06-12	9000
4	2	3	2023-06-12	10400
5	3	3	2023-06-12	85
6	1	1	2023-06-12	830
7	1	1	2023-06-12	490
8	3	3	2023-06-12	16100
9	3	2	2023-06-12	680
10	2	1	2023-06-12	7525
11	2	3	2023-06-12	725
12	3	1	2023-06-12	11430
13	3	3	2023-06-12	4900
14	3	3	2023-06-12	5490
15	1	1	2023-06-12	420
Stocks:

Id	Sucursal_Id	Producto_Id	Cantidad
1	1	1	65
2	1	2	71
3	1	3	8
4	1	4	42
5	1	5	61
6	1	6	14
7	1	7	70
8	1	8	66
9	1	9	13
10	1	10	68
11	2	1	14
12	2	2	67
13	2	3	74
14	2	4	32
15	2	5	75
16	2	6	37
17	2	7	14
18	2	8	42
19	2	9	51
20	2	10	41
21	3	1	59
22	3	2	98
23	3	3	52
24	3	4	85
25	3	5	31
26	3	6	17
27	3	7	13
28	3	8	18
29	3	9	76
30	3	10	1
Items:

id	orden_id	producto_id	cantidad	monto_venta
1	1	9	7	175
2	1	8	8	400
6	2	9	3	75
7	2	5	9	270
8	2	5	10	300
9	2	6	3	60
11	3	1	9	9000
16	4	1	4	4000
17	4	2	8	6400
21	5	6	2	40
22	5	7	3	45
26	6	4	9	630
27	6	9	4	100
28	6	3	2	100
31	7	5	8	240
32	7	9	6	150
33	7	8	2	100
36	8	1	6	6000
37	8	1	10	10000
38	8	3	2	100
41	9	8	9	450
42	9	3	3	150
43	9	7	2	30
44	9	10	5	50
46	10	9	9	225
47	10	1	7	7000
48	10	3	6	300
51	11	7	5	75
52	11	9	8	200
53	11	3	9	450
56	12	2	7	5600
57	12	1	5	5000
58	12	6	9	180
59	12	8	9	450
60	12	8	4	200
61	13	9	4	100
62	13	2	6	4800
66	14	1	5	5000
67	14	4	7	490
71	15	9	6	150
72	15	5	9	270
*/
Create DATABASE tiendadb;
\c tiendadb;
CREATE TABLE categorias (
    id serial PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

create table productos (
    id serial PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    categoria_id integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL
);

create table sucursales (
    id serial PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL
);

create table clientes (
    id serial PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(10) NOT NULL
);

create table ordenes (
    id serial PRIMARY KEY,
    cliente_id integer NOT NULL,
    sucursal_id integer NOT NULL,
    fecha date NOT NULL,
    total numeric(10,2) NOT NULL
);

create table stocks (
    id serial PRIMARY KEY,
    sucursal_id integer NOT NULL,
    producto_id integer NOT NULL,
    cantidad integer NOT NULL
);

create table items (
    id serial PRIMARY KEY,
    orden_id integer NOT NULL,
    producto_id integer NOT NULL,
    cantidad integer NOT NULL,
    monto_venta numeric(10,2) NOT NULL
);

insert into categorias (nombre) values ('Electrónicos'),('Ropa'),('Hogar'),('Deportes'),('Juguetes');

insert  into productos (nombre,marca,categoria_id,precio_unitario) values ('Televisor','Sony',1,1000),('Laptop','HP',1,800),('Camisa','Zara',2,50),('Pantalón','Levi''s',2,70),('Sartén','T-fal',3,30),('Toalla','Cannon',3,20),('Pelota','Nike',4,15),('Raqueta','Wilson',4,50),('Muñeca','Barbie',5,25),('Carro','Hot Wheels',5,10);

insert into sucursales (nombre,direccion) values ('Sucursal A','Calle 1'),('Sucursal B','Calle 2'),('Sucursal C','Calle 3');
insert into clientes (nombre,telefono) values ('Juan','1234567890'),('María','0987654321'),('Pedro','5555555555');
insert into ordenes (cliente_id,sucursal_id,fecha,total) values (1,3,'2023-06-12',575),(2,1,'2023-06-12',705),(3,3,'2023-06-12',9000),(2,3,'2023-06-12',10400),(3,3,'2023-06-12',85),(1,1,'2023-06-12',830),(1,1,'2023-06-12',490),(3,3,'2023-06-12',16100),(3,2,'2023-06-12',680),(2,1,'2023-06-12',7525),(2,3,'2023-06-12',725),(3,1,'2023-06-12',11430),(3,3,'2023-06-12',4900),(3,3,'2023-06-12',5490),(1,1,'2023-06-12',420);  
insert into stocks (Sucursal_Id,Producto_Id,Cantidad) values (1,1,65),(1,2,71),(1,3,8),(1,4,42),(1,5,61),(1,6,14),(1,7,70),(1,8,66),(1,9,13),(1,10,68),(2,1,14),(2,2,67),(2,3,74),(2,4,32),(2,5,75),(2,6,37),(2,7,14),(2,8,42),(2,9,51),(2,10,41),(3,1,59),(3,2,98),(3,3,52),(3,4,85),(3,5,31),(3,6,17),(3,7,13),(3,8,18),(3,9,76),(3,10,1);
insert into items (orden_id,producto_id,cantidad,monto_venta) values (1,9,7,175),(1,8,8,400),(2,9,3,75),(2,5,9,270),(2,5,10,300),(2,6,3,60),(3,1,9,9000),(4,1,4,4000),(4,2,8,6400),(5,6,2,40),(5,7,3,45),(6,4,9,630),(6,9,4,100),(6,3,2,100),(7,5,8,240),(7,9,6,150),(7,8,2,100),(8,1,6,6000),(8,1,10,10000),(8,3,2,100),(9,8,9,450),(9,3,3,150),(9,7,2,30),(9,10,5,50),(10,9,9,225),(10,1,7,7000),(10,3,6,300),(11,7,5,75),(11,9,8,200),(11,3,9,450),(12,2,7,5600),(12,1,5,5000),(12,6,9,180),(12,8,9,450),(12,8,4,200),(13,9,4,100),(13,2,6,4800),(14,1,5,5000),(14,4,7,490),(15,9,6,150),(15,5,9,270);


