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
        protected void Page_Load(object sender, EventArgs e)
        {
            RecuperarDadosCessao();
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {

        }
        
        private void RecuperarDadosCessao()
        {
            txtAgemdamento.Text = Session["IdAgendamento"].ToString();
            txtCodCliente.Text = Session["IdCliente"].ToString();
            txtCliente.Text = Session["Cliente"].ToString();
        }
    }
}