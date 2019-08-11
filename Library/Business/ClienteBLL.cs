using Library.DAL;
using Library.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Business
{
    public class ClienteBLL
    {
        public bool Insert(Cliente_Estetica c)
        {
            bool salvou = false;
            new ClienteDAL().Insert(c);

            //Se o ID for maior que zero, indica que o dado foi salvo
            if (c.Id > 0)
            {
                salvou = true;
            }
            return salvou;
        }
        public List<Cliente_Estetica> FindAll()
        {
            ClienteDAL cDAL = new ClienteDAL();
            return cDAL.FindAll();
        }
        public Cliente_Estetica FindById(int id)
        {
            ClienteDAL pDAL = new ClienteDAL();
            return pDAL.FindById(id);
        }

        public Cliente_Estetica FindByIdPessoa(int id)
        {
            ClienteDAL dDAL = new ClienteDAL();
            return dDAL.FindByIdPessoa(id);
        }

        public bool Update(Cliente_Estetica P)
        {
            bool atualizou = false;
            ClienteDAL pDAL = new ClienteDAL();

            //if (P.Id == 0)
            //{
            //    throw new Exception("Selecione uma pessoa para atualizar.");
            //}

            if (pDAL.Update(P) > 0)
            {
                //Este IF verificará se o retorno do método será maior que 0,
                //ou seja, se a atualização foi feita pela classe que acessa o Banco
                //se sim vai mudar para TRUE a variável e retornar para quem chamou este método.
                atualizou = true;
            }
            return atualizou;
        }

    }
}
