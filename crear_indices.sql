----------------------------Creacion de indices para PERSONAS_PDB------------------
sql usuario_personas/D1Dd1c913a46485946bd##@PERSONAS_PDB



----------------------------Creacion de indices para TRANSACCIONES_PDB------------------
sql usuario_transacciones/D1Dd1c913a46485946bd##@TRANSACCIONES_PDB

-- Crear índices en la tabla COMPRA
CREATE INDEX compra_idproveedor_fechaordencomprpa_IX ON COMPRA (id_proveedor, fecha_orden_compra) TABLESPACE INDICES_TS;
CREATE INDEX compra_idproveedor_IX ON COMPRA (id_proveedor) TABLESPACE INDICES_TS;

-- Crear índice en la tabla COMPRA_DETALLE
CREATE INDEX compradetalle_idproducto_IX ON COMPRA_DETALLE (id_producto) TABLESPACE INDICES_TS;

-- Crear índices en la tabla VENTA
CREATE INDEX venta_idcliente_IX ON VENTA (id_cliente) TABLESPACE INDICES_TS;
CREATE INDEX venta_idcliente_fechaordenventa_IX ON VENTA (id_cliente, fecha_orden_venta) TABLESPACE INDICES_TS;

-- Crear índice en la tabla VENTA_DETALLE
CREATE INDEX ventadetalle_idproducto_IX ON VENTA_DETALLE (id_producto) TABLESPACE INDICES_TS;

-- Crear índice en la tabla PRODUCTO
CREATE INDEX producto_idmarca_UIX ON PRODUCTO (id_marca) TABLESPACE INDICES_TS;

-- Crear índice en la tabla INVENTARIO
CREATE INDEX inventario_fecha_IX ON INVENTARIO (fecha) TABLESPACE INDICES_TS;