using System;
using Library.Model;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Library.Business;

namespace WebFlashEstetica.View.Web.Agendamento
{
    public partial class CadastrarAgendamento : System.Web.UI.Page
    {

        ClienteBLL cService = new ClienteBLL();
        AgendamentoBLL aService = new AgendamentoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            carregarCliente();
            btnSalvarBanco.Visible = false;
            if (!Page.IsPostBack)
            {
                EditarAgendamento();
            }
            if(string.IsNullOrEmpty(txtId.Text))
            {
                BloquearButoes();
                DesbloquearCampos();
                btnAdicionar.Visible = true;
            }
        }

        private void EditarAgendamento()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["AgendamentoId"]))
            {
                int ClienteID = Convert.ToInt32(Request.QueryString["AgendamentoId"].ToString());
                Agendamento_Estetica a = aService.FindByIdAgendamento(ClienteID);
                txtId.Text = a.Id.ToString();
                ddlCliente.Text = a.NomeCliente.ToString();
                txtData.Text = a.Data.ToString();
                txtHora.Text = a.Hora.ToString();

            }
            //Metodo para desbloquear os botões de Cancelar e Reagendar
            DesbloquearButoes();
            BloquearCampos();
        }

        private void BloquearButoes()
        {
            btnReagendar.Visible = false;
            btnCancelar.Visible = false;
        }
        private void DesbloquearButoes()
        {
            btnReagendar.Visible = true;
            btnCancelar.Visible = true;
        }

        private void BloquearCampos()
        {
            ddlCliente.Enabled = false;
            txtData.Enabled = false;
            txtHora.Enabled = false;
            Button1.Visible = false;
            btnAdicionar.Visible = false;
        }

        private void DesbloquearCampos()
        {
            ddlCliente.Enabled = true;
            txtData.Enabled = true;
            txtHora.Enabled = true;
            Button1.Visible = true;
            btnAdicionar.Visible = true;
        }

        private void DesbloquearCamposReag()
        {
            txtData.Enabled = true;
            txtHora.Enabled = true;
            Button1.Enabled = true;
            btnAdicionar.Visible = true;
            Button1.Visible = true;
        }
        protected void btnAdicionar_Click(object sender, EventArgs e)
        {
            try
            {
                List<Agendamento_Estetica> listCliente = new List<Agendamento_Estetica>();

                foreach (GridViewRow linha in gvAgendamento.Rows)
                {

                    Agendamento_Estetica aLinha = new Agendamento_Estetica();
                    aLinha.Id = Convert.ToInt32(linha.Cells[0].Text);
                    aLinha.NomeCliente = linha.Cells[1].Text;
                    aLinha.Data = Convert.ToDateTime(linha.Cells[2].Text);
                    aLinha.Hora = Convert.ToDateTime(linha.Cells[3].Text);


                    listCliente.Add(aLinha);

                }



                Agendamento_Estetica c = new Agendamento_Estetica();
                c.NomeCliente = ddlCliente.SelectedValue;
                c.NomeCliente = ddlCliente.SelectedItem.Text;
                c.Data = Convert.ToDateTime(txtData.Text);
                c.Hora = Convert.ToDateTime(txtHora.Text);

                listCliente.Add(c);

                gvAgendamento.DataSource = listCliente;
                gvAgendamento.DataBind();

                btnSalvarBanco.Visible = true;
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }

        public void carregarCliente()
        {
            List<Agendamento_Estetica> listaTipoDevolucao = aService.FindClienteAgen();
            ddlCliente.DataSource = listaTipoDevolucao;
            ddlCliente.DataTextField = "NomeCliente";
            ddlCliente.DataValueField = "Id";
            ddlCliente.DataBind();
        }

        public void SalvarBAnco()
        {
            List<Agendamento_Estetica> listCliente1 = new List<Agendamento_Estetica>();
            bool salvou = false;
            foreach (GridViewRow linha in gvAgendamento.Rows)
            {
                Agendamento_Estetica c = new Agendamento_Estetica();
                c.NomeCliente = linha.Cells[1].Text;
                c.Data = Convert.ToDateTime(linha.Cells[2].Text);
                c.Hora = Convert.ToDateTime(linha.Cells[3].Text);

                listCliente1.Add(c);
            }
            foreach (Agendamento_Estetica c in listCliente1)
            {
                salvou = aService.Insert(c);
            }
            if (salvou)
            {
                //carregarClientes();
               

            }
        }

        private void AtualizarReagendamento()
        {
            Agendamento_Estetica p = new Agendamento_Estetica();
            p.Data = Convert.ToDateTime(txtData.Text);
            p.Hora = Convert.ToDateTime(txtHora.Text);
            p.Id = Convert.ToInt32(txtId.Text);

            aService.UpdateReag(p);

        }

        private void AtualizarCancelamento()
        {
            Agendamento_Estetica p = new Agendamento_Estetica();
            p.Data = Convert.ToDateTime(txtData.Text);
            p.Hora = Convert.ToDateTime(txtHora.Text);
            p.Id = Convert.ToInt32(txtId.Text);

            aService.UpdateCancelamento(p);

        }
        protected void BtnSalvarBanco_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtId.Text))
                {
                    SalvarBAnco();
                    ClientScript.RegisterStartupScript(this.GetType(), "Mensagem", "<script>mensagem();</script>");
                }

                else
                {
                    AtualizarReagendamento();
                    SalvarBAnco();
                    ClientScript.RegisterStartupScript(this.GetType(), "Mensagem", "<script>mensagemUPDReag();</script>");
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }



        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            AtualizarCancelamento();
            ClientScript.RegisterStartupScript(this.GetType(), "Mensagem", "<script>mensagemUPDCAn();</script>");
            BloquerBotoesReagendarCancelar();
            lblAlerta.Visible = true;
        }

        protected void btnReagendar_Click(object sender, EventArgs e)
        {
            DesbloquearCamposReag();
            BloquerBotoesReagendarCancelar();
        }

        private void BloquerBotoesReagendarCancelar()
        {
            btnReagendar.Visible = false;
            btnCancelar.Visible = false;
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {

        }
    }
}