----------------------------Creacion de tablas para PERSONAS_PDB------------------
sql usuario_personas/D1Dd1c913a46485946bd##@PERSONAS_PDB

CREATE TABLE CLIENTE
(
	id_membresia         NUMBER(6) NOT NULL ,
	id_cliente           NUMBER(6) NOT NULL 
) tablespace persona_ts;



CREATE UNIQUE INDEX XPKCLIENTE ON CLIENTE
(id_cliente   ASC) tablespace persona_ts;



ALTER TABLE CLIENTE
	ADD CONSTRAINT  XPKCLIENTE PRIMARY KEY (id_cliente);


CREATE TABLE PROVEEDOR
(
	rfc_proveedor        VARCHAR2(13) NOT NULL ,
	id_proveedor         NUMBER(6) NOT NULL 
) tablespace persona_ts;



CREATE UNIQUE INDEX XPKPROVEEDOR ON PROVEEDOR
(id_proveedor   ASC) tablespace persona_ts;



ALTER TABLE PROVEEDOR
	ADD CONSTRAINT  XPKPROVEEDOR PRIMARY KEY (id_proveedor);


CREATE TABLE PROVEEDOR_MARCA
(
	id_proveedor         NUMBER(6) NOT NULL ,
	id_marca             NUMBER(6) NOT NULL 
) tablespace persona_ts;



CREATE UNIQUE INDEX XPKPROVEEDOR_MARCA ON PROVEEDOR_MARCA
(id_proveedor   ASC,id_marca   ASC) tablespace persona_ts;



ALTER TABLE PROVEEDOR_MARCA
	ADD CONSTRAINT  XPKPROVEEDOR_MARCA PRIMARY KEY (id_proveedor,id_marca);

CREATE TABLE MARCA
(
	id_marca             NUMBER(6) NOT NULL ,
	nombre               VARCHAR2(150) NULL ,
	imagen               BLOB NULL ,
	razon_social         VARCHAR2(150) NULL 
) tablespace persona_ts;



CREATE UNIQUE INDEX XPKMARCA ON MARCA
(id_marca   ASC) tablespace persona_ts;



ALTER TABLE MARCA
	ADD CONSTRAINT  XPKMARCA PRIMARY KEY (id_marca);

CREATE TABLE MEMBRESIA
(
	id_membresia         NUMBER(6) NOT NULL ,
	descripcion          VARCHAR2(250) NULL ,
	costo                DECIMAL NULL ,
	duracion             NUMBER NULL 
) tablespace persona_ts;



CREATE UNIQUE INDEX XPKMENBRESIA ON MEMBRESIA
(id_membresia   ASC) tablespace persona_ts;



ALTER TABLE MEMBRESIA
	ADD CONSTRAINT  XPKMENBRESIA PRIMARY KEY (id_membresia);


CREATE TABLE PERSONA
(
	nombre               VARCHAR2(30) NULL ,
  apellido              VARCHAR2(30) NULL ,
	direccion              VARCHAR2(50) NULL ,
	ciudad                 VARCHAR2(50) NULL ,
  estado                VARCHAR2(50) NULL ,
	email                VARCHAR2(50) NULL ,
	telefono             VARCHAR2(20) NULL ,
	id_persoma           NUMBER(6) NOT NULL ,
	tipo                 CHAR(1) NULL  CONSTRAINT  tipoPersonaRule CHECK (tipo IN ('E', 'P', 'C'))
) tablespace persona_ts;



CREATE UNIQUE INDEX XPKPERSONA ON PERSONA
(id_persoma   ASC) tablespace persona_ts;



ALTER TABLE PERSONA
	ADD CONSTRAINT  XPKPERSONA PRIMARY KEY (id_persoma);



CREATE TABLE DESCUENTO
(
	id_descuento         NUMBER(6) NOT NULL ,
	fecha_inicio         DATE NULL ,
	fecha_fin            DATE NULL ,
	porcentaje_descuento DECIMAL(5, 2) NULL ,
	id_estatus_descuento NUMBER(2) NOT NULL,
  descripcion          VARCHAR2(100) NULL
) tablespace persona_ts;



CREATE UNIQUE INDEX XPKDESCUENTO ON DESCUENTO
(id_descuento   ASC) tablespace persona_ts;



ALTER TABLE DESCUENTO
	ADD CONSTRAINT  XPKDESCUENTO PRIMARY KEY (id_descuento);


CREATE TABLE EMPLEADO
(
	NSS                  VARCHAR2(18) NULL ,
	id_empleado          NUMBER(6) NOT NULL 
) tablespace persona_ts;



CREATE UNIQUE INDEX XPKEMPLEADO ON EMPLEADO
(id_empleado   ASC) tablespace persona_ts;



ALTER TABLE EMPLEADO
	ADD CONSTRAINT  XPKEMPLEADO PRIMARY KEY (id_empleado);


CREATE TABLE ESTATUS_DESCUENTO
(
	id_estatus_descuento NUMBER(2) NOT NULL ,
	estatus              VARCHAR2(30) NULL ,
	descripcion          VARCHAR2(100) NULL 
) tablespace persona_ts;



CREATE UNIQUE INDEX XPKESTATUS_DESCUENTO ON ESTATUS_DESCUENTO
(id_estatus_descuento   ASC) tablespace persona_ts;



ALTER TABLE ESTATUS_DESCUENTO
	ADD CONSTRAINT  XPKESTATUS_DESCUENTO PRIMARY KEY (id_estatus_descuento);



----------------------------Creacion de tablas para TRANSACCIONES_PDB------------------
sql usuario_transacciones/D1Dd1c913a46485946bd##@TRANSACCIONES_PDB

CREATE TABLE INVENTARIO
(
	id_inventario        NUMBER(6) NOT NULL ,
	fecha                DATE NULL ,
	id_empleado          NUMBER(6) NOT NULL 
) tablespace TRANSACCIONES_TS;



CREATE UNIQUE INDEX XPKINVENTARIO ON INVENTARIO
(id_inventario   ASC) tablespace TRANSACCIONES_TS;



ALTER TABLE INVENTARIO
	ADD CONSTRAINT  XPKINVENTARIO PRIMARY KEY (id_inventario);


CREATE TABLE PRODUCTO
(
	id_producto          NUMBER(6) NOT NULL ,
	costo                DECIMAL NULL ,
	nombre               VARCHAR2(30) NULL ,
	clasificacion        VARCHAR2(20) NULL ,
	imagen               BLOB NULL ,
	id_descuento         NUMBER(6) NOT NULL ,
	id_marca             NUMBER(6) NULL 
) tablespace TRANSACCIONES_TS;



CREATE UNIQUE INDEX XPKPRODUCTO ON PRODUCTO
(id_producto   ASC) tablespace TRANSACCIONES_TS;



ALTER TABLE PRODUCTO
	ADD CONSTRAINT  XPKPRODUCTO PRIMARY KEY (id_producto);

CREATE TABLE VENTA
(
	id_orden_venta       NUMBER(6) NOT NULL ,
	fecha_orden_venta    DATE NULL ,
	fecha_entrega_venta  DATE NULL ,
	total_venta          DECIMAL NULL ,
	id_cliente           NUMBER(6) NOT NULL 
) tablespace TRANSACCIONES_TS;



CREATE UNIQUE INDEX XPKORDEN_VENTA ON VENTA
(id_orden_venta   ASC) tablespace TRANSACCIONES_TS;



ALTER TABLE VENTA
	ADD CONSTRAINT  XPKORDEN_VENTA PRIMARY KEY (id_orden_venta);

CREATE TABLE VENTA_DETALLE
(
	id_orden_venta       NUMBER(6) NOT NULL ,
	id_producto          NUMBER(6) NOT NULL ,
	cantidad_producto_vendido NUMBER(6) NOT NULL 
) tablespace TRANSACCIONES_TS;



CREATE UNIQUE INDEX XPKVENTA ON VENTA_DETALLE
(id_orden_venta   ASC,id_producto   ASC) tablespace TRANSACCIONES_TS;


CREATE TABLE COMPRA
(
	id_orden_compra      NUMBER(6) NOT NULL ,
	fecha_orden_compra   DATE NULL ,
	fecha_entrega_compra DATE NULL ,
	id_proveedor         NUMBER(6) NOT NULL ,
	total_compra         DECIMAL NULL 
) tablespace TRANSACCIONES_TS;



CREATE UNIQUE INDEX XPKORDEN_COMPRA ON COMPRA
(id_orden_compra   ASC) tablespace TRANSACCIONES_TS;



ALTER TABLE COMPRA
	ADD CONSTRAINT  XPKORDEN_COMPRA PRIMARY KEY (id_orden_compra);



CREATE TABLE COMPRA_DETALLE
(
	id_orden_compra      NUMBER(6) NOT NULL ,
	id_producto          NUMBER(6) NOT NULL ,
	cantidad_producto_compra NUMBER(6) NOT NULL 
) tablespace TRANSACCIONES_TS;



CREATE UNIQUE INDEX XPKCOMPRA ON COMPRA_DETALLE
(id_orden_compra   ASC,id_producto   ASC) tablespace TRANSACCIONES_TS;



ALTER TABLE COMPRA_DETALLE
	ADD CONSTRAINT  XPKCOMPRA PRIMARY KEY (id_orden_compra,id_producto);


CREATE TABLE DETALLE_INVENTARIO
(
	id_inventario        NUMBER(6) NOT NULL ,
	id_producto          NUMBER(6) NOT NULL ,
	cantidad             NUMBER(6) NULL ,
	comentarios          VARCHAR2(250) NULL 
) tablespace TRANSACCIONES_TS;



CREATE UNIQUE INDEX XPKINVENTARIO_PRODUCTO ON DETALLE_INVENTARIO
(id_producto   ASC,id_inventario   ASC) tablespace TRANSACCIONES_TS;



ALTER TABLE DETALLE_INVENTARIO
	ADD CONSTRAINT  XPKINVENTARIO_PRODUCTO PRIMARY KEY (id_producto,id_inventario);