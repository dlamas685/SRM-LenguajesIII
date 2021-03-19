USE [SRM-LENGUAJESIII]


/*** ATENCIÓN: EL CODIGO DE ABAJO INSERTA EL USUARIO ADMINISTRADOR AL SISTEMA Y ES NECESARIO PARA PODER LLEVAR A CABO EL PROCESO, VERIFICAR RUTA DE LA FOTO ***/
INSERT INTO EMPLEADOS(nombre_empleado,apellido_empleado,usuario_empleado,contraseña_empleado,foto_empleado)  
	SELECT 'Joaquin', 'Macaroff', 'Jomax', '123', BulkColumn  FROM Openrowset( 
			Bulk 'C:\Users\dani1\Documents\Herramientas\faces\face30.jpg', Single_Blob) as Imagen

UPDATE EMPLEADOS SET tipo_empleado = 'Administrador' WHERE id_empleado = 1

/*** FIN DE CODIGO ***/

/*** CODIGO PARA INSERTAR ESPECIALIDADES AL SISTEMA ***/

INSERT INTO ESPECIALIDADES (nombre_especialidad,descripcion_especialidad) VALUES ('Cardiología','Es la especialidad médica, encargada del estudio, diagnóstico y tratamiento de las enfermedades del corazón y del aparato circulatorio.')

INSERT INTO ESPECIALIDADES (nombre_especialidad,descripcion_especialidad) VALUES ('Neurología','Es la especialidad médica que trata los trastornos del sistema nervioso, su prevención, diagnóstico, tratamiento y rehabilitación.')

INSERT INTO ESPECIALIDADES (nombre_especialidad,descripcion_especialidad) VALUES ('Nutrición','Es la especialidad médica que estudia la alimentación humana y su relación con los procesos químicos, biológicos y metabólicos, así como su relación con la composición corporal y estado de salud humana.')

INSERT INTO ESPECIALIDADES (nombre_especialidad,descripcion_especialidad) VALUES ('Ginecología','La ginecología es una especialidad médica, pero también tiene algunas vertientes quirúrgicas. se dedica al estudio y tratamiento de diversos problemas y enfermedades del aparato genital femenino.')

INSERT INTO ESPECIALIDADES (nombre_especialidad,descripcion_especialidad) VALUES ('Medicina General','Es especialidad médica que proporciona atención sanitaria continua e integral al individuo y a la familia.')

INSERT INTO ESPECIALIDADES (nombre_especialidad,descripcion_especialidad) VALUES ('Oftalmología','Es la especialidad médica que estudia las enfermedades de ojo y su tratamiento, incluyendo el globo ocular, su musculatura, el sistema lagrimal y los párpados.')

/*** FIN DE CODIGO ***/
