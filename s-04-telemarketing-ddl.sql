Prompt conectando como &&p_usuario_p a PDB &&p_pdb1_p 
connect &&p_usuario_p/&&p_usr_pwd_p@&&p_pdb1_p
Prompt creando tablas
CREATE TABLE CLIENTE
(
	id_membresia         NUMBER(6) NOT NULL ,
	id_cliente           NUMBER(6) NOT NULL 
)tablespace persona_ts;


CREATE TABLE PROVEEDOR
(
	rfc_proveedor        VARCHAR2(13) NOT NULL ,
	id_proveedor         NUMBER(6) NOT NULL 
)tablespace persona_ts;


CREATE TABLE PROVEEDOR_MARCA
(
	id_proveedor         NUMBER(6) NOT NULL ,
	id_marca             NUMBER(6) NOT NULL 
)tablespace persona_ts;



CREATE TABLE MARCA
(
	id_marca             NUMBER(6) NOT NULL ,
	nombre               VARCHAR2(150) NULL ,
	imagen               BLOB NULL ,
	razon_social         VARCHAR2(150) NULL 
)tablespace persona_ts;



CREATE TABLE MEMBRESIA
(
	id_membresia         NUMBER(6) NOT NULL ,
	descripcion          VARCHAR2(250) NULL ,
	costo                DECIMAL NULL ,
	duracion             NUMBER NULL 
)tablespace persona_ts;



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
)tablespace persona_ts;

CREATE TABLE DESCUENTO
(
	id_descuento         NUMBER(6) NOT NULL ,
	fecha_inicio         DATE NULL ,
	fecha_fin            DATE NULL ,
	estatus_descuento    CHAR(1) NULL ,
	monto_descuento      DECIMAL NULL ,
	id_membresia         NUMBER(6) NOT NULL 
)tablespace persona_ts;



CREATE TABLE EMPLEADO
(
	NSS                  VARCHAR2(18) NULL ,
	id_empleado          NUMBER(6) NOT NULL 
)tablespace persona_ts;



CREATE TABLE ESTATUS_DESCUENTO
(
	id_estatus_descuento NUMBER(2) NOT NULL ,
	estatus              VARCHAR2(20) NULL ,
	descripcion          VARCHAR2(50) NULL 
)tablespace persona_ts;


Prompt conectando como &&p_usuario_t a PDB &&p_pdb1_t
connect &&p_usuario_t/&&p_usr_pwd_t@&&p_pdb1_t
Prompt creando tablas

CREATE TABLE INVENTARIO
(
	id_inventario        NUMBER(6) NOT NULL ,
	fecha                DATE NULL ,
	id_empleado          NUMBER(6) NOT NULL 
)tablespace TRANSACCIONES_TS;


CREATE TABLE PRODUCTO
(
	id_producto          NUMBER(6) NOT NULL ,
	costo                DECIMAL NULL ,
	nombre               VARCHAR2(30) NULL ,
	clasificacion        VARCHAR2(20) NULL ,
	imagen               BLOB NULL ,
	id_descuento         NUMBER(6) NOT NULL ,
	id_marca             NUMBER(6) NULL 
)tablespace TRANSACCIONES_TS;



CREATE TABLE VENTA
(
	id_orden_venta       NUMBER(6) NOT NULL ,
	fecha_orden_venta    DATE NULL ,
	fecha_entrega_venta  DATE NULL ,
	total_venta          DECIMAL NULL ,
	id_cliente           NUMBER(6) NOT NULL 
)tablespace TRANSACCIONES_TS;


CREATE TABLE VENTA_DETALLE
(
	id_orden_venta       NUMBER(6) NOT NULL ,
	id_producto          NUMBER(6) NOT NULL ,
	cantidad_producto_vendido NUMBER(6) NOT NULL 
)tablespace TRANSACCIONES_TS;

CREATE TABLE COMPRA
(
	id_orden_compra      NUMBER(6) NOT NULL ,
	fecha_orden_compra   DATE NULL ,
	fecha_entrega_compra DATE NULL ,
	id_proveedor         NUMBER(6) NOT NULL ,
	total_compra         DECIMAL NULL 
)tablespace TRANSACCIONES_TS;


CREATE TABLE COMPRA_DETALLE
(
	id_orden_compra      NUMBER(6) NOT NULL ,
	id_producto          NUMBER(6) NOT NULL ,
	cantidad_producto_compra NUMBER(6) NOT NULL 
)tablespace TRANSACCIONES_TS;

CREATE TABLE DETALLE_INVENTARIO
(
	id_inventario        NUMBER(6) NOT NULL ,
	id_producto          NUMBER(6) NOT NULL ,
	cantidad             NUMBER(6) NULL ,
	comentarios          VARCHAR2(250) NULL 
)tablespace TRANSACCIONES_TS;
