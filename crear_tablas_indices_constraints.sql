CREATE TABLE CLIENTE
(
	id_membresia         NUMBER(6) NOT NULL ,
	id_cliente           NUMBER(6) NOT NULL 
);



CREATE UNIQUE INDEX XPKCLIENTE ON CLIENTE
(id_cliente   ASC);



ALTER TABLE CLIENTE
	ADD CONSTRAINT  XPKCLIENTE PRIMARY KEY (id_cliente);



CREATE TABLE COMPRA
(
	id_orden_compra      NUMBER(6) NOT NULL ,
	fecha_orden_compra   DATE NULL ,
	fecha_entrega_compra DATE NULL ,
	id_proveedor         NUMBER(6) NOT NULL ,
	total_compra         DECIMAL NULL 
);



CREATE UNIQUE INDEX XPKORDEN_COMPRA ON COMPRA
(id_orden_compra   ASC);



ALTER TABLE COMPRA
	ADD CONSTRAINT  XPKORDEN_COMPRA PRIMARY KEY (id_orden_compra);



CREATE TABLE COMPRA_DETALLE
(
	id_orden_compra      NUMBER(6) NOT NULL ,
	id_producto          NUMBER(6) NOT NULL ,
	cantidad_producto_compra NUMBER(6) NOT NULL 
);



CREATE UNIQUE INDEX XPKCOMPRA ON COMPRA_DETALLE
(id_orden_compra   ASC,id_producto   ASC);



ALTER TABLE COMPRA_DETALLE
	ADD CONSTRAINT  XPKCOMPRA PRIMARY KEY (id_orden_compra,id_producto);



CREATE TABLE DESCUENTO
(
	id_descuento         NUMBER(6) NOT NULL ,
	fecha_inicio         DATE NULL ,
	fecha_fin            DATE NULL ,
	estatus_descuento    CHAR(1) NULL ,
	monto_descuento      DECIMAL NULL ,
	id_membresia         NUMBER(6) NOT NULL ,
	id_estatus_descuento NUMBER(2) NOT NULL 
);



CREATE UNIQUE INDEX XPKDESCUENTO ON DESCUENTO
(id_descuento   ASC);



ALTER TABLE DESCUENTO
	ADD CONSTRAINT  XPKDESCUENTO PRIMARY KEY (id_descuento);



CREATE TABLE DETALLE_INVENTARIO
(
	id_inventario        NUMBER(6) NOT NULL ,
	id_producto          NUMBER(6) NOT NULL ,
	cantidad             NUMBER(6) NULL ,
	comentarios          VARCHAR2(250) NULL 
);



CREATE UNIQUE INDEX XPKINVENTARIO_PRODUCTO ON DETALLE_INVENTARIO
(id_producto   ASC,id_inventario   ASC);



ALTER TABLE DETALLE_INVENTARIO
	ADD CONSTRAINT  XPKINVENTARIO_PRODUCTO PRIMARY KEY (id_producto,id_inventario);



CREATE TABLE EMPLEADO
(
	NSS                  VARCHAR2(18) NULL ,
	id_empleado          NUMBER(6) NOT NULL 
);



CREATE UNIQUE INDEX XPKEMPLEADO ON EMPLEADO
(id_empleado   ASC);



ALTER TABLE EMPLEADO
	ADD CONSTRAINT  XPKEMPLEADO PRIMARY KEY (id_empleado);



CREATE TABLE ESTADO
(
	id_estado            NUMBER(3) NOT NULL ,
	nombre               VARCHAR2(50) NULL 
);



CREATE UNIQUE INDEX XPKESTADO ON ESTADO
(id_estado   ASC);



ALTER TABLE ESTADO
	ADD CONSTRAINT  XPKESTADO PRIMARY KEY (id_estado);



CREATE TABLE ESTATUS_DESCUENTO
(
	id_estatus_descuento NUMBER(2) NOT NULL ,
	estatus              VARCHAR2(30) NULL ,
	descripcion          VARCHAR2(100) NULL 
);



CREATE UNIQUE INDEX XPKESTATUS_DESCUENTO ON ESTATUS_DESCUENTO
(id_estatus_descuento   ASC);



ALTER TABLE ESTATUS_DESCUENTO
	ADD CONSTRAINT  XPKESTATUS_DESCUENTO PRIMARY KEY (id_estatus_descuento);



CREATE TABLE INVENTARIO
(
	id_inventario        NUMBER(6) NOT NULL ,
	fecha                DATE NULL ,
	id_empleado          NUMBER(6) NOT NULL 
);



CREATE UNIQUE INDEX XPKINVENTARIO ON INVENTARIO
(id_inventario   ASC);



ALTER TABLE INVENTARIO
	ADD CONSTRAINT  XPKINVENTARIO PRIMARY KEY (id_inventario);



CREATE TABLE MARCA
(
	id_marca             NUMBER(6) NOT NULL ,
	nombre               VARCHAR2(150) NULL ,
	imagen               BLOB NULL ,
	razon_social         VARCHAR2(150) NULL 
);



CREATE UNIQUE INDEX XPKMARCA ON MARCA
(id_marca   ASC);



ALTER TABLE MARCA
	ADD CONSTRAINT  XPKMARCA PRIMARY KEY (id_marca);



CREATE TABLE MEMBRESIA
(
	id_membresia         NUMBER(6) NOT NULL ,
	descripcion          VARCHAR2(250) NULL ,
	costo                DECIMAL NULL ,
	duracion             NUMBER NULL 
);



CREATE UNIQUE INDEX XPKMENBRESIA ON MEMBRESIA
(id_membresia   ASC);



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
);



CREATE UNIQUE INDEX XPKPERSONA ON PERSONA
(id_persoma   ASC);



ALTER TABLE PERSONA
	ADD CONSTRAINT  XPKPERSONA PRIMARY KEY (id_persoma);



CREATE TABLE PRODUCTO
(
	id_producto          NUMBER(6) NOT NULL ,
	costo                DECIMAL NULL ,
	nombre               VARCHAR2(30) NULL ,
	clasificacion        VARCHAR2(20) NULL ,
	imagen               BLOB NULL ,
	id_descuento         NUMBER(6) NOT NULL ,
	id_marca             NUMBER(6) NULL 
);



CREATE UNIQUE INDEX XPKPRODUCTO ON PRODUCTO
(id_producto   ASC);



ALTER TABLE PRODUCTO
	ADD CONSTRAINT  XPKPRODUCTO PRIMARY KEY (id_producto);



CREATE TABLE PROVEEDOR
(
	rfc_proveedor        VARCHAR2(13) NOT NULL ,
	id_proveedor         NUMBER(6) NOT NULL 
);



CREATE UNIQUE INDEX XPKPROVEEDOR ON PROVEEDOR
(id_proveedor   ASC);



ALTER TABLE PROVEEDOR
	ADD CONSTRAINT  XPKPROVEEDOR PRIMARY KEY (id_proveedor);



CREATE TABLE PROVEEDOR_MARCA
(
	id_proveedor         NUMBER(6) NOT NULL ,
	id_marca             NUMBER(6) NOT NULL 
);



CREATE UNIQUE INDEX XPKPROVEEDOR_MARCA ON PROVEEDOR_MARCA
(id_proveedor   ASC,id_marca   ASC);



ALTER TABLE PROVEEDOR_MARCA
	ADD CONSTRAINT  XPKPROVEEDOR_MARCA PRIMARY KEY (id_proveedor,id_marca);



CREATE TABLE VENTA
(
	id_orden_venta       NUMBER(6) NOT NULL ,
	fecha_orden_venta    DATE NULL ,
	fecha_entrega_venta  DATE NULL ,
	total_venta          DECIMAL NULL ,
	id_cliente           NUMBER(6) NOT NULL 
);



CREATE UNIQUE INDEX XPKORDEN_VENTA ON VENTA
(id_orden_venta   ASC);



ALTER TABLE VENTA
	ADD CONSTRAINT  XPKORDEN_VENTA PRIMARY KEY (id_orden_venta);



CREATE TABLE VENTA_DETALLE
(
	id_orden_venta       NUMBER(6) NOT NULL ,
	id_producto          NUMBER(6) NOT NULL ,
	cantidad_producto_vendido NUMBER(6) NOT NULL 
);



CREATE UNIQUE INDEX XPKVENTA ON VENTA_DETALLE
(id_orden_venta   ASC,id_producto   ASC);



ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT  XPKVENTA PRIMARY KEY (id_orden_venta,id_producto);



ALTER TABLE CLIENTE
	ADD (CONSTRAINT R_38 FOREIGN KEY (id_membresia) REFERENCES MEMBRESIA (id_membresia));



ALTER TABLE CLIENTE
	ADD (FOREIGN KEY (id_cliente) REFERENCES PERSONA(id_persoma) ON DELETE CASCADE);



ALTER TABLE COMPRA
	ADD (CONSTRAINT R_2 FOREIGN KEY (id_proveedor) REFERENCES PROVEEDOR (id_proveedor));



ALTER TABLE COMPRA_DETALLE
	ADD (CONSTRAINT R_15 FOREIGN KEY (id_orden_compra) REFERENCES COMPRA (id_orden_compra));



ALTER TABLE COMPRA_DETALLE
	ADD (CONSTRAINT R_18 FOREIGN KEY (id_producto) REFERENCES PRODUCTO (id_producto));



ALTER TABLE DESCUENTO
	ADD (CONSTRAINT R_48 FOREIGN KEY (id_membresia) REFERENCES MEMBRESIA (id_membresia));



ALTER TABLE DESCUENTO
	ADD (CONSTRAINT R_50 FOREIGN KEY (id_estatus_descuento) REFERENCES ESTATUS_DESCUENTO (id_estatus_descuento));



ALTER TABLE DETALLE_INVENTARIO
	ADD (CONSTRAINT R_55 FOREIGN KEY (id_inventario) REFERENCES INVENTARIO (id_inventario));



ALTER TABLE DETALLE_INVENTARIO
	ADD (CONSTRAINT R_57 FOREIGN KEY (id_producto) REFERENCES PRODUCTO (id_producto));



ALTER TABLE EMPLEADO
	ADD (FOREIGN KEY (id_empleado) REFERENCES PERSONA(id_persoma) ON DELETE CASCADE);



ALTER TABLE INVENTARIO
	ADD (CONSTRAINT R_39 FOREIGN KEY (id_empleado) REFERENCES EMPLEADO (id_empleado));



ALTER TABLE PERSONA
	ADD (CONSTRAINT R_32 FOREIGN KEY (id_estado) REFERENCES ESTADO (id_estado));



ALTER TABLE PRODUCTO
	ADD (CONSTRAINT R_4 FOREIGN KEY (id_descuento) REFERENCES DESCUENTO (id_descuento));



ALTER TABLE PRODUCTO
	ADD (CONSTRAINT R_26 FOREIGN KEY (id_marca) REFERENCES MARCA (id_marca) ON DELETE SET NULL);



ALTER TABLE PROVEEDOR
	ADD (FOREIGN KEY (id_proveedor) REFERENCES PERSONA(id_persoma) ON DELETE CASCADE);



ALTER TABLE PROVEEDOR_MARCA
	ADD (CONSTRAINT R_52 FOREIGN KEY (id_proveedor) REFERENCES PROVEEDOR (id_proveedor));



ALTER TABLE PROVEEDOR_MARCA
	ADD (CONSTRAINT R_54 FOREIGN KEY (id_marca) REFERENCES MARCA (id_marca));



ALTER TABLE VENTA
	ADD (CONSTRAINT R_47 FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente));



ALTER TABLE VENTA_DETALLE
	ADD (CONSTRAINT R_21 FOREIGN KEY (id_orden_venta) REFERENCES VENTA (id_orden_venta));



ALTER TABLE VENTA_DETALLE
	ADD (CONSTRAINT R_22 FOREIGN KEY (id_producto) REFERENCES PRODUCTO (id_producto));



CREATE  TRIGGER tI_CLIENTE BEFORE INSERT ON CLIENTE for each row
-- ERwin Builtin Trigger
-- INSERT trigger on CLIENTE 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* MEMBRESIA  CLIENTE on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001e70d", PARENT_OWNER="", PARENT_TABLE="MEMBRESIA"
    CHILD_OWNER="", CHILD_TABLE="CLIENTE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="id_membresia" */
    SELECT count(*) INTO NUMROWS
      FROM MEMBRESIA
      WHERE
        /* %JoinFKPK(:%New,MEMBRESIA," = "," AND") */
        :new.id_membresia = MEMBRESIA.id_membresia;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert CLIENTE because MEMBRESIA does not exist.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* PERSONA  CLIENTE on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PERSONA"
    CHILD_OWNER="", CHILD_TABLE="CLIENTE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="id_cliente" */
    SELECT count(*) INTO NUMROWS
      FROM PERSONA
      WHERE
        /* %JoinFKPK(:%New,PERSONA," = "," AND") */
        :new.id_cliente = PERSONA.id_persoma;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert CLIENTE because PERSONA does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER  tD_CLIENTE AFTER DELETE ON CLIENTE for each row
-- ERwin Builtin Trigger
-- DELETE trigger on CLIENTE 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* CLIENTE  VENTA on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000d3c1", PARENT_OWNER="", PARENT_TABLE="CLIENTE"
    CHILD_OWNER="", CHILD_TABLE="VENTA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_47", FK_COLUMNS="id_cliente" */
    SELECT count(*) INTO NUMROWS
      FROM VENTA
      WHERE
        /*  %JoinFKPK(VENTA,:%Old," = "," AND") */
        VENTA.id_cliente = :old.id_cliente;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete CLIENTE because VENTA exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_CLIENTE AFTER UPDATE ON CLIENTE for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on CLIENTE 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* CLIENTE  VENTA on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000303c3", PARENT_OWNER="", PARENT_TABLE="CLIENTE"
    CHILD_OWNER="", CHILD_TABLE="VENTA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_47", FK_COLUMNS="id_cliente" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_cliente <> :new.id_cliente
  THEN
    SELECT count(*) INTO NUMROWS
      FROM VENTA
      WHERE
        /*  %JoinFKPK(VENTA,:%Old," = "," AND") */
        VENTA.id_cliente = :old.id_cliente;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update CLIENTE because VENTA exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* MEMBRESIA  CLIENTE on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MEMBRESIA"
    CHILD_OWNER="", CHILD_TABLE="CLIENTE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="id_membresia" */
  SELECT count(*) INTO NUMROWS
    FROM MEMBRESIA
    WHERE
      /* %JoinFKPK(:%New,MEMBRESIA," = "," AND") */
      :new.id_membresia = MEMBRESIA.id_membresia;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update CLIENTE because MEMBRESIA does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* PERSONA  CLIENTE on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PERSONA"
    CHILD_OWNER="", CHILD_TABLE="CLIENTE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="id_cliente" */
  SELECT count(*) INTO NUMROWS
    FROM PERSONA
    WHERE
      /* %JoinFKPK(:%New,PERSONA," = "," AND") */
      :new.id_cliente = PERSONA.id_persoma;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update CLIENTE because PERSONA does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_COMPRA BEFORE INSERT ON COMPRA for each row
-- ERwin Builtin Trigger
-- INSERT trigger on COMPRA 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* PROVEEDOR  COMPRA on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000fb1c", PARENT_OWNER="", PARENT_TABLE="PROVEEDOR"
    CHILD_OWNER="", CHILD_TABLE="COMPRA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="id_proveedor" */
    SELECT count(*) INTO NUMROWS
      FROM PROVEEDOR
      WHERE
        /* %JoinFKPK(:%New,PROVEEDOR," = "," AND") */
        :new.id_proveedor = PROVEEDOR.id_proveedor;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert COMPRA because PROVEEDOR does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER  tD_COMPRA AFTER DELETE ON COMPRA for each row
-- ERwin Builtin Trigger
-- DELETE trigger on COMPRA 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* COMPRA  COMPRA_DETALLE on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e201", PARENT_OWNER="", PARENT_TABLE="COMPRA"
    CHILD_OWNER="", CHILD_TABLE="COMPRA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="id_orden_compra" */
    SELECT count(*) INTO NUMROWS
      FROM COMPRA_DETALLE
      WHERE
        /*  %JoinFKPK(COMPRA_DETALLE,:%Old," = "," AND") */
        COMPRA_DETALLE.id_orden_compra = :old.id_orden_compra;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete COMPRA because COMPRA_DETALLE exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_COMPRA AFTER UPDATE ON COMPRA for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on COMPRA 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* COMPRA  COMPRA_DETALLE on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00022103", PARENT_OWNER="", PARENT_TABLE="COMPRA"
    CHILD_OWNER="", CHILD_TABLE="COMPRA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="id_orden_compra" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_orden_compra <> :new.id_orden_compra
  THEN
    SELECT count(*) INTO NUMROWS
      FROM COMPRA_DETALLE
      WHERE
        /*  %JoinFKPK(COMPRA_DETALLE,:%Old," = "," AND") */
        COMPRA_DETALLE.id_orden_compra = :old.id_orden_compra;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update COMPRA because COMPRA_DETALLE exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* PROVEEDOR  COMPRA on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PROVEEDOR"
    CHILD_OWNER="", CHILD_TABLE="COMPRA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="id_proveedor" */
  SELECT count(*) INTO NUMROWS
    FROM PROVEEDOR
    WHERE
      /* %JoinFKPK(:%New,PROVEEDOR," = "," AND") */
      :new.id_proveedor = PROVEEDOR.id_proveedor;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update COMPRA because PROVEEDOR does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_COMPRA_DETALLE BEFORE INSERT ON COMPRA_DETALLE for each row
-- ERwin Builtin Trigger
-- INSERT trigger on COMPRA_DETALLE 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* COMPRA  COMPRA_DETALLE on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001f769", PARENT_OWNER="", PARENT_TABLE="COMPRA"
    CHILD_OWNER="", CHILD_TABLE="COMPRA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="id_orden_compra" */
    SELECT count(*) INTO NUMROWS
      FROM COMPRA
      WHERE
        /* %JoinFKPK(:%New,COMPRA," = "," AND") */
        :new.id_orden_compra = COMPRA.id_orden_compra;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert COMPRA_DETALLE because COMPRA does not exist.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* PRODUCTO  COMPRA_DETALLE on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PRODUCTO"
    CHILD_OWNER="", CHILD_TABLE="COMPRA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="id_producto" */
    SELECT count(*) INTO NUMROWS
      FROM PRODUCTO
      WHERE
        /* %JoinFKPK(:%New,PRODUCTO," = "," AND") */
        :new.id_producto = PRODUCTO.id_producto;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert COMPRA_DETALLE because PRODUCTO does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_COMPRA_DETALLE AFTER UPDATE ON COMPRA_DETALLE for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on COMPRA_DETALLE 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* COMPRA  COMPRA_DETALLE on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001fcd0", PARENT_OWNER="", PARENT_TABLE="COMPRA"
    CHILD_OWNER="", CHILD_TABLE="COMPRA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="id_orden_compra" */
  SELECT count(*) INTO NUMROWS
    FROM COMPRA
    WHERE
      /* %JoinFKPK(:%New,COMPRA," = "," AND") */
      :new.id_orden_compra = COMPRA.id_orden_compra;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update COMPRA_DETALLE because COMPRA does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* PRODUCTO  COMPRA_DETALLE on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PRODUCTO"
    CHILD_OWNER="", CHILD_TABLE="COMPRA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="id_producto" */
  SELECT count(*) INTO NUMROWS
    FROM PRODUCTO
    WHERE
      /* %JoinFKPK(:%New,PRODUCTO," = "," AND") */
      :new.id_producto = PRODUCTO.id_producto;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update COMPRA_DETALLE because PRODUCTO does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_DESCUENTO BEFORE INSERT ON DESCUENTO for each row
-- ERwin Builtin Trigger
-- INSERT trigger on DESCUENTO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* MEMBRESIA  DESCUENTO on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0002119f", PARENT_OWNER="", PARENT_TABLE="MEMBRESIA"
    CHILD_OWNER="", CHILD_TABLE="DESCUENTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_48", FK_COLUMNS="id_membresia" */
    SELECT count(*) INTO NUMROWS
      FROM MEMBRESIA
      WHERE
        /* %JoinFKPK(:%New,MEMBRESIA," = "," AND") */
        :new.id_membresia = MEMBRESIA.id_membresia;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert DESCUENTO because MEMBRESIA does not exist.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* ESTATUS_DESCUENTO  DESCUENTO on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ESTATUS_DESCUENTO"
    CHILD_OWNER="", CHILD_TABLE="DESCUENTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="id_estatus_descuento" */
    SELECT count(*) INTO NUMROWS
      FROM ESTATUS_DESCUENTO
      WHERE
        /* %JoinFKPK(:%New,ESTATUS_DESCUENTO," = "," AND") */
        :new.id_estatus_descuento = ESTATUS_DESCUENTO.id_estatus_descuento;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert DESCUENTO because ESTATUS_DESCUENTO does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER  tD_DESCUENTO AFTER DELETE ON DESCUENTO for each row
-- ERwin Builtin Trigger
-- DELETE trigger on DESCUENTO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* DESCUENTO  PRODUCTO on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000db1e", PARENT_OWNER="", PARENT_TABLE="DESCUENTO"
    CHILD_OWNER="", CHILD_TABLE="PRODUCTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="id_descuento" */
    SELECT count(*) INTO NUMROWS
      FROM PRODUCTO
      WHERE
        /*  %JoinFKPK(PRODUCTO,:%Old," = "," AND") */
        PRODUCTO.id_descuento = :old.id_descuento;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete DESCUENTO because PRODUCTO exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_DESCUENTO AFTER UPDATE ON DESCUENTO for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on DESCUENTO 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* DESCUENTO  PRODUCTO on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00033ff8", PARENT_OWNER="", PARENT_TABLE="DESCUENTO"
    CHILD_OWNER="", CHILD_TABLE="PRODUCTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="id_descuento" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_descuento <> :new.id_descuento
  THEN
    SELECT count(*) INTO NUMROWS
      FROM PRODUCTO
      WHERE
        /*  %JoinFKPK(PRODUCTO,:%Old," = "," AND") */
        PRODUCTO.id_descuento = :old.id_descuento;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update DESCUENTO because PRODUCTO exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* MEMBRESIA  DESCUENTO on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MEMBRESIA"
    CHILD_OWNER="", CHILD_TABLE="DESCUENTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_48", FK_COLUMNS="id_membresia" */
  SELECT count(*) INTO NUMROWS
    FROM MEMBRESIA
    WHERE
      /* %JoinFKPK(:%New,MEMBRESIA," = "," AND") */
      :new.id_membresia = MEMBRESIA.id_membresia;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update DESCUENTO because MEMBRESIA does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* ESTATUS_DESCUENTO  DESCUENTO on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ESTATUS_DESCUENTO"
    CHILD_OWNER="", CHILD_TABLE="DESCUENTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="id_estatus_descuento" */
  SELECT count(*) INTO NUMROWS
    FROM ESTATUS_DESCUENTO
    WHERE
      /* %JoinFKPK(:%New,ESTATUS_DESCUENTO," = "," AND") */
      :new.id_estatus_descuento = ESTATUS_DESCUENTO.id_estatus_descuento;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update DESCUENTO because ESTATUS_DESCUENTO does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_DETALLE_INVENTARIO BEFORE INSERT ON DETALLE_INVENTARIO for each row
-- ERwin Builtin Trigger
-- INSERT trigger on DETALLE_INVENTARIO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* INVENTARIO  DETALLE_INVENTARIO on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00020b1b", PARENT_OWNER="", PARENT_TABLE="INVENTARIO"
    CHILD_OWNER="", CHILD_TABLE="DETALLE_INVENTARIO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_55", FK_COLUMNS="id_inventario" */
    SELECT count(*) INTO NUMROWS
      FROM INVENTARIO
      WHERE
        /* %JoinFKPK(:%New,INVENTARIO," = "," AND") */
        :new.id_inventario = INVENTARIO.id_inventario;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert DETALLE_INVENTARIO because INVENTARIO does not exist.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* PRODUCTO  DETALLE_INVENTARIO on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PRODUCTO"
    CHILD_OWNER="", CHILD_TABLE="DETALLE_INVENTARIO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_57", FK_COLUMNS="id_producto" */
    SELECT count(*) INTO NUMROWS
      FROM PRODUCTO
      WHERE
        /* %JoinFKPK(:%New,PRODUCTO," = "," AND") */
        :new.id_producto = PRODUCTO.id_producto;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert DETALLE_INVENTARIO because PRODUCTO does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_DETALLE_INVENTARIO AFTER UPDATE ON DETALLE_INVENTARIO for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on DETALLE_INVENTARIO 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* INVENTARIO  DETALLE_INVENTARIO on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00021a19", PARENT_OWNER="", PARENT_TABLE="INVENTARIO"
    CHILD_OWNER="", CHILD_TABLE="DETALLE_INVENTARIO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_55", FK_COLUMNS="id_inventario" */
  SELECT count(*) INTO NUMROWS
    FROM INVENTARIO
    WHERE
      /* %JoinFKPK(:%New,INVENTARIO," = "," AND") */
      :new.id_inventario = INVENTARIO.id_inventario;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update DETALLE_INVENTARIO because INVENTARIO does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* PRODUCTO  DETALLE_INVENTARIO on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PRODUCTO"
    CHILD_OWNER="", CHILD_TABLE="DETALLE_INVENTARIO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_57", FK_COLUMNS="id_producto" */
  SELECT count(*) INTO NUMROWS
    FROM PRODUCTO
    WHERE
      /* %JoinFKPK(:%New,PRODUCTO," = "," AND") */
      :new.id_producto = PRODUCTO.id_producto;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update DETALLE_INVENTARIO because PRODUCTO does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_EMPLEADO BEFORE INSERT ON EMPLEADO for each row
-- ERwin Builtin Trigger
-- INSERT trigger on EMPLEADO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* PERSONA  EMPLEADO on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e7e2", PARENT_OWNER="", PARENT_TABLE="PERSONA"
    CHILD_OWNER="", CHILD_TABLE="EMPLEADO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="id_empleado" */
    SELECT count(*) INTO NUMROWS
      FROM PERSONA
      WHERE
        /* %JoinFKPK(:%New,PERSONA," = "," AND") */
        :new.id_empleado = PERSONA.id_persoma;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert EMPLEADO because PERSONA does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER  tD_EMPLEADO AFTER DELETE ON EMPLEADO for each row
-- ERwin Builtin Trigger
-- DELETE trigger on EMPLEADO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* EMPLEADO  INVENTARIO on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e780", PARENT_OWNER="", PARENT_TABLE="EMPLEADO"
    CHILD_OWNER="", CHILD_TABLE="INVENTARIO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="id_empleado" */
    SELECT count(*) INTO NUMROWS
      FROM INVENTARIO
      WHERE
        /*  %JoinFKPK(INVENTARIO,:%Old," = "," AND") */
        INVENTARIO.id_empleado = :old.id_empleado;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete EMPLEADO because INVENTARIO exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_EMPLEADO AFTER UPDATE ON EMPLEADO for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on EMPLEADO 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* EMPLEADO  INVENTARIO on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000216f4", PARENT_OWNER="", PARENT_TABLE="EMPLEADO"
    CHILD_OWNER="", CHILD_TABLE="INVENTARIO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="id_empleado" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_empleado <> :new.id_empleado
  THEN
    SELECT count(*) INTO NUMROWS
      FROM INVENTARIO
      WHERE
        /*  %JoinFKPK(INVENTARIO,:%Old," = "," AND") */
        INVENTARIO.id_empleado = :old.id_empleado;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update EMPLEADO because INVENTARIO exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* PERSONA  EMPLEADO on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PERSONA"
    CHILD_OWNER="", CHILD_TABLE="EMPLEADO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="id_empleado" */
  SELECT count(*) INTO NUMROWS
    FROM PERSONA
    WHERE
      /* %JoinFKPK(:%New,PERSONA," = "," AND") */
      :new.id_empleado = PERSONA.id_persoma;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update EMPLEADO because PERSONA does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_ESTADO AFTER DELETE ON ESTADO for each row
-- ERwin Builtin Trigger
-- DELETE trigger on ESTADO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* ESTADO  PERSONA on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000d4e5", PARENT_OWNER="", PARENT_TABLE="ESTADO"
    CHILD_OWNER="", CHILD_TABLE="PERSONA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="id_estado" */
    SELECT count(*) INTO NUMROWS
      FROM PERSONA
      WHERE
        /*  %JoinFKPK(PERSONA,:%Old," = "," AND") */
        PERSONA.id_estado = :old.id_estado;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete ESTADO because PERSONA exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_ESTADO AFTER UPDATE ON ESTADO for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on ESTADO 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* ESTADO  PERSONA on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000f88f", PARENT_OWNER="", PARENT_TABLE="ESTADO"
    CHILD_OWNER="", CHILD_TABLE="PERSONA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="id_estado" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_estado <> :new.id_estado
  THEN
    SELECT count(*) INTO NUMROWS
      FROM PERSONA
      WHERE
        /*  %JoinFKPK(PERSONA,:%Old," = "," AND") */
        PERSONA.id_estado = :old.id_estado;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update ESTADO because PERSONA exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_ESTATUS_DESCUENTO AFTER DELETE ON ESTATUS_DESCUENTO for each row
-- ERwin Builtin Trigger
-- DELETE trigger on ESTATUS_DESCUENTO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* ESTATUS_DESCUENTO  DESCUENTO on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f283", PARENT_OWNER="", PARENT_TABLE="ESTATUS_DESCUENTO"
    CHILD_OWNER="", CHILD_TABLE="DESCUENTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="id_estatus_descuento" */
    SELECT count(*) INTO NUMROWS
      FROM DESCUENTO
      WHERE
        /*  %JoinFKPK(DESCUENTO,:%Old," = "," AND") */
        DESCUENTO.id_estatus_descuento = :old.id_estatus_descuento;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete ESTATUS_DESCUENTO because DESCUENTO exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_ESTATUS_DESCUENTO AFTER UPDATE ON ESTATUS_DESCUENTO for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on ESTATUS_DESCUENTO 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* ESTATUS_DESCUENTO  DESCUENTO on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00012712", PARENT_OWNER="", PARENT_TABLE="ESTATUS_DESCUENTO"
    CHILD_OWNER="", CHILD_TABLE="DESCUENTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="id_estatus_descuento" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_estatus_descuento <> :new.id_estatus_descuento
  THEN
    SELECT count(*) INTO NUMROWS
      FROM DESCUENTO
      WHERE
        /*  %JoinFKPK(DESCUENTO,:%Old," = "," AND") */
        DESCUENTO.id_estatus_descuento = :old.id_estatus_descuento;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update ESTATUS_DESCUENTO because DESCUENTO exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_INVENTARIO BEFORE INSERT ON INVENTARIO for each row
-- ERwin Builtin Trigger
-- INSERT trigger on INVENTARIO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* EMPLEADO  INVENTARIO on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000fd00", PARENT_OWNER="", PARENT_TABLE="EMPLEADO"
    CHILD_OWNER="", CHILD_TABLE="INVENTARIO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="id_empleado" */
    SELECT count(*) INTO NUMROWS
      FROM EMPLEADO
      WHERE
        /* %JoinFKPK(:%New,EMPLEADO," = "," AND") */
        :new.id_empleado = EMPLEADO.id_empleado;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert INVENTARIO because EMPLEADO does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER  tD_INVENTARIO AFTER DELETE ON INVENTARIO for each row
-- ERwin Builtin Trigger
-- DELETE trigger on INVENTARIO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* INVENTARIO  DETALLE_INVENTARIO on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f21a", PARENT_OWNER="", PARENT_TABLE="INVENTARIO"
    CHILD_OWNER="", CHILD_TABLE="DETALLE_INVENTARIO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_55", FK_COLUMNS="id_inventario" */
    SELECT count(*) INTO NUMROWS
      FROM DETALLE_INVENTARIO
      WHERE
        /*  %JoinFKPK(DETALLE_INVENTARIO,:%Old," = "," AND") */
        DETALLE_INVENTARIO.id_inventario = :old.id_inventario;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete INVENTARIO because DETALLE_INVENTARIO exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_INVENTARIO AFTER UPDATE ON INVENTARIO for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on INVENTARIO 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* INVENTARIO  DETALLE_INVENTARIO on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000234a2", PARENT_OWNER="", PARENT_TABLE="INVENTARIO"
    CHILD_OWNER="", CHILD_TABLE="DETALLE_INVENTARIO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_55", FK_COLUMNS="id_inventario" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_inventario <> :new.id_inventario
  THEN
    SELECT count(*) INTO NUMROWS
      FROM DETALLE_INVENTARIO
      WHERE
        /*  %JoinFKPK(DETALLE_INVENTARIO,:%Old," = "," AND") */
        DETALLE_INVENTARIO.id_inventario = :old.id_inventario;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update INVENTARIO because DETALLE_INVENTARIO exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* EMPLEADO  INVENTARIO on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMPLEADO"
    CHILD_OWNER="", CHILD_TABLE="INVENTARIO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="id_empleado" */
  SELECT count(*) INTO NUMROWS
    FROM EMPLEADO
    WHERE
      /* %JoinFKPK(:%New,EMPLEADO," = "," AND") */
      :new.id_empleado = EMPLEADO.id_empleado;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update INVENTARIO because EMPLEADO does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_MARCA AFTER DELETE ON MARCA for each row
-- ERwin Builtin Trigger
-- DELETE trigger on MARCA 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* MARCA  PRODUCTO on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0001bc85", PARENT_OWNER="", PARENT_TABLE="MARCA"
    CHILD_OWNER="", CHILD_TABLE="PRODUCTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="id_marca" */
    UPDATE PRODUCTO
      SET
        /* %SetFK(PRODUCTO,NULL) */
        PRODUCTO.id_marca = NULL
      WHERE
        /* %JoinFKPK(PRODUCTO,:%Old," = "," AND") */
        PRODUCTO.id_marca = :old.id_marca;

    /* ERwin Builtin Trigger */
    /* MARCA  PROVEEDOR_MARCA on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MARCA"
    CHILD_OWNER="", CHILD_TABLE="PROVEEDOR_MARCA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_54", FK_COLUMNS="id_marca" */
    SELECT count(*) INTO NUMROWS
      FROM PROVEEDOR_MARCA
      WHERE
        /*  %JoinFKPK(PROVEEDOR_MARCA,:%Old," = "," AND") */
        PROVEEDOR_MARCA.id_marca = :old.id_marca;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete MARCA because PROVEEDOR_MARCA exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_MARCA AFTER UPDATE ON MARCA for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on MARCA 
DECLARE NUMROWS INTEGER;
BEGIN
  /* MARCA  PRODUCTO on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0001f3c2", PARENT_OWNER="", PARENT_TABLE="MARCA"
    CHILD_OWNER="", CHILD_TABLE="PRODUCTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="id_marca" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_marca <> :new.id_marca
  THEN
    UPDATE PRODUCTO
      SET
        /* %SetFK(PRODUCTO,NULL) */
        PRODUCTO.id_marca = NULL
      WHERE
        /* %JoinFKPK(PRODUCTO,:%Old," = ",",") */
        PRODUCTO.id_marca = :old.id_marca;
  END IF;

  /* ERwin Builtin Trigger */
  /* MARCA  PROVEEDOR_MARCA on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MARCA"
    CHILD_OWNER="", CHILD_TABLE="PROVEEDOR_MARCA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_54", FK_COLUMNS="id_marca" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_marca <> :new.id_marca
  THEN
    SELECT count(*) INTO NUMROWS
      FROM PROVEEDOR_MARCA
      WHERE
        /*  %JoinFKPK(PROVEEDOR_MARCA,:%Old," = "," AND") */
        PROVEEDOR_MARCA.id_marca = :old.id_marca;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update MARCA because PROVEEDOR_MARCA exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_MEMBRESIA AFTER DELETE ON MEMBRESIA for each row
-- ERwin Builtin Trigger
-- DELETE trigger on MEMBRESIA 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* MEMBRESIA  CLIENTE on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001cf3a", PARENT_OWNER="", PARENT_TABLE="MEMBRESIA"
    CHILD_OWNER="", CHILD_TABLE="CLIENTE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="id_membresia" */
    SELECT count(*) INTO NUMROWS
      FROM CLIENTE
      WHERE
        /*  %JoinFKPK(CLIENTE,:%Old," = "," AND") */
        CLIENTE.id_membresia = :old.id_membresia;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete MEMBRESIA because CLIENTE exists.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* MEMBRESIA  DESCUENTO on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MEMBRESIA"
    CHILD_OWNER="", CHILD_TABLE="DESCUENTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_48", FK_COLUMNS="id_membresia" */
    SELECT count(*) INTO NUMROWS
      FROM DESCUENTO
      WHERE
        /*  %JoinFKPK(DESCUENTO,:%Old," = "," AND") */
        DESCUENTO.id_membresia = :old.id_membresia;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete MEMBRESIA because DESCUENTO exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_MEMBRESIA AFTER UPDATE ON MEMBRESIA for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on MEMBRESIA 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* MEMBRESIA  CLIENTE on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00021a18", PARENT_OWNER="", PARENT_TABLE="MEMBRESIA"
    CHILD_OWNER="", CHILD_TABLE="CLIENTE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="id_membresia" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_membresia <> :new.id_membresia
  THEN
    SELECT count(*) INTO NUMROWS
      FROM CLIENTE
      WHERE
        /*  %JoinFKPK(CLIENTE,:%Old," = "," AND") */
        CLIENTE.id_membresia = :old.id_membresia;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update MEMBRESIA because CLIENTE exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* MEMBRESIA  DESCUENTO on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MEMBRESIA"
    CHILD_OWNER="", CHILD_TABLE="DESCUENTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_48", FK_COLUMNS="id_membresia" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_membresia <> :new.id_membresia
  THEN
    SELECT count(*) INTO NUMROWS
      FROM DESCUENTO
      WHERE
        /*  %JoinFKPK(DESCUENTO,:%Old," = "," AND") */
        DESCUENTO.id_membresia = :old.id_membresia;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update MEMBRESIA because DESCUENTO exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Trigger
END;
/




CREATE  TRIGGER  tD_PERSONA AFTER DELETE ON PERSONA for each row
-- ERwin Builtin Trigger
-- DELETE trigger on PERSONA 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* PERSONA  CLIENTE on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="000204d2", PARENT_OWNER="", PARENT_TABLE="PERSONA"
    CHILD_OWNER="", CHILD_TABLE="CLIENTE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="id_cliente" */
    DELETE FROM CLIENTE
      WHERE
        /*  %JoinFKPK(CLIENTE,:%Old," = "," AND") */
        CLIENTE.id_cliente = :old.id_persoma;

    /* ERwin Builtin Trigger */
    /* PERSONA  EMPLEADO on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PERSONA"
    CHILD_OWNER="", CHILD_TABLE="EMPLEADO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="id_empleado" */
    DELETE FROM EMPLEADO
      WHERE
        /*  %JoinFKPK(EMPLEADO,:%Old," = "," AND") */
        EMPLEADO.id_empleado = :old.id_persoma;

    /* ERwin Builtin Trigger */
    /* PERSONA  PROVEEDOR on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PERSONA"
    CHILD_OWNER="", CHILD_TABLE="PROVEEDOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="id_proveedor" */
    DELETE FROM PROVEEDOR
      WHERE
        /*  %JoinFKPK(PROVEEDOR,:%Old," = "," AND") */
        PROVEEDOR.id_proveedor = :old.id_persoma;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_PERSONA AFTER UPDATE ON PERSONA for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on PERSONA 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* PERSONA  CLIENTE on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0003d73e", PARENT_OWNER="", PARENT_TABLE="PERSONA"
    CHILD_OWNER="", CHILD_TABLE="CLIENTE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="id_cliente" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_persoma <> :new.id_persoma
  THEN
    UPDATE CLIENTE
      SET
        /*  %JoinFKPK(CLIENTE,:%New," = ",",") */
        CLIENTE.id_cliente = :new.id_persoma
      WHERE
        /*  %JoinFKPK(CLIENTE,:%Old," = "," AND") */
        CLIENTE.id_cliente = :old.id_persoma;
  END IF;

  /* ERwin Builtin Trigger */
  /* PERSONA  EMPLEADO on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PERSONA"
    CHILD_OWNER="", CHILD_TABLE="EMPLEADO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="id_empleado" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_persoma <> :new.id_persoma
  THEN
    UPDATE EMPLEADO
      SET
        /*  %JoinFKPK(EMPLEADO,:%New," = ",",") */
        EMPLEADO.id_empleado = :new.id_persoma
      WHERE
        /*  %JoinFKPK(EMPLEADO,:%Old," = "," AND") */
        EMPLEADO.id_empleado = :old.id_persoma;
  END IF;

  /* ERwin Builtin Trigger */
  /* PERSONA  PROVEEDOR on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PERSONA"
    CHILD_OWNER="", CHILD_TABLE="PROVEEDOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="id_proveedor" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_persoma <> :new.id_persoma
  THEN
    UPDATE PROVEEDOR
      SET
        /*  %JoinFKPK(PROVEEDOR,:%New," = ",",") */
        PROVEEDOR.id_proveedor = :new.id_persoma
      WHERE
        /*  %JoinFKPK(PROVEEDOR,:%Old," = "," AND") */
        PROVEEDOR.id_proveedor = :old.id_persoma;
  END IF;

  /* ERwin Builtin Trigger */
  /* ESTADO  PERSONA on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="ESTADO"
    CHILD_OWNER="", CHILD_TABLE="PERSONA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="id_estado" */
  SELECT count(*) INTO NUMROWS
    FROM ESTADO
    WHERE
      /* %JoinFKPK(:%New,ESTADO," = "," AND") */
      :new.id_estado = ESTADO.id_estado;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update PERSONA because ESTADO does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_PRODUCTO BEFORE INSERT ON PRODUCTO for each row
-- ERwin Builtin Trigger
-- INSERT trigger on PRODUCTO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* DESCUENTO  PRODUCTO on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001ea43", PARENT_OWNER="", PARENT_TABLE="DESCUENTO"
    CHILD_OWNER="", CHILD_TABLE="PRODUCTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="id_descuento" */
    SELECT count(*) INTO NUMROWS
      FROM DESCUENTO
      WHERE
        /* %JoinFKPK(:%New,DESCUENTO," = "," AND") */
        :new.id_descuento = DESCUENTO.id_descuento;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert PRODUCTO because DESCUENTO does not exist.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* MARCA  PRODUCTO on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MARCA"
    CHILD_OWNER="", CHILD_TABLE="PRODUCTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="id_marca" */
    UPDATE PRODUCTO
      SET
        /* %SetFK(PRODUCTO,NULL) */
        PRODUCTO.id_marca = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM MARCA
            WHERE
              /* %JoinFKPK(:%New,MARCA," = "," AND") */
              :new.id_marca = MARCA.id_marca
        ) 
        /* %JoinPKPK(PRODUCTO,:%New," = "," AND") */
         and PRODUCTO.id_producto = :new.id_producto;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER  tD_PRODUCTO AFTER DELETE ON PRODUCTO for each row
-- ERwin Builtin Trigger
-- DELETE trigger on PRODUCTO 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* PRODUCTO  COMPRA_DETALLE on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="000308b1", PARENT_OWNER="", PARENT_TABLE="PRODUCTO"
    CHILD_OWNER="", CHILD_TABLE="COMPRA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="id_producto" */
    SELECT count(*) INTO NUMROWS
      FROM COMPRA_DETALLE
      WHERE
        /*  %JoinFKPK(COMPRA_DETALLE,:%Old," = "," AND") */
        COMPRA_DETALLE.id_producto = :old.id_producto;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete PRODUCTO because COMPRA_DETALLE exists.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* PRODUCTO  VENTA_DETALLE on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PRODUCTO"
    CHILD_OWNER="", CHILD_TABLE="VENTA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="id_producto" */
    SELECT count(*) INTO NUMROWS
      FROM VENTA_DETALLE
      WHERE
        /*  %JoinFKPK(VENTA_DETALLE,:%Old," = "," AND") */
        VENTA_DETALLE.id_producto = :old.id_producto;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete PRODUCTO because VENTA_DETALLE exists.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* PRODUCTO  DETALLE_INVENTARIO on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PRODUCTO"
    CHILD_OWNER="", CHILD_TABLE="DETALLE_INVENTARIO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_57", FK_COLUMNS="id_producto" */
    SELECT count(*) INTO NUMROWS
      FROM DETALLE_INVENTARIO
      WHERE
        /*  %JoinFKPK(DETALLE_INVENTARIO,:%Old," = "," AND") */
        DETALLE_INVENTARIO.id_producto = :old.id_producto;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete PRODUCTO because DETALLE_INVENTARIO exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_PRODUCTO AFTER UPDATE ON PRODUCTO for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on PRODUCTO 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* PRODUCTO  COMPRA_DETALLE on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0005885e", PARENT_OWNER="", PARENT_TABLE="PRODUCTO"
    CHILD_OWNER="", CHILD_TABLE="COMPRA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="id_producto" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_producto <> :new.id_producto
  THEN
    SELECT count(*) INTO NUMROWS
      FROM COMPRA_DETALLE
      WHERE
        /*  %JoinFKPK(COMPRA_DETALLE,:%Old," = "," AND") */
        COMPRA_DETALLE.id_producto = :old.id_producto;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update PRODUCTO because COMPRA_DETALLE exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* PRODUCTO  VENTA_DETALLE on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PRODUCTO"
    CHILD_OWNER="", CHILD_TABLE="VENTA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="id_producto" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_producto <> :new.id_producto
  THEN
    SELECT count(*) INTO NUMROWS
      FROM VENTA_DETALLE
      WHERE
        /*  %JoinFKPK(VENTA_DETALLE,:%Old," = "," AND") */
        VENTA_DETALLE.id_producto = :old.id_producto;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update PRODUCTO because VENTA_DETALLE exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* PRODUCTO  DETALLE_INVENTARIO on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PRODUCTO"
    CHILD_OWNER="", CHILD_TABLE="DETALLE_INVENTARIO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_57", FK_COLUMNS="id_producto" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_producto <> :new.id_producto
  THEN
    SELECT count(*) INTO NUMROWS
      FROM DETALLE_INVENTARIO
      WHERE
        /*  %JoinFKPK(DETALLE_INVENTARIO,:%Old," = "," AND") */
        DETALLE_INVENTARIO.id_producto = :old.id_producto;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update PRODUCTO because DETALLE_INVENTARIO exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* DESCUENTO  PRODUCTO on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="DESCUENTO"
    CHILD_OWNER="", CHILD_TABLE="PRODUCTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="id_descuento" */
  SELECT count(*) INTO NUMROWS
    FROM DESCUENTO
    WHERE
      /* %JoinFKPK(:%New,DESCUENTO," = "," AND") */
      :new.id_descuento = DESCUENTO.id_descuento;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update PRODUCTO because DESCUENTO does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* MARCA  PRODUCTO on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MARCA"
    CHILD_OWNER="", CHILD_TABLE="PRODUCTO"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="id_marca" */
  SELECT count(*) INTO NUMROWS
    FROM MARCA
    WHERE
      /* %JoinFKPK(:%New,MARCA," = "," AND") */
      :new.id_marca = MARCA.id_marca;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.id_marca IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update PRODUCTO because MARCA does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_PROVEEDOR BEFORE INSERT ON PROVEEDOR for each row
-- ERwin Builtin Trigger
-- INSERT trigger on PROVEEDOR 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* PERSONA  PROVEEDOR on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e7b1", PARENT_OWNER="", PARENT_TABLE="PERSONA"
    CHILD_OWNER="", CHILD_TABLE="PROVEEDOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="id_proveedor" */
    SELECT count(*) INTO NUMROWS
      FROM PERSONA
      WHERE
        /* %JoinFKPK(:%New,PERSONA," = "," AND") */
        :new.id_proveedor = PERSONA.id_persoma;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert PROVEEDOR because PERSONA does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER  tD_PROVEEDOR AFTER DELETE ON PROVEEDOR for each row
-- ERwin Builtin Trigger
-- DELETE trigger on PROVEEDOR 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* PROVEEDOR  COMPRA on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001e95d", PARENT_OWNER="", PARENT_TABLE="PROVEEDOR"
    CHILD_OWNER="", CHILD_TABLE="COMPRA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="id_proveedor" */
    SELECT count(*) INTO NUMROWS
      FROM COMPRA
      WHERE
        /*  %JoinFKPK(COMPRA,:%Old," = "," AND") */
        COMPRA.id_proveedor = :old.id_proveedor;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete PROVEEDOR because COMPRA exists.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* PROVEEDOR  PROVEEDOR_MARCA on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PROVEEDOR"
    CHILD_OWNER="", CHILD_TABLE="PROVEEDOR_MARCA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="id_proveedor" */
    SELECT count(*) INTO NUMROWS
      FROM PROVEEDOR_MARCA
      WHERE
        /*  %JoinFKPK(PROVEEDOR_MARCA,:%Old," = "," AND") */
        PROVEEDOR_MARCA.id_proveedor = :old.id_proveedor;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete PROVEEDOR because PROVEEDOR_MARCA exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_PROVEEDOR AFTER UPDATE ON PROVEEDOR for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on PROVEEDOR 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* PROVEEDOR  COMPRA on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00033667", PARENT_OWNER="", PARENT_TABLE="PROVEEDOR"
    CHILD_OWNER="", CHILD_TABLE="COMPRA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="id_proveedor" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_proveedor <> :new.id_proveedor
  THEN
    SELECT count(*) INTO NUMROWS
      FROM COMPRA
      WHERE
        /*  %JoinFKPK(COMPRA,:%Old," = "," AND") */
        COMPRA.id_proveedor = :old.id_proveedor;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update PROVEEDOR because COMPRA exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* PROVEEDOR  PROVEEDOR_MARCA on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PROVEEDOR"
    CHILD_OWNER="", CHILD_TABLE="PROVEEDOR_MARCA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="id_proveedor" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_proveedor <> :new.id_proveedor
  THEN
    SELECT count(*) INTO NUMROWS
      FROM PROVEEDOR_MARCA
      WHERE
        /*  %JoinFKPK(PROVEEDOR_MARCA,:%Old," = "," AND") */
        PROVEEDOR_MARCA.id_proveedor = :old.id_proveedor;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update PROVEEDOR because PROVEEDOR_MARCA exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* PERSONA  PROVEEDOR on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PERSONA"
    CHILD_OWNER="", CHILD_TABLE="PROVEEDOR"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_a", FK_COLUMNS="id_proveedor" */
  SELECT count(*) INTO NUMROWS
    FROM PERSONA
    WHERE
      /* %JoinFKPK(:%New,PERSONA," = "," AND") */
      :new.id_proveedor = PERSONA.id_persoma;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update PROVEEDOR because PERSONA does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_PROVEEDOR_MARCA BEFORE INSERT ON PROVEEDOR_MARCA for each row
-- ERwin Builtin Trigger
-- INSERT trigger on PROVEEDOR_MARCA 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* PROVEEDOR  PROVEEDOR_MARCA on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00020ebd", PARENT_OWNER="", PARENT_TABLE="PROVEEDOR"
    CHILD_OWNER="", CHILD_TABLE="PROVEEDOR_MARCA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="id_proveedor" */
    SELECT count(*) INTO NUMROWS
      FROM PROVEEDOR
      WHERE
        /* %JoinFKPK(:%New,PROVEEDOR," = "," AND") */
        :new.id_proveedor = PROVEEDOR.id_proveedor;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert PROVEEDOR_MARCA because PROVEEDOR does not exist.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* MARCA  PROVEEDOR_MARCA on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MARCA"
    CHILD_OWNER="", CHILD_TABLE="PROVEEDOR_MARCA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_54", FK_COLUMNS="id_marca" */
    SELECT count(*) INTO NUMROWS
      FROM MARCA
      WHERE
        /* %JoinFKPK(:%New,MARCA," = "," AND") */
        :new.id_marca = MARCA.id_marca;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert PROVEEDOR_MARCA because MARCA does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_PROVEEDOR_MARCA AFTER UPDATE ON PROVEEDOR_MARCA for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on PROVEEDOR_MARCA 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* PROVEEDOR  PROVEEDOR_MARCA on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001f49a", PARENT_OWNER="", PARENT_TABLE="PROVEEDOR"
    CHILD_OWNER="", CHILD_TABLE="PROVEEDOR_MARCA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_52", FK_COLUMNS="id_proveedor" */
  SELECT count(*) INTO NUMROWS
    FROM PROVEEDOR
    WHERE
      /* %JoinFKPK(:%New,PROVEEDOR," = "," AND") */
      :new.id_proveedor = PROVEEDOR.id_proveedor;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update PROVEEDOR_MARCA because PROVEEDOR does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* MARCA  PROVEEDOR_MARCA on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MARCA"
    CHILD_OWNER="", CHILD_TABLE="PROVEEDOR_MARCA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_54", FK_COLUMNS="id_marca" */
  SELECT count(*) INTO NUMROWS
    FROM MARCA
    WHERE
      /* %JoinFKPK(:%New,MARCA," = "," AND") */
      :new.id_marca = MARCA.id_marca;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update PROVEEDOR_MARCA because MARCA does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_VENTA BEFORE INSERT ON VENTA for each row
-- ERwin Builtin Trigger
-- INSERT trigger on VENTA 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* CLIENTE  VENTA on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e98e", PARENT_OWNER="", PARENT_TABLE="CLIENTE"
    CHILD_OWNER="", CHILD_TABLE="VENTA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_47", FK_COLUMNS="id_cliente" */
    SELECT count(*) INTO NUMROWS
      FROM CLIENTE
      WHERE
        /* %JoinFKPK(:%New,CLIENTE," = "," AND") */
        :new.id_cliente = CLIENTE.id_cliente;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert VENTA because CLIENTE does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER  tD_VENTA AFTER DELETE ON VENTA for each row
-- ERwin Builtin Trigger
-- DELETE trigger on VENTA 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* VENTA  VENTA_DETALLE on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e8f5", PARENT_OWNER="", PARENT_TABLE="VENTA"
    CHILD_OWNER="", CHILD_TABLE="VENTA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="id_orden_venta" */
    SELECT count(*) INTO NUMROWS
      FROM VENTA_DETALLE
      WHERE
        /*  %JoinFKPK(VENTA_DETALLE,:%Old," = "," AND") */
        VENTA_DETALLE.id_orden_venta = :old.id_orden_venta;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete VENTA because VENTA_DETALLE exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_VENTA AFTER UPDATE ON VENTA for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on VENTA 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* VENTA  VENTA_DETALLE on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001f6ab", PARENT_OWNER="", PARENT_TABLE="VENTA"
    CHILD_OWNER="", CHILD_TABLE="VENTA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="id_orden_venta" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id_orden_venta <> :new.id_orden_venta
  THEN
    SELECT count(*) INTO NUMROWS
      FROM VENTA_DETALLE
      WHERE
        /*  %JoinFKPK(VENTA_DETALLE,:%Old," = "," AND") */
        VENTA_DETALLE.id_orden_venta = :old.id_orden_venta;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update VENTA because VENTA_DETALLE exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin Trigger */
  /* CLIENTE  VENTA on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CLIENTE"
    CHILD_OWNER="", CHILD_TABLE="VENTA"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_47", FK_COLUMNS="id_cliente" */
  SELECT count(*) INTO NUMROWS
    FROM CLIENTE
    WHERE
      /* %JoinFKPK(:%New,CLIENTE," = "," AND") */
      :new.id_cliente = CLIENTE.id_cliente;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update VENTA because CLIENTE does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_VENTA_DETALLE BEFORE INSERT ON VENTA_DETALLE for each row
-- ERwin Builtin Trigger
-- INSERT trigger on VENTA_DETALLE 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* VENTA  VENTA_DETALLE on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00021a43", PARENT_OWNER="", PARENT_TABLE="VENTA"
    CHILD_OWNER="", CHILD_TABLE="VENTA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="id_orden_venta" */
    SELECT count(*) INTO NUMROWS
      FROM VENTA
      WHERE
        /* %JoinFKPK(:%New,VENTA," = "," AND") */
        :new.id_orden_venta = VENTA.id_orden_venta;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert VENTA_DETALLE because VENTA does not exist.'
      );
    END IF;

    /* ERwin Builtin Trigger */
    /* PRODUCTO  VENTA_DETALLE on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PRODUCTO"
    CHILD_OWNER="", CHILD_TABLE="VENTA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="id_producto" */
    SELECT count(*) INTO NUMROWS
      FROM PRODUCTO
      WHERE
        /* %JoinFKPK(:%New,PRODUCTO," = "," AND") */
        :new.id_producto = PRODUCTO.id_producto;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert VENTA_DETALLE because PRODUCTO does not exist.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_VENTA_DETALLE AFTER UPDATE ON VENTA_DETALLE for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on VENTA_DETALLE 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* VENTA  VENTA_DETALLE on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001f7e8", PARENT_OWNER="", PARENT_TABLE="VENTA"
    CHILD_OWNER="", CHILD_TABLE="VENTA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="id_orden_venta" */
  SELECT count(*) INTO NUMROWS
    FROM VENTA
    WHERE
      /* %JoinFKPK(:%New,VENTA," = "," AND") */
      :new.id_orden_venta = VENTA.id_orden_venta;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update VENTA_DETALLE because VENTA does not exist.'
    );
  END IF;

  /* ERwin Builtin Trigger */
  /* PRODUCTO  VENTA_DETALLE on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="PRODUCTO"
    CHILD_OWNER="", CHILD_TABLE="VENTA_DETALLE"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="id_producto" */
  SELECT count(*) INTO NUMROWS
    FROM PRODUCTO
    WHERE
      /* %JoinFKPK(:%New,PRODUCTO," = "," AND") */
      :new.id_producto = PRODUCTO.id_producto;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update VENTA_DETALLE because PRODUCTO does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/