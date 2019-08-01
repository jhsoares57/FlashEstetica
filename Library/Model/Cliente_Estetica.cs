using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Model
{
    public class Cliente_Estetica
    {
        private int id;
        private string nome;
        private string celular;
        private string email;
        private string cep;
        private string endereco;
        private string bairro;
        private int numero;
        private string cidade;
        private string uf;
        private string nascimento;
        private int idade;
        private int sexo;
        private int estadoCivil;
        private string profissao;
        private int estetico;
        private string qualEsteico;
        private int oncologico;
        private string qualocnOclogico;
        private int cirurgico;
        private string qualCirurgico;
        private int acido;
        private string qualAcido;
        private int intestino;
        private string obsIntestino;
        private int lesoes;
        private string quaisLesoes;
        private int tratMedico;
        private string qualTratMedico;
        private int liquidos;
        private string quaisLiquidos;
        private int varizes;
        private string grauVarizes;
        private int ativFisica;
        private string qualAtivFisica;
        private int anticoncepcional;
        private string qualAnticoncepcional;
        private int ortopedico;
        private string qualOrtopedico;
        private int aliBalanceada;
        private string qualAliBalanceada;
        private int alergia;
        private string qualAlergia;
        private int marcapasso;
        private string qualMarcapasso;
        private int cuidadoDaiario;
        private string qualProduto;
        private int filho;
        private string quantosFilos;
        private int sentada;
        private int fumante;
        private int hipotensao;
        private int hipertensao;
        private int diabetes;
        private string cpf;
        private string motivo;

        public int Id { get => id; set => id = value; }
        public string Nome { get => nome; set => nome = value; }
        public string Celular { get => celular; set => celular = value; }
        public string Email { get => email; set => email = value; }
        public string Cep { get => cep; set => cep = value; }
        public string Endereco { get => endereco; set => endereco = value; }
        public string Bairro { get => bairro; set => bairro = value; }
        public int Numero { get => numero; set => numero = value; }
        public string Cidade { get => cidade; set => cidade = value; }
        public string Uf { get => uf; set => uf = value; }
        public string Nascimento { get => nascimento; set => nascimento = value; }
        public int Idade { get => idade; set => idade = value; }

        public string Profissao { get => profissao; set => profissao = value; }

        public string QualEsteico { get => qualEsteico; set => qualEsteico = value; }

        public string QualocnOclogico { get => qualocnOclogico; set => qualocnOclogico = value; }

        public string QualCirurgico { get => qualCirurgico; set => qualCirurgico = value; }

        public string QualAcido { get => qualAcido; set => qualAcido = value; }

        public string ObsIntestino { get => obsIntestino; set => obsIntestino = value; }

        public string QuaisLesoes { get => quaisLesoes; set => quaisLesoes = value; }

        public string QualTratMedico { get => qualTratMedico; set => qualTratMedico = value; }

        public string QuaisLiquidos { get => quaisLiquidos; set => quaisLiquidos = value; }

        public string GrauVarizes { get => grauVarizes; set => grauVarizes = value; }
       
        public string QualAtivFisica { get => qualAtivFisica; set => qualAtivFisica = value; }

        public string QualAnticoncepcional { get => qualAnticoncepcional; set => qualAnticoncepcional = value; }

        public string QualOrtopedico { get => qualOrtopedico; set => qualOrtopedico = value; }

        public string QualAliBalanceada { get => qualAliBalanceada; set => qualAliBalanceada = value; }

        public string QualAlergia { get => qualAlergia; set => qualAlergia = value; }

        public string QualMarcapasso { get => qualMarcapasso; set => qualMarcapasso = value; }

        public string QualProduto { get => qualProduto; set => qualProduto = value; }

        public string QuantosFilos { get => quantosFilos; set => quantosFilos = value; }
        public int Sexo { get => sexo; set => sexo = value; }
        public int EstadoCivil { get => estadoCivil; set => estadoCivil = value; }
        public int Estetico { get => estetico; set => estetico = value; }
        public int Oncologico { get => oncologico; set => oncologico = value; }
        public int Cirurgico { get => cirurgico; set => cirurgico = value; }
        public int Acido { get => acido; set => acido = value; }
        public int Intestino { get => intestino; set => intestino = value; }
        public int Lesoes { get => lesoes; set => lesoes = value; }
        public int TratMedico { get => tratMedico; set => tratMedico = value; }
        public int Liquidos { get => liquidos; set => liquidos = value; }
        public int Varizes { get => varizes; set => varizes = value; }
        public int AtivFisica { get => ativFisica; set => ativFisica = value; }
        public int Anticoncepcional { get => anticoncepcional; set => anticoncepcional = value; }
        public int Ortopedico { get => ortopedico; set => ortopedico = value; }
        public int AliBalanceada { get => aliBalanceada; set => aliBalanceada = value; }
        public int Alergia { get => alergia; set => alergia = value; }
        public int Marcapasso { get => marcapasso; set => marcapasso = value; }
        public int CuidadoDaiario { get => cuidadoDaiario; set => cuidadoDaiario = value; }
        public int Filho { get => filho; set => filho = value; }
        public int Sentada { get => sentada; set => sentada = value; }
        public int Fumante { get => fumante; set => fumante = value; }
        public int Hipotensao { get => hipotensao; set => hipotensao = value; }
        public int Hipertensao { get => hipertensao; set => hipertensao = value; }
        public int Diabetes { get => diabetes; set => diabetes = value; }
        public string Cpf { get => cpf; set => cpf = value; }
        public string Motivo { get => motivo; set => motivo = value; }
    }
}
