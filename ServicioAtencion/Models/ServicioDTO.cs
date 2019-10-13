using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServicioAtencion.Models
{
    public class ServicioDTO
    {
        public int id_servicio { get; set; }
        public string descripcion { get; set; }
        public short solicitar_comentario { get; set; }

        public ServicioDTO()
        {

        }
    }
}