<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Interno.aspx.cs" Inherits="CapaPresentacionInterna.Login_Interno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link href="../Herramientas/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../Herramientas/estilos/css/themify-icons.css" rel="stylesheet" />
    <link href="../Herramientas/estilos/css/vendor.bundle.base.css" rel="stylesheet" />
    <link href="../Herramientas/estilos/css/style.css" rel="stylesheet" />
    <link href="https://localhost:44393/Herramientas/bootstrap/css/w3.css" rel="stylesheet" />
    <link href="../Herramientas/bootstrap/css/bootsrap-validaciones.css" rel="stylesheet" />
    <link href="../Herramientas/bootstrap/css/boostrap-glyphicons.css" rel="stylesheet" />
    <link href="../Herramientas/fontawesome/css/all.css" rel="stylesheet" />
    <link href="../Herramientas/bootstrap/css/pagina-maestra.css" rel="stylesheet" />
    <link href="../Herramientas/plugins/sweetalert/sweetalert2.css" rel="stylesheet" />
    <script src="../Herramientas/plugins/sweetalert/sweetalert2.all.js"></script>
    <script src="../Herramientas/estilos/js/login.js"></script>
</head>
<body>
        <form id="fmLoginInterno" runat="server" novalidate="novalidate" class="needs-validation">
        <asp:Login ID="LoginUser" runat="server" EnableViewState="false" OnAuthenticate="LoginUser_Authenticate" Width="100%">
            <LayoutTemplate>
                <div class="container-scroller">
                    <div class="container-fluid page-body-wrapper full-page-wrapper ">
                        <div class="content-wrapper d-flex align-items-center auth px-0 bg-dark">
                            <div class="row w-100 mx-0">
                                <div class="col-lg-5 mx-auto">
                                    <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                                        <h3 class="text-center">LOGIN</h3>
                                        <h6 class="font-weight-normal text-secondary mt-4">Inicia sesión para continuar.</h6>
                                        <div class="pt-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-prepend bg-transparent">
                                                        <span class="input-group-text bg-transparent">
                                                            <i class="fa fa-user-circle text-primary" style="width: 30px;"></i>
                                                        </span>
                                                    </div>
                                                    <asp:TextBox ID="UserName" class="form-control form-control-lg" runat="server" placeholder="* Ingresar nombre de usuario." required="required"></asp:TextBox>
                                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                    <div class="invalid-feedback font-size-15">Por favor, ingrese un usuario correcto.</div>
                                                </div>

                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-prepend bg-transparent">
                                                        <span class="input-group-text bg-transparent">
                                                            <i class="fa fa-lock text-primary" style="width: 30px;"></i>
                                                        </span>
                                                    </div>
                                                    <asp:TextBox ID="Password" TextMode="Password" class="form-control form-control-lg" runat="server" placeholder="* Ingresar contraseña." required="required"></asp:TextBox>
                                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                    <div class="invalid-feedback font-size-15">Por favor, ingrese una contraseña</div>
                                                </div>
                                            </div>
                                            <div class="mt-3">
                                                <asp:Button ID="btnInciarSesion" CssClass="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn w3-hover-white w3-border-blue w3-hover-text-blue" runat="server" Text="INICIAR SESIÓN" CommandName="Login" />
                                            </div>
                                            <div class="my-2 d-flex justify-content-between align-items-center">
                                                <div class="form-check">
                                                    <label class="form-check-label text-muted">
                                                        <input type="checkbox" class="form-check-input" />
                                                        Mantenme conectado
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </LayoutTemplate>
        </asp:Login>

    </form>
    <script src="../Herramientas/estilos/js/vendor.bundle.base.js"></script>
    <script src="../Herramientas/estilos/js/off-canvas.js"></script>
    <script src="../Herramientas/estilos/js/hoverable-collapse.js"></script>
    <script src="../Herramientas/estilos/js/template.js"></script>
    <script src="../Herramientas/estilos/js/todolist.js"></script>
    <script src="../Herramientas/fontawesome/js/all.js"></script>
</body>
</html>
