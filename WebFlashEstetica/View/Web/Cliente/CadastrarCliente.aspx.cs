using Library.Business;
using Library.Model;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFlashEstetica.View.Web.Cliente
{
    public partial class CadastrarCliente : System.Web.UI.Page
    {
        ClienteBLL cService = new ClienteBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (txtID.Text == null)
            {
                btnImprimirFicha.Visible = false;
            }

            Cliente_Estetica usuario = new Cliente_Estetica();

            //codigo = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (!IsPostBack)
            {
                //txtID.Text = Session["id"].ToString();
                //if (!string.IsNullOrEmpty(Request.QueryString["PessoaId"]))
                //{
                //    int ClienteID = Convert.ToInt32(Request.QueryString["PessoaId"].ToString());
                //    Cliente_Estetica c = cService.FindByIdPessoa(ClienteID);
                //    txtID.Text = c.Id.ToString();
                //    txtNome.Text = c.Nome.ToString();
                //    txtCPF.Text = c.Cpf.ToString();
                //    txtCelular.Text = c.Celular.ToString();
                //    txtEmail.Text = c.Email.ToString();
                //    txtCep.Text = c.Cep.ToString();
                //    txtRua.Text = c.Endereco.ToString();
                //    txtBairro.Text = c.Bairro.ToString();
                //    txtNumero.Text = c.Numero.ToString();
                //    txtCiade.Text = c.Cidade.ToString();
                //    txtEstado.Text = c.Uf.ToString();
                //    txtNascimento.Text = c.Nascimento.ToString();
                //    txtIdade.Text = c.Idade.ToString();
                //    ddlSexo.Text = c.Sexo.ToString();
                //    ddlEstadoCivil.Text = c.EstadoCivil.ToString();
                //    txtProf.Text = c.Profissao.ToString();
                //    txtQueixa.Text = c.Motivo.ToString();
                //    ddlEstetico.Text = c.Estetico.ToString();
                //    txtEstetico.Text = c.QualEsteico.ToString();
                //    ddlOncologico.Text = c.Oncologico.ToString();
                //    txtOncologicos.Text = c.QualocnOclogico.ToString();
                //    ddlCirurgico.Text = c.Cirurgico.ToString();
                //    txtCirurgia.Text = c.QualCirurgico.ToString();
                //    ddlAcido.Text = c.Acido.ToString();
                //    txtAcido.Text = c.QualAcido.ToString();
                //    ddlIntestino.Text = c.Intestino.ToString();
                //    txtIntestino.Text = c.ObsIntestino.ToString();
                //    ddlLesoes.Text = c.Lesoes.ToString();
                //    txtLesao.Text = c.QuaisLesoes.ToString();
                //    ddlTratamento.Text = c.TratMedico.ToString();
                //    txtMedico.Text = c.QualTratMedico.ToString();
                //    ddlLiquido.Text = c.Liquidos.ToString();
                //    txtLiquido.Text = c.QuaisLiquidos.ToString();
                //    ddlVarizes.Text = c.Varizes.ToString();
                //    txtVarizes.Text = c.GrauVarizes.ToString();
                //    ddlAtivFisica.Text = c.AtivFisica.ToString();
                //    txtAtividade.Text = c.QualAtivFisica.ToString();
                //    ddlAnticoncepcional.Text = c.Anticoncepcional.ToString();
                //    txtanticoncpcional.Text = c.QualAnticoncepcional.ToString();
                //    ddlOrtopedico.Text = c.Ortopedico.ToString();
                //    txtOrtopedico.Text = c.QualOrtopedico.ToString();
                //    ddlAliementacao.Text = c.AliBalanceada.ToString();
                //    txtAlimentacao.Text = c.QualAliBalanceada.ToString();
                //    ddlAlergia.Text = c.Alergia.ToString();
                //    txtAlergia.Text = c.QualAlergia.ToString();
                //    ddlMarcapasso.Text = c.Marcapasso.ToString();
                //    txtMarcaPasso.Text = c.QualMarcapasso.ToString();
                //    ddlFilhos.Text = c.Filho.ToString();
                //    txtFilhos.Text = c.QuantosFilos.ToString();
                //    ddlSentada.Text = c.Sentada.ToString();
                //    ddlFumante.Text = c.Fumante.ToString();
                //    ddlHipotensao.Text = c.Hipotensao.ToString();
                //    ddlHipertensao.Text = c.Hipertensao.ToString();
                //    ddlDiabetes.Text = c.Diabetes.ToString();

                //}
            }


        }

        protected void btnBuscarCep_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    DataSet ds = new DataSet();
            //    string xml = "http://cep.republicavirtual.com.br/web_cep.php?cep=@cep&formato=xml".Replace("cep", txtCep.Text);
            //    ds.ReadXml(xml);

            //    txtRua.Text = ds.Tables[0].Rows[0]["logradouro"].ToString();
            //    txtBairro.Text = ds.Tables[0].Rows[0]["bairro"].ToString();
            //    txtCiade.Text = ds.Tables[0].Rows[0]["cidade"].ToString();
            //    txtEstado.Text = ds.Tables[0].Rows[0]["uf"].ToString();
            //}
            //catch(Exception ex)
            //{
            //    Response.Write("Cep invalido");
            //}
            LocalizarCep();
        }
        private void LocalizarCep()
        {

            //if (!string.IsNullOrWhiteSpace(txtCep.Text))
            //{
            //    Address endereco = SearchZip.GetAddress(txtCep.Text);
            //    if (endereco.Zip != null)
            //    {
            //        txtRua.Text = endereco.Street;
            //        txtBairro.Text = endereco.District;
            //        txtCiade.Text = endereco.City;
            //        txtEstado.Text = endereco.State;

            //    }
            //    else
            //    {
            //        //MessageBox.Show("Cep não localizado...");
            //    }
            //}
        }



        protected void btnSalvar_Click(object sender, EventArgs e)
        {

            // string erros = string.Empty;
            try
            {

                Cliente_Estetica c = new Cliente_Estetica();
                c.Nome = txtNome.Text;
                c.Cpf = txtCPF.Text;
                c.Celular = txtCelular.Text;
                c.Email = txtEmail.Text;
                c.Cep = txtCep.Text;
                c.Endereco = txtRua.Text;
                c.Bairro = txtBairro.Text;
                c.Numero = Convert.ToInt32(txtNumero.Text);
                c.Cidade = txtCiade.Text;
                c.Uf = txtEstado.Text;
                c.Nascimento = txtNascimento.Text;
                c.Idade = Convert.ToInt32(txtIdade.Text);
                c.Sexo = Convert.ToInt32(ddlSexo.SelectedValue);
                c.EstadoCivil = Convert.ToInt32(ddlEstadoCivil.SelectedValue);
                c.Profissao = txtProf.Text;
                c.Motivo = txtQueixa.Text;
                c.Estetico = Convert.ToInt32(ddlEstetico.SelectedValue);
                c.QualEsteico = txtEstetico.Text;
                c.Oncologico = Convert.ToInt32(ddlOncologico.SelectedValue);
                c.QualocnOclogico = txtOncologicos.Text;
                c.Cirurgico = Convert.ToInt32(ddlCirurgico.SelectedValue);
                c.QualCirurgico = txtCirurgia.Text;
                c.Acido = Convert.ToInt32(ddlAcido.SelectedValue);
                c.QualAcido = txtAcido.Text;
                c.Intestino = Convert.ToInt32(ddlIntestino.SelectedValue);
                c.ObsIntestino = txtIntestino.Text;
                c.Lesoes = Convert.ToInt32(ddlLesoes.SelectedValue);
                c.QuaisLesoes = txtLesao.Text;
                c.TratMedico = Convert.ToInt32(ddlTratamento.SelectedValue);
                c.QualTratMedico = txtMedico.Text;
                c.Liquidos = Convert.ToInt32(ddlLiquido.SelectedValue);
                c.QuaisLiquidos = txtLiquido.Text;
                c.Varizes = Convert.ToInt32(ddlVarizes.SelectedValue);
                c.GrauVarizes = txtVarizes.Text;
                c.AtivFisica = Convert.ToInt32(ddlAtivFisica.SelectedValue);
                c.QualAtivFisica = txtAtividade.Text;
                c.Anticoncepcional = Convert.ToInt32(ddlAnticoncepcional.SelectedValue);
                c.QualAnticoncepcional = txtanticoncpcional.Text;
                c.Ortopedico = Convert.ToInt32(ddlOrtopedico.SelectedValue);
                c.QualOrtopedico = txtOrtopedico.Text;
                c.AliBalanceada = Convert.ToInt32(ddlAliementacao.SelectedValue);
                c.QualAliBalanceada = txtAlimentacao.Text;
                c.Alergia = Convert.ToInt32(ddlAlergia.SelectedValue);
                c.QualAlergia = txtAlergia.Text;
                c.Marcapasso = Convert.ToInt32(ddlMarcapasso.SelectedValue);
                c.QualMarcapasso = txtMarcaPasso.Text;
                c.CuidadoDaiario = Convert.ToInt32(ddlCuidados.SelectedValue);
                c.QualProduto = txtCuidado.Text;
                c.Filho = Convert.ToInt32(ddlFilhos.SelectedValue);
                c.QuantosFilos = txtFilhos.Text;
                c.Sentada = Convert.ToInt32(ddlSentada.SelectedValue);
                c.Fumante = Convert.ToInt32(ddlFumante.SelectedValue);
                c.Hipotensao = Convert.ToInt32(ddlHipotensao.SelectedValue);
                c.Hipertensao = Convert.ToInt32(ddlHipertensao.SelectedValue);
                c.Diabetes = Convert.ToInt32(ddlDiabetes.SelectedValue);


                if (cService.Insert(c))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Mensagem", "<script>mensagem();</script>");
                    //Response.Write("Partida salva com sucesso.");


                }

            }

            catch (Exception)
            {
                //string scriptMensagem = string.Format("<script>ChamarExibirMensagemErro('{0}');</script>", ex.Message);
                //ClientScript.RegisterStartupScript(this.GetType(), "ChaveMensagem", scriptMensagem);
                throw;
            }
        }

        protected void btnNovo_Click(object sender, EventArgs e)
        {
            Response.Redirect("LancarSecao.aspx?id=" + txtID.Text + "&nome=" + txtNome.Text);
        }

        protected void btnImprimirFicha_Click(object sender, EventArgs e)
        {
            try
            {
                Session["Nome"] = this.txtNome.Text;
                Session["CPF"] = this.txtCPF.Text;
                Session["Celular"] = this.txtCelular.Text;
                Session["Email"] = this.txtEmail.Text;
                Session["Cep"] = this.txtCep.Text;
                Session["Endereco"] = this.txtRua.Text;
                Session["Bairro"] = this.txtBairro.Text;
                Session["Numero"] = this.txtNumero.Text;
                Session["Cidade"] = this.txtCiade.Text;
                Session["Estado"] = this.txtEstado.Text;
                Session["Nascimento"] = this.txtNascimento.Text;
                Session["Idade"] = this.txtIdade.Text;
                Session["Sexo"] = this.ddlSexo.Text;
                Session["EstadoCivil"] = this.ddlEstadoCivil.Text;
                Session["Profissao"] = this.txtProf.Text;
                Session["Queixa"] = this.txtQueixa.Text;
                Session["Estetico"] = this.ddlEstetico.Text;
                Session["QualEsteico"] = this.txtEstetico.Text;
                Session["Oncologico"] = this.ddlOncologico.Text;
                Session["QualocnOclogico"] = this.txtOncologicos.Text;
                Session["Cirurgico"] = this.ddlCirurgico.Text;
                Session["QualCirurgico"] = this.txtCirurgia.Text;
                Session["Acido"] = this.ddlAcido.Text;
                Session["QualAcido"] = this.txtAcido.Text;
                Session["Intestino"] = this.ddlIntestino.Text;
                Session["ObsIntestino"] = this.txtIntestino.Text;
                Session["Lesoes"] = this.ddlLesoes.Text;
                Session["QuaisLesoes"] = this.txtLesao.Text;
                Session["TratMedico"] = this.ddlTratamento.Text;
                Session["QualTratMedico"] = this.txtMedico.Text;
                Session["Liquidos"] = this.ddlLiquido.Text;
                Session["QuaisLiquidos"] = this.txtLiquido.Text;
                Session["Varizes"] = this.ddlVarizes.Text;
                Session["GrauVarizes"] = this.txtVarizes.Text;
                Session["AtivFisica"] = this.ddlAtivFisica.Text;
                Session["QualAtivFisica"] = this.txtAtividade.Text;
                Session["Anticoncepcional"] = this.ddlAnticoncepcional.Text;
                Session["QualAnticoncepcional"] = this.txtanticoncpcional.Text;
                Session["Ortopedico"] = this.ddlOrtopedico.Text;
                Session["QualOrtopedico"] = this.txtOrtopedico.Text;
                Session["AliBalanceada"] = this.ddlAliementacao.Text;
                Session["QualAliBalanceada"] = this.txtAlimentacao.Text;
                Session["Alergia"] = this.ddlAlergia.Text;
                Session["QualAlergia"] = this.txtAlergia.Text;
                Session["Marcapasso"] = this.ddlMarcapasso.Text;
                Session["QualMarcapasso"] = this.txtMarcaPasso.Text;
                Session["CuidadoDaiario"] = this.ddlCuidados.Text;
                Session["QualProduto"] = this.txtCuidado.Text;
                Session["Filho"] = this.ddlFilhos.Text;
                Session["QuantosFilos"] = this.txtFilhos.Text;
                Session["Sentada"] = this.ddlSentada.Text;
                Session["Fumante"] = this.ddlFumante.Text;
                Session["Hipotensao"] = this.ddlHipotensao.Text;
                Session["Hipertensao"] = this.ddlHipertensao.Text;
                Session["Diabetes"] = this.ddlDiabetes.Text;

                //Response.Redirect("FichaCadastroCliente.aspx");
                Response.Redirect("FichaCliente.aspx");
                // Response.Redirect("FichaCadastroCliente.aspx?id=" + txtID.Text);
            }
            catch (Exception)
            {

                throw;
            }


        }
    }
}