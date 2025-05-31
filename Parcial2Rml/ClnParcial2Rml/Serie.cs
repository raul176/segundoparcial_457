﻿using cadParcial2Rml;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClnParcial2Rml
{
    public class SerieCln
    {
        public static int Insertar(Serie serie)
        {
            using (var context = new Parcial2RmlEntities())
            {
                context.Serie.Add(serie);
                context.SaveChanges();
                return serie.id;
            }

        }
        public static int Actualizar(Serie serie)
        {
            using (var context = new Parcial2RmlEntities())
            {
                var existente = context.Serie.Find(serie.id);
                existente.titulo = serie.titulo;
                existente.sinopsis = serie.sinopsis;
                existente.director = serie.director;
                existente.episodios = serie.episodios;
                existente.fechaEstreno = serie.fechaEstreno;
                existente.urltrailer = serie.urltrailer;
                return context.SaveChanges();
            }
        }
        public static int Eliminar(int id)
        {
            using (var context = new Parcial2RmlEntities())
            {
                var serie = context.Serie.Find(id);
                serie.estado = -1;
                return context.SaveChanges();
            }
        }

        public static Serie ObtenerUno(int id)
        {
            using (var context = new Parcial2RmlEntities())
            {
                return context.Serie.Find(id);
            }
        }

        public static List<Serie> Listar()
        {
            using (var context = new Parcial2RmlEntities())
            {
                return context.Serie.Where(x => x.estado != -1).ToList();
            }
        }

        public static List<paSerieListar_Result> ListarPa(string parametro)
        {
            using (var context = new Parcial2RmlEntities())
            {
                return context.paSerieListar(parametro).ToList();
            }
        }
    }
}
