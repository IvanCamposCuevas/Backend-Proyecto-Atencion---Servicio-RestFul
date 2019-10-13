using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ServicioAtencion.Models;
using ServicioAtencion.Controllers;
using System.Net.Http;

namespace ServicioAtencion.Consola
{
    class Program
    {
        static void Main(string[] args)
        {
            List<Atencion> listaAtencion = new List<Atencion>
            {
                new Atencion("A@LAA+++a#$&()!°´+}{", "221354859887",5, "", 1),//<-- Hasta aqui llego
                //new Atencion("Gabriel Andrés", "1111", 4, "Hola Copmo estan jaja", 0),
                //new Atencion("Raul Monarquez", "236548-8", 3, null, 1)
            };

            AtencionController atController = new AtencionController();
            foreach(var at in listaAtencion)
            {
                atController.postAgregarAtencion(at);
            }

            //AtencionController.postAtencion(at);
            //List<Numero> listaAtencion = NumeroController.getNumerosAtencion(187411998);
            //foreach (var item in listaAtencion)
            //{
            //    Console.WriteLine($"Rut: {item.Rut}, Servicio: {item.Servicio}, N° Atencion: {item.NumAtencion}");
            //}
            //Console.ReadKey();

            //NumeroController.deleteNumeroAtencion(4);
            //HttpClient cliente = new HttpClient();


        }
    }
}
