USE [DB_TEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_VISITAS]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_VISITAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_VALIDAR_USUARIO]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_VALIDAR_USUARIO]
GO
/****** Object:  StoredProcedure [dbo].[SP_VALIDAR_FLUJO_ACTUAL]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_VALIDAR_FLUJO_ACTUAL]
GO
/****** Object:  StoredProcedure [dbo].[SP_RESULTADOS_NPS]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_RESULTADOS_NPS]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_VISITA]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_REGISTRAR_VISITA]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_USUARIO]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_REGISTRAR_USUARIO]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_TICKET]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_REGISTRAR_TICKET]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_PUNTUACION]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_REGISTRAR_PUNTUACION]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_PUNTO_VISITADO]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_REGISTRAR_PUNTO_VISITADO]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_INVITADO]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_REGISTRAR_INVITADO]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_HISTORIAL_PACIENTE]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_REGISTRAR_HISTORIAL_PACIENTE]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_FLUJO]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_REGISTRAR_FLUJO]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_ESTADO_CUESTIONARIO]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_REGISTRAR_ESTADO_CUESTIONARIO]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_CUESTIONARIO]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_REGISTRAR_CUESTIONARIO]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_CITA]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_REGISTRAR_CITA]
GO
/****** Object:  StoredProcedure [dbo].[SP_PUNTOS_VISITADOS]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_PUNTOS_VISITADOS]
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_MENU]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_LISTAR_MENU]
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_HISTORIAL_PACIENTE]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_LISTAR_HISTORIAL_PACIENTE]
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_DOCTORES]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_LISTAR_DOCTORES]
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_DISPONIBILIDAD_DOCTOR]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_LISTAR_DISPONIBILIDAD_DOCTOR]
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_CITAS_USUARIO]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_LISTAR_CITAS_USUARIO]
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_CITAS_DOCTOR]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_LISTAR_CITAS_DOCTOR]
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_CENTROS_ATENCION]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_LISTAR_CENTROS_ATENCION]
GO
/****** Object:  StoredProcedure [dbo].[sp_generar_ticket]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[sp_generar_ticket]
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZAR_CONTRASEÑA]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[SP_ACTUALIZAR_CONTRASEÑA]
GO
/****** Object:  StoredProcedure [dbo].[generar_backup_watson]    Script Date: 15/09/2022 18:13:07 ******/
DROP PROCEDURE [dbo].[generar_backup_watson]
GO

/****** Object:  Table [dbo].[tbl_visitas]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_visitas]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_visitas]
GO
/****** Object:  Table [dbo].[tbl_usuario]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_usuario]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_usuario]
GO
/****** Object:  Table [dbo].[tbl_tipousuario]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_tipousuario]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_tipousuario]
GO
/****** Object:  Table [dbo].[tbl_tipolinea]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_tipolinea]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_tipolinea]
GO
/****** Object:  Table [dbo].[tbl_tickets]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_tickets]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_tickets]
GO
/****** Object:  Table [dbo].[tbl_resumen_flujo]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_resumen_flujo]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_resumen_flujo]
GO
/****** Object:  Table [dbo].[tbl_puntos_visitados]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_puntos_visitados]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_puntos_visitados]
GO
/****** Object:  Table [dbo].[tbl_opciones_usuario]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_opciones_usuario]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_opciones_usuario]
GO
/****** Object:  Table [dbo].[tbl_meses]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_meses]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_meses]
GO
/****** Object:  Table [dbo].[tbl_menu]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_menu]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_menu]
GO
/****** Object:  Table [dbo].[tbl_invitados]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_invitados]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_invitados]
GO
/****** Object:  Table [dbo].[tbl_historial_paciente]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_historial_paciente]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_historial_paciente]
GO
/****** Object:  Table [dbo].[tbl_flujos]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_flujos]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_flujos]
GO
/****** Object:  Table [dbo].[tbl_estados_cita]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_estados_cita]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_estados_cita]
GO
/****** Object:  Table [dbo].[tbl_encuesta]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_encuesta]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_encuesta]
GO
/****** Object:  Table [dbo].[tbl_cita]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_cita]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_cita]
GO
/****** Object:  Table [dbo].[tbl_centros_atencion]    Script Date: 15/09/2022 18:13:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_centros_atencion]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_centros_atencion]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_EncriptarPassword]    Script Date: 15/09/2022 18:13:07 ******/
DROP FUNCTION [dbo].[fn_EncriptarPassword]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_DesencriptarPassword]    Script Date: 15/09/2022 18:13:07 ******/
DROP FUNCTION [dbo].[fn_DesencriptarPassword]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_DesencriptarPassword]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_DesencriptarPassword]
(
	@password varbinary(300)
)
RETURNS varchar(300)
AS   

BEGIN
    DECLARE @res_decrypt varchar(300);

    SELECT @res_decrypt = CONVERT(VARCHAR(100), DecryptByPassPhrase('12', @password))	
    RETURN @res_decrypt;
END;


GO
/****** Object:  UserDefinedFunction [dbo].[fn_EncriptarPassword]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_EncriptarPassword]
(
	@password varchar(300)
)
RETURNS varbinary(300)
AS   

BEGIN  
    DECLARE @res_encrypt varbinary(300);

    SELECT @res_encrypt = EncryptByPassPhrase('12', @password)
    RETURN @res_encrypt;
END;
GO
/****** Object:  Table [dbo].[tbl_centros_atencion]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_centros_atencion](
	[id_centro_atencion] [int] IDENTITY(1,1) NOT NULL,
	[centro_atencion] [varchar](200) NULL,
	[direccion] [varchar](200) NULL,
	[horario] [varchar](200) NULL,
	[latitud] [varchar](20) NULL,
	[longitud] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_centro_atencion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cita]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cita](
	[id_cita] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[fecha_cita] [date] NULL,
	[hora_cita] [time](7) NULL,
	[id_doctor_asignado] [int] NULL,
	[id_estado_cita] [int] NULL,
	[fecha_registro] [datetime] NULL,
	[tipo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_encuesta]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_encuesta](
	[id_item] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[puntuacion] [int] NULL,
	[hora] [varchar](8) NULL,
	[fecha] [varchar](10) NULL,
	[resultado] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estados_cita]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estados_cita](
	[id_estado_cita] [int] IDENTITY(1,1) NOT NULL,
	[estado_cita] [varchar](50) NULL,
	[fecha_registro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estado_cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_flujos]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_flujos](
	[id_flujo] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[tipo] [varchar](50) NULL,
	[contenido_texto] [nvarchar](max) NULL,
	[contenido_html] [nvarchar](max) NULL,
	[habilitado] [int] NULL,
	[remitente] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_flujo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_historial_paciente]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_historial_paciente](
	[id_historial] [int] IDENTITY(1,1) NOT NULL,
	[id_paciente] [int] NULL,
	[nota] [varchar](500) NULL,
	[recomendacion] [varchar](500) NULL,
	[medicina] [varchar](500) NULL,
	[id_doctor] [int] NULL,
	[fecha_registro] [date] NULL,
	[hora_registro] [time](7) NULL,
 CONSTRAINT [PK__tbl_hist__76E6C502D94772C6] PRIMARY KEY CLUSTERED 
(
	[id_historial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_invitados]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_invitados](
	[id_invitado] [int] IDENTITY(-1,-1) NOT NULL,
	[linea] [varchar](20) NULL,
	[id_tipolinea] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_invitado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_menu]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_menu](
	[id_padre] [char](2) NULL,
	[id_opcion] [char](4) NULL,
	[opcion] [varchar](100) NULL,
	[posicion] [int] NULL,
	[icono] [varchar](100) NULL,
	[url] [varchar](100) NULL,
	[habilitado] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_meses]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_meses](
	[num_mes] [int] NULL,
	[mes] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_opciones_usuario]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_opciones_usuario](
	[id_usuario] [int] NULL,
	[id_tipousuario] [int] NULL,
	[id_opcion] [varchar](5) NULL,
	[habilitado] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_puntos_visitados]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_puntos_visitados](
	[punto_visitado] [varchar](50) NULL,
	[visitante] [varchar](50) NULL,
	[fecha_visita] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_resumen_flujo]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_resumen_flujo](
	[id_item] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[resultado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_tickets]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tickets](
	[id_ticket] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[id_usuario] [int] NULL,
	[estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_tipolinea]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tipolinea](
	[id_tipolinea] [int] IDENTITY(1,1) NOT NULL,
	[tipolinea] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipolinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_tipousuario]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tipousuario](
	[id_tipousuario] [int] IDENTITY(1,1) NOT NULL,
	[tipousuario] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipousuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_usuario]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](100) NULL,
	[apellidos] [varchar](100) NULL,
	[id_tipousuario] [int] NULL,
	[password] [varbinary](300) NULL,
	[habilitado] [int] NULL,
	[tipo_documento] [varchar](50) NULL,
	[num_documento] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[test_actual] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_visitas]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_visitas](
	[visitante] [varchar](50) NULL,
	[fecha_visita] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_centros_atencion] ON 
GO
INSERT [dbo].[tbl_centros_atencion] ([id_centro_atencion], [centro_atencion], [direccion], [horario], [latitud], [longitud]) VALUES (1, N'Centro Cívico', N'Av. Paseo de la República', N'Todo el día', N'-12.056308', N'-77.037218')
GO
INSERT [dbo].[tbl_centros_atencion] ([id_centro_atencion], [centro_atencion], [direccion], [horario], [latitud], [longitud]) VALUES (2, N'Rambla', N'Av. Javier Prado', N'10:00 - 18:00', N'-12.087802', N'-77.014022')
GO
INSERT [dbo].[tbl_centros_atencion] ([id_centro_atencion], [centro_atencion], [direccion], [horario], [latitud], [longitud]) VALUES (3, N'Plaza Lima Sur', N'Av Paseo de la República', N'10:00 - 21:00', N'-12.173210', N'-77.014127')
GO
SET IDENTITY_INSERT [dbo].[tbl_centros_atencion] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_estados_cita] ON 
GO
INSERT [dbo].[tbl_estados_cita] ([id_estado_cita], [estado_cita], [fecha_registro]) VALUES (1, N'REGISTRADO', CAST(N'2022-08-25T21:45:58.160' AS DateTime))
GO
INSERT [dbo].[tbl_estados_cita] ([id_estado_cita], [estado_cita], [fecha_registro]) VALUES (2, N'ATENDIDO', CAST(N'2022-08-25T21:45:58.163' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_estados_cita] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_flujos] ON 
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (1, 2, N'text', N'Hola, ¿cómo puedo ayudarte?', N'<li><div class="chat-img"><img src="https://localhost:44383/images/bot.jpg" class=""/></div><div class="chat-content"><div class="box bg-light-success">Hola, ¿cómo puedo ayudarte?</div></div><div class="chat-time">00:24</div></li>', 1, N'bot')
GO
SET IDENTITY_INSERT [dbo].[tbl_flujos] OFF
GO
INSERT [dbo].[tbl_menu] ([id_padre], [id_opcion], [opcion], [posicion], [icono], [url], [habilitado]) VALUES (N'00', N'01  ', N'ADMINISTRACION', 1, N'mdi mdi-gauge', N'', 1)
GO
INSERT [dbo].[tbl_menu] ([id_padre], [id_opcion], [opcion], [posicion], [icono], [url], [habilitado]) VALUES (N'01', N'02  ', N'Visitas', 1, N'mdi mdi-gauge', N'Home', 1)
GO
INSERT [dbo].[tbl_menu] ([id_padre], [id_opcion], [opcion], [posicion], [icono], [url], [habilitado]) VALUES (N'01', N'03  ', N'Reportes', 1, N'mdi mdi-gauge', N'Reportes', 1)
GO
INSERT [dbo].[tbl_meses] ([num_mes], [mes]) VALUES (1, N'ENERO')
GO
INSERT [dbo].[tbl_meses] ([num_mes], [mes]) VALUES (2, N'FEBRERO')
GO
INSERT [dbo].[tbl_meses] ([num_mes], [mes]) VALUES (3, N'MARZO')
GO
INSERT [dbo].[tbl_meses] ([num_mes], [mes]) VALUES (4, N'ABRIL')
GO
INSERT [dbo].[tbl_meses] ([num_mes], [mes]) VALUES (5, N'MAYO')
GO
INSERT [dbo].[tbl_meses] ([num_mes], [mes]) VALUES (6, N'JUNIO')
GO
INSERT [dbo].[tbl_meses] ([num_mes], [mes]) VALUES (7, N'JULIO')
GO
INSERT [dbo].[tbl_meses] ([num_mes], [mes]) VALUES (8, N'AGOSTO')
GO
INSERT [dbo].[tbl_meses] ([num_mes], [mes]) VALUES (9, N'SETIEMBRE')
GO
INSERT [dbo].[tbl_meses] ([num_mes], [mes]) VALUES (10, N'OCTUBRE')
GO
INSERT [dbo].[tbl_meses] ([num_mes], [mes]) VALUES (11, N'NOVIEMBRE')
GO
INSERT [dbo].[tbl_meses] ([num_mes], [mes]) VALUES (12, N'DICIEMBRE')
GO
INSERT [dbo].[tbl_opciones_usuario] ([id_usuario], [id_tipousuario], [id_opcion], [habilitado]) VALUES (1, 1, N'01', 1)
GO
INSERT [dbo].[tbl_opciones_usuario] ([id_usuario], [id_tipousuario], [id_opcion], [habilitado]) VALUES (1, 1, N'02', 1)
GO
INSERT [dbo].[tbl_opciones_usuario] ([id_usuario], [id_tipousuario], [id_opcion], [habilitado]) VALUES (1, 1, N'03', 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_tipousuario] ON 
GO
INSERT [dbo].[tbl_tipousuario] ([id_tipousuario], [tipousuario]) VALUES (1, N'Admin')
GO
INSERT [dbo].[tbl_tipousuario] ([id_tipousuario], [tipousuario]) VALUES (2, N'Cliente')
GO
INSERT [dbo].[tbl_tipousuario] ([id_tipousuario], [tipousuario]) VALUES (3, N'Doctor')
GO
SET IDENTITY_INSERT [dbo].[tbl_tipousuario] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_usuario] ON 
GO
INSERT [dbo].[tbl_usuario] ([id_usuario], [nombres], [apellidos], [id_tipousuario], [password], [habilitado], [tipo_documento], [num_documento], [email], [test_actual]) VALUES (1, N'Martin', N'Aguirre', 1, 0x01000000639CDBDD6A636021E0C9DD5C848990FDF573A7847EF50B7E, 1, N'DNI', N'11111111', N'admin@abc.com', 0)
GO
INSERT [dbo].[tbl_usuario] ([id_usuario], [nombres], [apellidos], [id_tipousuario], [password], [habilitado], [tipo_documento], [num_documento], [email], [test_actual]) VALUES (2, N'Juan', N'Marca', 2, 0x01000000639CDBDD6A636021E0C9DD5C848990FDF573A7847EF50B7E, 1, N'DNI', N'22222222', N'cliente@abc.com', 0)
GO
INSERT [dbo].[tbl_usuario] ([id_usuario], [nombres], [apellidos], [id_tipousuario], [password], [habilitado], [tipo_documento], [num_documento], [email], [test_actual]) VALUES (3, N'Dr Luis', N'Ortiz', 3, 0x01000000639CDBDD6A636021E0C9DD5C848990FDF573A7847EF50B7E, 1, N'DNI', N'33333333', N'doc1@abc.com', 0)
GO
INSERT [dbo].[tbl_usuario] ([id_usuario], [nombres], [apellidos], [id_tipousuario], [password], [habilitado], [tipo_documento], [num_documento], [email], [test_actual]) VALUES (4, N'Dr Daniel', N'Espinoza', 3, 0x01000000639CDBDD6A636021E0C9DD5C848990FDF573A7847EF50B7E, 1, N'DNI', N'44444444', N'doc2@abc.com', 0)
GO
INSERT [dbo].[tbl_usuario] ([id_usuario], [nombres], [apellidos], [id_tipousuario], [password], [habilitado], [tipo_documento], [num_documento], [email], [test_actual]) VALUES (5, N'Dr Felipe', N'Ugarte', 3, 0x01000000639CDBDD6A636021E0C9DD5C848990FDF573A7847EF50B7E, 1, N'DNI', N'55555555', N'doc3@abc.com', 0)
GO
SET IDENTITY_INSERT [dbo].[tbl_usuario] OFF
GO
ALTER TABLE [dbo].[tbl_cita] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[tbl_estados_cita] ADD  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[tbl_historial_paciente] ADD  CONSTRAINT [DF__tbl_histo__fecha__08B54D69]  DEFAULT (getdate()) FOR [fecha_registro]
GO
/****** Object:  StoredProcedure [dbo].[generar_backup_watson]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[generar_backup_watson]
as
begin
	set nocount on;

	declare @fecha char(8) = convert(char(8),getdate(),112);
	declare @hora varchar(8) = replace(convert(varchar(8), convert(time, getdate())), ':', '')

	declare @path varchar(100) = concat('D:\BACKS\', 'WATSON_BACKUP', '_', @fecha, '_', @hora, '.bak');

	backup database DB_WATSON
	to disk = @path
	with no_compression, name='DB_WATSON'

end
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZAR_CONTRASEÑA]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ACTUALIZAR_CONTRASEÑA]
(
	@usuario varchar(100),
	@password varchar(50),
	@nuevo_password varchar(50)
)
as
begin
	set nocount on;

	declare @error varchar(100) = '';

	update tbl_usuario set
		password = dbo.fn_EncriptarPassword(@nuevo_password)
	where email = @usuario;

	select
		'OK' 'validacion'

end
GO
/****** Object:  StoredProcedure [dbo].[sp_generar_ticket]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_generar_ticket]
AS
BEGIN

	select
		CONCAT('TK', RIGHT(CONCAT('0000000000',count(*) + 1),6)) 'codigo'
	from tbl_tickets

END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_CENTROS_ATENCION]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAR_CENTROS_ATENCION]
(
	@latitud varchar(20),
	@longitud varchar(20)
)
AS
BEGIN
	SET NOCOUNT ON;
	
	if (select COUNT(*) from tbl_centros_atencion) = 0
	begin
		select
		0 id_centro_atencion,
		'' centro_atencion,
		'' direccion,
		'' horario,
		'No hay centros de atención registrados' validacion
	end
	else
	begin
		if @latitud = '0' and @longitud = '0'
		begin
			select
				id_centro_atencion,
				centro_atencion,
				direccion,
				horario,
				'OK' validacion
			from tbl_centros_atencion
		end
		else
		begin
			declare @latitud_ decimal(10,8) = cast(@latitud as decimal(10,8))
			declare @longitud_ decimal(10,8) = cast(@longitud as decimal(10,8))

			SELECT
				id_centro_atencion,
				centro_atencion,
				direccion,
				horario,
				'OK' validacion
			FROM tbl_centros_atencion
			ORDER BY
			ABS(ABS( cast(latitud as decimal(10,8)) - @latitud_) +
			ABS(cast(longitud as decimal(10,8)) - @longitud_))

		end
	end
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_CITAS_DOCTOR]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[SP_LISTAR_CITAS_DOCTOR]  
(  
 @id_usuario int,  
 @fecha varchar(10),  
 @id_estado int  
)  
AS  
BEGIN  
 SET NOCOUNT ON;  
  
 SELECT  
  c.id_cita,  
  c.id_estado_cita,  
  e.estado_cita 'estado',  
  CONVERT(varchar(10), CONVERT(date, c.fecha_cita)) 'fecha_cita',  
  REPLACE(REPLACE(RIGHT(CONCAT('0', CONVERT(varchar(15),c.hora_cita,100)), 7), 'PM', ' PM'), 'AM', ' AM') 'hora_cita',  
  c.id_usuario,  
  CONCAT(u.nombres, ' ', u.apellidos) 'usuario',
  c.tipo
 FROM tbl_cita c  
 INNER JOIN tbl_usuario u ON u.id_usuario = c.id_usuario  
 INNER JOIN tbl_estados_cita e ON e.id_estado_cita = c.id_estado_cita  
 WHERE c.id_doctor_asignado = @id_usuario  
 AND (@id_estado = -1 or c.id_estado_cita = @id_estado)  
 AND (@fecha = '-' or convert(varchar(10), convert(date, c.fecha_cita)) = @fecha)  
 AND c.tipo = 'CITA'
  
 ORDER BY fecha_cita, hora_cita  
  
END  
  
  
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_CITAS_USUARIO]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAR_CITAS_USUARIO]  
(  
 @id_usuario INT  
)  
AS  
BEGIN  
 SET NOCOUNT ON;  
  
 SELECT  
  c.id_cita,  
  c.id_estado_cita,  
  e.estado_cita 'estado',  
  CONVERT(varchar(10), CONVERT(date, c.fecha_cita)) 'fecha_cita',  
  REPLACE(REPLACE(RIGHT(CONCAT('0', CONVERT(varchar(15),c.hora_cita,100)), 7), 'PM', ' PM'), 'AM', ' AM') 'hora_cita',  
  c.id_doctor_asignado,  
  CONCAT(u.nombres, ' ', u.apellidos) 'doctor_asignado',
  c.tipo
 FROM tbl_cita c  
 INNER JOIN tbl_usuario u ON u.id_usuario = c.id_doctor_asignado  
 INNER JOIN tbl_estados_cita e ON e.id_estado_cita = c.id_estado_cita  
 WHERE c.id_usuario = @id_usuario  
 AND c.tipo in ('CITA','CUESTIONARIO')
 ORDER BY fecha_cita, hora_cita  
  
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_DISPONIBILIDAD_DOCTOR]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_LISTAR_DISPONIBILIDAD_DOCTOR]
(
	@id_doctor int,
	@fecha varchar(10)
)
AS
BEGIN
	SET NOCOUNT ON;

	declare @fecha_ date = convert(date, @fecha);

	declare @temp_horas table (
		hora_cita varchar(8),
		estado varchar(20)
	)

	insert into @temp_horas select '08:00 AM','';
	insert into @temp_horas select '09:00 AM','';
	insert into @temp_horas select '10:00 AM','';
	insert into @temp_horas select '11:00 AM','';
	insert into @temp_horas select '12:00 PM','';
	insert into @temp_horas select '01:00 PM','';
	insert into @temp_horas select '02:00 PM','';
	insert into @temp_horas select '03:00 PM','';
	insert into @temp_horas select '04:00 PM','';

	select
		t.hora_cita,
		case
			when c.id_cita is null then 'DISPONIBLE'
			else 'RESERVADO'
		end 'estado'
	from @temp_horas t
	left join tbl_cita c on c.id_doctor_asignado = @id_doctor and c.fecha_cita = @fecha_ and c.hora_cita = convert(time, convert(datetime, t.hora_cita, 0))
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_DOCTORES]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAR_DOCTORES]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		id_usuario 'id_usuario',
		nombres + ' ' + apellidos 'nombres'
	FROM tbl_usuario
	WHERE id_tipousuario = 3
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_HISTORIAL_PACIENTE]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--select * from tbl_usuario

CREATE PROCEDURE [dbo].[SP_LISTAR_HISTORIAL_PACIENTE]
(
	@id_usuario int
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		h.id_historial,
		ISNULL(h.nota, '') 'nota',
		ISNULL(h.recomendacion, '') 'recomendacion',
		ISNULL(h.medicina, '') 'medicina',
		CONCAT(u.nombres,' ',u.apellidos) 'doctor',
		CONVERT(varchar(10), CONVERT(date, h.fecha_registro)) 'fecha_registro',
		REPLACE(REPLACE(RIGHT(CONCAT('0', CONVERT(varchar(15), h.hora_registro,100)), 7), 'PM', ' PM'), 'AM', ' AM') 'hora_registro'
	FROM tbl_historial_paciente h
	LEFT JOIN tbl_usuario u on u.id_usuario = h.id_doctor and u.id_tipousuario = 3
	WHERE h.id_paciente = @id_usuario
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_MENU]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAR_MENU]
(
	@id_usuario INT,
	@id_tipousuario INT
)
AS
BEGIN
  
	SET NOCOUNT ON;
   
	SELECT
		(select m2.opcion from tbl_menu m2 where m2.id_opcion = m1.id_padre) 'nombre_categoria',
		m1.opcion 'nombre_opcion',
		m1.url 'ruta_opcion',
		(select m2.icono from tbl_menu m2 where m2.id_opcion = m1.id_padre) 'icono',
		'' 'acceso_directo',
		'OK' 'validacion'
	FROM tbl_opciones_usuario ou
	inner join tbl_menu m1 on m1.id_opcion = ou.id_opcion

	where ou.id_usuario = @id_usuario
	and ou.id_tipousuario = @id_tipousuario
	and m1.id_padre <> '00'
	order by 1,2

END
GO
/****** Object:  StoredProcedure [dbo].[SP_PUNTOS_VISITADOS]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_PUNTOS_VISITADOS]
(
	@año int,
	@mes int
)
AS
BEGIN

	--declare @año int = 2020
	declare @tbl_meses table (orden int, num_mes int, mes varchar(50), tipo varchar(50), visitante varchar(50), total int)

	declare @i int = 1;
	declare @c1 int = 1;
	declare @c2 int = 2;
	declare @c3 int = 3;
	declare @c4 int = 4;
	while (@i < 13)
	begin
		insert into @tbl_meses select @c1, num_mes, mes, 'WHATSAPP', 'CLIENTE', 0 from tbl_meses where num_mes = @i;
		insert into @tbl_meses select @c2, num_mes, mes, 'WHATSAPP', 'NO CLIENTE', 0 from tbl_meses where num_mes = @i;
		insert into @tbl_meses select @c3, num_mes, mes, 'CALL-CENTER', 'CLIENTE', 0 from tbl_meses where num_mes = @i;
		insert into @tbl_meses select @c4, num_mes, mes, 'CALL-CENTER', 'NO CLIENTE', 0 from tbl_meses where num_mes = @i;

		set @i = @i + 1;
		set @c1 = @c1 + 4;
		set @c2 = @c2 + 4;
		set @c3 = @c3 + 4;
		set @c4 = @c4 + 4;
	end

	declare @j int = 1;
	while (@j < (select COUNT(*) + 1 from @tbl_meses))
	begin
		declare @tipo varchar(50);
		declare @visitante varchar(50);
		declare @num_mes int;
		declare @total int;

		select @tipo = tipo, @visitante = visitante, @num_mes = num_mes from @tbl_meses where orden = @j;

		select @total = count(*) from tbl_puntos_visitados
		where datepart(year,convert(date,fecha_visita)) = @año and visitante = @visitante and punto_visitado = @tipo and DATEPART(month,convert(date,fecha_visita)) = @num_mes;

		update @tbl_meses set total = @total
		where tipo = @tipo and visitante = @visitante and num_mes = @num_mes;

		set @j = @j + 1;
	end


	select * from @tbl_meses

END

GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_CITA]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_REGISTRAR_CITA]
(
	@id_cita int,
	@id_usuario int,
	@fecha_cita varchar(10),
	@hora_cita varchar(8),
	@id_doctor int
)
AS
BEGIN
	SET NOCOUNT ON;

	--SET @hora_cita = REPLACE(@hora_cita, ' PM', ':00 PM');
	--SET @hora_cita = REPLACE(@hora_cita, ' AM', ':00 AM');

	declare @estado_cita int = 1;
	declare @fecha_cita_ date = convert(date, @fecha_cita);
	declare @hora_cita_ time = convert(time, convert(datetime, @hora_cita, 0));
	declare @fecha_hora_cita_ datetime = CAST(@fecha_cita_ AS DATETIME) + CAST(@hora_cita_ AS DATETIME);

	declare @inicio time = convert(time, convert(datetime, '08:00 AM', 0));
	declare @fin time = convert(time, convert(datetime, '04:00 PM', 0));

	IF @fecha_hora_cita_ < GETDATE()
	BEGIN
		SELECT 'La fecha y hora seleccionados son incorrectos.' AS 'rpta';
	END
	ELSE
	BEGIN
		IF @hora_cita_ BETWEEN @inicio AND @fin
		BEGIN
			IF EXISTS (SELECT * FROM tbl_cita WHERE hora_cita = @hora_cita_ and fecha_cita = @fecha_cita_ and id_cita <> @id_cita and id_usuario = @id_usuario)
			BEGIN
				SELECT 'Ya hay una cita registrada en el horario seleccionado.' AS 'rpta';
			END
			ELSE
			BEGIN

				IF @id_cita = 0
				BEGIN
					IF EXISTS (SELECT * FROM tbl_cita WHERE id_doctor_asignado = @id_doctor and hora_cita = @hora_cita_ and fecha_cita = @fecha_cita_ and id_cita <> @id_cita)
					BEGIN
						SELECT 'Ya hay una cita registrada en el horario seleccionado.' AS 'rpta';
					END
					ELSE
					BEGIN
						INSERT INTO tbl_cita (id_usuario, fecha_cita, hora_cita, id_doctor_asignado, id_estado_cita, tipo)
						VALUES (@id_usuario, @fecha_cita_, @hora_cita_, @id_doctor, @estado_cita, 'CITA');
						SELECT 'OK' AS 'rpta';
					END
				END
				ELSE
				IF @id_cita > 0
				BEGIN
					IF EXISTS (SELECT * FROM tbl_cita WHERE id_doctor_asignado = @id_doctor and hora_cita = @hora_cita_ and fecha_cita = @fecha_cita_ and id_cita <> @id_cita)
					BEGIN
						SELECT 'Ya hay una cita registrada en el horario seleccionado.' AS 'rpta';
					END
					ELSE
					BEGIN
						UPDATE tbl_cita SET
							fecha_cita = @fecha_cita_,
							hora_cita = @hora_cita_,
							id_doctor_asignado = @id_doctor
						WHERE id_cita = @id_cita;

						SELECT 'OK' AS 'rpta';
					END
				END

			END
		END
		ELSE
		BEGIN
			SELECT 'El registro de citas debe ser entre las 08:00 AM y 04:00 PM.' AS 'rpta';
		END
	END

END

GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_CUESTIONARIO]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_REGISTRAR_CUESTIONARIO]
(
	--@id_cita int,
	@id_usuario int,
	@fecha_cita varchar(10),
	--@hora_cita varchar(8),
	@id_doctor int
)
AS
BEGIN
	SET NOCOUNT ON;

	declare @estado_cita int = 1;
	declare @fecha_cita_ date = convert(date, dateadd(day,1,getdate()) );

	declare @total_si int =
	(
		select count(*) from tbl_flujos
		where id_usuario = @id_usuario and habilitado = 1 and remitente = 'person' and tipo = 'text' and contenido_texto = 'Si'
	);

	if @total_si > 2
	begin
		insert into tbl_cita (id_usuario, fecha_cita, hora_cita, id_doctor_asignado, id_estado_cita, fecha_registro, tipo)
		values (@id_usuario, @fecha_cita_, null, @id_doctor, @estado_cita, getdate(), 'CUESTIONARIO');

		update tbl_flujos set habilitado = 0 where id_usuario = @id_usuario and habilitado = 1;
	 	
		insert into tbl_flujos
		select top 1 id_usuario,tipo,contenido_texto,contenido_html,1,remitente from tbl_flujos
		where id_usuario = @id_usuario and habilitado = 0;

		SELECT 'OK' AS 'rpta';
	end
	else
	begin
		update tbl_flujos set habilitado = 0 where id_usuario = @id_usuario and habilitado = 1;
	 	
		insert into tbl_flujos
		select top 1 id_usuario,tipo,contenido_texto,contenido_html,1,remitente from tbl_flujos
		where id_usuario = @id_usuario and habilitado = 0;

			SELECT 'Gracias por participar en la encuesta' AS 'rpta';
	end

END
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_ESTADO_CUESTIONARIO]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[SP_REGISTRAR_ESTADO_CUESTIONARIO]
(
	@id_cita int
)
AS  
BEGIN  
 SET NOCOUNT ON;  
  
 DECLARE @id_estado_cita INT = (SELECT id_estado_cita FROM tbl_cita WHERE id_cita = @id_cita);  
  
 IF @id_estado_cita = 1  
 BEGIN  
    
  UPDATE tbl_cita SET id_estado_cita = 2 WHERE id_cita = @id_cita;
  
  SELECT 'OK' AS 'rpta';  
  
 END  
 ELSE  
 BEGIN  
  SELECT 'Ocurrió un error atendiendo su solicitud' AS 'res';  
 END   
   
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_FLUJO]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_REGISTRAR_FLUJO]    
(    
 @id_usuario int,    
 @tipo varchar(50),    
 @remitente varchar(20),    
 @contenido_texto nvarchar(max),    
 @contenido_html nvarchar(max)    
)    
AS    
BEGIN    
    
 if @remitente = 'bot'    
 begin    
  if (@contenido_texto = 'Gracias! Por su preferencia')    
  begin    
   insert into tbl_resumen_flujo values (@id_usuario, 'GRACIAS');    
  end    
  else    
  if (@contenido_texto like '%' + 'ticket de seguimiento' + '%')    
  begin    
   insert into tbl_resumen_flujo values (@id_usuario, 'TICKET');    
  end    
  else    
  if (@contenido_texto = 'En este momento procedo a llamar al Call Center')    
  begin    
   insert into tbl_resumen_flujo values (@id_usuario, 'CALL CENTER');    
  end    
 end    
    
  if @contenido_texto = 'Gracias por participar en la encuesta' or @contenido_texto = 'Muy bien se agendó un nuevo test, a partir de mañana podrá realizarlo'  
 begin  
 insert into tbl_flujos (id_usuario, tipo, contenido_texto, contenido_html, habilitado, remitente)    
 values (@id_usuario, @tipo, @contenido_texto, @contenido_html, 0, @remitente);    
 end  
 if @contenido_texto = 'Gracias por participar'  
 begin  
	update tbl_flujos set habilitado = 0 where id_usuario = @id_usuario and habilitado = 1;    
   
 insert into tbl_flujos    
 select top 1 id_usuario,tipo,contenido_texto,contenido_html,1,remitente from tbl_flujos    
 where id_usuario = @id_usuario and habilitado = 0;  
 end  
 else  
 begin  
 insert into tbl_flujos (id_usuario, tipo, contenido_texto, contenido_html, habilitado, remitente)    
 values (@id_usuario, @tipo, @contenido_texto, @contenido_html, 1, @remitente);    
 end  
    
 select 'OK' 'rpta';    
    
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_HISTORIAL_PACIENTE]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_REGISTRAR_HISTORIAL_PACIENTE]
(
	@id_paciente int,
	@nota varchar(500),
	@recomendacion varchar(500),
	@medicina varchar(500),
	@id_doctor int,
	@id_cita int
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @id_estado_cita INT = (SELECT id_estado_cita FROM tbl_cita WHERE id_cita = @id_cita);

	IF @id_estado_cita = 1
	BEGIN
		
		UPDATE tbl_cita SET id_estado_cita = 2 WHERE id_cita = @id_cita;

		declare @fecha date = convert(date,getdate());
		declare @hora time = convert(time,getdate());

		INSERT INTO tbl_historial_paciente (id_paciente, nota, recomendacion, medicina, id_doctor, fecha_registro, hora_registro)
		VALUES (@id_paciente, @nota, @recomendacion, @medicina, @id_doctor, @fecha, @hora)

		SELECT 'OK' AS 'rpta';

	END
	ELSE
	BEGIN
		SELECT 'La cita ya ha sido atendida.' AS 'res';
	END	
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_INVITADO]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_REGISTRAR_INVITADO]
(
	@linea varchar(20),
	@id_tipolinea int
)
AS
BEGIN

	declare @id_invitado int = 0;

	if exists (select * from tbl_invitados where linea = @linea and id_tipolinea = @id_tipolinea)
	begin
		select @id_invitado = id_invitado from tbl_invitados where linea = @linea and id_tipolinea = @id_tipolinea;
	end
	else
	begin
		
		insert into tbl_invitados select @linea, @id_tipolinea;
		set @id_invitado = @@IDENTITY;

		declare @nuevo_contenido_html nvarchar(max) = '<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" alt="user" /></div><div class="chat-content"><div class="box bg-light-success">Hola, ¿cómo puedo ayudarte?</div></div><div class="chat-time">' + left(convert(time,getdate()),5) + '</div></li>';

		insert into tbl_flujos (id_usuario, tipo, contenido_texto, contenido_html, habilitado, remitente)
		values (@id_invitado, 'text', 'Hola, ¿cómo puedo ayudarte?', @nuevo_contenido_html, 1, 'bot');
	end

	select @id_invitado 'id_invitado'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_PUNTO_VISITADO]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_REGISTRAR_PUNTO_VISITADO]
(
	@id_tipousuario INT,
	@punto_visitado VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;

	declare @visitante VARCHAR(50)

	if @id_tipousuario = 0
	begin
		set @visitante = 'NO CLIENTE'
	end
	else
	begin
		set @visitante = 'CLIENTE'
	end
	
	insert into tbl_puntos_visitados
	values (@punto_visitado, @visitante, getdate())

	select 'OK' 'rpta'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_PUNTUACION]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_REGISTRAR_PUNTUACION]
(
	@id_usuario int,
	@puntuacion int
)
AS
BEGIN

	declare @hora varchar(8) = convert(varchar(8),convert(time,getdate()))
	declare @fecha varchar(10) = convert(date,getdate())

	declare @resultado varchar(20) = case when @puntuacion between 1 and 6 then 'Detractor' when @puntuacion between 7 and 8 then 'Pasivo' else 'Promotor' end;

	insert into tbl_encuesta select @id_usuario, @puntuacion, @hora, @fecha, @resultado;

	update tbl_flujos set
		habilitado = 0
	where id_usuario = @id_usuario;

	declare @nuevo_contenido_html nvarchar(max) = '<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" alt="user" /></div><div class="chat-content"><div class="box bg-light-success">Hola otra vez, ¿cómo puedo ayudarte?</div></div><div class="chat-time">' + left(convert(time,getdate()),5) + '</div></li>';

	insert into tbl_flujos (id_usuario, tipo, contenido_texto, contenido_html, habilitado, remitente)
	values (@id_usuario, 'text', 'Hola otra vez, ¿cómo puedo ayudarte?', @nuevo_contenido_html, 1, 'bot');

	select 'OK' 'rpta';

ENd
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_TICKET]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_REGISTRAR_TICKET]
(
	@codigo varchar(50),
	@id_usuario int,
	@estado varchar(50)
)
AS
BEGIN

	insert into tbl_tickets (codigo, id_usuario, estado)
	values (@codigo, @id_usuario, @estado);

	select 'OK' 'rpta';

END
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_USUARIO]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_REGISTRAR_USUARIO]
(
	@nombres varchar(100),
	@apellidos varchar(100),
	@id_tipousuario int,
	@tipo_documento varchar(50),
	@num_documento varchar(20),
	@linea varchar(9),
	@id_tipolinea int
)
AS
BEGIN
	
	declare @rpta varchar(100);
	declare @id_usuario int;

	--if exists(select * from tbl_usuario where tipo_documento = @tipo_documento and num_documento = @num_documento)
	--begin
	--	set @rpta = 'El documento ingresado ya se encuentra registrado';
	--end
	--else
	--begin
	--	if exists(select * from tbl_linea where linea = @linea and id_tipolinea = @id_tipolinea)
	--	begin
	--		set @rpta = 'La línea ingresada ya se encuentra registrada';
	--	end
	--	else
	--	begin
	--		insert into tbl_usuario select @nombres, @apellidos, @id_tipousuario, '', null, 1, @tipo_documento, @num_documento;
	--		set @id_usuario = @@IDENTITY;

	--		declare @nuevo_contenido_html nvarchar(max) = '<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" alt="user" /></div><div class="chat-content"><div class="box bg-light-success">Hola, ¿cómo puedo ayudarte?</div></div><div class="chat-time">' + left(convert(time,getdate()),5) + '</div></li>';

	--		insert into tbl_flujos (id_usuario, tipo, contenido_texto, contenido_html, habilitado, remitente)
	--		values (@id_usuario, 'text', 'Hola, ¿cómo puedo ayudarte?', @nuevo_contenido_html, 1, 'bot');

	--		insert into tbl_linea select @linea, @id_tipolinea, @id_usuario, 1;
	--		set @rpta = 'OK'
	--	end
	--end

	select @rpta 'rpta'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_VISITA]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTRAR_VISITA]
(
	@id_tipousuario INT
)
AS
BEGIN
	SET NOCOUNT ON;

	declare @visitante VARCHAR(50)

	if @id_tipousuario = 0
	begin
		set @visitante = 'NO CLIENTE'
	end
	else
	begin
		set @visitante = 'CLIENTE'
	end

	insert into tbl_visitas values (@visitante, GETDATE())

	SELECT 'OK' 'rpta'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_RESULTADOS_NPS]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_RESULTADOS_NPS]
(
	@año int,
	@mes int
)
AS
BEGIN

	declare @total int = (select count(*) from tbl_encuesta where DATEPART(year,convert(date,fecha)) = @año);
	declare @total_flujo int = (select count(*) from tbl_resumen_flujo);

	declare @nps_objetivo numeric(10,2) = 85.00;

	declare @temp_resultados table ( total_entero int, total_porcentaje numeric(10,2), resultado varchar(20) )
	declare @temp_resultados_flujo table ( total_entero int, total_porcentaje numeric(10,2), resultado varchar(20) )

	insert into @temp_resultados
	select
		count(*) total_entero,
		convert(numeric(10,2), convert(numeric(10,2), count(*)) / convert(numeric(10,2), @total) * 100 ) total_porcentaje,
		resultado
	from tbl_encuesta group by resultado

	if not exists (select * from @temp_resultados where resultado = 'Detractor')
	begin
		insert into @temp_resultados select 0,0.00,'Detractor'
	end

	if not exists (select * from @temp_resultados where resultado = 'Pasivo')
	begin
		insert into @temp_resultados select 0,0.00,'Pasivo'
	end

	if not exists (select * from @temp_resultados where resultado = 'Promotor')
	begin
		insert into @temp_resultados select 0,0.00,'Promotor'
	end
	
	insert into @temp_resultados_flujo
	select
		count(*) total_entero,
		convert(numeric(10,2), convert(numeric(10,2), count(*)) / convert(numeric(10,2), @total_flujo) * 100 ) total_porcentaje,
		resultado
	from tbl_resumen_flujo
	group by resultado

	if not exists (select * from @temp_resultados_flujo where resultado = 'TICKET')
	begin
		insert into @temp_resultados_flujo select 0,0.00,'TICKET';
	end

	if not exists (select * from @temp_resultados_flujo where resultado = 'GRACIAS')
	begin
		insert into @temp_resultados_flujo select 0,0.00,'GRACIAS';
	end

	if not exists (select * from @temp_resultados_flujo where resultado = 'CALL CENTER')
	begin
		insert into @temp_resultados_flujo select 0,0.00,'CALL CENTER';
	end

	select
		total_entero,
		total_porcentaje,
		resultado
	from @temp_resultados
	union all
	select
		@total,
		100.00,
		'Total general'
	union all
	select
		0,
		@nps_objetivo,
		'NPS Objetivo'
	union all
	select
		Convert(int, (select total_entero from @temp_resultados where resultado = 'Promotor')) - Convert(int, (select total_entero from @temp_resultados where resultado = 'Detractor')),
		convert(numeric(11,2), convert(numeric(11,2), (select total_porcentaje from @temp_resultados where resultado = 'Promotor')) - convert(numeric(11,2), (select total_porcentaje from @temp_resultados where resultado = 'Detractor'))),
		'NPS Real'
	--select
	--	0,
	--	convert(numeric(10,2), convert(numeric(10,2), count(*)) / convert(numeric(10,2), (case when @total = 0 then 1 else @total end)) * 100 ) total_porcentaje,
	--	'NPS Real'
	--from tbl_encuesta where resultado <> 'Promotor'
	union all
	select * from @temp_resultados_flujo

END
GO
/****** Object:  StoredProcedure [dbo].[SP_VALIDAR_FLUJO_ACTUAL]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_VALIDAR_FLUJO_ACTUAL]
(
	@id_usuario int
)
AS
BEGIN

	select --top 1
		*
	from tbl_flujos
	where id_usuario = @id_usuario
	and habilitado = 1
	--order by 1 desc

END
GO
/****** Object:  StoredProcedure [dbo].[SP_VALIDAR_USUARIO]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC SP_VALIDAR_USUARIO 'admin@abc.com','123';
CREATE PROCEDURE [dbo].[SP_VALIDAR_USUARIO]
(
	@usuario varchar(100),
	@password varchar(50)
)
as
begin
	set nocount on;

	declare @error varchar(100) = '';

	if exists (select * from tbl_usuario where email = @usuario)
	begin
		if (select dbo.fn_DesencriptarPassword(password) from tbl_usuario where email = @usuario) = @password
		begin
			if (select habilitado from tbl_usuario where email = @usuario and dbo.fn_DesencriptarPassword(password) = @password) = 1
			begin
				set @error = ''
			end
			else
			begin
				set @error = 'El usuario no se encuentra habilitado'
			end
		end
		else
		begin
			set @error = 'Credenciales incorrectas'
		end
	end
	else
	begin
		set @error = 'El usuario no se encuentra registrado'
	end

	if @error = ''
	begin
		select
			u.id_usuario,
			u.nombres,
			u.apellidos,
			u.id_tipousuario,
			tu.tipousuario,
			u.tipo_documento,
			u.num_documento,
			u.test_actual,
			'OK' 'validacion'
		from tbl_usuario u
		inner join tbl_tipousuario tu on tu.id_tipousuario = u.id_tipousuario
		where u.email = @usuario
		and dbo.fn_DesencriptarPassword(u.password) = @password
	end
	else
	begin
		select
			0 id_usuario,
			'' nombres,
			'' apellidos,
			0 id_tipousuario,
			'' tipousuario,
			'' tipo_documento,
			'' num_documento,
			0 test_actual,
			@error 'validacion'
	end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_VISITAS]    Script Date: 15/09/2022 18:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_VISITAS]
(
	@año int,
	@mes int
)
AS
BEGIN

	declare @tbl_meses table (orden int, num_mes int, mes varchar(50), tipo varchar(50), visitante varchar(50), total int)

declare @i int = 1;
declare @c1 int = 1;
declare @c2 int = 2;
declare @c3 int = 3;
declare @c4 int = 4;
while (@i < 13)
begin
	insert into @tbl_meses select @c1, num_mes, mes, '', 'CLIENTE', 0 from tbl_meses where num_mes = @i;
	insert into @tbl_meses select @c2, num_mes, mes, '', 'NO CLIENTE', 0 from tbl_meses where num_mes = @i;

	set @i = @i + 1;
	set @c1 = @c1 + 2;
	set @c2 = @c2 + 2;
end

declare @j int = 1;
while (@j < (select COUNT(*) + 1 from @tbl_meses))
begin
	declare @tipo varchar(50);
	declare @visitante varchar(50);
	declare @num_mes int;
	declare @total int;

	select @visitante = visitante, @num_mes = num_mes from @tbl_meses where orden = @j;

	select @total = count(*) from tbl_visitas
	where datepart(year,convert(date,fecha_visita)) = @año and visitante = @visitante and DATEPART(month,convert(date,fecha_visita)) = @num_mes;

	update @tbl_meses set total = @total
	where visitante = @visitante and num_mes = @num_mes;

	set @j = @j + 1;
end

select * from @tbl_meses
	
END
GO
