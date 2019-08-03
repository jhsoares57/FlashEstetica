﻿using Library.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.DAL
{
    public class AgendamentoDAL
    {

        ConnectionFactory cf;
        public List<Agendamento_Estetica> FindClienteAgen()
        {
            cf = new ConnectionFactory();

            string query = "SELECT ID_CLINTE, NM_CLIENTE FROM CLIENTE";

            cf.Comando = cf.Conexao.CreateCommand();

            cf.Comando.CommandType = CommandType.Text;

            cf.Comando.CommandText = query;

            cf.Conexao.Open();

            List<Agendamento_Estetica> lista = new List<Agendamento_Estetica>();

            SqlDataReader dr = cf.Comando.ExecuteReader();

            while (dr.Read())
            {
                Agendamento_Estetica c = new Agendamento_Estetica();
                c.Id = Convert.ToInt32(dr["ID_CLINTE"]);
                c.NomeCliente = Convert.ToString(dr["NM_CLIENTE"]);
                lista.Add(c);
            }
            cf.Conexao.Close();

            return lista;
        }

        public void Insert_Agendamento(Agendamento_Estetica c)
        {
            cf = new ConnectionFactory();

            StringBuilder query = new StringBuilder();
            query.AppendLine("INSERT INTO TB_AGENDAMENTO");
            query.AppendLine(" (CLIENTE_AGEN,DATA_AGEN,HORA_AGEN) ");
            query.AppendLine("VALUES (@CLIENTE_AGEN,@DATA_AGEN,@HORA_AGEN) ");
            query.AppendLine("SELECT SCOPE_IDENTITY();");

            cf.Comando = cf.Conexao.CreateCommand();

            cf.Comando.Parameters.AddWithValue("@CLIENTE_AGEN", c.NomeCliente);
            cf.Comando.Parameters.AddWithValue("@DATA_AGEN", c.Data);
            cf.Comando.Parameters.AddWithValue("@HORA_AGEN", c.Hora);

            cf.Comando.CommandType = CommandType.Text;
            cf.Comando.CommandText = query.ToString();

            cf.Conexao.Open();

            c.Id = Convert.ToInt32(cf.Comando.ExecuteScalar());
            cf.Conexao.Close();

        }
        public List<Agendamento_Estetica> FindAll()
        {

            //Consulta tebale de agendamento usando select
            StringBuilder query = new StringBuilder();
            query.AppendLine("SELECT ID_AGEN, CLIENTE_AGEN, DATA_AGEN, HORA_AGEN, AGEN_SITUACAO FROM TB_AGENDAMENTO ORDER BY  DATA_AGEN ASC");

            //Abrir conexão com o banco de dados
            cf = new ConnectionFactory();
            cf.Comando = cf.Conexao.CreateCommand();
            cf.Comando.CommandType = CommandType.Text;
            cf.Comando.CommandText = query.ToString();

            //Cria uma lista, que armazenárá os resultados da consulta  
            List<Agendamento_Estetica> listaAgendamento = new List<Agendamento_Estetica>();

            cf.Conexao.Open();//Abre a conexão
            SqlDataReader reader = cf.Comando.ExecuteReader();//Executando o comando

            while (reader.Read())
            {
                Agendamento_Estetica p = new Agendamento_Estetica();//Instanciando o objeto da iteração
                //Preenchimento das propriedades a partir do que retornou no banco.
                p.Id = Convert.ToInt32(reader["ID_AGEN"]);
                p.NomeCliente = reader["CLIENTE_AGEN"].ToString();
                p.Data = Convert.ToDateTime(reader["DATA_AGEN"]);
                p.Hora = Convert.ToDateTime(reader["HORA_AGEN"]);
                p.Status = reader["AGEN_SITUACAO"].ToString();
               
                listaAgendamento.Add(p);//Adicionando o objeto para a lista
            }
            //Fechando a conexão
            cf.Conexao.Close();

            //Retornando a lista já carregada.
            return listaAgendamento;
        }

        public Agendamento_Estetica FindByIdAgendamento(int id)
        {
            string query = "SELECT ID_AGEN,CLIENTE_AGEN,DATA_AGEN,HORA_AGEN FROM TB_AGENDAMENTO WHERE ID_AGEN = @ID";
            //Cria um objeto do tipo Pessoa
            Agendamento_Estetica c = new Agendamento_Estetica();

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
                c.Id = Convert.ToInt32(reader["ID_AGEN"]);
                c.NomeCliente = reader["CLIENTE_AGEN"].ToString();
                c.Data = Convert.ToDateTime(reader["DATA_AGEN"]);
                c.Hora = Convert.ToDateTime(reader["HORA_AGEN"]);

            }
            cf.Conexao.Close();
            return c; //Retorna o objeto do tipo Pessoa
        }

        public int UpdateReagendamento(Agendamento_Estetica a)
        {
            cf = new ConnectionFactory();
            string query = "USP_TB_AGENDAMENTO_UPD_REAG";

            //Variável guardará a quantidade de linhas afetadas
            int linhasAfetadas = 0;

            //PARAMETROS 
            cf.Comando = cf.Conexao.CreateCommand();
            cf.Comando.Parameters.AddWithValue("@DATA", a.Data);
            cf.Comando.Parameters.AddWithValue("@HORA", a.Hora);
            cf.Comando.Parameters.AddWithValue("@ID_AGEN", a.Id);//Necessário ID para saber que registro será atualizado

            cf.Comando.CommandType = CommandType.StoredProcedure;
            cf.Comando.CommandText = query;
            cf.Conexao.Open();
            //ExecuteNonQuery: Retorna o número de linhas afetadas no Banco de dados para a variável.
            linhasAfetadas = cf.Comando.ExecuteNonQuery();
            cf.Conexao.Close();

            //Este método retorna um número inteiro, conforme o que a assinatura pede.
            return linhasAfetadas;
        }

        public int UpdateCancelamento(Agendamento_Estetica a)
        {
            cf = new ConnectionFactory();
            string query = "USP_TB_AGENDAMENTO_UPD_CANC";

            //Variável guardará a quantidade de linhas afetadas
            int linhasAfetadas = 0;

            //PARAMETROS 
            cf.Comando = cf.Conexao.CreateCommand();
            cf.Comando.Parameters.AddWithValue("@DATA", a.Data);
            cf.Comando.Parameters.AddWithValue("@HORA", a.Hora);
            cf.Comando.Parameters.AddWithValue("@ID_AGEN", a.Id);//Necessário ID para saber que registro será atualizado

            cf.Comando.CommandType = CommandType.StoredProcedure;
            cf.Comando.CommandText = query;
            cf.Conexao.Open();
            //ExecuteNonQuery: Retorna o número de linhas afetadas no Banco de dados para a variável.
            linhasAfetadas = cf.Comando.ExecuteNonQuery();
            cf.Conexao.Close();

            //Este método retorna um número inteiro, conforme o que a assinatura pede.
            return linhasAfetadas;
        }

        public int UpdateFinalizado(Agendamento_Estetica a)
        {
            cf = new ConnectionFactory();
            string query = "USP_TB_AGENDAMENTO_UPD_FIN";

            //Variável guardará a quantidade de linhas afetadas
            int linhasAfetadas = 0;

            //PARAMETROS 
            cf.Comando = cf.Conexao.CreateCommand();
            cf.Comando.Parameters.AddWithValue("@ID_AGEN", a.Id);//Necessário ID para saber que registro será atualizado

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
