USE [DB_TEA]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_DesencriptarPassword]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fn_EncriptarPassword]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  Table [dbo].[tbl_centros_atencion]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  Table [dbo].[tbl_encuesta]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  Table [dbo].[tbl_flujos]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  Table [dbo].[tbl_invitados]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  Table [dbo].[tbl_menu]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  Table [dbo].[tbl_meses]    Script Date: 17/06/2022 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_meses](
	[num_mes] [int] NULL,
	[mes] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_opciones_usuario]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  Table [dbo].[tbl_puntos_visitados]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  Table [dbo].[tbl_resumen_flujo]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  Table [dbo].[tbl_tickets]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  Table [dbo].[tbl_tipolinea]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  Table [dbo].[tbl_tipousuario]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  Table [dbo].[tbl_usuario]    Script Date: 17/06/2022 11:28:14 ******/
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
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_visitas]    Script Date: 17/06/2022 11:28:14 ******/
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
SET IDENTITY_INSERT [dbo].[tbl_encuesta] ON 
GO
INSERT [dbo].[tbl_encuesta] ([id_item], [id_usuario], [puntuacion], [hora], [fecha], [resultado]) VALUES (1, 2, 4, N'15:09:34', N'2021-04-03', N'Detractor')
GO
SET IDENTITY_INSERT [dbo].[tbl_encuesta] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_flujos] ON 
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (1, 2, N'text', N'Hola, ¿cómo estás?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" alt="user" /></div><div class="chat-content"><div class="box bg-light-success">Hola, ¿cómo puedo ayudarte?</div></div><div class="chat-time">19:28</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (2, -1, N'text', N'Hola, ¿cómo puedo ayudarte?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" alt="user" /></div><div class="chat-content"><div class="box bg-light-success">Hola, ¿cómo puedo ayudarte?</div></div><div class="chat-time">03:00</div></li>', 1, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (3, -2, N'text', N'Hola, ¿cómo puedo ayudarte?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" alt="user" /></div><div class="chat-content"><div class="box bg-light-success">Hola, ¿cómo puedo ayudarte?</div></div><div class="chat-time">15:05</div></li>', 1, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (4, -2, N'text', N'graciass', N'<li class="reverse"><div class="chat-time">15:05</div><div class="chat-content"><div class="box bg-light-inverse">graciass</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 1, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (5, -2, N'text', N'Gracias a Usted! Que tenga un buen día!', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="box bg-light-success">Gracias a Usted! Que tenga un buen día!</div></div><div class="chat-time">15:05</div></li>', 1, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (6, -2, N'text', N'tengo un problema', N'<li class="reverse"><div class="chat-time">15:06</div><div class="chat-content"><div class="box bg-light-inverse">tengo un problema</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 1, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (7, -2, N'text', N'Revise si se encuentra enchufado a la corriente
', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="box bg-light-success">Revise si se encuentra enchufado a la corriente
</div></div><div class="chat-time">15:06</div></li>', 1, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (8, -2, N'options_title', N'¿Se soluciono?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Se soluciono?</div></div></div><div class="chat-time">15:06</div></li>', 1, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (9, -2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Confirm'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''LaptoRouter'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 1, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (10, -2, N'text', N'Si', N'<li class="reverse"><div class="chat-time">15:06</div><div class="chat-content"><div class="box bg-light-inverse">Si</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 1, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (11, -2, N'text', N'Gracias! Por su preferencia
', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="box bg-light-success">Gracias! Por su preferencia
</div></div><div class="chat-time">15:06</div></li>', 1, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (12, 2, N'text', N'tengo un problema', N'<li class="reverse"><div class="chat-time">15:07</div><div class="chat-content"><div class="box bg-light-inverse">tengo un problema</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (13, 2, N'text', N'Revise si se encuentra enchufado a la corriente
', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="box bg-light-success">Revise si se encuentra enchufado a la corriente
</div></div><div class="chat-time">15:07</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (14, 2, N'options_title', N'¿Se soluciono?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Se soluciono?</div></div></div><div class="chat-time">15:07</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (15, 2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Confirm'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''LaptoRouter'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (16, 2, N'text', N'Si', N'<li class="reverse"><div class="chat-time">15:07</div><div class="chat-content"><div class="box bg-light-inverse">Si</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (17, 2, N'text', N'Gracias! Por su preferencia
', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="box bg-light-success">Gracias! Por su preferencia
</div></div><div class="chat-time">15:07</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (18, 2, N'text', N'No', N'<li class="reverse"><div class="chat-time">15:07</div><div class="chat-content"><div class="box bg-light-inverse">No</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (19, 2, N'options_title', N'Por favor conecte su laptop al router por cable de red', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">Por favor conecte su laptop al router por cable de red</div></div></div><div class="chat-time">15:07</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (20, 2, N'option', N'Si tengo mi cable de Red,No tengo mi cable de Red', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''SiCable'',''Si tengo mi cable de Red'')"><div class="box bg-light-info">Si tengo mi cable de Red</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo mi cable de red'',''No tengo mi cable de Red'')"><div class="box bg-light-info">No tengo mi cable de Red</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (21, 2, N'text', N'No tengo mi cable de red', N'<li class="reverse"><div class="chat-time">15:07</div><div class="chat-content"><div class="box bg-light-inverse">No tengo mi cable de red</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (22, 2, N'options_title', N'Por favor conecte su laptop al router por cable de red', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">Por favor conecte su laptop al router por cable de red</div></div></div><div class="chat-time">15:07</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (23, 2, N'option', N'Si tengo mi cable de Red,No tengo mi cable de Red', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''SiCable'',''Si tengo mi cable de Red'')"><div class="box bg-light-info">Si tengo mi cable de Red</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo mi cable de red'',''No tengo mi cable de Red'')"><div class="box bg-light-info">No tengo mi cable de Red</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (24, 2, N'text', N'Si tengo mi cable de Red', N'<li class="reverse"><div class="chat-time">15:07</div><div class="chat-content"><div class="box bg-light-inverse">Si tengo mi cable de Red</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (25, 2, N'options_title', N'¿Tiene internet?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Tiene internet?</div></div></div><div class="chat-time">15:07</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (26, 2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Si tengo internet'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo internet'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (27, 2, N'text', N'Si tengo internet', N'<li class="reverse"><div class="chat-time">15:07</div><div class="chat-content"><div class="box bg-light-inverse">Si tengo internet</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (28, 2, N'options_title', N'¿Tiene internet?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Tiene internet?</div></div></div><div class="chat-time">15:07</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (29, 2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Si tengo internet'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo internet'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (30, 2, N'text', N'Si tengo internet', N'<li class="reverse"><div class="chat-time">15:08</div><div class="chat-content"><div class="box bg-light-inverse">Si tengo internet</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (31, 2, N'options_title', N'¿Tiene internet?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Tiene internet?</div></div></div><div class="chat-time">15:08</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (32, 2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Si tengo internet'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo internet'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (33, 2, N'text', N'No tengo internet', N'<li class="reverse"><div class="chat-time">15:08</div><div class="chat-content"><div class="box bg-light-inverse">No tengo internet</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (34, 2, N'options_title', N'¿Tiene internet?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Tiene internet?</div></div></div><div class="chat-time">15:08</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (35, 2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Si tengo internet'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo internet'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (36, 2, N'text', N'No tengo internet', N'<li class="reverse"><div class="chat-time">15:08</div><div class="chat-content"><div class="box bg-light-inverse">No tengo internet</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (37, 2, N'options_title', N'¿Tiene internet?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Tiene internet?</div></div></div><div class="chat-time">15:08</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (38, 2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Si tengo internet'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo internet'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (39, 2, N'text', N'No tengo mi cable de red', N'<li class="reverse"><div class="chat-time">15:08</div><div class="chat-content"><div class="box bg-light-inverse">No tengo mi cable de red</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (40, 2, N'options_title', N'¿Tiene internet?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Tiene internet?</div></div></div><div class="chat-time">15:08</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (41, 2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Si tengo internet'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo internet'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (42, 2, N'text', N'No tengo internet', N'<li class="reverse"><div class="chat-time">15:08</div><div class="chat-content"><div class="box bg-light-inverse">No tengo internet</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (43, 2, N'options_title', N'¿Tiene internet?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Tiene internet?</div></div></div><div class="chat-time">15:08</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (44, 2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Si tengo internet'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo internet'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (45, 2, N'text', N'tengo un problema', N'<li class="reverse"><div class="chat-time">15:08</div><div class="chat-content"><div class="box bg-light-inverse">tengo un problema</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (46, 2, N'options_title', N'¿Tiene internet?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Tiene internet?</div></div></div><div class="chat-time">15:08</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (47, 2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Si tengo internet'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo internet'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (48, 2, N'text', N'No tengo internet', N'<li class="reverse"><div class="chat-time">15:08</div><div class="chat-content"><div class="box bg-light-inverse">No tengo internet</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (49, 2, N'options_title', N'¿Tiene internet?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Tiene internet?</div></div></div><div class="chat-time">15:08</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (50, 2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Si tengo internet'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo internet'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (51, 2, N'text', N'tengo un problema', N'<li class="reverse"><div class="chat-time">15:08</div><div class="chat-content"><div class="box bg-light-inverse">tengo un problema</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (52, 2, N'options_title', N'¿Tiene internet?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Tiene internet?</div></div></div><div class="chat-time">15:08</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (53, 2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Si tengo internet'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo internet'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (54, 2, N'text', N'Si tengo internet', N'<li class="reverse"><div class="chat-time">15:08</div><div class="chat-content"><div class="box bg-light-inverse">Si tengo internet</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (55, 2, N'options_title', N'¿Tiene internet?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Tiene internet?</div></div></div><div class="chat-time">15:09</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (56, 2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Si tengo internet'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo internet'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (57, 2, N'text', N'si tengo', N'<li class="reverse"><div class="chat-time">15:09</div><div class="chat-content"><div class="box bg-light-inverse">si tengo</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (58, 2, N'options_title', N'¿Tiene internet?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Tiene internet?</div></div></div><div class="chat-time">15:09</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (59, 2, N'option', N'Si,No', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Si tengo internet'',''Si'')"><div class="box bg-light-info">Si</div></div><div class="chat-content chat-option" onclick="redirect_message(''No tengo internet'',''No'')"><div class="box bg-light-info">No</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (60, 2, N'text', N'gracias', N'<li class="reverse"><div class="chat-time">15:09</div><div class="chat-content"><div class="box bg-light-inverse">gracias</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (61, 2, N'options_title', N'¿Tienes alguna consulta adicional?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">¿Tienes alguna consulta adicional?</div></div></div><div class="chat-time">15:09</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (62, 2, N'option', N'SI,NINGUNA', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''si_otra_consulta'',''SI'')"><div class="box bg-light-info">SI</div></div><div class="chat-content chat-option" onclick="redirect_message(''ninguna_consulta'',''NINGUNA'')"><div class="box bg-light-info">NINGUNA</div></div></div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (63, 2, N'text', N'No tengo otra consulta', N'<li class="reverse"><div class="chat-time">15:09</div><div class="chat-content"><div class="box bg-light-inverse">No tengo otra consulta</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 0, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (64, 2, N'text', N'Gracias! Por su preferencia', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="box bg-light-success">Gracias! Por su preferencia</div></div><div class="chat-time">15:09</div></li>', 0, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (65, 2, N'text', N'Hola otra vez, ¿cómo puedo ayudarte?', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" alt="user" /></div><div class="chat-content"><div class="box bg-light-success">Hola otra vez, ¿cómo puedo ayudarte?</div></div><div class="chat-time">15:09</div></li>', 1, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (66, 2, N'text', N'hola', N'<li class="reverse"><div class="chat-time">01:13</div><div class="chat-content"><div class="box bg-light-inverse">hola</div></div><div class="chat-img"><img src="https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png" /></div></li>', 1, N'person')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (67, 2, N'text', N'¡Hola! Soy Bankito, tu asistente virtual ??. 
Puedes realizar cualquier consulta de los productos que tenemos disponibles para ti ?? del siguiente menú:', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="box bg-light-success">¡Hola! Soy Bankito, tu asistente virtual ??. 
Puedes realizar cualquier consulta de los productos que tenemos disponibles para ti ?? del siguiente menú:</div></div><div class="chat-time">01:13</div></li>', 1, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (68, 2, N'options_title', N'Menu de opciones', N'<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class=""/></div><div class="chat-content"><div class="chat-content" style="margin-bottom: -10px;"><div class="box bg-light-success">Menu de opciones</div></div></div><div class="chat-time">01:13</div></li>', 1, N'bot')
GO
INSERT [dbo].[tbl_flujos] ([id_flujo], [id_usuario], [tipo], [contenido_texto], [contenido_html], [habilitado], [remitente]) VALUES (69, 2, N'option', N'A) Cuentas y número de Cuentas Interbancarias (CCI) ??,B) Tarjetas de Crédito ??,C) Créditos Personales ??,D) Seguros Bancarios ??,E) Estado de Cuenta ??,F) Más Productos y servicios Bancarias ,G) Sugerencias para mejorar el servicio', N'<li style="margin-top: 10px;"><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element"/></div><div class="chat-content"><div class="chat-content chat-option" onclick="redirect_message(''Opción A'',''A) Cuentas y número de Cuentas Interbancarias (CCI) ??'')"><div class="box bg-light-info">A) Cuentas y número de Cuentas Interbancarias (CCI) ??</div></div><div class="chat-content chat-option" onclick="redirect_message(''Opción B'',''B) Tarjetas de Crédito ??'')"><div class="box bg-light-info">B) Tarjetas de Crédito ??</div></div><div class="chat-content chat-option" onclick="redirect_message(''Opción C'',''C) Créditos Personales ??'')"><div class="box bg-light-info">C) Créditos Personales ??</div></div><div class="chat-content chat-option" onclick="redirect_message(''Opción D'',''D) Seguros Bancarios ??'')"><div class="box bg-light-info">D) Seguros Bancarios ??</div></div><div class="chat-content chat-option" onclick="redirect_message(''Opción E'',''E) Estado de Cuenta ??'')"><div class="box bg-light-info">E) Estado de Cuenta ??</div></div><div class="chat-content chat-option" onclick="redirect_message(''Opción F'',''F) Más Productos y servicios Bancarias '')"><div class="box bg-light-info">F) Más Productos y servicios Bancarias </div></div><div class="chat-content chat-option" onclick="redirect_message(''Opción G'',''G) Sugerencias para mejorar el servicio'')"><div class="box bg-light-info">G) Sugerencias para mejorar el servicio</div></div></div></li>', 1, N'bot')
GO
SET IDENTITY_INSERT [dbo].[tbl_flujos] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_invitados] ON 
GO
INSERT [dbo].[tbl_invitados] ([id_invitado], [linea], [id_tipolinea]) VALUES (-2, N'123123123', 1)
GO
INSERT [dbo].[tbl_invitados] ([id_invitado], [linea], [id_tipolinea]) VALUES (-1, N'98769876', 2)
GO
SET IDENTITY_INSERT [dbo].[tbl_invitados] OFF
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
INSERT [dbo].[tbl_puntos_visitados] ([punto_visitado], [visitante], [fecha_visita]) VALUES (N'WHATSAPP', N'CLIENTE', CAST(N'2020-10-18T18:17:45.190' AS DateTime))
GO
INSERT [dbo].[tbl_puntos_visitados] ([punto_visitado], [visitante], [fecha_visita]) VALUES (N'WHATSAPP', N'CLIENTE', CAST(N'2020-11-07T21:15:15.290' AS DateTime))
GO
INSERT [dbo].[tbl_puntos_visitados] ([punto_visitado], [visitante], [fecha_visita]) VALUES (N'CALL-CENTER', N'CLIENTE', CAST(N'2020-11-07T21:26:01.613' AS DateTime))
GO
INSERT [dbo].[tbl_puntos_visitados] ([punto_visitado], [visitante], [fecha_visita]) VALUES (N'WHATSAPP', N'CLIENTE', CAST(N'2020-11-07T21:30:22.330' AS DateTime))
GO
INSERT [dbo].[tbl_puntos_visitados] ([punto_visitado], [visitante], [fecha_visita]) VALUES (N'WHATSAPP', N'CLIENTE', CAST(N'2020-11-09T23:23:33.793' AS DateTime))
GO
INSERT [dbo].[tbl_puntos_visitados] ([punto_visitado], [visitante], [fecha_visita]) VALUES (N'WHATSAPP', N'CLIENTE', CAST(N'2020-11-09T23:24:57.120' AS DateTime))
GO
INSERT [dbo].[tbl_puntos_visitados] ([punto_visitado], [visitante], [fecha_visita]) VALUES (N'WHATSAPP', N'CLIENTE', CAST(N'2020-11-09T23:26:42.620' AS DateTime))
GO
INSERT [dbo].[tbl_puntos_visitados] ([punto_visitado], [visitante], [fecha_visita]) VALUES (N'WHATSAPP', N'CLIENTE', CAST(N'2020-11-09T23:27:37.190' AS DateTime))
GO
INSERT [dbo].[tbl_puntos_visitados] ([punto_visitado], [visitante], [fecha_visita]) VALUES (N'WHATSAPP', N'CLIENTE', CAST(N'2020-11-13T09:01:27.710' AS DateTime))
GO
INSERT [dbo].[tbl_puntos_visitados] ([punto_visitado], [visitante], [fecha_visita]) VALUES (N'WHATSAPP', N'CLIENTE', CAST(N'2020-11-13T09:04:13.883' AS DateTime))
GO
INSERT [dbo].[tbl_puntos_visitados] ([punto_visitado], [visitante], [fecha_visita]) VALUES (N'WHATSAPP', N'NO CLIENTE', CAST(N'2020-11-20T19:04:29.557' AS DateTime))
GO
INSERT [dbo].[tbl_puntos_visitados] ([punto_visitado], [visitante], [fecha_visita]) VALUES (N'WHATSAPP', N'CLIENTE', CAST(N'2022-05-23T22:11:58.780' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_resumen_flujo] ON 
GO
INSERT [dbo].[tbl_resumen_flujo] ([id_item], [id_usuario], [resultado]) VALUES (1, 2, N'GRACIAS')
GO
SET IDENTITY_INSERT [dbo].[tbl_resumen_flujo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_tipolinea] ON 
GO
INSERT [dbo].[tbl_tipolinea] ([id_tipolinea], [tipolinea]) VALUES (1, N'Móvil')
GO
INSERT [dbo].[tbl_tipolinea] ([id_tipolinea], [tipolinea]) VALUES (2, N'Fija')
GO
SET IDENTITY_INSERT [dbo].[tbl_tipolinea] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_tipousuario] ON 
GO
INSERT [dbo].[tbl_tipousuario] ([id_tipousuario], [tipousuario]) VALUES (1, N'Admin')
GO
INSERT [dbo].[tbl_tipousuario] ([id_tipousuario], [tipousuario]) VALUES (2, N'Cliente')
GO
SET IDENTITY_INSERT [dbo].[tbl_tipousuario] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_usuario] ON 
GO
INSERT [dbo].[tbl_usuario] ([id_usuario], [nombres], [apellidos], [id_tipousuario], [password], [habilitado], [tipo_documento], [num_documento], [email]) VALUES (1, N'Martin', N'Aguirre', 1, 0x01000000A6A22DEF47F0C0F976C070A345E9C82ABD36308DE81D7303, 1, N'DNI', N'11111111', N'admin@abc.com')
GO
INSERT [dbo].[tbl_usuario] ([id_usuario], [nombres], [apellidos], [id_tipousuario], [password], [habilitado], [tipo_documento], [num_documento], [email]) VALUES (2, N'Juan', N'Marca', 2, 0x01000000311509935D32637CCA09CF0A10985285800CA45AA5BDFF3B, 1, N'DNI', N'22222222', N'cliente@abc.com')
GO
SET IDENTITY_INSERT [dbo].[tbl_usuario] OFF
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T17:01:22.340' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T17:08:28.523' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-10-18T17:10:28.167' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-10-18T18:03:50.630' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-10-18T18:17:22.860' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-10-18T20:05:46.383' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T20:31:08.837' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-10-18T21:06:55.187' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T22:03:27.740' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T22:10:19.307' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T22:41:39.900' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T22:45:25.140' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T22:53:15.087' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T23:31:33.050' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-10-29T15:03:32.530' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-10-29T15:14:06.697' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-29T15:14:43.107' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-07T21:13:44.420' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-07T21:25:33.137' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-07T21:26:24.060' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-07T21:33:29.410' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-07T21:37:26.410' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-09T23:23:15.430' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-09T23:24:44.140' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-09T23:26:29.413' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-13T07:18:30.257' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-13T07:23:40.253' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-13T07:25:29.783' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-13T07:57:54.527' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-13T08:42:02.010' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-13T09:07:06.500' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-16T21:21:46.403' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-16T23:10:22.693' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-16T23:19:03.200' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-16T23:25:20.510' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-16T23:38:34.117' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-17T00:03:48.243' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-17T01:13:57.937' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-17T02:25:05.823' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T09:21:02.403' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T18:40:27.193' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-11-20T19:04:13.410' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T21:09:52.207' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T21:19:27.397' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T21:56:19.180' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T02:43:07.653' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T05:10:59.140' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T12:07:40.880' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T12:25:19.447' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T12:58:50.423' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T13:14:03.230' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T13:28:45.530' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T13:36:17.780' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T15:37:14.417' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T15:39:25.890' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T15:50:43.737' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T15:52:22.477' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T15:57:01.113' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T16:29:40.193' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T17:10:11.080' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T19:14:30.257' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T19:27:21.433' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T23:44:06.047' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T01:56:49.433' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T02:05:00.840' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T02:53:43.643' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T03:10:56.497' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T10:36:37.360' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T13:36:40.570' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T13:55:27.627' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T14:11:55.133' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T14:31:00.313' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T15:06:50.770' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T15:20:21.707' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T15:36:06.803' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T15:55:08.080' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T16:04:37.290' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T16:12:31.720' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T16:46:30.163' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T17:08:12.767' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T17:26:12.120' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T17:38:22.640' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T17:51:28.963' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T20:53:09.323' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T20:54:49.463' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T21:05:41.677' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T21:13:05.033' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T21:45:12.043' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T21:58:47.307' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T22:29:11.257' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T22:46:39.710' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T22:49:59.540' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T23:02:21.300' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T02:05:55.477' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T16:44:47.490' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T21:13:23.830' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T22:19:29.493' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T22:25:53.457' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T22:41:53.920' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T22:45:51.487' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T23:33:19.970' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T01:00:24.520' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T01:26:57.143' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T01:29:40.093' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T01:35:35.050' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T01:36:22.670' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T02:23:25.300' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T02:25:34.503' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T02:35:43.340' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T02:40:39.080' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T02:48:25.263' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-11-24T15:39:03.060' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T15:40:12.410' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T20:10:02.403' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-11-24T20:21:09.610' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-11-24T22:18:46.113' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-11-24T22:51:06.400' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-11-24T22:54:42.407' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T23:30:25.330' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T23:33:47.340' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T23:42:56.480' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T23:44:30.310' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T23:48:41.383' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-25T00:07:46.973' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2021-04-03T15:05:15.093' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2021-04-03T15:06:57.080' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2022-05-20T01:13:24.350' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2022-05-20T01:15:08.037' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2022-05-20T01:16:22.953' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2022-05-20T01:19:10.560' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2022-05-20T01:20:29.630' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T21:08:52.680' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T21:16:25.420' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T23:54:18.203' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T22:57:45.740' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T22:59:02.170' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T23:14:16.510' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T03:55:23.450' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T05:21:50.497' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T12:08:07.293' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T04:38:33.267' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-25T00:40:51.583' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-25T00:41:25.560' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T21:29:52.073' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-10-18T21:44:39.617' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-13T08:31:48.800' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-17T01:32:43.563' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T10:09:54.467' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T20:37:36.750' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T17:10:27.890' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T21:35:07.223' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T00:33:36.527' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T00:59:12.530' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T15:20:47.543' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T15:58:54.300' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T16:27:13.630' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T16:27:42.473' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-11-24T17:48:30.920' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-11-24T22:42:46.770' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-25T00:43:30.140' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-25T00:57:38.527' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-25T01:50:23.573' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-11-25T01:58:01.160' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-25T02:11:14.277' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-11-25T03:00:25.997' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-25T03:06:18.637' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-25T03:13:22.090' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-25T03:21:55.013' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2022-05-20T01:39:53.287' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2022-05-20T01:46:16.187' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2022-05-20T01:52:41.777' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-13T09:21:14.007' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-17T01:53:20.590' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-17T02:41:21.250' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-17T03:46:46.387' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T18:02:16.027' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T20:31:42.950' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T20:45:05.333' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T20:50:08.987' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T22:21:08.880' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T03:19:49.460' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T03:33:57.957' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T04:17:06.720' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T05:46:55.307' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T12:22:09.040' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T12:23:09.750' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T12:26:54.440' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T12:46:27.050' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T13:04:07.460' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T19:26:59.183' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T20:26:55.457' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T22:54:56.687' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-21T23:01:18.810' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T01:06:56.693' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T02:38:10.163' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T03:36:41.920' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T03:40:00.367' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T14:40:09.000' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T14:53:16.873' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T22:18:46.590' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T23:01:53.800' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-22T23:02:51.143' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T00:42:21.877' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T00:50:46.443' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T02:56:52.873' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T03:18:26.580' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-23T22:48:13.713' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-11-24T21:55:16.333' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T23:06:05.277' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'NO CLIENTE', CAST(N'2020-11-24T23:12:42.500' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-25T01:56:50.127' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-20T22:54:41.180' AS DateTime))
GO
INSERT [dbo].[tbl_visitas] ([visitante], [fecha_visita]) VALUES (N'CLIENTE', CAST(N'2020-11-24T23:07:22.693' AS DateTime))
GO
/****** Object:  StoredProcedure [dbo].[generar_backup_watson]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZAR_CONTRASEÑA]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_generar_ticket]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_CENTROS_ATENCION]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_MENU]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_PUNTOS_VISITADOS]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_FLUJO]    Script Date: 17/06/2022 11:28:14 ******/
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

	insert into tbl_flujos (id_usuario, tipo, contenido_texto, contenido_html, habilitado, remitente)
	values (@id_usuario, @tipo, @contenido_texto, @contenido_html, 1, @remitente);

	select 'OK' 'rpta';

END
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_INVITADO]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_PUNTO_VISITADO]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_PUNTUACION]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_TICKET]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_USUARIO]    Script Date: 17/06/2022 11:28:14 ******/
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

	if exists(select * from tbl_usuario where tipo_documento = @tipo_documento and num_documento = @num_documento)
	begin
		set @rpta = 'El documento ingresado ya se encuentra registrado';
	end
	else
	begin
		if exists(select * from tbl_linea where linea = @linea and id_tipolinea = @id_tipolinea)
		begin
			set @rpta = 'La línea ingresada ya se encuentra registrada';
		end
		else
		begin
			insert into tbl_usuario select @nombres, @apellidos, @id_tipousuario, '', null, 1, @tipo_documento, @num_documento;
			set @id_usuario = @@IDENTITY;

			declare @nuevo_contenido_html nvarchar(max) = '<li><div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" alt="user" /></div><div class="chat-content"><div class="box bg-light-success">Hola, ¿cómo puedo ayudarte?</div></div><div class="chat-time">' + left(convert(time,getdate()),5) + '</div></li>';

			insert into tbl_flujos (id_usuario, tipo, contenido_texto, contenido_html, habilitado, remitente)
			values (@id_usuario, 'text', 'Hola, ¿cómo puedo ayudarte?', @nuevo_contenido_html, 1, 'bot');

			insert into tbl_linea select @linea, @id_tipolinea, @id_usuario, 1;
			set @rpta = 'OK'
		end
	end

	select @rpta 'rpta'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_VISITA]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_RESULTADOS_NPS]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_VALIDAR_FLUJO_ACTUAL]    Script Date: 17/06/2022 11:28:14 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_VALIDAR_USUARIO]    Script Date: 17/06/2022 11:28:14 ******/
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
			@error 'validacion'
	end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_VISITAS]    Script Date: 17/06/2022 11:28:14 ******/
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
