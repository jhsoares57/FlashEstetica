<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarAgendamento.aspx.cs" Inherits="WebFlashEstetica.View.Web.Agendamento.ListarAgendamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
         //Cadastro da Pessoa
         function CadastrarAgendamento() {
             var url = 'CadastrarAgendamento.aspx';
             $("#frmModalUrl").attr("src", url);
             $("#frmModal").modal();
             return false;
         }


         function EditarAgendamento(id) {
             var url = 'CadastrarAgendamento.aspx?AgendamentoId=' + id;
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
                    <asp:Button ID="btnCarregarPessoas" runat="server" Text="Carregar Pessoas" OnClick="btnCarregarPessoas_Click" />
                    <asp:Button ID="btnExcluir" runat="server" Text="Excluir Pessoa" />
                    <asp:HiddenField ID="hdnId" runat="server" />
                </div>

                <div id="frmModal" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div>
                                <iframe src="javascript:" id="frmModalUrl" frameborder="0" class="frame-param" style="border: 0; width: 900px; height: 300px"
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
                value="Novo" onclick="CadastrarAgendamento()">

                <i class="glyphicon glyphicon-pencil"></i>&nbsp;Lançamento  
                           
            </button>

            <br />
            <br />

                                    <div class="row">
                            <div class="col-md-8">
                                <asp:GridView ID="gvListarAgendamento" runat="server"  HeaderStyle-BackColor="#3AC0F2" AutoGenerateColumns="false" OnRowDataBound="gvListarAgendamento_RowDataBound" Width="800px" OnSelectedIndexChanged="gvListarAgendamento_SelectedIndexChanged" HorizontalAlign="Center" ShowFooter="True">
                                    <Columns>
                                        <asp:BoundField HeaderText="Código" DataField="Id" />
                                        <asp:BoundField HeaderText="Nome do Cliente:" DataField="NomeCliente" />
                                        <asp:BoundField HeaderText="Data do agendamento" DataField="Data" DataFormatString="{0: dd/MM/yyyy}"/>
                                        <asp:BoundField HeaderText="Hora do agendamento" DataField="Hora" DataFormatString="{0:t}"/>
                                        <asp:BoundField HeaderText="Situação:" DataField="Status" />

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
                                                        type="button" onclick='EditarAgendamento(<%# Eval("Id") %>); return false;'>
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
