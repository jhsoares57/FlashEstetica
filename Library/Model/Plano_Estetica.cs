using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Model
{
    public class Plano_Estetica
    {
        private int idPlano;
        private string descricaoPlano;

        public int IdPlano { get => idPlano; set => idPlano = value; }
        public string DescricaoPlano { get => descricaoPlano; set => descricaoPlano = value; }
    }
}
