﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Tea.entities
{
	public class Usuario
	{
		public string email { get; set; } = "";
		public string password { get; set; } = "";
		public string nuevo_pass1 { get; set; } = "";
		public string nuevo_pass2 { get; set; } = "";
		public int id_usuario { get; set; } = 0;
		public string nombres { get; set; } = "";
		public string apellidos { get; set; } = "";
		public int id_tipousuario { get; set; } = 0;
		public string tipousuario { get; set; } = "";
		public string tipo_documento { get; set; } = "";
		public string num_documento { get; set; } = "";
		public string validacion { get; set; } = "";
	}
}
