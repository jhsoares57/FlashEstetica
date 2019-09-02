using Library.Business;
using Library.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFlashEstetica.View.Web.Plano
{
    public partial class CadastrarPlano : System.Web.UI.Page
    {
        PlanoBLL pService = new PlanoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                Plano_Estetica a = new Plano_Estetica();
                a.DescricaoPlano = txtDescricao.Text;
                pService.Insert(a);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}