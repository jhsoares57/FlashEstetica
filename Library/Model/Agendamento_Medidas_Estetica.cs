using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Model
{
    public class Agendamento_Medidas_Estetica
    {
        private int idMedida;
        private int idAgendamento;
        private string cintura;
        private string culote;
        private string quadril;
        private string coxaDir;
        private string coxaEsq;
        private string pantDir;
        private string pantEsq;

        public int IdMedida { get => idMedida; set => idMedida = value; }
        public int IdAgendamento { get => idAgendamento; set => idAgendamento = value; }
        public string Cintura { get => cintura; set => cintura = value; }
        public string Culote { get => culote; set => culote = value; }
        public string Quadril { get => quadril; set => quadril = value; }
        public string CoxaDir { get => coxaDir; set => coxaDir = value; }
        public string CoxaEsq { get => coxaEsq; set => coxaEsq = value; }
        public string PantDir { get => pantDir; set => pantDir = value; }
        public string PantEsq { get => pantEsq; set => pantEsq = value; }
    }
}
