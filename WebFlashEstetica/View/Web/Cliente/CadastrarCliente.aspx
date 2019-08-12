<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastrarCliente.aspx.cs" Inherits="WebFlashEstetica.View.Web.Cliente.CadastrarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/jquery.maskedinput.min.js"></script>

    <script type="text/javascript">
        function ChamarFecharPopUp() {
            parent.FecharPopUP();
        }
        function ChamarExibirMensagemErro(msg) {
            parent.ExibirMensagemErro(msg);
        }
        function ChamarExibirMensagemSucesso(msg) {
            parent.ChamarExibirMensagemSucesso(msg);
        }

        function mensagem() {
            window.alert("Registro Salvo com sucesso!")
        }

        function mensagemUPDT() {
            window.alert("Registro atualizado com sucesso!")
        }

        function doVolta() { history.go(-1); }

        function CadastrarCliente1() {
            var url = 'CadastroPessoa.aspx';
            $("#frmModalUrl").attr("src", url);
            $("#frmModal").modal();
            return false;
        }



        function Secao(id, nome) {

            ////var largura = 10;
            ////var altura = 10;
            //var posLeft = (screen.width - largura) / 2;
            //var posTop = (screen.height - altura) / 2;
            window.open("LancarSecao.aspx?id=" + txtID.Text + "&nome=" + txtNome.Text, "PrimeiraJanela", "width=950,height=420, left=1000, top=100")

        }

        function abrirPagina() {
            Window.open("FichaCliente.aspx");
        }

        function Sair() {
            window.close("ListarCliente.aspx", "PrimeiraJanela", "status=1,toolbar=1")

        }

        function SAirCadastrarCliente() {

            ////var largura = 10;
            ////var altura = 10;
            //var posLeft = (screen.width - largura) / 2;
            //var posTop = (screen.height - altura) / 2;
            location.href = "ListarCliente.aspx";

        }
        function EditarPessoa(id, nome) {
            var url = 'LancarSecao.aspx?PessoaId=' + id + '&nome=' + nome;
            $("#frmModalUrl").attr("src", url);
            $("#frmModal").modal();
            return false;
        }
        //Edição da Pessoa
        function LancarSecao(id) {
            var url = 'LancarSecao.aspx?PessoaId=' + id;
            $("#frmModalUrl").attr("src", url);
            $("#frmModal").modal();
            return false;
        }



        function RelatorioCliente() {
            var url = 'FichaCliente.aspx';
            $("#frmModalUrl").attr("src", url);
            $("#frmModal").modal();
            return false;
        }



        // function Secao() {
        //    window.open("LancarSecao.aspx","PrimeiraJanela","status=1,toolbar=1")

        //}


        jQuery(function ($) {
            $("#txtNascimento").mask("99/99/9999");
            $("#txtCelular").mask("(99) 99999-9999");
            $("#txtCep").mask("99999-999");
            $("#txtCPF").mask("999.999.999-99");
            $("#txtCNPJ").mask("99.999.999/9999-99");
            $("#txtPlacaVeiculo").mask("aaa - 9999");
            $("#txtIP").mask('099.099.099.099');
        });


    </script>

    <body>


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
        <%--<table>
            <tr>
                <td>--%><br/>
        <%--inicio da camada de dados basicos--%>

        <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"

        <div class="row text-default">
            <h4 style="font-size: 2em;">Cadastro de Cliente</h4>
            <hr />

          <%--  <asp:LinkButton ID="btnImprimirFicha" CssClass="btn btn-success" runat="server" OnClick="btnImprimirFicha_Click">
            <i class="glyphicon glyphicon-user"></i>&nbsp;Imprimir Ficha
            </asp:LinkButton>--%>

       <br />
       <br />
            <div style="font-size:14px; color:black; font-style:inherit">
            <div class="panel panel-default">
                <div class="panel-body">
                     <div class="row text-default"></div>
            <h4 style="font-size: 2em;">Dados Básicos</h4>
            <hr />
       <br />
                <asp:Label ID="Label9" runat="server" Text="Código:"></asp:Label>
                        <asp:TextBox ID="txtID" Enabled="false" runat="server" Width="65px" ></asp:TextBox>
                        &nbsp;
                <asp:Label ID="Label8" runat="server" Text="Nome:"></asp:Label>
                        <asp:TextBox ID="txtNome" Enabled="true" runat="server" MaxLength="50"></asp:TextBox>
                        &nbsp;
                <asp:Label ID="Label10" runat="server" Text="CPF:"></asp:Label>
                        <asp:TextBox ID="txtCPF" Enabled="true" runat="server" MaxLength="15"></asp:TextBox>
       <br />
       <br />
                        <asp:Label ID="Label13" runat="server" Text="Celular:"></asp:Label>
                <asp:TextBox ID="txtCelular" Enabled="true" runat="server" MaxLength="15" ></asp:TextBox>
                &nbsp;
                             <asp:Label ID="Label14" runat="server" Text="Email:"></asp:Label>
                <asp:TextBox ID="txtEmail" Enabled="true" runat="server" Width="220px" MaxLength="30"></asp:TextBox>
       <br />
       <br />
                            
                    <asp:Label ID="Label5" runat="server" Text="CEP:"></asp:Label>
                <asp:TextBox ID="txtCep" runat="server" MaxLength="9"></asp:TextBox>
                <asp:Button ID="btnBuscarCep" runat="server" Text="Cep" OnClick="btnBuscarCep_Click" CssClass="btn-primary" />
                &nbsp;
        
                <asp:Label ID="Label" runat="server" Text="Endereço:"></asp:Label>
                    <asp:TextBox ID="txtRua" runat="server" MaxLength="15"></asp:TextBox>
                    &nbsp;
        
                <asp:Label ID="Label1" runat="server" Text="Bairro:"></asp:Label>
                    <asp:TextBox ID="txtBairro" runat="server" MaxLength="15"></asp:TextBox>

           <br />
           <br />
                <asp:Label ID="Label2" runat="server" Text="Numero:"></asp:Label>
                    <asp:TextBox ID="txtNumero" runat="server" MaxLength="5"></asp:TextBox>

                    <asp:Label ID="Label6" runat="server" Text="Cidade:"></asp:Label>
                    <asp:TextBox ID="txtCiade" runat="server" MaxLength="20"></asp:TextBox>

                    <asp:Label ID="Label7" runat="server" Text="Estado:"></asp:Label>
                    <asp:TextBox ID="txtEstado" runat="server" MaxLength="2"></asp:TextBox>


           <br />
          <br />

                <asp:Label ID="Label3" runat="server" Text="Nascimento:"></asp:Label>
                    <asp:TextBox ID="txtNascimento" runat="server" MaxLength="10"></asp:TextBox>

                    <asp:Label ID="Label4" runat="server" Text="Idade:"></asp:Label>
                    <asp:TextBox ID="txtIdade" runat="server" MaxLength="2" Width="78"></asp:TextBox>

         <br />
         <br />


                    <asp:Label ID="Label11" runat="server" Text="Sexo:"></asp:Label>
            <asp:DropDownList ID="ddlSexo" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Masculino"></asp:ListItem>
                <asp:ListItem Value="2" Text="Feminino"></asp:ListItem>

            </asp:DropDownList>
            <asp:Label ID="Label15" runat="server" Text="Estado Civil:"></asp:Label>
            <asp:DropDownList ID="ddlEstadoCivil" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Casada"></asp:ListItem>
                <asp:ListItem Value="2" Text="Solteira"></asp:ListItem>

            </asp:DropDownList>

            <asp:Label ID="Label16" runat="server" Text="Profissão:"></asp:Label>
            <asp:TextBox ID="txtProf" runat="server" MaxLength="20"></asp:TextBox>

           <br />
              <br />
            <asp:Label ID="Label55" runat="server" Text="Queixa Principal:"></asp:Label>
            <br />
            <asp:TextBox ID="txtQueixa" runat="server" Width="842px" MaxLength="100"></asp:TextBox>

                    </div>
                </div>
            <div class="panel panel-default">
                <div class="panel-body">

            <%--Inicio da camada de historico--%>

            <div class="row text-default"></div>
                <h4 style="font-size: 2em;">Histórico</h4>
                <hr />
            
 <div class="col-md-6">
            <%--primeiro bloco--%>
            <asp:Label ID="Label12" runat="server" Text="Tratamento estético anterior?"></asp:Label>
            &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlEstetico" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
     <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label17" runat="server" Text="Qual?" ></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtEstetico" runat="server" MaxLength="20"></asp:TextBox>

            <br />
            <br />

            <asp:Label ID="Label18" runat="server" Text="Pratica atividade física?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlAtivFisica" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
     <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label19" runat="server" Text="Qual?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtAtividade" runat="server" MaxLength="20"></asp:TextBox>

           <br />
       <br />
        <%--Segundo bloco--%>

            <asp:Label ID="Label20" runat="server" Text="Oncológicos?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlOncologico" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
     <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label47" runat="server" Text="Quais?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtOncologicos" runat="server" MaxLength="20"></asp:TextBox>

            <br />
            <br />

            <asp:Label ID="Label22" runat="server" Text="Usa anticoncepcional?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlAnticoncepcional" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
     <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label23" runat="server" Text="Qual?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtanticoncpcional" runat="server" MaxLength="20"></asp:TextBox>

           <br />
       <br />


        <%--Terceiro bloco--%>
            <asp:Label ID="Label21" runat="server" Text="Antecedente cirurgico?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlCirurgico" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
     <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label24" runat="server" Text="Quais?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtCirurgia" runat="server" MaxLength="20"></asp:TextBox>

            <br />
            <br />

            <asp:Label ID="Label25" runat="server" Text="Problema ortopédico?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlOrtopedico" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
     <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label26" runat="server" Text="Qual?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtOrtopedico" runat="server" MaxLength="20"></asp:TextBox>

           <br />
       <br />
        
           <%--Quarto bloco--%>
            <asp:Label ID="Label27" runat="server" Text="Usa ou já usou Ácido na pele?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlAcido" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
     <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label28" runat="server" Text="Quais?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtAcido" runat="server" MaxLength="20"></asp:TextBox>

            <br />
            <br />

            <asp:Label ID="Label29" runat="server" Text="Alimentação balanceada?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlAliementacao" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
     <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label30" runat="server" Text="Qual?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtAlimentacao" runat="server" MaxLength="20"></asp:TextBox>

           <br />
       <br />

           <%--Quinto bloco--%>
            <asp:Label ID="Label31" runat="server" Text="Funcionamento intestino regular?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlIntestino" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
     <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label32" runat="server" Text="Obs:"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtIntestino" runat="server" MaxLength="20"></asp:TextBox>

            <br />
            <br />

            <asp:Label ID="Label33" runat="server" Text="Alergias?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlAlergia" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
     <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label34" runat="server" Text="Quais?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtAlergia" runat="server" MaxLength="20"></asp:TextBox>

           <br />
       <br />
        
   <%--Sexto bloco--%>
            <asp:Label ID="Label35" runat="server" Text="Lesões?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlLesoes" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
     <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label36" runat="server" Text="Quais?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtLesao" runat="server" MaxLength="20"></asp:TextBox>

            <br />
            <br />

            <asp:Label ID="Label37" runat="server" Text="Portador de Marcapasso?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlMarcapasso" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
     <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label38" runat="server" Text="Qual?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtMarcaPasso" runat="server" MaxLength="20"></asp:TextBox>

           <br />
       <br />
                    </div>
         <div class="col-md-6">
           <%--Setimo bloco--%>
            <asp:Label ID="Label39" runat="server" Text="Faz algum tratamento médico?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlTratamento" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
      <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label40" runat="server" Text="Qual?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtMedico" runat="server" MaxLength="20"></asp:TextBox>

            <br />
            <br />

            <asp:Label ID="Label41" runat="server" Text="Cuidados diários?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlCuidados" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
      <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label42" runat="server" Text="Produtos em uso?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtCuidado" runat="server" MaxLength="20"></asp:TextBox>

           <br />
       <br />

           <%--oitavo bloco--%>
            <asp:Label ID="Label43" runat="server" Text="Ingere líquidos com frequencia?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlLiquido" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
        <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label44" runat="server" Text="Quanto?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtLiquido" runat="server" MaxLength="20"></asp:TextBox>

            <br />
            <br />

            <asp:Label ID="Label45" runat="server" Text="Possui filhos?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlFilhos" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
        <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label46" runat="server" Text="Quantos?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtFilhos" runat="server" MaxLength="20"></asp:TextBox>

           <br />
       <br />
        
           <%--decimo bloco--%>
            <asp:Label ID="Label48" runat="server" Text="Varizes?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlVarizes" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
             <br />
             &nbsp;
            &nbsp;
            <asp:Label ID="Label49" runat="server" Text="Grau?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:TextBox ID="txtVarizes" runat="server" MaxLength="10"></asp:TextBox>

            <br />
            <br />

            <asp:Label ID="Label50" runat="server" Text="Hipotensão?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlHipotensao" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>

           <br />
       <br />

      
           <%--decimo primeiro bloco--%>
            <asp:Label ID="Label52" runat="server" Text="Costuma ficar muito tempo sentata?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlSentada" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>

            <br />
            <br />

            <asp:Label ID="Label54" runat="server" Text="Hipertensão?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlHipertensao" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>

           <br />
       <br />
        
           <%--decimo segundo bloco--%>
            <asp:Label ID="Label51" runat="server" Text="É fumante?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlFumante" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>

            <br />
            <br />

            <asp:Label ID="Label53" runat="server" Text="Diabetes?"></asp:Label>
             &nbsp;
            &nbsp;
            <asp:DropDownList ID="ddlDiabetes" runat="server">
                <asp:ListItem Value="0" Text="Selecione" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Sim"></asp:ListItem>
                <asp:ListItem Value="2" Text="Não"></asp:ListItem>
            </asp:DropDownList>
                    </div>
                    </div>
                </div>
            </div>
           <br />
           <br />           
            <div class="row">
                <div class="col-lg-12" style="left: 0px; top: 0px">
                    <asp:LinkButton ID="btnSalvar" CssClass="btn btn-primary form-control" runat="server" OnClick="btnSalvar_Click">
                    <i class="glyphicon glyphicon-hdd"></i>&nbsp;Salvar
                    </asp:LinkButton>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                       <button type="button" name="btnNovo" id="btnSair" class="btn btn-danger form-control"
                            value="Novo" onclick=" SAirCadastrarCliente()">
                            
                            <i class="glyphicon glyphicon-pencil" ></i>&nbsp;Sair
                           
                        </button>
                </div>
            </div>
            </div>
            </div> 
        </div>
    </body>
</asp:Content>
