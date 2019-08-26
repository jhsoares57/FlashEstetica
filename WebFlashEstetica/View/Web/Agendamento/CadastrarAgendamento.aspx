<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadastrarAgendamento.aspx.cs" Inherits="WebFlashEstetica.View.Web.Agendamento.CadastrarAgendamento" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
        jQuery(function ($) {
            $("#txtHora").mask("99:99");
            $("#txtData").mask("99/99/9999");
        });

        function mensagem() {
            window.alert("Registro Salvo com sucesso!")

        }

        function mensagemUPDReag() {
            window.alert("Reagendado com sucesso!")
        }

        function mensagemUPDCAn() {
            window.alert("Agendamento cancelado com sucesso!")
        }
         function mensagemerroCEP() {
            window.alert(ex.Message)
        }

        function mensagemUPDFin() {
            window.alert("Agendamento finalizado com sucesso!")
            //window.location = 'ListarAgendamento.aspx';
        }

        function ChamarExibirMensagemSucesso(msg) {
            alert.ChamarExibirMensagemSucesso(msg);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Laçamento de Agendamento</div>
                    <div class="panel-body">
                        <div>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="Label4" runat="server" Text="Código" Visible="false"></asp:Label>
                                    <asp:TextBox ID="txtId" runat="server" Visible="false" Width="33px"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="Label1" runat="server" Text="Cliente:"></asp:Label>
                                    <asp:DropDownList ID="ddlCliente" runat="server" Width="267px"></asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>

                                    <asp:Label ID="Label2" runat="server" Text="Data:"></asp:Label>
                                    <asp:TextBox ID="txtData" runat="server" Width="100px"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtData" PopupButtonID="Button1" Format="dd/MM/yyyy" />
                                    <asp:Button ID="Button1" runat="server" Text="Calen." CssClass="btn btn-primary" />
                                    &nbsp
                                    <asp:Label ID="Label3" runat="server" Text="Hora:"></asp:Label>
                                    <asp:TextBox ID="txtHora" runat="server" Width="78px"></asp:TextBox>
                                    &nbsp
                                    &nbsp
                                    <asp:Button ID="btnAdicionar" runat="server" Text="Adicionar" CssClass="btn btn-primary" OnClick="btnAdicionar_Click" />
                                </div>
                            </div>
                            <br />
                            <br />
                            <asp:GridView ID="gvAgendamento" runat="server" DataKeyNames="IdCliente1" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="597px">
                                <Columns>
                                    <asp:BoundField HeaderText="ID Cliente" DataField="IdCliente1" />
                                    <asp:BoundField HeaderText="Nome do Cliente" DataField="NomeCliente" />
                                    <asp:BoundField HeaderText="Data" DataField="Data" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField HeaderText="Hora" DataField="Hora" DataFormatString="{0:hh:mm}" />
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" />
                                <HeaderStyle BackColor="Blue" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                <RowStyle BackColor="White" />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#808080" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#383838" />
                            </asp:GridView>
                            <div class="col-md-6">
                                <asp:Label ID="lblAlerta" runat="server" Text="Agendamento Cancelado, Clicar em Fechar para sair!" BackColor="Red" Visible="false"></asp:Label>
                            </div>
                            <br />
                            <asp:Button ID="btnSalvarBanco" runat="server" Text="Salvar" CssClass="btn btn-primary" OnClick="BtnSalvarBanco_Click" Width="92px" />
                            &nbsp
                            &nbsp
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" Width="92px" OnClick="btnCancelar_Click" />
                            &nbsp
                             &nbsp
                            <asp:Button ID="btnReagendar" runat="server" Text="Reagendar" CssClass="btn btn-warning" Width="92px" OnClick="btnReagendar_Click" />
                            &nbsp
                             &nbsp
                            <asp:Button ID="btnFinalizar" runat="server" Text="Finalizar" CssClass="btn btn-success" Width="92px" OnClick="btnFinalizar_Click" />
                             &nbsp
                             &nbsp
                            <asp:Button ID="btnFinalizarMedida" runat="server" Text="Finalizar com Mendidas" CssClass="btn btn-success" Width="175px" OnClick="btnFinalizarMedida_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
