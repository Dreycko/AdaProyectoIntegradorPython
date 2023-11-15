--Obtener el precio mínimo, precio máximo y precio promedio de todos los productos.
select min(precio_unitario), max(precio_unitario), avg(precio_unitario) from productos;

--Calcular la cantidad total de productos en stock por sucursal.

select s.nombre , sum(cantidad) 
  from stocks st 
 inner 
  join sucursales s  
    on st.sucursal_id = s.id 
 group 
    by nombre ;

--Obtener el total de ventas por cliente.
select  c.nombre  , sum(total) 
  from ordenes o 
 inner 
  join clientes c 
    on o.cliente_id = c.id 
 group by c.nombre 
