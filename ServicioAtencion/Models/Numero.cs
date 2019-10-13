using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServicioAtencion.Models
{
    public class Numero
    {
        public String Rut { get; set; }

        public String Servicio { get; set; }

        public int NumAtencion { get; set; }

        public Numero()
        {

        }

        public Numero(string rut, string servicio, int numero)
        {
            Rut = rut;
            Servicio = servicio;
            NumAtencion = numero;
        }
    }
}