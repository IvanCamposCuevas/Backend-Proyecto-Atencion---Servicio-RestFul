﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BDAtencionEntities : DbContext
    {
        public BDAtencionEntities()
            : base("name=BDAtencionEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<atencion> atencion { get; set; }
        public virtual DbSet<cliente> cliente { get; set; }
        public virtual DbSet<modulo> modulo { get; set; }
        public virtual DbSet<servicio> servicio { get; set; }
    }
}
