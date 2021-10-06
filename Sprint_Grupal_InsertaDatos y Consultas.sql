USE sprint_final_g4_v2;

INSERT INTO `sprint_final_g4_v2`.`empleados` (`nombre`, `apellido`, `cargo`) VALUES ('empleado', 'tres', 'vendedor');

INSERT INTO `sprint_final_g4_v2`.`forma_de_pago` (`tipo_pago`) VALUES ('efectivo');
INSERT INTO `sprint_final_g4_v2`.`forma_de_pago` (`tipo_pago`) VALUES ('credito');
INSERT INTO `sprint_final_g4_v2`.`forma_de_pago` (`tipo_pago`) VALUES ('debito');

INSERT INTO `sprint_final_g4_v2`.`forma_pedido` (`tipo_forma_pedido`) VALUES ('telefono');
INSERT INTO `sprint_final_g4_v2`.`forma_pedido` (`tipo_forma_pedido`) VALUES ('email');
INSERT INTO `sprint_final_g4_v2`.`forma_pedido` (`tipo_forma_pedido`) VALUES ('redes sociales');
INSERT INTO `sprint_final_g4_v2`.`forma_pedido` (`tipo_forma_pedido`) VALUES ('pagina web');

INSERT INTO `sprint_final_g4_v2`.`proveedores` (`nombre_corporativo`, `representante_legal`, `telefono1`, `telefono2`, `nombre_contacto`, `categoria_giro_productos`, `email_proveedor`)
VALUES ('empresa_1', 'gerente_1', '111', '222', 'vendedor', 'producto_electronico', 'empresa_1@gmail.com'),
('empresa_2', 'gerente_2', '222', '333', 'vendedor', 'producto_hogar', 'empresa_2@gmail.com'),
('empresa_3', 'gerente_3', '333', '444', 'vendedor', 'producto_construccion', 'empresa_3@gmail.com'),
('empresa_4', 'gerente_4', '444', '555', 'vendedor', 'producto_limpieza', 'empresa_4@gmail.com'),
('empresa_5', 'gerente_5', '555', '666', 'vendedor', 'producto_electronico', 'empresa_6@gmail.com');

INSERT INTO `sprint_final_g4_v2`.`productos_empresa` (`precio`, `categoria`, `color`, `nombre`, `stock`)
VALUES ('100', 'computacion', 'negro', 'notebook', '10'),
('200', 'electronica', 'negro', 'radio', '50'),
('100', 'computacion', 'blanco', 'equipo torre', '10'),
('100', 'computacion', 'negro', 'macbook pro', '10'),
('200', 'electronica', 'negro', 'mp4', '50'),
('100', 'computacion', 'blanco', 'all in one', '10'),
('100', 'computacion', 'negro', 'notebook dell', '10'),
('200', 'electronica', 'negro', 'mp3', '50'),
('100', 'computacion', 'blanco', 'equipo torre', '10'),
('100', 'computacion', 'negro', 'notebook', '10'),
('200', 'electronica', 'negro', 'radio auto', '50'),
('100', 'computacion', 'blanco', 'equipo torre', '10');


INSERT INTO `sprint_final_g4_v2`.`repartidores` (`nombre_repartidor`, `apellido_repartidor`, `telefono`, `email`)
VALUES ('repartidor', 'uno', '111', 'repartidor_1@gmail.com'),
('repartidor', 'dos', '222', 'repartidor_2@gmail.com');

INSERT INTO `sprint_final_g4_v2`.`pedido_productos_empresa` (`cantidad`, `productos_empresa_idproductos`, `proveedores_rut_proveedor`, `cantidades_solicitadas_proveedor`, `empleados_idempleado`) 
VALUES ('5', '1', '1', '5', '1');
INSERT INTO `sprint_final_g4_v2`.`pedido_productos_empresa` (`cantidad`, `productos_empresa_idproductos`, `proveedores_rut_proveedor`, `cantidades_solicitadas_proveedor`, `empleados_idempleado`) 
VALUES ('2', '2', '1', '4', '1');


SELECT * FROM productos_empresa;

INSERT INTO `sprint_final_g4_v2`.`productos_empresa` (`precio`, `categoria`, `color`, `nombre`, `stock`)
VALUES ('100', 'computacion', 'negro', 'notebook', 100),
('200', 'electronica', 'negro', 'radio', 50),
('100', 'computacion', 'blanco', 'equipo torre', 10),
('100', 'computacion', 'negro', 'macbook pro', 10),
('200', 'electronica', 'negro', 'mp4', 50),
('100', 'computacion', 'blanco', 'all in one', 10),
('100', 'computacion', 'negro', 'notebook dell', 10),
('200', 'electronica', 'negro', 'mp3', 50),
('100', 'computacion', 'blanco', 'equipo torre', 10),
('100', 'computacion', 'negro', 'notebook', 10),
('200', 'electronica', 'negro', 'radio auto', 50),
('100', 'computacion', 'blanco', 'equipo torre', 10);


/***

- Cual o cuales son los proveedores con menor stock de productos.
Por último:
- Cambien la categoría de productos más popular por ‘Electrónica y computación’.

**/

-- Cuál es la categoría de productos que más se repite.
SELECT COUNT(categoria) as contador_categoria, categoria 
From productos_empresa 
group by categoria 
order by contador_categoria desc
limit 0,1 ;

-- - Cuáles son los productos con mayor stock

select idproductos, categoria, nombre, color, stock
from productos_empresa
where stock = ( select max(stock)as cantidad_mayor from productos_empresa 	);

-- Qué color de producto es más común en nuestra tienda.

SELECT COUNT(color) as contador_color, color 
From productos_empresa 
group by color 
order by contador_color desc
limit 0,1 ;

-- Cual o cuales son los proveedores con menor stock de productos.


select rut_proveedor, nombre_corporativo, representante_legal, telefono1, telefono2, PROD.stock
from proveedores as PROV , pedido_productos_empresa AS PEDI , productos_empresa as PROD
where PROV.rut_proveedor = PEDI.proveedores_rut_proveedor
and  PEDI.productos_empresa_idproductos = PROD.idproductos
and PROD.stock = ( select min(stock)as cantidad_menor from productos_empresa );


-- Por último:
-- Cambien la categoría de productos más popular por ‘Electrónica y computación’.


SET @IdProductoMasVendido := 0;

SELECT @IdProductoMasVendido := ped_pro.productos_empresa_idproductos , count(productos_empresa_idproductos)  as ContadorVentaProductos
FROM pedidos_clientes_has_productos_empresa as ped_pro , productos_empresa as Pro
WHERE Pro.idproductos = ped_pro.productos_empresa_idproductos
ORDER By ContadorVentaProductos desc
LIMIT 0,1;

UPDATE Productos_empresa
SET categoria = 'Electronica y Computación'
WHERE productos_empresa.idproductos = @IdProductoMasVendido; 