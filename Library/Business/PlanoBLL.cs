using Library.DAL;
using Library.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Business
{
    public class PlanoBLL
    {
        public bool Insert(Plano_Estetica P)
        {
            bool salvou = false;
            new PlanoDAL().InserirPlano(P);

            //Se o ID for maior que zero, indica que o dado foi salvo
            if (P.IdPlano > 0)
            {
                salvou = true;
            }
            return salvou;
        }
    }
}
