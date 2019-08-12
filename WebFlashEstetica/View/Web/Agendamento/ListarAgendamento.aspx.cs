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
    public partial class ListarAgendamento : System.Web.UI.Page
    {
        AgendamentoBLL bService = new AgendamentoBLL();
        Usuario usuarioLogado = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuarioLogado = (Usuario)Session["Usuario"];
            if (usuarioLogado ==null)
            {
                Response.Redirect ("../../../AcessoWeb.aspx");
            }
            CerregarAgen();
        }

        protected void btnCarregarPessoas_Click(object sender, EventArgs e)
        {

        }
        protected void btnExcluir_Click(object sender, EventArgs e)
        {

        }

        public void CerregarAgen()
        {
            List<Agendamento_Estetica> listaAgen = bService.FindAll();
            gvListarAgendamento.DataSource = listaAgen;
            gvListarAgendamento.DataBind();
        }

        protected void gvListarAgendamento_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Panel pnlAlterar = (Panel)e.Row.FindControl("pnlAlterar");
                Panel pnlAgendar = (Panel)e.Row.FindControl("pnlAgendar");
                //Panel pnlAdicionarSecao = (Panel)e.Row.FindControl("pnlAdicionarSecao");
                if (e.Row.Cells[4].Text == "F")
                {
                    pnlAgendar.Visible = false;
                }
                if (e.Row.Cells[4].Text == "R")
                {
                    pnlAgendar.Visible = false;
                }
                if (e.Row.Cells[4].Text == "C")
                {
                    pnlAgendar.Visible = false;
                }

            }

            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    if (e.Row.RowState == DataControlRowState.Alternate)
            //    {
            //        e.Row.Style.Add("background-color", "#3AC0F2");
            //    }
            //}

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Center;
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Center;
            }

            //colorindo uma linha com base no status do agendamento
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                switch (e.Row.Cells[4].Text)
                {
                    //Se o a genda
                    case "F":
                        e.Row.BackColor = System.Drawing.Color.Lime;
                        break;
                    case "R":
                        e.Row.BackColor = System.Drawing.Color.DarkGray;
                        break;
                    case "C":
                        e.Row.BackColor = System.Drawing.Color.Tomato;
                        break;
                }
            }

        }

        protected void gvListarAgendamento_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


    }
}