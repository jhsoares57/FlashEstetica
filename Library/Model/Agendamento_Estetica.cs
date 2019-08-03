using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Model
{
    public class Agendamento_Estetica
    {
        private int id;
        private int IdCliente;
        private string nomeCliente;
        private DateTime data;
        private DateTime hora;
        private string status;

        public int Id { get => id; set => id = value; }
        public int IdCliente1 { get => IdCliente; set => IdCliente = value; }
        public string NomeCliente { get => nomeCliente; set => nomeCliente = value; }
        public DateTime Data { get => data; set => data = value; }
        public DateTime Hora { get => hora; set => hora = value; }
        public string Status { get => status; set => status = value; }
    }
}
