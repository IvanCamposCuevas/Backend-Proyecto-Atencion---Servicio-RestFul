using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServicioAtencion.Models
{
    public class Atencion
    {
        public String Nombre { get; set; }

        public String Rut { get; set; }

        public int TipoServicio { get; set; }

        public String Comentario { get; set; }

        public int EsCliente { get; set; }

        public Atencion(string nombre, string rut, int tipoServicio, string comentario, int esCliente)
        {
            Nombre = nombre;
            Rut = rut;
            TipoServicio = tipoServicio;
            Comentario = (comentario != null && comentario != "") ? comentario : null;
            EsCliente = esCliente;
        }

        public Atencion()
        {

        }
    }
}