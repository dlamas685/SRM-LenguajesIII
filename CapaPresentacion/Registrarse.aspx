<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="CapaPresentacionExterna.Registrarse" %>

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
    <link href="../Herramientas/plugins/airdatepicker/datepicker.css" rel="stylesheet" />
    <link href="../Herramientas/bootstrap/css/bootsrap-validaciones.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="../Herramientas/plugins/sweetalert/sweetalert2.css" rel="stylesheet" />
    <link href="../Herramientas/bootstrap/css/w3.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet" />
    <link href="../Herramientas/bootstrap/css/pagina-maestra.css" rel="stylesheet" />
    <script src="../Herramientas/plugins/sweetalert/sweetalert2.all.js"></script>
    <script src="../Herramientas/estilos/js/ve-mj-registrarse.js"></script>
    

</head>
<body>
    <form id="fmRegistrarseVistaInterna" runat="server" class="needs-validation" novalidate="novalidate">
       
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-stretch auth auth-img-bg" >
                    <div class="row flex-grow" style="background-image:url(images/8287.jpg);">
                        <div class="col-lg-12 col-xl-7 col-md-12 col-sm-12 col-12 d-flex align-items-center justify-content-center  border-right">
                            <div class="auth-form-transparent text-left border-white bg-white shadow px-5 pb-5 w3-animate-zoom" style="width: 90%;">
                                <div class="brand-logo text-left">
                                    <img src="../Herramientas/estilos/imagenes/fima-logo.png" class="img-fluid" alt="logo" />
                                </div>
                                <div class="container-fluid">
                                    <div class="row px-3">
                                        <h4 class="font-weight-medium">¿Eres nuevo?</h4>
                                    </div>
                                    <div class="row mt-1 px-3">

                                        <h6 class="font-weight-medium text-secondary">¡Unete a nosotros! Solo toma unos pocos pasos.</h6>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12 col-xl-6 col-lg-6 mt-4">
                                            <label class="font-weight-medium">Nombre</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-user-alt text-primary" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtNombreRegistrarPaciente" class="form-control border-left-0" placeholder="* Nombre de paciente." title="Nombre" pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{2,48}" runat="server" required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese un nombre de pila.</div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-12 col-xl-6 col-lg-6 mt-4">
                                            <label class="font-weight-medium">Apellido</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-user-alt text-primary" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtApellidoRegistrarPaciente" runat="server" class="form-control border-left-0" placeholder="* Apellido de paciente." title="Apellido" pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{2,64}" required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese un apellido.</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12 col-xl-6 col-lg-6 mt-4">
                                            <label class="font-weight-medium">DNI</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="ti-user text-primary" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtDniRegistrarPaciente" runat="server" class="form-control border-left-0" placeholder="* Númuero de documento." required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese un DNI.</div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-12 col-xl-6 col-lg-6 mt-4">
                                            <label class="font-weight-medium">Fecha de Nachimiento</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-calendar-alt text-primary" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtFechaNacimientoRegistrarPaciente" runat="server" class="form-control datepicker-here border-left-0" placeholder="* Fecha de nacimiento." required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese una fecha de nacimiento.</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12 col-xl-6 col-lg-6 mt-4">
                                            <label class="font-weight-medium">Email</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-envelope text-primary" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtEmailRegistrarPaciente" TextMode="Email" runat="server" class="form-control border-left-0" placeholder="* Correo electrónico."  title="Dirección de correo electrónico" pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese un email.</div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-12 col-xl-6 col-lg-6 mt-4">
                                            <label class="font-weight-medium">Teléfono</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-phone text-primary" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtTelefonoRegistrarPaciente" TextMode="Phone" runat="server" class="form-control border-left-0" placeholder="* Teléfono celular" required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese un número de teléfono.</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12 col-xl-6 col-lg-6 mt-4">
                                            <label class="font-weight-medium">Dirección</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-map text-primary" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtDireccionRegistrarPaciente" TextMode="SingleLine" runat="server" class="form-control border-left-0" placeholder="* Dirección." required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese una dirección.</div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-12 col-xl-6 col-lg-6 mt-4">
                                            <label class="font-weight-medium">Sexo</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-female text-primary" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <select class="custom-select border-left-0 border-secondary" style="height: 46px;" id="selectSexoRegistrarPaciente" runat="server" required="required">
                                                    <option value="" selected="selected">(Seleccionar sexo)</option>
                                                    <option value="1">Femenino</option>
                                                    <option value="2">Masculino</option>
                                                </select>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, seleccione un sexo.</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12 col-xl-6 col-lg-6 mt-4">
                                            <label class="font-weight-medium">Contraseña</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-lock text-primary" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtContraseñaRegistrarPaciente" TextMode="Password" title="Contraseña" runat="server" class="form-control border-left-0" placeholder="* Contraseña para cuenta" required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese una contraseña.</div>

                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-12 col-xl-6 col-lg-6 mt-4">
                                            <label class="font-weight-medium">Confirmar Contraseña</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-lock text-primary" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtContraseñaConfirmarRegistrarPaciente" TextMode="Password" runat="server" title="Repetir Contraseña" class="form-control border-left-0" placeholder="* Repetir contraseña" required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, repita la contraseña.</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label class="font-weight-medium text-danger" style="display: none;" id="mensajeContraseña">Las contraseñas no coinciden por favor reintentar.</label>

                                        </div>
                                    </div>
                                    <br />
                                    <div class="row mt-4 justify-content-end">
                                        <div class="col-xl-9 col-lg-9 col-md-6 col-12 order-last col-sm-12 order-sm-last order-xl-first order-lg-first order-md-first">
                                            <div class="text-left mt-2 font-weight-light">
                                                ¿Ya tienes una cuenta? <a href="Iniciar_Sesion.aspx" class="text-primary font-weight-bold">Iniciar Sesion</a>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-3 col-md-6 col-12 order-first col-sm-12 order-sm-first order-xl-last order-lg-last order-md-last">
                                            <asp:Button ID="btnRegistrarPaciente" class="btn btn-block btn-success-success w3-hover-white w3-hover-text-teal btn-rounded font-weight-medium text-white" runat="server" Text="Registrarse" OnClick="btnRegistrarPaciente_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-xl-5 col-md-12 col-sm-12 col-12 register-half-bg d-flex flex-row">
                            <p class="text-dark font-weight-medium text-center flex-grow align-self-end">Copyright &copy; 2019 Todos los derechos reservados.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="../Herramientas/plugins/jquery/jquery-3.4.1.js"></script>
    <script src="../Herramientas/plugins/airdatepicker/datepicker.js"></script>
    <script src="../Herramientas/plugins/airdatepicker/i18n/datepicker.es.js"></script>
    <script src="../Herramientas/fontawesome/js/all.js"></script>
    <script src="../Herramientas/estilos/js/ve-registrarse.js"></script>
    <script src="../Herramientas/estilos/js/jquery.mask.js"></script>
    <script src="Herramientas/bootstrap/js/bootstrap.js"></script>
</body>
</html>
