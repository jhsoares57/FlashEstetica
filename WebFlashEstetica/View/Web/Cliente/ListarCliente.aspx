<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarCliente.aspx.cs" Inherits="WebFlashEstetica.View.Web.Cliente.ListarCliente" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

         <script type="text/javascript">


             function EditPessoa(id) {
                 window.location = 'CadastroCliente.aspx?PessoaId=' + id;
                 return false;
             }


             function Secao(id, nome) {

                 ////var largura = 10;
                 ////var altura = 10;
                 //var posLeft = (screen.width - largura) / 2;
                 //var posTop = (screen.height - altura) / 2;
                 window.open("LancarSecao.aspx", "PrimeiraJanela", "width=950,height=425, left=1000, top=100")

             }



             function CadastrarCliente() {

                 ////var largura = 10;
                 ////var altura = 10;
                 //var posLeft = (screen.width - largura) / 2;
                 //var posTop = (screen.height - altura) / 2;
                 location.href = "CadastrarCliente.aspx";

             }

    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

                <div class="container">

                <!--Abaixo do context de conteúdo -->
                <div style="visibility: hidden;">
                    <asp:Button ID="btnCarregarPessoas" runat="server" Text="Carregar Pessoas" OnClick="btnCarregarPessoas_Click" />
                    <asp:Button ID="btnExcluir" runat="server" Text="Excluir Pessoa" />
                    <asp:HiddenField ID="hdnId" runat="server" />
                </div>

                <div id="frmModal" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div>
                                <iframe src="javascript:" id="frmModalUrl" frameborder="0" class="frame-param" style="border: 0; width: 900px; height: 400px"
                                    scrolling="auto" marginheight="0" marginwidth="0"></iframe>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal" width: 900px;>
                                    Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>


    <div class="row">
        <div class="col-md-4">
            <button type="button" name="btnNovo" id="btnNovo" class="btn btn-primary form-control"
                value="Novo" onclick="CadastrarCliente()">

                <i class="glyphicon glyphicon-pencil"></i>&nbsp;Novo  
                           
            </button>

            <br />
            <br />

                                    <div class="row">
                            <div class="col-md-12">
                                <asp:GridView ID="gvCadastroCliente" runat="server"  HeaderStyle-BackColor="#3AC0F2" AutoGenerateColumns="false" OnRowDataBound="gvCadastroPessoa_RowDataBound" Width="1014px" OnSelectedIndexChanged="gvCadastroCliente_SelectedIndexChanged" GridLines="Horizontal">
                                    <Columns>
                                        <asp:BoundField HeaderText="Código" DataField="Id" ControlStyle-CssClass="" />
                                        <asp:BoundField HeaderText="Nome:" DataField="Nome" />
                                        <asp:BoundField HeaderText="Celular" DataField="Celular" />
                                        <asp:BoundField HeaderText="Email" DataField="Email" />


                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                 <button class="btn btn-warning btn-sm" title="Alterar Cliente" style="height: 30px"
                                                        type="button" onclick='EditPessoa(<%# Eval("Id") %>); return false;'>
                                                        <i class="glyphicon glyphicon-pencil"></i>
                                                    </button>
                                                </ItemTemplate>
                                                </asp:TemplateField>

                                    </Columns>

                                <HeaderStyle BackColor="#3AC0F2"></HeaderStyle>
                                </asp:GridView>
                            </div>
                        </div>
                 </div>
            </div>
         </div>
</asp:Content>
