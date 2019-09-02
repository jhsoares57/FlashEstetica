<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinalizarAgendamento.aspx.cs" Inherits="WebFlashEstetica.View.Web.Agendamento.FinalizarAgendamento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../../Content/bootstrap.css" rel="stylesheet" />
    <script src="../../../Scripts/bootstrap.min.js"></script>
    <script src="../../../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../../../Scripts/jquery.maskedinput.min.js"></script>
    <script type="text/javascript">
        function mensagemUPDFin() {
            window.alert("Agendamento finalizado com sucesso!")
            //window.location = 'ListarAgendamento.aspx';
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Medidas cessão</div>
                    <div class="panel-body">
                        <div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Label ID="Label4" runat="server" Text="Nr. Agen.:"></asp:Label>
                                    <asp:TextBox ID="txtAgemdamento" runat="server" Width="33px" Enabled="False"></asp:TextBox>
                                    <asp:Label ID="Label1" runat="server" Text="Cód. Cliente:"></asp:Label>
                                    <asp:TextBox ID="txtCodCliente" runat="server" Width="33px" Enabled="False"></asp:TextBox>
                                    <asp:Label ID="Label2" runat="server" Text="Cliente:"></asp:Label>
                                    <asp:TextBox ID="txtCliente" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                                </div>
                                <br />
                                <div class="col-md-6">
                                    <asp:Label ID="Label3" runat="server" Text="Cintura:"></asp:Label>
                                    <asp:TextBox ID="txtCitura" runat="server" Width="33px"></asp:TextBox>
                                    <asp:Label ID="Label5" runat="server" Text="Culote:"></asp:Label>
                                    <asp:TextBox ID="txtCulote" runat="server" Width="33px"></asp:TextBox>
                                    <asp:Label ID="Label6" runat="server" Text="Quadril:"></asp:Label>
                                    <asp:TextBox ID="txtQuadril" runat="server" Width="33px"></asp:TextBox>
                                    <asp:Label ID="Label7" runat="server" Text="Coxa Dir.:"></asp:Label>
                                    <asp:TextBox ID="txtCoxaDir" runat="server" Width="33px"></asp:TextBox>
                                    <asp:Label ID="Label8" runat="server" Text="Coxa Esq.:"></asp:Label>
                                    <asp:TextBox ID="txtCoxaEsq" runat="server" Width="33px"></asp:TextBox>
                                </div>
                                <br />
                                <div class="col-md-6">
                                    <asp:Label ID="Label9" runat="server" Text="Panturrilha Esq:"></asp:Label>
                                    <asp:TextBox ID="txtPanturrilhaEsq" runat="server" Width="33px"></asp:TextBox>
                                    <asp:Label ID="Label10" runat="server" Text="Panturrilha Dir:"></asp:Label>
                                    <asp:TextBox ID="txtPanturrilhaDir" runat="server" Width="33px"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <%--<asp:Button ID="btnVoltar" runat="server" Text="Voltar" CssClass="btn btn-primary" Width="92px" OnClick="btnVoltar_Click" />--%>
                                    &nbsp
                                &nbsp
                            <asp:Button ID="btnFinalizar" runat="server" Text="Finalizar" CssClass="btn btn-success" Width="92px" OnClick="btnFinalizar_Click" />
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
