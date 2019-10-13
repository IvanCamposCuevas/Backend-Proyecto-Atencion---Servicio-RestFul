using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ServicioAtencion.Datos.Modelo;
using ServicioAtencion.Models;

namespace ServicioAtencion.Controllers
{
    public class NumeroController : ApiController
    {
        /// <summary>
        /// Retorna la lista de numeros en atencion.
        /// </summary>
        /// <param name="rut"></param>
        /// <returns></returns>
        [HttpGet]
        public List<Numero> getAtencionPorRut(string rut)
        {
            List<Numero> consultaNumeros = new List<Numero>();
            using (BDAtencionEntities bd = new BDAtencionEntities())
            {
                consultaNumeros = (from x in bd.atencion
                                   where x.rut == rut
                                   join y in bd.servicio on x.id_servicio equals y.id_servicio
                                   select new Numero {
                                       Rut = x.rut,
                                       NumAtencion = x.nro_atencion,
                                       Servicio = y.descripcion
                                   }).ToList();
            }
            return consultaNumeros;
        }

        /// <summary>
        /// Elimina un numero de atencion.
        /// </summary>
        /// <param name="nroAtencion"></param>
        /// <returns></returns>
        [HttpDelete]
        public bool deleteNumeroAtencion(int nroAtencion)
        {
            try
            {
                bool resultado;
                using (BDAtencionEntities bd = new BDAtencionEntities())
                {
                    var atencion = bd.atencion.Where(x => x.nro_atencion == nroAtencion).FirstOrDefault();
                    bd.atencion.Remove(atencion);
                    resultado = (bd.SaveChanges() > 0) ? true : false;

                }
                return resultado;
            }
            catch (ArgumentNullException)
            {
                throw;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
