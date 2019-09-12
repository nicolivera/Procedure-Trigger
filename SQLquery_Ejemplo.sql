create database Almacen;

use Almacen;

create table Ventas(
id_venta int primary key identity,
id_producto int,
cantidad int
);

create table TotalVentas(
cantidad int
);

create trigger InsertarVenta 
on Ventas 
for insert 
as
begin 
	declare @total int 
	set @total = (select sum(cantidad) from Ventas) 
	update TotalVentas 
	set TotalVentas.cantidad = @total 
end;

create procedure sp_Ventas(
@id_producto int,
@cantidad int
)
as
begin
   insert into Ventas (id_producto, cantidad)values(@id_producto,@cantidad)
end;

exec sp_Ventas 2, 20

select * from Ventas;
select * from TotalVentas;

insert into Ventas (id_venta, id_producto, cantidad)values(2, 2, 15);
insert into TotalVentas values(20)