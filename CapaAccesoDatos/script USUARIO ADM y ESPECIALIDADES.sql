USE [SRM-LENGUAJESIII]


/*** ATENCI�N: EL CODIGO DE ABAJO INSERTA EL USUARIO ADMINISTRADOR AL SISTEMA Y ES NECESARIO PARA PODER LLEVAR A CABO EL PROCESO, VERIFICAR RUTA DE LA FOTO ***/
INSERT INTO EMPLEADOS(nombre_empleado,apellido_empleado,usuario_empleado,contrase�a_empleado,foto_empleado)  
	SELECT 'Joaquin', 'Macaroff', 'Jomax', '123', BulkColumn  FROM Openrowset( 
			Bulk 'C:\Users\dani1\Documents\Herramientas\faces\face30.jpg', Single_Blob) as Imagen

UPDATE EMPLEADOS SET tipo_empleado = 'Administrador' WHERE id_empleado = 1

/*** FIN DE CODIGO ***/

/*** CODIGO PARA INSERTAR ESPECIALIDADES AL SISTEMA ***/

INSERT INTO ESPECIALIDADES (nombre_especialidad,descripcion_especialidad) VALUES ('Cardiolog�a','Es la especialidad m�dica, encargada del estudio, diagn�stico y tratamiento de las enfermedades del coraz�n y del aparato circulatorio.')

INSERT INTO ESPECIALIDADES (nombre_especialidad,descripcion_especialidad) VALUES ('Neurolog�a','Es la especialidad m�dica que trata los trastornos del sistema nervioso, su prevenci�n, diagn�stico, tratamiento y rehabilitaci�n.')

INSERT INTO ESPECIALIDADES (nombre_especialidad,descripcion_especialidad) VALUES ('Nutrici�n','Es la especialidad m�dica que estudia la alimentaci�n humana y su relaci�n con los procesos qu�micos, biol�gicos y metab�licos, as� como su relaci�n con la composici�n corporal y estado de salud humana.')

INSERT INTO ESPECIALIDADES (nombre_especialidad,descripcion_especialidad) VALUES ('Ginecolog�a','La ginecolog�a es una especialidad m�dica, pero tambi�n tiene algunas vertientes quir�rgicas. se dedica al estudio y tratamiento de diversos problemas y enfermedades del aparato genital femenino.')

INSERT INTO ESPECIALIDADES (nombre_especialidad,descripcion_especialidad) VALUES ('Medicina General','Es especialidad m�dica que proporciona atenci�n sanitaria continua e integral al individuo y a la familia.')

INSERT INTO ESPECIALIDADES (nombre_especialidad,descripcion_especialidad) VALUES ('Oftalmolog�a','Es la especialidad m�dica que estudia las enfermedades de ojo y su tratamiento, incluyendo el globo ocular, su musculatura, el sistema lagrimal y los p�rpados.')

/*** FIN DE CODIGO ***/
