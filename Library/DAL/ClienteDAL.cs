using Library.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.DAL
{
    public class ClienteDAL
    {
        ConnectionFactory cf;

        public void Insert(Cliente_Estetica c)
        {
            string query = "FL_CLIENTE_INS";

            //Connection Factory: Classe que gerencia o local da conexão, tendo o método responsável por obter a conexão
            cf = new ConnectionFactory();

            //CreateCommand: Inicializa o objeto SqlCommand associando o Comando com a conexão do Banco onde será executado
            cf.Comando = cf.Conexao.CreateCommand();

            //Abaixo os parametros que no momento da execução serão substituídos pelos valor das propriedades
            //cf.Comando.Parameters.AddWithValue("@ID_CLINTE", c.Id);
            cf.Comando.Parameters.AddWithValue("@NM_CLIENTE", c.Nome);
            cf.Comando.Parameters.AddWithValue("@CPF", c.Cpf);
            cf.Comando.Parameters.AddWithValue("@CELULAR", c.Celular);
            cf.Comando.Parameters.AddWithValue("@EMAIL", c.Email);
            cf.Comando.Parameters.AddWithValue("@CEP", c.Cep);
            cf.Comando.Parameters.AddWithValue("@ENDERECO", c.Endereco);
            cf.Comando.Parameters.AddWithValue("@BAIRRO", c.Bairro);
            cf.Comando.Parameters.AddWithValue("@NUMERO", c.Numero);
            cf.Comando.Parameters.AddWithValue("@CIDADE", c.Cidade);
            cf.Comando.Parameters.AddWithValue("@UF", c.Uf);
            cf.Comando.Parameters.AddWithValue("@NASCIMENTO", c.Nascimento);
            cf.Comando.Parameters.AddWithValue("@IDADE", c.Idade);
            cf.Comando.Parameters.AddWithValue("@SEXO", c.Sexo);
            cf.Comando.Parameters.AddWithValue("@ESTCIVIL", c.EstadoCivil);
            cf.Comando.Parameters.AddWithValue("@PROFISSAO", c.Profissao);
            cf.Comando.Parameters.AddWithValue("@MOTIVO", c.Motivo);
            //Inicio das Perguntas
            cf.Comando.Parameters.AddWithValue("@ESTETICO", c.Estetico);
            cf.Comando.Parameters.AddWithValue("@QUALESTETICO", c.QualEsteico);
            cf.Comando.Parameters.AddWithValue("@ONCOLOGICO", c.Oncologico);
            cf.Comando.Parameters.AddWithValue("@QUALONCOLOGICO", c.QualocnOclogico);
            cf.Comando.Parameters.AddWithValue("@CIRURGICO", c.Cirurgico);
            cf.Comando.Parameters.AddWithValue("@QUALCIRURGICO", c.QualCirurgico);
            cf.Comando.Parameters.AddWithValue("@ACIDO", c.Acido);
            cf.Comando.Parameters.AddWithValue("@QUALACIDO", c.QualAcido);
            cf.Comando.Parameters.AddWithValue("@INTESTINO", c.Intestino);
            cf.Comando.Parameters.AddWithValue("@OBSINTESTINO", c.ObsIntestino);
            cf.Comando.Parameters.AddWithValue("@LESOES", c.Lesoes);
            cf.Comando.Parameters.AddWithValue("@QUAISLESOES", c.QuaisLesoes);
            cf.Comando.Parameters.AddWithValue("@TRATMEDICO", c.TratMedico);
            cf.Comando.Parameters.AddWithValue("@QUALTRATMEDICO", c.QualTratMedico);
            cf.Comando.Parameters.AddWithValue("@LIQUIDOS", c.Liquidos);
            cf.Comando.Parameters.AddWithValue("@QUAISLIQUIDOS", c.QuaisLiquidos);
            cf.Comando.Parameters.AddWithValue("@VARIZES", c.Varizes);
            cf.Comando.Parameters.AddWithValue("@GRAUVARIZES", c.GrauVarizes);
            cf.Comando.Parameters.AddWithValue("@ATIVFISICA", c.AtivFisica);
            cf.Comando.Parameters.AddWithValue("@QUALATIVFISICA", c.QualAtivFisica);
            cf.Comando.Parameters.AddWithValue("@ANTICONCEPCIONAL", c.Anticoncepcional);
            cf.Comando.Parameters.AddWithValue("@QUALANTICONCEPCIONAL", c.QualAnticoncepcional);
            cf.Comando.Parameters.AddWithValue("@ORTOPEDICO", c.Ortopedico);
            cf.Comando.Parameters.AddWithValue("@QUALORTOPEDICO", c.QualOrtopedico);
            cf.Comando.Parameters.AddWithValue("@ALIBALANCEADA", c.AliBalanceada);
            cf.Comando.Parameters.AddWithValue("@QUALALIBALANCEADA", c.QualAliBalanceada);
            cf.Comando.Parameters.AddWithValue("@ALERGIA", c.Alergia);
            cf.Comando.Parameters.AddWithValue("@QUALALERGIA", c.QualAlergia);
            cf.Comando.Parameters.AddWithValue("@MARCAPASSO", c.Marcapasso);
            cf.Comando.Parameters.AddWithValue("@QUALMARCAPASSO", c.QualMarcapasso);
            cf.Comando.Parameters.AddWithValue("@CUIDADODIARIO", c.CuidadoDaiario);
            cf.Comando.Parameters.AddWithValue("@QUALPRODUTO", c.QualProduto);
            cf.Comando.Parameters.AddWithValue("@FILHO", c.Filho);
            cf.Comando.Parameters.AddWithValue("@QUANTOSFILHOS", c.QuantosFilos);
            cf.Comando.Parameters.AddWithValue("@SENTADA", c.Sentada);
            cf.Comando.Parameters.AddWithValue("@FUMANTE", c.Fumante);
            cf.Comando.Parameters.AddWithValue("@HIPOTENSAO", c.Hipotensao);
            cf.Comando.Parameters.AddWithValue("@HIPERTENSAO", c.Hipertensao);
            cf.Comando.Parameters.AddWithValue("@DIABETES", c.Diabetes);

            cf.Comando.Parameters.AddWithValue("@ID_OUT", 0).Direction = ParameterDirection.Output;

            //CommandType indica que o Comando será via procedure no banco de dados
            cf.Comando.CommandType = CommandType.StoredProcedure;

            //CommandText: Propriedade do objeto command que receberá o texto do Comando a ser executado.
            cf.Comando.CommandText = query.ToString();

            //Abre a conexão 
            cf.Conexao.Open();
            c.Id = 0;//Define o ID inicialmente como 0.

            cf.Comando.ExecuteNonQuery();//Execução do Comando no Banco de dados        
            object o = cf.Comando.Parameters["@ID_OUT"].Value;//Recuperando o ID salvo (que deverá ser > 0).
            cf.Conexao.Close();

            if (o != null)
                c.Id = Convert.ToInt32(o);
        }

        public List<Cliente_Estetica> FindAll()
        {
            //Consulta select com inner join
            StringBuilder query = new StringBuilder();
            query.AppendLine("SELECT ID_CLINTE, NM_CLIENTE, CELULAR, EMAIL FROM CLIENTE ");

            cf = new ConnectionFactory();
            cf.Comando = cf.Conexao.CreateCommand();
            cf.Comando.CommandType = CommandType.Text;
            cf.Comando.CommandText = query.ToString();

            //Cria uma lista, que armazenárá os resultados da consulta  
            List<Cliente_Estetica> listaCliente = new List<Cliente_Estetica>();

            cf.Conexao.Open();//Abre a conexão
            SqlDataReader reader = cf.Comando.ExecuteReader();//Executando o comando

            while (reader.Read())
            {
                Cliente_Estetica p = new Cliente_Estetica();//Instanciando o objeto da iteração
                //Preenchimento das propriedades a partir do que retornou no banco.
                p.Id = Convert.ToInt32(reader["ID_CLINTE"]);
                p.Nome = reader["NM_CLIENTE"].ToString();
                p.Celular = reader["CELULAR"].ToString();
                p.Email = reader["EMAIL"].ToString();
                //p.Email = Convert.ToDateTime(reader["DT_NASCIMENTO"]);

                listaCliente.Add(p);//Adicionando o objeto para a lista
            }
            //Fechando a conexão
            cf.Conexao.Close();

            //Retornando a lista já carregada.
            return listaCliente;
        }

        public Cliente_Estetica FindById(int id)
        {
            string query = "SELECT ID_CLINTE,NM_CLIENTE FROM CLIENTE WHERE ID_CLINTE = @ID";
            //Cria um objeto do tipo Pessoa
            Cliente_Estetica c = new Cliente_Estetica();

            cf = new ConnectionFactory();
            cf.Comando = cf.Conexao.CreateCommand();
            cf.Comando.Parameters.AddWithValue("@ID", id);
            cf.Comando.CommandType = CommandType.Text;
            cf.Comando.CommandText = query;

            cf.Conexao.Open();
            //Objeto SqlDataReader: Armazena um buffer dos resultados da consulta
            SqlDataReader reader = cf.Comando.ExecuteReader();

            //Se o buffer conter linhas, entrará no IF parar ler os dados da pessoa
            //e carregar o objeto que será devolvido pelo Método
            if (reader.Read())
            {
                c.Id = Convert.ToInt32(reader["ID_CLINTE"]);
                c.Nome = reader["NM_CLIENTE"].ToString();

            }
            cf.Conexao.Close();
            return c; //Retorna o objeto do tipo Pessoa
        }

        public Cliente_Estetica FindByIdPessoa(int id)
        {
            string query = "SELECT ID_CLINTE, NM_CLIENTE, CPF, CELULAR, EMAIL, CEP, ENDERECO, BAIRRO, NUMERO, CIDADE, UF, NASCIMENTO, IDADE, SEXO, ESTCIVIL, PROFISSAO, MOTIVO, ESTETICO, QUALESTETICO, ONCOLOGICO, QUALONCOLOGICO, CIRURGICO, QUALCIRURGICO, ACIDO, QUALACIDO, INTESTINO, OBSINTESTINO, LESOES, QUAISLESOES, TRATMEDICO, QUALTRATMEDICO, LIQUIDOS, QUAISLIQUIDOS, VARIZES, GRAUVARIZES, ATIVFISICA, QUALATIVFISICA, ANTICONCEPCIONAL, QUALANTICONCEPCIONAL , ORTOPEDICO, QUALORTOPEDICO, ALIBALANCEADA, QUALALIBALANCEADA, ALERGIA, QUALALERGIA, MARCAPASSO, QUALMARCAPASSO, CUIDADODIARIO, QUALPRODUTO, FILHO, QUANTOSFILHOS, SENTADA, FUMANTE, HIPOTENSAO, HIPERTENSAO, DIABETES FROM CLIENTE WHERE ID_CLINTE = @ID_CLINTE";
            //Cria um objeto do tipo Pessoa
            Cliente_Estetica c = new Cliente_Estetica();

            cf = new ConnectionFactory();
            cf.Comando = cf.Conexao.CreateCommand();
            cf.Comando.Parameters.AddWithValue("@ID_CLINTE", id);
            cf.Comando.CommandType = CommandType.Text;
            cf.Comando.CommandText = query;

            cf.Conexao.Open();
            //Objeto SqlDataReader: Armazena um buffer dos resultados da consulta
            SqlDataReader reader = cf.Comando.ExecuteReader();

            //Se o buffer conter linhas, entrará no IF parar ler os dados da pessoa
            //e carregar o objeto que será devolvido pelo Método
            if (reader.Read())
            {
                c.Id = Convert.ToInt32(reader["ID_CLINTE"]);
                c.Nome = reader["NM_CLIENTE"].ToString();
                c.Cpf = reader["CPF"].ToString();
                c.Celular = reader["CELULAR"].ToString();
                c.Email = reader["EMAIL"].ToString();
                c.Cep = reader["CEP"].ToString();
                c.Endereco = reader["ENDERECO"].ToString();
                c.Bairro = reader["BAIRRO"].ToString();
                c.Numero = Convert.ToInt32(reader["NUMERO"]);
                c.Cidade = reader["CIDADE"].ToString();
                c.Uf = reader["UF"].ToString();
                c.Nascimento = reader["NASCIMENTO"].ToString();
                c.Idade = Convert.ToInt32(reader["IDADE"]);
                c.Sexo = Convert.ToInt32(reader["SEXO"]);
                c.EstadoCivil = Convert.ToInt32(reader["ESTCIVIL"]);
                c.Profissao = reader["PROFISSAO"].ToString();
                c.Motivo = reader["MOTIVO"].ToString();
                c.Estetico = Convert.ToInt32(reader["ESTETICO"]);
                c.QualEsteico = reader["QUALESTETICO"].ToString();
                c.Oncologico = Convert.ToInt32(reader["ONCOLOGICO"]);
                c.QualocnOclogico = reader["QUALONCOLOGICO"].ToString();
                c.Cirurgico = Convert.ToInt32(reader["CIRURGICO"]);
                c.QualCirurgico = reader["QUALCIRURGICO"].ToString();
                c.Acido = Convert.ToInt32(reader["ACIDO"]);
                c.QualAcido = reader["QUALACIDO"].ToString();
                c.Intestino = Convert.ToInt32(reader["INTESTINO"]);
                c.ObsIntestino = reader["OBSINTESTINO"].ToString();
                c.Lesoes = Convert.ToInt32(reader["LESOES"]);
                c.QuaisLesoes = reader["QUAISLESOES"].ToString();
                c.TratMedico = Convert.ToInt32(reader["TRATMEDICO"]);
                c.QualTratMedico = reader["QUALTRATMEDICO"].ToString();
                c.Liquidos = Convert.ToInt32(reader["LIQUIDOS"]);
                c.QuaisLiquidos = reader["QUAISLIQUIDOS"].ToString();
                c.Varizes = Convert.ToInt32(reader["VARIZES"]);
                c.GrauVarizes = reader["GRAUVARIZES"].ToString();
                c.AtivFisica = Convert.ToInt32(reader["ATIVFISICA"]);
                c.QualAtivFisica = reader["QUALATIVFISICA"].ToString();
                c.Anticoncepcional = Convert.ToInt32(reader["ANTICONCEPCIONAL"]);
                c.QualAnticoncepcional = reader["QUALANTICONCEPCIONAL"].ToString();
                c.Ortopedico = Convert.ToInt32(reader["ORTOPEDICO"]);
                c.QualOrtopedico = reader["QUALORTOPEDICO"].ToString();
                c.AliBalanceada = Convert.ToInt32(reader["ALIBALANCEADA"]);
                c.QualAliBalanceada = reader["QUALALIBALANCEADA"].ToString();
                c.Alergia = Convert.ToInt32(reader["ALERGIA"]);
                c.QualAlergia = reader["QUALALERGIA"].ToString();
                c.Marcapasso = Convert.ToInt32(reader["MARCAPASSO"]);
                c.QualMarcapasso = reader["QUALMARCAPASSO"].ToString();
                c.CuidadoDaiario = Convert.ToInt32(reader["CUIDADODIARIO"]);
                c.QualProduto = reader["QUALPRODUTO"].ToString();
                c.Filho = Convert.ToInt32(reader["FILHO"]);
                c.QuantosFilos = reader["QUANTOSFILHOS"].ToString();
                c.Sentada = Convert.ToInt32(reader["SENTADA"]);
                c.Fumante = Convert.ToInt32(reader["FUMANTE"]);
                c.Hipotensao = Convert.ToInt32(reader["HIPOTENSAO"]);
                c.Hipertensao = Convert.ToInt32(reader["HIPERTENSAO"]);
                c.Diabetes = Convert.ToInt32(reader["DIABETES"]);
            }
            cf.Conexao.Close();
            return c; //Retorna o objeto do tipo Pessoa
        }


        //FAZER ATUALIZAÇÃO DA PALESTRA
        public int Update(Cliente_Estetica c)
        {
            cf = new ConnectionFactory();
            string query = "FL_CLIENTE_UPD";

            //Variável guardará a quantidade de linhas afetadas
            int linhasAfetadas = 0;

            //PARAMETROS 
            cf.Comando = cf.Conexao.CreateCommand();
            cf.Comando.Parameters.AddWithValue("@NM_CLIENTE",c.Nome);
            cf.Comando.Parameters.AddWithValue("@CPF", c.Cpf);
            cf.Comando.Parameters.AddWithValue("@CELULAR",   c.Celular);
            cf.Comando.Parameters.AddWithValue("@EMAIL", c.Email);
            cf.Comando.Parameters.AddWithValue("@CEP", c.Cep);
            cf.Comando.Parameters.AddWithValue("@ENDERECO", c.Endereco);
            cf.Comando.Parameters.AddWithValue("@BAIRRO", c.Bairro);
            cf.Comando.Parameters.AddWithValue("@NUMERO", c.Numero);
            cf.Comando.Parameters.AddWithValue("@CIDADE	,", c.Cidade);
            cf.Comando.Parameters.AddWithValue("@UF", c.Uf);
            cf.Comando.Parameters.AddWithValue("@NASCIMENTO", c.Nascimento);
            cf.Comando.Parameters.AddWithValue("@IDADE", c.Idade);
            cf.Comando.Parameters.AddWithValue("@SEXO", c.Sexo);
            cf.Comando.Parameters.AddWithValue("@ESTCIVIL", c.EstadoCivil);
            cf.Comando.Parameters.AddWithValue("@PROFISSAO", c.Profissao);
            cf.Comando.Parameters.AddWithValue("@MOTIVO", c.Motivo);
            cf.Comando.Parameters.AddWithValue("@ESTETICO", c.Estetico);
            cf.Comando.Parameters.AddWithValue("@QUALESTETICO", c.QualEsteico);
            cf.Comando.Parameters.AddWithValue("@ONCOLOGICO", c.Oncologico);
            cf.Comando.Parameters.AddWithValue("@QUALONCOLOGICO", c.QualocnOclogico);
            cf.Comando.Parameters.AddWithValue("@CIRURGICO", c.Cirurgico);
            cf.Comando.Parameters.AddWithValue("@QUALCIRURGICO", c.QualCirurgico);
            cf.Comando.Parameters.AddWithValue("@ACIDO", c.Acido);
            cf.Comando.Parameters.AddWithValue("@QUALACIDO", c.QualAcido);
            cf.Comando.Parameters.AddWithValue("@INTESTINO", c.Intestino);
            cf.Comando.Parameters.AddWithValue("@OBSINTESTINO", c.ObsIntestino);
            cf.Comando.Parameters.AddWithValue("@LESOES", c.Lesoes);
            cf.Comando.Parameters.AddWithValue("@QUAISLESOES", c.QuaisLesoes);
            cf.Comando.Parameters.AddWithValue("@TRATMEDICO", c.TratMedico);
            cf.Comando.Parameters.AddWithValue("@QUALTRATMEDICO", c.QualTratMedico);
            cf.Comando.Parameters.AddWithValue("@LIQUIDOS", c.Liquidos);
            cf.Comando.Parameters.AddWithValue("@QUAISLIQUIDOS", c.QuaisLiquidos);
            cf.Comando.Parameters.AddWithValue("@VARIZES", c.Varizes);
            cf.Comando.Parameters.AddWithValue("@GRAUVARIZES", c.GrauVarizes);
            cf.Comando.Parameters.AddWithValue("@ATIVFISICA	", c.AtivFisica);
            cf.Comando.Parameters.AddWithValue("@QUALATIVFISICA", c.QualAtivFisica);
            cf.Comando.Parameters.AddWithValue("@ANTICONCEPCIONAL", c.Anticoncepcional);
            cf.Comando.Parameters.AddWithValue("@QUALANTICONCEPCIONAL", c.QualAnticoncepcional);
            cf.Comando.Parameters.AddWithValue("@ORTOPEDICO", c.Ortopedico);
            cf.Comando.Parameters.AddWithValue("@QUALORTOPEDICO", c.QualOrtopedico);
            cf.Comando.Parameters.AddWithValue("@ALIBALANCEADA", c.AliBalanceada);
            cf.Comando.Parameters.AddWithValue("@QUALALIBALANCEADA", c.QualAliBalanceada);
            cf.Comando.Parameters.AddWithValue("@ALERGIA", c.Alergia);
            cf.Comando.Parameters.AddWithValue("@QUALALERGIA", c.QualAlergia);
            cf.Comando.Parameters.AddWithValue("@MARCAPASSO", c.Marcapasso);
            cf.Comando.Parameters.AddWithValue("@QUALMARCAPASSO", c.QualMarcapasso);
            cf.Comando.Parameters.AddWithValue("@CUIDADODIARIO", c.CuidadoDaiario);
            cf.Comando.Parameters.AddWithValue("@QUALPRODUTO", c.QualProduto);
            cf.Comando.Parameters.AddWithValue("@FILHO", c.Filho);
            cf.Comando.Parameters.AddWithValue("@QUANTOSFILHOS", c.QuantosFilos);
            cf.Comando.Parameters.AddWithValue("@SENTADA", c.Sentada);
            cf.Comando.Parameters.AddWithValue("@FUMANTE", c.Fumante);
            cf.Comando.Parameters.AddWithValue("@HIPOTENSAO", c.Hipotensao);
            cf.Comando.Parameters.AddWithValue("@HIPERTENSAO", c.Hipertensao);
            cf.Comando.Parameters.AddWithValue("@DIABETES", c.Diabetes);
            cf.Comando.Parameters.AddWithValue("@ID_CLIENTE",c.Id);//Necessário ID para saber que registro será atualizado

            cf.Comando.CommandType = CommandType.StoredProcedure;
            cf.Comando.CommandText = query;
            cf.Conexao.Open();
            //ExecuteNonQuery: Retorna o número de linhas afetadas no Banco de dados para a variável.
            linhasAfetadas = cf.Comando.ExecuteNonQuery();
            cf.Conexao.Close();

            //Este método retorna um número inteiro, conforme o que a assinatura pede.
            return linhasAfetadas;
        }

    }
}
