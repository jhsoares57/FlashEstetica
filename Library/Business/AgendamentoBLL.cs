using Library.DAL;
using Library.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Business
{
    public class AgendamentoBLL
    {

        public List<Agendamento_Estetica> FindClienteAgen()
        {
            AgendamentoDAL dal = new AgendamentoDAL();
            return dal.FindClienteAgen();
        }

        public bool Insert(Agendamento_Estetica c)
        {

            bool salvou = false;
            new AgendamentoDAL().Insert_Agendamento(c);

            if (c.IdAgendmento > 0)
            {
                salvou = true;

            }
            return salvou;
        }

        public List<Agendamento_Estetica> FindAll()
        {
            AgendamentoDAL aDAL = new AgendamentoDAL();
            return aDAL.FindAll();
        }


        public Agendamento_Estetica FindByIdAgendamento(int id)
        {
            AgendamentoDAL pDAL = new AgendamentoDAL();
            return pDAL.FindByIdAgendamento(id);
        }

        public bool UpdateReag(Agendamento_Estetica P)
        {
            bool atualizou = false;
            AgendamentoDAL pDAL = new AgendamentoDAL();

            //if (P.Id == 0)
            //{
            //    throw new Exception("Selecione uma pessoa para atualizar.");
            //}

            if (pDAL.UpdateReagendamento(P) > 0)
            {
                //Este IF verificará se o retorno do método será maior que 0,
                //ou seja, se a atualização foi feita pela classe que acessa o Banco
                //se sim vai mudar para TRUE a variável e retornar para quem chamou este método.
                atualizou = true;
            }
            return atualizou;
        }
        public bool UpdateCancelamento(Agendamento_Estetica P)
        {
            bool atualizou = false;
            AgendamentoDAL pDAL = new AgendamentoDAL();

            //if (P.Id == 0)
            //{
            //    throw new Exception("Selecione uma pessoa para atualizar.");
            //}

            if (pDAL.UpdateCancelamento(P) > 0)
            {
                //Este IF verificará se o retorno do método será maior que 0,
                //ou seja, se a atualização foi feita pela classe que acessa o Banco
                //se sim vai mudar para TRUE a variável e retornar para quem chamou este método.
                atualizou = true;
            }
            return atualizou;
        }

        public bool UpdateFina(Agendamento_Estetica P)
        {
            bool atualizou = false;
            AgendamentoDAL pDAL = new AgendamentoDAL();

            //if (P.Id == 0)
            //{
            //    throw new Exception("Selecione uma pessoa para atualizar.");
            //}

            if (pDAL.UpdateFinalizado(P) > 0)
            {
                //Este IF verificará se o retorno do método será maior que 0,
                //ou seja, se a atualização foi feita pela classe que acessa o Banco
                //se sim vai mudar para TRUE a variável e retornar para quem chamou este método.
                atualizou = true;
            }
            return atualizou;
        }
        public bool InsertMedidas(Agendamento_Medidas_Estetica c)
        {
            bool salvou = false;
            new AgendamentoDAL().InsertMedidas(c);

            //Se o ID for maior que zero, indica que o dado foi salvo
            if (c.IdMedida > 0)
            {
                salvou = true;
            }
            return salvou;
        }
    }
}
