//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ServicioAtencion.Datos.Modelo
{
    using System;
    using System.Collections.Generic;
    
    public partial class atencion
    {
        public int nro_atencion { get; set; }
        public string rut { get; set; }
        public int id_servicio { get; set; }
        public int nro_modulo { get; set; }
        public short es_cliente { get; set; }
        public int tiempo_espera { get; set; }
        public string comentario { get; set; }
        public System.DateTime fecha_creacion { get; set; }
    
        public virtual cliente cliente { get; set; }
        public virtual modulo modulo { get; set; }
        public virtual servicio servicio { get; set; }
    }
}
