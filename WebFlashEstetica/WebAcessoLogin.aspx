<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebAcessoLogin.aspx.cs" Inherits="WebFlashEstetica.WebAcessoLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />


    <style type="text/css">
        .auto-style1 {
            height: 324px;
            width: 617px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="auto-style1">
                <div class="container text-center">
                    <div class="form-login">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="panel-title">Login do Sistema</div>
                            </div>
                            <div style="padding-top: 30px" class="panel-body">
                                <div style="display: none" id="result" class="alert 
                    alert-danger col-sm-12">
                                </div>

                                <div class="input-group">
                                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control " placeholder="Usuario"></asp:TextBox>
                                </div>
                                <br />
                                <div class="input-group">
                                    <asp:TextBox ID="txtSenha" runat="server" CssClass="form-control input_pass" placeholder="Senha" Type="password"></asp:TextBox>
                                </div>
                                <br />
                                <div class="input-group">
                                    <asp:LinkButton ID="btnAcessar" runat="server" CssClass="btn btn-primary form-control">Acessar</asp:LinkButton>
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
