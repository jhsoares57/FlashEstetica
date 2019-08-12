using Library.Business;
using Library.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFlashEstetica.View.Web.Cliente
{
    public partial class ListarCliente : System.Web.UI.Page
    {

        ClienteBLL cService = new ClienteBLL();
        Usuario usuarioLogado = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioLogado = (Usuario)Session["Usuario"];
            if (usuarioLogado == null)
            {
                Response.Redirect("../../../AcessoWeb.aspx");
            }
            CerregarCliente();
        }

        protected void btnCarregarPessoas_Click(object sender, EventArgs e)
        {
            try
            {
                CerregarCliente();
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }

        public void CerregarCliente()
        {
            List<Cliente_Estetica> listaCliente = cService.FindAll();
            gvCadastroCliente.DataSource = listaCliente;
            gvCadastroCliente.DataBind();
        }


        protected void gvCadastroPessoa_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Panel pnlAlterar = (Panel)e.Row.FindControl("pnlAlterar");
                Panel pnlAdicionarPacote = (Panel)e.Row.FindControl("pnlAdicionarPacote");
                Panel pnlAdicionarSecao = (Panel)e.Row.FindControl("pnlAdicionarSecao");


            }
        }

        protected void gvCadastroCliente_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}