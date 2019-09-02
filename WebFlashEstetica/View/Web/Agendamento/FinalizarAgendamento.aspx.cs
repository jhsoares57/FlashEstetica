using Library.Business;
using Library.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFlashEstetica.View.Web.Agendamento
{
    public partial class FinalizarAgendamento : System.Web.UI.Page
    {

        AgendamentoBLL aService = new AgendamentoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            RecuperarDadosCessao();
        }

        //protected void btnVoltar_Click(object sender, EventArgs e)
        //{

        //}

        private void RecuperarDadosCessao()
        {
            txtAgemdamento.Text = Session["IdAgendamento"].ToString();
            txtCodCliente.Text = Session["IdCliente"].ToString();
            txtCliente.Text = Session["Cliente"].ToString();
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            try
            {

                AtualizarFinalizadoComMedida();
                ClientScript.RegisterStartupScript(this.GetType(), "Mensagem", "<script>mensagemUPDFin();</script>");
                btnFinalizar.Visible = false;
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void AtualizarFinalizadoComMedida()
        {
            try
            {


                Agendamento_Estetica p = new Agendamento_Estetica();
                p.IdAgendmento = Convert.ToInt32(txtAgemdamento.Text);
                if (aService.UpdateFina(p))
                {
                    InserirMedidas();
                }
            }
            catch (Exception)
            {

                throw;
            }


        }

        private void InserirMedidas()
        {
            try
            {

                Agendamento_Medidas_Estetica a = new Agendamento_Medidas_Estetica();
                a.IdAgendamento = Convert.ToInt32(txtAgemdamento.Text);
                a.Cintura = txtCitura.Text;
                a.Culote = txtCulote.Text;
                a.CoxaDir = txtCoxaDir.Text;
                a.CoxaEsq = txtCoxaEsq.Text;
                a.PantDir = txtPanturrilhaDir.Text;
                a.PantEsq = txtPanturrilhaEsq.Text;
                aService.InsertMedidas(a);

            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
    }
}