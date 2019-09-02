<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarPlano.aspx.cs" Inherits="WebFlashEstetica.View.Web.Plano.ListarPlano" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <script type="text/javascript">

         function CadastrarAgendamento() {
             var url = 'CadastrarPlano.aspx';
             $("#frmModalUrl").attr("src", url);
             $("#frmModal").modal();
             return false;
         }


         function EditarAgendamento(id) {
             var url = 'CadastrarPlano.aspx?PlanoId=' + id;
             $("#frmModalUrl").attr("src", url);
             $("#frmModal").modal();
             return false;
         }




    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <br />

    
                <div class="container">

                <!--Abaixo do context de conteúdo -->
                <div style="visibility: hidden;">
                    <asp:Button ID="btnCarregarPessoas" runat="server" Text="Carregar Pessoas" />
                    <asp:Button ID="btnExcluir" runat="server" Text="Excluir Pessoa" />
                    <asp:HiddenField ID="hdnId" runat="server" />
                </div>

                <div id="frmModal" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div>
                                <iframe src="javascript:" id="frmModalUrl" class="frame-param" style="border: 0; width: 100%; height: 200px"
                                   ></iframe>

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
                value="Novo" onclick="CadastrarAgendamento()">

                <i class="glyphicon glyphicon-pencil"></i>&nbsp;Agendamento  
                           
            </button>

            <br />
            <br />

                                    <div class="row">
                            <div class="col-md-8">
                                <asp:GridView ID="gvListarPlano" runat="server"  HeaderStyle-BackColor="#3AC0F2" AutoGenerateColumns="false" OnRowDataBound="gvListarPlano_RowDataBound" Width="800px" OnSelectedIndexChanged="gvListarPlano_SelectedIndexChanged" HorizontalAlign="Center" ShowFooter="True">
                                    <Columns>
                                        <asp:BoundField HeaderText="Código" DataField="IdPlano" />
                                        <asp:BoundField HeaderText="Descrição Plano:" DataField="DescricaoPlano" />

                                       <%-- <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Panel ID="pnlAdicionarPacote" runat="server">
                                                    <button class="btn btn-danger" title="Cancelar" style="height: 30px"
                                                        type="button" onclick='LancarPacote(<%# Eval("Id") %>); return false;'>
                                                        <i class="glyphicon glyphicon-remove"></i>
                                                    </button>
                                                </asp:Panel>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Panel ID="pnlAgendar" runat="server">
                                                 <button class="btn btn-success btn-sm" title="Editar Agendamento" style="height: 30px"
                                                        type="button" onclick='EditarAgendamento(<%# Eval("IdAgendmento") %>); return false;'>
                                                        <i class="glyphicon glyphicon-copy"></i>
                                                    </button>
                                                    </asp:Panel>
                                                </ItemTemplate>
                                                </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
