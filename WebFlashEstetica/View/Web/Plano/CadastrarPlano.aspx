<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadastrarPlano.aspx.cs" Inherits="WebFlashEstetica.View.Web.Plano.CadastrarPlano" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../../Content/bootstrap.css" rel="stylesheet" />
    <script src="../../../Scripts/bootstrap.min.js"></script>
    <script src="../../../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../../../Scripts/jquery.maskedinput.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Laçamento de Agendamento</div>
                        <div class="panel-body">
                            <div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label ID="Label4" runat="server" Text="Código" ></asp:Label>
                                        <asp:TextBox ID="txtId" runat="server" Width="10%"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="Label1" runat="server" Text="Descrição do plano:"></asp:Label>
                                        <asp:TextBox ID="txtDescricao" runat="server" Width="100%"></asp:TextBox>
                                    </div>
                                    &nbsp
                             &nbsp
                                 <div class="col-md-12">
                                     <asp:Button ID="btnSalvar" runat="server" Text="Finalizar" CssClass="btn btn-success" Width="100%" OnClick="btnSalvar_Click" />
                                     &nbsp
                                 </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
