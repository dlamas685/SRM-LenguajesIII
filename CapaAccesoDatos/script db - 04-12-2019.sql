USE [SRM-LENGUAJESIII]
GO
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 4/12/2019 20:54:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADOS](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[foto_empleado] [image] NOT NULL,
	[nombre_empleado] [varchar](50) NOT NULL,
	[apellido_empleado] [varchar](50) NOT NULL,
	[usuario_empleado] [varchar](100) NOT NULL,
	[contraseña_empleado] [varchar](200) NOT NULL,
	[fecha_creacion_empleado] [datetime] NOT NULL,
	[estado_eliminacion_empleado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESPECIALIDADES]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESPECIALIDADES](
	[id_especialidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre_especialidad] [varchar](50) NOT NULL,
	[descripcion_especialidad] [varchar](1000) NOT NULL,
	[estado_eliminacion_especialidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HORARIOS]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HORARIOS](
	[id_horario] [int] IDENTITY(1,1) NOT NULL,
	[id_medico] [int] NOT NULL,
	[id_empleado] [int] NOT NULL,
	[fecha_atencion] [date] NOT NULL,
	[hora_inicio] [time](0) NOT NULL,
	[hora_fin] [time](0) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[estado_horario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HORARIOS_HORA]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HORARIOS_HORA](
	[id_horario_hora] [int] IDENTITY(1,1) NOT NULL,
	[id_horario] [int] NOT NULL,
	[hora] [time](0) NOT NULL,
	[estado_hora] [int] NOT NULL,
	[situacion_hora] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_horario_hora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEDICOS]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEDICOS](
	[id_medico] [int] IDENTITY(1,1) NOT NULL,
	[id_especialidad] [int] NOT NULL,
	[id_empleado] [int] NOT NULL,
	[foto_medico] [image] NOT NULL,
	[nombre_medico] [varchar](50) NOT NULL,
	[apellido_medico] [varchar](50) NOT NULL,
	[cuil_medico] [varchar](15) NOT NULL,
	[dni_medico] [varchar](8) NOT NULL,
	[telefono_medico] [varchar](50) NOT NULL,
	[sexo_medico] [varchar](1) NOT NULL,
	[fecha_nacimiento_medico] [date] NOT NULL,
	[descripcion_medico] [varchar](1000) NULL,
	[fecha_creacion_medico] [datetime] NOT NULL,
	[estado_eliminacion_medico] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PACIENTES]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PACIENTES](
	[id_paciente] [int] IDENTITY(1,1) NOT NULL,
	[foto_paciente] [image] NOT NULL,
	[nombre_paciente] [varchar](50) NOT NULL,
	[apellido_paciente] [varchar](50) NOT NULL,
	[dni_paciente] [varchar](8) NOT NULL,
	[fecha_nacimiento_paciente] [date] NOT NULL,
	[email_paciente] [varchar](100) NOT NULL,
	[telefono_paciente] [varchar](50) NULL,
	[direccion_paciente] [varchar](100) NOT NULL,
	[sexo_paciente] [varchar](1) NOT NULL,
	[contraseña_paciente] [varchar](200) NOT NULL,
	[estado_eliminacion_paciente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dni_paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESERVAS]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESERVAS](
	[id_reserva] [int] IDENTITY(1,1) NOT NULL,
	[id_paciente] [int] NOT NULL,
	[id_empleado] [int] NULL,
	[id_medico] [int] NOT NULL,
	[fecha_reserva] [date] NOT NULL,
	[hora_reserva] [time](0) NOT NULL,
	[consulta_reserva] [varchar](1000) NULL,
	[motivo_observacion_reserva] [varchar](1000) NULL,
	[estado_reserva] [varchar](20) NOT NULL,
	[estado_eliminacion_reserva] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT (getdate()) FOR [fecha_creacion_empleado]
GO
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ((1)) FOR [estado_eliminacion_empleado]
GO
ALTER TABLE [dbo].[ESPECIALIDADES] ADD  DEFAULT ((1)) FOR [estado_eliminacion_especialidad]
GO
ALTER TABLE [dbo].[HORARIOS] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[HORARIOS] ADD  DEFAULT ((1)) FOR [estado_horario]
GO
ALTER TABLE [dbo].[HORARIOS_HORA] ADD  DEFAULT ((1)) FOR [estado_hora]
GO
ALTER TABLE [dbo].[HORARIOS_HORA] ADD  DEFAULT ((0)) FOR [situacion_hora]
GO
ALTER TABLE [dbo].[MEDICOS] ADD  DEFAULT (getdate()) FOR [fecha_creacion_medico]
GO
ALTER TABLE [dbo].[MEDICOS] ADD  DEFAULT ((1)) FOR [estado_eliminacion_medico]
GO
ALTER TABLE [dbo].[PACIENTES] ADD  DEFAULT ((1)) FOR [estado_eliminacion_paciente]
GO
ALTER TABLE [dbo].[RESERVAS] ADD  DEFAULT ('Pendiente') FOR [estado_reserva]
GO
ALTER TABLE [dbo].[RESERVAS] ADD  DEFAULT ((1)) FOR [estado_eliminacion_reserva]
GO
ALTER TABLE [dbo].[HORARIOS]  WITH CHECK ADD FOREIGN KEY([id_empleado])
REFERENCES [dbo].[EMPLEADOS] ([id_empleado])
GO
ALTER TABLE [dbo].[HORARIOS]  WITH CHECK ADD FOREIGN KEY([id_medico])
REFERENCES [dbo].[MEDICOS] ([id_medico])
GO
ALTER TABLE [dbo].[HORARIOS_HORA]  WITH CHECK ADD FOREIGN KEY([id_horario])
REFERENCES [dbo].[HORARIOS] ([id_horario])
GO
ALTER TABLE [dbo].[MEDICOS]  WITH CHECK ADD FOREIGN KEY([id_empleado])
REFERENCES [dbo].[EMPLEADOS] ([id_empleado])
GO
ALTER TABLE [dbo].[MEDICOS]  WITH CHECK ADD FOREIGN KEY([id_especialidad])
REFERENCES [dbo].[ESPECIALIDADES] ([id_especialidad])
GO
ALTER TABLE [dbo].[RESERVAS]  WITH CHECK ADD FOREIGN KEY([id_empleado])
REFERENCES [dbo].[EMPLEADOS] ([id_empleado])
GO
ALTER TABLE [dbo].[RESERVAS]  WITH CHECK ADD FOREIGN KEY([id_medico])
REFERENCES [dbo].[MEDICOS] ([id_medico])
GO
ALTER TABLE [dbo].[RESERVAS]  WITH CHECK ADD FOREIGN KEY([id_paciente])
REFERENCES [dbo].[PACIENTES] ([id_paciente])
GO
/****** Object:  StoredProcedure [dbo].[spConfirmarReserva]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConfirmarReserva] (
@prmIdReserva INT,
@prmUsuario VARCHAR(100),
@prmObservacion VARCHAR (1000)
)
AS
BEGIN
	DECLARE @IdEmpleado INT
	SET @IdEmpleado = (SELECT id_empleado FROM EMPLEADOS WHERE usuario_empleado = @prmUsuario)
	UPDATE RESERVAS SET 
	motivo_observacion_reserva = @prmObservacion,
	estado_reserva = 'Confirmada',
	id_empleado = @IdEmpleado
	WHERE id_reserva = @prmIdReserva
END
GO
/****** Object:  StoredProcedure [dbo].[spDeshabilitarHorarioFecha]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeshabilitarHorarioFecha] (
@prmIdHorario INT,
@prmIdHorarioHora INT
)
AS
BEGIN
	UPDATE HORARIOS_HORA
	SET estado_hora = 0
	WHERE id_horario_hora = @prmIdHorarioHora AND @prmIdHorario = id_horario
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarHorarioMedico]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarHorarioMedico] (
@prmIdMedico INT,
@prmIdHorario INT
)
AS
BEGIN
	DECLARE @CANT INT
	SET @CANT = (SELECT COUNT(id_horario_hora) FROM HORARIOS_HORA WHERE situacion_hora = 1 AND  id_horario = @prmIdHorario)
	IF (@CANT = 0)
			DELETE FROM HORARIOS_HORA WHERE id_horario = @prmIdHorario
			DELETE FROM HORARIOS WHERE id_horario = @prmIdHorario AND id_medico = @prmIdMedico
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarMedico]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarMedico] (@prmIdMedico INT)
AS
BEGIN
	UPDATE MEDICOS SET estado_eliminacion_medico = 0 WHERE id_medico = @prmIdMedico
END
GO
/****** Object:  StoredProcedure [dbo].[spHabilitarHorarioFecha]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spHabilitarHorarioFecha] (
@prmIdHorario INT,
@prmIdHorarioHora INT
)
AS
BEGIN
	UPDATE HORARIOS_HORA
	SET estado_hora = 1
	WHERE id_horario_hora = @prmIdHorarioHora AND @prmIdHorario = id_horario
END
GO
/****** Object:  StoredProcedure [dbo].[spIniciarSesion]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spIniciarSesion] (@prmEmailPaciente VARCHAR (100), @prmContraseñaPaciente VARCHAR (200))
AS
BEGIN
	SELECT id_paciente,foto_paciente,email_paciente,contraseña_paciente FROM PACIENTES WHERE email_paciente = @prmEmailPaciente AND contraseña_paciente = @prmContraseñaPaciente

END
GO
/****** Object:  StoredProcedure [dbo].[spIniciarSesionEmpleado]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spIniciarSesionEmpleado] (
@prmUsuarioEmpleado VARCHAR (100), 
@prmContraseñaEmpleado VARCHAR (200))
AS
BEGIN
	SELECT id_empleado,foto_empleado,usuario_empleado,contraseña_empleado,nombre_empleado,apellido_empleado FROM EMPLEADOS WHERE usuario_empleado = @prmUsuarioEmpleado AND contraseña_empleado = @prmContraseñaEmpleado AND estado_eliminacion_empleado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spListarEspecialidades]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spListarEspecialidades] 
AS
BEGIN
	SELECT id_especialidad, nombre_especialidad,descripcion_especialidad FROM ESPECIALIDADES WHERE estado_eliminacion_especialidad=1 ORDER BY nombre_especialidad ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spListarHorariosMedico]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarHorariosMedico] (@prmIdMedico INT)
AS
BEGIN
	SELECT id_medico,id_horario,CONVERT(VARCHAR(10),fecha_atencion,103) AS 'fecha_atencion', Convert(VARCHAR(8),hora_inicio,8) AS 'hora_inicio',CONVERT(VARCHAR(8),hora_fin,8) AS 'hora_fin' FROM HORARIOS 
	WHERE id_medico = @prmIdMedico 
END
GO
/****** Object:  StoredProcedure [dbo].[spListarHorariosMedicoRangoFecha]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spListarHorariosMedicoRangoFecha] (
@prmIdMedico INT,
@prmFechaInicio DATE,
@prmFechaFin DATE
)
AS
BEGIN
	SELECT id_medico,id_horario,CONVERT(VARCHAR(10),fecha_atencion,103) AS 'fecha_atencion', Convert(VARCHAR(8),hora_inicio,8) AS 'hora_inicio',CONVERT(VARCHAR(8),hora_fin,8) AS 'hora_fin' FROM HORARIOS 
	WHERE id_medico = @prmIdMedico AND fecha_atencion BETWEEN @prmFechaInicio AND @prmFechaFin
END
GO
/****** Object:  StoredProcedure [dbo].[spListarHorasFecha]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarHorasFecha] (@prmIdHorario INT)
AS
BEGIN
	SELECT id_horario_hora,id_horario,hora,situacion_hora,estado_hora FROM HORARIOS_HORA 
	WHERE id_horario = @prmIdHorario AND situacion_hora = 0
END
GO
/****** Object:  StoredProcedure [dbo].[spListarHorasFechaHabilitadas]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarHorasFechaHabilitadas] (@prmIdHorario INT)
AS
BEGIN
	SELECT id_horario_hora,id_horario,hora,situacion_hora,estado_hora FROM HORARIOS_HORA 
	WHERE id_horario = @prmIdHorario AND situacion_hora = 0 AND estado_hora = 1
	ORDER BY hora
END
GO
/****** Object:  StoredProcedure [dbo].[spListarMedicos]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMedicos]
AS
BEGIN
	SELECT M.id_medico,M.foto_medico,M.nombre_medico,M.apellido_medico,M.cuil_medico,CONVERT(VARCHAR(10),M.fecha_nacimiento_medico,103) AS 'fecha_nacimiento_medico',ISNULL(M.descripcion_medico,'-') AS 'descripcion_medico',M.sexo_medico,E.nombre_especialidad,M.telefono_medico,M.dni_medico, E.id_especialidad FROM MEDICOS M 
	INNER JOIN ESPECIALIDADES E 
	ON E.id_especialidad = M.id_especialidad
	WHERE estado_eliminacion_medico = 1
	ORDER BY (M.apellido_medico + ' ' + M.nombre_medico) ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spListarMedicosConFechasDefinidas]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMedicosConFechasDefinidas]
AS
BEGIN
	SELECT M.id_medico,M.nombre_medico,M.apellido_medico
	FROM MEDICOS M 
	INNER JOIN HORARIOS H
	ON H.id_medico = M.id_medico
	WHERE estado_eliminacion_medico = 1 AND H.fecha_atencion>GETDATE()
	GROUP BY M.nombre_medico,M.id_medico,M.apellido_medico
	ORDER BY (M.apellido_medico + ' ' + M.nombre_medico) ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spListarMedicosEspecialidadFechas]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMedicosEspecialidadFechas] (
@prmIdEspecialidad INT,
@prmFechaInicio DATE,
@prmFechaFin DATE
)
AS
BEGIN
	SELECT DISTINCT M.id_medico,M.nombre_medico,CAST(foto_medico AS VARBINARY(MAX)) AS 'foto_medico',M.apellido_medico,M.cuil_medico,CONVERT(VARCHAR(10),M.fecha_nacimiento_medico,103) AS 'fecha_nacimiento_medico',ISNULL(M.descripcion_medico,'-') AS 'descripcion_medico',M.sexo_medico,E.nombre_especialidad,M.telefono_medico,M.dni_medico, E.id_especialidad 
	FROM MEDICOS M
	INNER JOIN ESPECIALIDADES E
	ON E.id_especialidad = M.id_especialidad
	INNER JOIN HORARIOS H
	ON H.id_medico = M.id_medico
	INNER JOIN HORARIOS_HORA HH
	ON HH.id_horario = H.id_horario
	WHERE M.id_especialidad=@prmIdEspecialidad AND HH.situacion_hora=0 AND H.fecha_atencion BETWEEN @prmFechaInicio AND @prmFechaFin
END
GO
/****** Object:  StoredProcedure [dbo].[spListarReservas]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarReservas]
AS
BEGIN
	SELECT R.id_reserva,P.nombre_paciente,P.apellido_paciente,P.email_paciente,P.telefono_paciente,P.sexo_paciente,M.nombre_medico,M.apellido_medico,CONVERT(VARCHAR(10),R.fecha_reserva,103) AS 'fecha_reserva',R.hora_reserva,R.estado_reserva, R.consulta_reserva, E.nombre_especialidad FROM RESERVAS R
	INNER JOIN MEDICOS M
	ON R.id_medico = M.id_medico
	INNER JOIN PACIENTES P
	ON P.id_paciente = R.id_paciente
	INNER JOIN ESPECIALIDADES E
	ON E.id_especialidad = M.id_especialidad
	WHERE estado_reserva= 'Pendiente'
END
GO
/****** Object:  StoredProcedure [dbo].[spListarReservasConfirmadas]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarReservasConfirmadas]
AS
BEGIN
	SELECT R.id_reserva,P.nombre_paciente,P.apellido_paciente,P.email_paciente,P.telefono_paciente,P.sexo_paciente,M.nombre_medico,M.apellido_medico,CONVERT(VARCHAR(10),R.fecha_reserva,103) AS 'fecha_reserva',R.hora_reserva,R.estado_reserva, R.consulta_reserva, E.nombre_especialidad,EM.nombre_empleado, EM.apellido_empleado, R.motivo_observacion_reserva FROM RESERVAS R
	INNER JOIN MEDICOS M
	ON R.id_medico = M.id_medico
	INNER JOIN PACIENTES P
	ON P.id_paciente = R.id_paciente
	INNER JOIN ESPECIALIDADES E
	ON E.id_especialidad = M.id_especialidad
	INNER JOIN EMPLEADOS EM
	ON EM.id_empleado = R.id_empleado
	WHERE estado_reserva= 'Confirmada'
END
GO
/****** Object:  StoredProcedure [dbo].[spListarReservasPaciente]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarReservasPaciente] (
@prmIdPaciente INT
)
AS
BEGIN
	SELECT R.id_reserva,P.nombre_paciente,P.apellido_paciente,P.email_paciente,P.telefono_paciente,P.sexo_paciente,M.nombre_medico,M.apellido_medico,CONVERT(VARCHAR(10),R.fecha_reserva,103) AS 'fecha_reserva',R.hora_reserva,R.estado_reserva, R.consulta_reserva, E.nombre_especialidad, ISNULL(R.motivo_observacion_reserva,'Sin Revisar') AS 'motivo_observacion_reserva' FROM RESERVAS R
	INNER JOIN MEDICOS M
	ON R.id_medico = M.id_medico
	INNER JOIN PACIENTES P
	ON P.id_paciente = R.id_paciente
	INNER JOIN ESPECIALIDADES E
	ON E.id_especialidad = M.id_especialidad
	WHERE R.id_paciente = @prmIdPaciente
END
GO
/****** Object:  StoredProcedure [dbo].[spListarReservasRechazadas]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarReservasRechazadas]
AS
BEGIN
	SELECT R.id_reserva,P.nombre_paciente,P.apellido_paciente,P.email_paciente,P.telefono_paciente,P.sexo_paciente,M.nombre_medico,M.apellido_medico,CONVERT(VARCHAR(10),R.fecha_reserva,103) AS 'fecha_reserva',R.hora_reserva,R.estado_reserva, R.consulta_reserva, E.nombre_especialidad,EM.nombre_empleado, EM.apellido_empleado, R.motivo_observacion_reserva FROM RESERVAS R
	INNER JOIN MEDICOS M
	ON R.id_medico = M.id_medico
	INNER JOIN PACIENTES P
	ON P.id_paciente = R.id_paciente
	INNER JOIN ESPECIALIDADES E
	ON E.id_especialidad = M.id_especialidad
	INNER JOIN EMPLEADOS EM
	ON EM.id_empleado = R.id_empleado
	WHERE estado_reserva= 'Rechazada'
END
GO
/****** Object:  StoredProcedure [dbo].[spModificarMedico]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModificarMedico](
@prmIdMedico INT,
@prmFotoMedico IMAGE = NULL,
@prmNombreMedico VARCHAR (50),
@prmApellidoMedico VARCHAR (50),
@prmDniMedico VARCHAR (8),
@prmFechaNacimientoMedico DATE,
@prmCuilMedico VARCHAR (15),
@prmTelefonoMedico VARCHAR (50),
@prmDescripcionMedico VARCHAR (1000) = null,
@prmSexoMedico VARCHAR (1),
@prmIdEspecialidad INT
)
AS
BEGIN
	IF (@prmFotoMedico IS NULL) 
		UPDATE MEDICOS
		SET
		nombre_medico = @prmNombreMedico,
		apellido_medico = @prmApellidoMedico,
		cuil_medico = @prmCuilMedico,
		telefono_medico = @prmTelefonoMedico,
		descripcion_medico = @prmDescripcionMedico,
		sexo_medico = @prmSexoMedico,
		dni_medico = @prmDniMedico,
		fecha_nacimiento_medico = @prmFechaNacimientoMedico,
		id_especialidad = @prmIdEspecialidad
		WHERE id_medico = @prmIdMedico
	ELSE 
		UPDATE MEDICOS
		SET foto_medico = @prmFotoMedico,
		nombre_medico = @prmNombreMedico,
		apellido_medico = @prmApellidoMedico,
		cuil_medico = @prmCuilMedico,
		telefono_medico = @prmTelefonoMedico,
		descripcion_medico = @prmDescripcionMedico,
		sexo_medico = @prmSexoMedico,
		dni_medico = @prmDniMedico,
		fecha_nacimiento_medico = @prmFechaNacimientoMedico,
		id_especialidad = @prmIdEspecialidad
		WHERE id_medico = @prmIdMedico	
END
GO
/****** Object:  StoredProcedure [dbo].[spModificarPaciente]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModificarPaciente](
@prmEmailPaciente VARCHAR (100),
@prmFotoPaciente IMAGE = NULL,
@prmNombrePaciente VARCHAR (50),
@prmApellidoPaciente VARCHAR (50),
@prmFechaNacimientoMedico DATE,
@prmDireccionPaciente VARCHAR (100),
@prmTelefonoPaciente VARCHAR (50) = NULL,
@prmSexoPaciente VARCHAR (1)
)
AS
BEGIN
	IF (@prmFotoPaciente IS NULL) 
		UPDATE PACIENTES
		SET
		nombre_paciente = @prmNombrePaciente,
		apellido_paciente = @prmApellidoPaciente,
		telefono_paciente = @prmTelefonoPaciente,
		direccion_paciente= @prmDireccionPaciente,
		fecha_nacimiento_paciente = @prmFechaNacimientoMedico,
		sexo_paciente = @prmSexoPaciente
		WHERE email_paciente = @prmEmailPaciente
	ELSE 
		UPDATE PACIENTES
		SET
		nombre_paciente = @prmNombrePaciente,
		apellido_paciente = @prmApellidoPaciente,
		telefono_paciente = @prmTelefonoPaciente,
		direccion_paciente= @prmDireccionPaciente,
		fecha_nacimiento_paciente = @prmFechaNacimientoMedico,
		sexo_paciente = @prmSexoPaciente,
		foto_paciente = @prmFotoPaciente
		WHERE email_paciente = @prmEmailPaciente
END
GO
/****** Object:  StoredProcedure [dbo].[spRechazarReserva]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRechazarReserva] (
@prmIdReserva INT,
@prmUsuario VARCHAR(100),
@prmMotivo VARCHAR (1000)
)
AS
BEGIN
	BEGIN TRANSACTION TN
	BEGIN TRY
		DECLARE @IdEmpleado INT
		SET @IdEmpleado = (SELECT id_empleado FROM EMPLEADOS WHERE usuario_empleado = @prmUsuario)
		DECLARE @fecha DATE 
		SET @fecha = (SELECT fecha_reserva FROM RESERVAS WHERE id_reserva = @prmIdReserva)
		DECLARE @IdMedico INT
		SET @IdMedico = (SELECT id_medico FROM RESERVAS WHERE id_reserva = @prmIdReserva)
		DECLARE @hora TIME (0)
		SET @hora = (SELECT hora_reserva FROM RESERVAS WHERE id_reserva = @prmIdReserva)
		DECLARE @IdHorario INT
		SET @IdHorario = (SELECT id_horario FROM HORARIOS WHERE id_medico = @IdMedico AND fecha_atencion = @fecha)
		DECLARE @IdHorarioHora INT
		SET @IdHorarioHora = (SELECT id_horario_hora FROM HORARIOS_HORA WHERE id_horario = @IdHorario AND hora = @hora)
		UPDATE RESERVAS SET 
		motivo_observacion_reserva = @prmMotivo,
		estado_reserva = 'Rechazada',
		id_empleado = @IdEmpleado
		WHERE id_reserva = @prmIdReserva
		UPDATE HORARIOS_HORA SET situacion_hora = 0
		WHERE id_horario_hora = @IdHorarioHora
		IF @@TRANCOUNT > 0
		COMMIT
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER(),
				ERROR_SEVERITY(),
				ERROR_STATE(),
				ERROR_LINE(),
				ERROR_MESSAGE()
		ROLLBACK
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarHorariosAtencion]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarHorariosAtencion] (
@prmIdMedico INT,
@prmIdEmpleado INT,
@prmFechaAtencion DATE,
@prmHoraInicio TIME(0),
@prmHoraFin TIME (0)
)
AS
BEGIN
	DECLARE @FILAS INT 
	SET @FILAS = (SELECT COUNT(id_horario) FROM HORARIOS WHERE fecha_atencion = @prmFechaAtencion AND id_medico = @prmIdMedico)
	IF @FILAS = 0
		INSERT INTO HORARIOS (id_medico,id_empleado,fecha_atencion,hora_inicio,hora_fin) VALUES (@prmIdMedico,@prmIdEmpleado,@prmFechaAtencion,@prmHoraInicio,@prmHoraFin)
		DECLARE @IDHORARIO INT
		SET @IDHORARIO = (SELECT TOP 1 id_horario FROM HORARIOS ORDER BY id_horario DESC)
		DECLARE @LIMITE TIME(0) 
		SET @LIMITE = @prmHoraInicio
		WHILE @LIMITE <= @prmHoraFin
			BEGIN
			INSERT INTO HORARIOS_HORA (id_horario,hora) VALUES (@IDHORARIO,@LIMITE)
			SET @LIMITE = (SELECT CONVERT(time(0),DATEADD(minute,30,@LIMITE),8))
			END
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarMedico]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarMedico](
@prmFotoMedico IMAGE,
@prmNombreMedico VARCHAR (50),
@prmApellidoMedico VARCHAR (50),
@prmDniMedico VARCHAR (8),
@prmFechaNacimientoMedico DATE,
@prmCuilMedico VARCHAR (15),
@prmTelefonoMedico VARCHAR (50),
@prmDescripcionMedico VARCHAR (1000) = null,
@prmSexoMedico VARCHAR (1),
@prmIdEspecialidad INT,
@prmUsuarioEmpleado VARCHAR (100)
)
AS
BEGIN
	DECLARE @FILAS INT 
	SET @FILAS = (SELECT COUNT(id_medico) FROM MEDICOS WHERE cuil_medico = @prmCuilMedico)
	IF @FILAS=0
		DECLARE @IdEmpleado INT
		SET @IdEmpleado = (SELECT id_empleado FROM EMPLEADOS WHERE usuario_empleado = @prmUsuarioEmpleado) 
		INSERT INTO MEDICOS(foto_medico,nombre_medico,apellido_medico,dni_medico,fecha_nacimiento_medico,cuil_medico,telefono_medico,descripcion_medico,sexo_medico,id_empleado,id_especialidad) 
		VALUES (@prmFotoMedico,@prmNombreMedico,@prmApellidoMedico,@prmDniMedico,@prmFechaNacimientoMedico,@prmCuilMedico,@prmTelefonoMedico,@prmDescripcionMedico,@prmSexoMedico,@IdEmpleado,@prmIdEspecialidad)
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarPaciente]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarPaciente](
@prmFotoPaciente IMAGE,
@prmNombrePaciente VARCHAR (50),
@prmApellidoPaciente VARCHAR (50),
@prmDniPaciente VARCHAR (8),
@prmFechaNacimientoPaciente DATE,
@prmEmailPaciente VARCHAR (100),
@prmTelefonoPaciente VARCHAR (50) = NULL,
@prmDireccionPaciente VARCHAR (100),
@prmSexoPaciente VARCHAR (1),
@prmContraseñaPaciente VARCHAR (100)
)
AS
BEGIN
	DECLARE @FILAS INT 
	SET @FILAS = (SELECT COUNT(id_paciente) FROM PACIENTES WHERE dni_paciente = @prmDniPaciente OR email_paciente= @prmEmailPaciente)
	IF @FILAS=0
	INSERT INTO PACIENTES (foto_paciente,nombre_paciente,apellido_paciente,dni_paciente,fecha_nacimiento_paciente,email_paciente,telefono_paciente,direccion_paciente,sexo_paciente,contraseña_paciente) 
	VALUES (@prmFotoPaciente,@prmNombrePaciente,@prmApellidoPaciente,@prmDniPaciente,@prmFechaNacimientoPaciente,@prmEmailPaciente,@prmTelefonoPaciente,@prmDireccionPaciente,@prmSexoPaciente,@prmContraseñaPaciente)
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarReserva]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarReserva] (
@prmIdMedico INT,
@prmEmailPaciente VARCHAR (100),
@prmFechaReserva DATE,
@prmHoraReserva TIME(0),
@prmConsultaReserva VARCHAR (1000),
@prmIdHorarioHora INT
)
AS
BEGIN

		DECLARE @IdPaciente INT
		SET @IdPaciente = (SELECT id_paciente FROM PACIENTES WHERE email_paciente = @prmEmailPaciente)
		DECLARE @SITUACION INT
		SET @SITUACION = (SELECT situacion_hora FROM HORARIOS_HORA WHERE id_horario_hora=@prmIdHorarioHora)
		DECLARE @ESTADO INT
		SET @ESTADO = (SELECT estado_hora FROM HORARIOS_HORA WHERE id_horario_hora=@prmIdHorarioHora)
		IF (@SITUACION = 0 AND @ESTADO = 1)
			UPDATE HORARIOS_HORA SET situacion_hora = 1 WHERE id_horario_hora = @prmIdHorarioHora
			INSERT INTO RESERVAS (id_paciente,id_medico,fecha_reserva,hora_reserva,consulta_reserva) VALUES (@IdPaciente,@prmIdMedico,@prmFechaReserva,@prmHoraReserva,@prmConsultaReserva)
END
GO
/****** Object:  StoredProcedure [dbo].[spTraerDatosPaciente]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTraerDatosPaciente] (
@prmEmailPaciente VARCHAR (100)
)
AS
BEGIN 
	SELECT id_paciente,foto_paciente, email_paciente, nombre_paciente,apellido_paciente,dni_paciente,CONVERT(varchar(10),fecha_nacimiento_paciente,103)AS 'fecha_nacimiento_paciente', ISNULL(telefono_paciente,'-') AS 'telefono_paciente', direccion_paciente, sexo_paciente,contraseña_paciente 
	FROM PACIENTES WHERE email_paciente = @prmEmailPaciente
END
GO
/****** Object:  StoredProcedure [dbo].[spTraerFechasMedico]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTraerFechasMedico](@prmIdMedico INT)
AS
BEGIN 
	SELECT id_horario,CONVERT(varchar(10),fecha_atencion,103) AS 'fecha_atencion', Convert(VARCHAR(8),hora_inicio,8) AS 'hora_inicio', CONVERT(VARCHAR(8),hora_fin,8) AS 'hora_fin' FROM HORARIOS 
	WHERE id_medico = @prmIdMedico AND fecha_atencion > GETDATE()
	ORDER BY fecha_atencion
END
GO
/****** Object:  StoredProcedure [dbo].[spTraerFechasMedicoRango]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTraerFechasMedicoRango](
@prmIdMedico INT,
@prmFechaInicio DATE,
@prmFechaFin DATE
)
AS
BEGIN 
	SELECT H.id_horario,CONVERT(varchar(10),H.fecha_atencion,103) AS 'fecha_atencion', COUNT(H.id_horario) AS 'total_sin_reservar' FROM HORARIOS H
	INNER JOIN HORARIOS_HORA HH
	ON HH.id_horario = H.id_horario
	WHERE HH.situacion_hora=0 AND H.id_medico = @prmIdMedico AND H.fecha_atencion BETWEEN @prmFechaInicio AND @prmFechaFin
	GROUP BY H.id_horario, H.fecha_atencion
	HAVING COUNT(H.id_horario) > 0
	ORDER BY fecha_atencion	
END
GO
/****** Object:  StoredProcedure [dbo].[spTraerHorariosEntradaSalida]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTraerHorariosEntradaSalida](@prmIdHorario INT)
AS
BEGIN
	SELECT id_medico,id_horario,CONVERT(VARCHAR(10),fecha_atencion,103) AS 'fecha_atencion', Convert(VARCHAR(8),hora_inicio,8) AS 'hora_inicio',CONVERT(VARCHAR(8),hora_fin,8) AS 'hora_fin'  FROM HORARIOS WHERE id_horario = @prmIdHorario
END
GO
/****** Object:  StoredProcedure [dbo].[spTrearDatosMedico]    Script Date: 4/12/2019 20:54:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTrearDatosMedico] (@prmIdMedico INT)
AS
BEGIN
	SELECT M.id_medico,M.foto_medico,M.nombre_medico,M.apellido_medico,M.cuil_medico,CONVERT(VARCHAR(10),M.fecha_nacimiento_medico,103) AS 'fecha_nacimiento_medico',ISNULL(M.descripcion_medico,'-') AS 'descripcion_medico',M.sexo_medico,E.nombre_especialidad,M.telefono_medico,M.dni_medico, E.id_especialidad FROM MEDICOS M 
	INNER JOIN ESPECIALIDADES E 
	ON E.id_especialidad = M.id_especialidad
	WHERE M.id_medico = @prmIdMedico
	ORDER BY (M.apellido_medico + ' ' + M.nombre_medico) ASC
END
GO

/*AGREGAR A LA BASE DE DATOS DE LA NOTEBOOK*/

GO
/****** Object:  StoredProcedure [dbo].[spListarEmpleados]    Script Date: 7/12/2019 19:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarEmpleados]
AS
BEGIN
	SELECT id_empleado,nombre_empleado,apellido_empleado,foto_empleado,usuario_empleado,CONVERT(VARCHAR(10),fecha_creacion_empleado,103) AS 'fecha_creacion_empleado' FROM EMPLEADOS 
	WHERE estado_eliminacion_empleado = 1 AND tipo_empleado = 'Normal'
	ORDER BY usuario_empleado ASC
END


GO
/****** Object:  StoredProcedure [dbo].[spEliminarEmpleado]    Script Date: 7/12/2019 19:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarEmpleado] (@prmIdEmpleado INT)
AS
BEGIN
	UPDATE EMPLEADOS SET estado_eliminacion_empleado = 0 WHERE id_empleado = @prmIdEmpleado AND tipo_empleado = 'Normal'
END


GO
/****** Object:  StoredProcedure [dbo].[spRegistrarEmpleado]    Script Date: 7/12/2019 19:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarEmpleado](
@prmFotoEmpleado IMAGE,
@prmNombreEmpleado VARCHAR (50),
@prmApellidoEmpleado VARCHAR (50),
@prmUsuarioEmpleado VARCHAR (100),
@prmContraseñaEmpleado VARCHAR(200)
)
AS
BEGIN
	DECLARE @FILAS INT 
	SET @FILAS = (SELECT COUNT(id_empleado) FROM EMPLEADOS WHERE usuario_empleado = @prmUsuarioEmpleado)
	IF @FILAS=0
		INSERT INTO EMPLEADOS(foto_empleado,nombre_empleado,apellido_empleado,usuario_empleado,contraseña_empleado)
		VALUES (@prmFotoEmpleado,@prmNombreEmpleado,@prmApellidoEmpleado,@prmUsuarioEmpleado,@prmContraseñaEmpleado)
END


GO
/****** Object:  StoredProcedure [dbo].[spCancelarReserva]    Script Date: 7/12/2019 20:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCancelarReserva] (
@prmIdReserva INT,
@prmUsuario VARCHAR(100),
@prmMotivo VARCHAR (1000)
)
AS
BEGIN
	BEGIN TRANSACTION TN
	BEGIN TRY
		DECLARE @IdEmpleado INT
		SET @IdEmpleado = (SELECT id_empleado FROM EMPLEADOS WHERE usuario_empleado = @prmUsuario)
		DECLARE @fecha DATE 
		SET @fecha = (SELECT fecha_reserva FROM RESERVAS WHERE id_reserva = @prmIdReserva)
		DECLARE @IdMedico INT
		SET @IdMedico = (SELECT id_medico FROM RESERVAS WHERE id_reserva = @prmIdReserva)
		DECLARE @hora TIME (0)
		SET @hora = (SELECT hora_reserva FROM RESERVAS WHERE id_reserva = @prmIdReserva)
		DECLARE @IdHorario INT
		SET @IdHorario = (SELECT id_horario FROM HORARIOS WHERE id_medico = @IdMedico AND fecha_atencion = @fecha)
		DECLARE @IdHorarioHora INT
		SET @IdHorarioHora = (SELECT id_horario_hora FROM HORARIOS_HORA WHERE id_horario = @IdHorario AND hora = @hora)
		UPDATE RESERVAS SET 
		motivo_cancelacion = @prmMotivo,
		estado_reserva = 'Cancelada',
		id_empleado = @IdEmpleado
		WHERE id_reserva = @prmIdReserva
		UPDATE HORARIOS_HORA SET situacion_hora = 0
		WHERE id_horario_hora = @IdHorarioHora
		IF @@TRANCOUNT > 0
		COMMIT
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER(),
				ERROR_SEVERITY(),
				ERROR_STATE(),
				ERROR_LINE(),
				ERROR_MESSAGE()
		ROLLBACK
	END CATCH
END