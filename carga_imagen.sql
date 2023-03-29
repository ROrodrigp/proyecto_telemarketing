CREATE OR REPLACE DIRECTORY MY_IMAGE_DIRECTORY AS '/ruta/al/directorio/de/imagenes';


----------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE cargar_imagen_marca (
    p_id_marca IN NUMBER,
    p_nombre_archivo IN VARCHAR2
) AS
    v_blob BLOB;
    v_bfile BFILE;
BEGIN
    -- Inicializar el objeto BLOB vacío
    UPDATE marca SET imagen = EMPTY_BLOB() WHERE id_marca = p_id_marca RETURNING imagen INTO v_blob;

    -- Abrir el archivo de imagen desde el sistema de archivos
    v_bfile := BFILENAME('MY_IMAGE_DIRECTORY', p_nombre_archivo);
    DBMS_LOB.fileopen(v_bfile, DBMS_LOB.file_readonly);

    -- Cargar la imagen en la columna BLOB
    DBMS_LOB.loadfromfile(v_blob, v_bfile, DBMS_LOB.getlength(v_bfile));

    -- Cerrar el archivo y actualizar la columna BLOB
    DBMS_LOB.fileclose(v_bfile);

    UPDATE marca SET imagen = v_blob WHERE id_marca = p_id_marca;

    COMMIT;
END cargar_imagen_marca;
/

----------------------------------------------------------------------------------------
BEGIN
    cargar_imagen_marca(1, 'nombre_de_la_imagen.jpg');
END;
/
