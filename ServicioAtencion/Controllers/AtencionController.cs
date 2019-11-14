using ServicioAtencion.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ServicioAtencion.Datos.Modelo;

namespace ServicioAtencion.Controllers
{
    public class AtencionController : ApiController
    {
        /// <summary>
        /// Recuperara un cliente o creara uno nuevo si no existe
        /// </summary>
        /// <param name="atencion"></param>
        /// <param name="existe"></param>
        /// <returns></returns>
        private cliente obtenerCliente(Atencion atencion, out bool existe)
        {
            cliente clAux;
            bool aux = false;
            using (BDAtencionEntities bd = new BDAtencionEntities())
            {
                var cliente = bd.cliente.Where(x => x.rut == atencion.Rut).FirstOrDefault();
                if (cliente != null)
                {
                    clAux = cliente;
                    aux = true;
                }else
                {
                    clAux = new cliente();
                    clAux.nombre = atencion.Nombre;
                    clAux.rut = atencion.Rut;
                }
            }
            existe = aux;
            return clAux;
        }

        /// <summary>
        /// Ingresara una atencion a la Base de datos, y devuelve un objeto
        /// tipo "Atencion" que devuelve los datos de la entidad.
        /// </summary>
        /// <param name="atencion"></param>
        /// <returns></returns>
        [HttpPost]
        public HttpResponseMessage postAgregarAtencion([FromBody]Atencion atencion)
        {
            bool existe;
            var clEntidad = obtenerCliente(atencion, out existe);
            HttpResponseMessage respuesta;
            try
            {
                using (BDAtencionEntities bd = new BDAtencionEntities())
                {
                    if (existe)//Si el cliente existe en la bd, no se creara nuevamente, solo se asociara a la tabla atencion.
                    {
                        bd.Entry<cliente>(clEntidad).State = System.Data.Entity.EntityState.Unchanged;
                    }
                    var atEntidad = new atencion { cliente = clEntidad };
                    atEntidad.fecha_creacion = DateTime.Today;
                    atEntidad.es_cliente = (short)atencion.EsCliente;
                    atEntidad.id_servicio = atencion.TipoServicio;
                    atEntidad.comentario = atencion.Comentario;
                    var modulo = new Modulo();
                    try
                    {
                        if (atEntidad.es_cliente > 0)//Si es cliente (> 0), se asociara a los modulos 2 al 10, Sino, al 1.
                        {
                            modulo = (from x in bd.modulo
                                      let cargaActual = (from y in bd.modulo select y.carga_actual)
                                      where x.carga_actual == cargaActual.Min() &&
                                      x.nro_modulo != 1
                                      select new Modulo
                                      {
                                          nro_modulo = x.nro_modulo,
                                          carga_actual = x.carga_actual
                                      }).First();
                        }
                        else
                        {
                            modulo = (from x in bd.modulo
                                      where x.nro_modulo == 1
                                      select new Modulo
                                      {
                                          nro_modulo = x.nro_modulo,
                                          carga_actual = x.carga_actual
                                      }).First();
                        }
                    }
                    catch (InvalidOperationException ex)
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, "No existen modulos en la BD", ex);
                    }
                    atEntidad.nro_modulo = modulo.nro_modulo;
                    atEntidad.tiempo_espera = modulo.carga_actual * 5;
                    bd.atencion.Add(atEntidad);
                    bd.SaveChanges();
                    respuesta = Request.CreateResponse(HttpStatusCode.Created, atEntidad);
                }
                return respuesta;
            }
            catch (Exception ex)
            {

                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        [HttpGet]
        public HttpResponseMessage getObtenerServicios()
        {
            using (BDAtencionEntities bd = new BDAtencionEntities())
            {
                var listaServicio = bd.servicio.Select(x => new ServicioDTO
                {
                    descripcion = x.descripcion,
                    id_servicio = x.id_servicio,
                    solicitar_comentario = x.solicitar_comentario
                }).ToList();
                if (listaServicio != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, listaServicio);
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Lista de servicios no encontradas");
                }
            }
        }
    }
}
