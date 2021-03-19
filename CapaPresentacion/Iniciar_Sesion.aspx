<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Iniciar_Sesion.aspx.cs" Inherits="CapaPresentacionExterna.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../Herramientas/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../Herramientas/estilos/css/style.css" rel="stylesheet" />
    <link href="../Herramientas/estilos/css/vendor.bundle.base.css" rel="stylesheet" />
    <link href="../Herramientas/estilos/css/themify-icons.css" rel="stylesheet" />
    <link href="../Herramientas/fontawesome/css/all.css" rel="stylesheet" />
    <link href="../Herramientas/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />
    <link href="../Herramientas/bootstrap/css/bootsrap-validaciones.css" rel="stylesheet" />
    <link href="../Herramientas/bootstrap/css/w3.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="../Herramientas/plugins/sweetalert/sweetalert2.css" rel="stylesheet" />
    <link href="../Herramientas/bootstrap/css/pagina-maestra.css" rel="stylesheet" />
    <script src="../Herramientas/plugins/sweetalert/sweetalert2.all.js"></script>
    <script src="../Herramientas/estilos/js/ve-iniciar-sesion.js"></script>

</head>
<body>
    <form id="fmIniciarSesionVistaExterna" runat="server" novalidate="novalidate" class="needs-validation">
        <asp:Login ID="LoginUser" runat="server" EnableViewState="false" OnAuthenticate="LoginUser_Authenticate" Width="100%">
            <LayoutTemplate>
                <div class="container-scroller">
                    <div class="container-fluid page-body-wrapper full-page-wrapper">
                        <div class="content-wrapper d-flex align-items-stretch auth auth-img-bg">
                            <div class="row flex-grow" style="background-image:url(images/8287.jpg);">
                                <div class="col-lg-12 col-xl-6 col-md-12 col-sm-12 col-12 d-flex align-items-center justify-content-center  border-right">
                                    <div class="auth-form-transparent text-left border-white bg-white shadow px-5 pb-5 w3-animate-zoom" style="width: 90%;">
                                        <div class="brand-logo text-left">
                                            <img src="../Herramientas/estilos/imagenes/fima-logo.png" alt="logo" />
                                        </div>
                                        <div class="container-fluid">
                                            <div class="row px-3">
                                                <h4 class="font-weight-medium">¡Bienvenido de nuevo!</h4>
                                            </div>
                                            <div class="row mt-1 px-3">
                                                <h6 class="font-weight-medium text-secondary">Iniciar sesión para continuar.</h6>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-12 col-md-12 col-xl-12 col-lg-12 mt-4">
                                                    <label class="font-weight-medium">Email</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend bg-transparent">
                                                            <span class="input-group-text bg-transparent border-right-0">
                                                                <i class="fa fa-envelope text-primary" style="width: 20px;"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox ID="UserName" TextMode="Email" class="form-control border-left-0" placeholder="* Dirección de correo electrónico." runat="server" required="required" title="Dirección de correo electrónico" pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$"></asp:TextBox>
                                                        <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                        <div class="invalid-feedback font-size-15">Por favor, ingrese una dirección de correo electrónico.</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-12 col-md-12 col-xl-12 col-lg-12 mt-4">
                                                    <label class="font-weight-medium">Contraseña</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend bg-transparent">
                                                            <span class="input-group-text bg-transparent border-right-0">
                                                                <i class="fa fa-lock text-primary" style="width: 20px;"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox ID="Password" TextMode="Password" runat="server" class="form-control border-left-0" placeholder="* Contraseña." required="required"></asp:TextBox>
                                                        <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                        <div class="invalid-feedback font-size-15">Por favor, ingrese una contraseña.</div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="my-2 d-flex justify-content-between align-items-center">
                                                <div class="form-check">
                                                    <label class="form-check-label text-muted">
                                                        <input type="checkbox" class="form-check-input" />
                                                        Mantenme conectado
                                                    </label>
                                                </div>
                                                <%--<a href="#" class="auth-link text-black">¿Se te olvidó tu contraseña?</a>--%>
                                            </div>
                                            <div class="row mt-4 justify-content-end">
                                                <div class="col-xl-7 col-lg-6 col-md-6 col-12 order-last col-sm-12 order-sm-last order-xl-first order-lg-first order-md-first">
                                                    <div class="text-left mt-2 font-weight-light">
                                                        ¿No tienes una cuenta? <a href="Registrarse.aspx" class="text-primary font-weight-bold">Crear</a>
                                                    </div>
                                                </div>
                                                <div class="col-xl-5 col-lg-6 col-md-6 col-12 order-first col-sm-12 order-sm-first order-xl-last order-lg-last order-md-last">
                                                    <asp:Button ID="btnRegistrarPaciente" class="btn btn-block btn-success-success w3-hover-white w3-hover-text-teal btn-rounded font-weight-medium text-white" runat="server" CommandName="Login" Text="Iniciar Sesion" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-lg-12 col-xl-6 col-md-12 col-sm-12 col-12 register-half-bg d-flex flex-row">
                                    <p class="text-dark font-weight-medium text-center flex-grow align-self-end">Copyright &copy; 2019 Todos los derechos reservados.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </LayoutTemplate>
        </asp:Login>
    </form>
    <script src="../Herramientas/plugins/jquery/jquery-3.4.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

    <script src="../Herramientas/bootstrap/js/bootstrap.js"></script>
    <script src="../Herramientas/estilos/js/vendor.bundle.base.js"></script>
    <script src="../Herramientas/estilos/js/off-canvas.js"></script>
    <script src="../Herramientas/estilos/js/hoverable-collapse.js"></script>
    <script src="../Herramientas/estilos/js/template.js"></script>
    <script src="../Herramientas/estilos/js/todolist.js"></script>
    <script src="../Herramientas/fontawesome/js/all.js"></script>
    <script src="../Herramientas/plugins/daterangepicker/moment.min.js"></script>
    <script src="../Herramientas/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="../Herramientas/estilos/js/jquery.mask.js"></script>

</body>
</html>
