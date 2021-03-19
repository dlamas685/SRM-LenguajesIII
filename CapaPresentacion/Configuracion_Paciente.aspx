<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Externa.Master" AutoEventWireup="true" CodeBehind="Configuracion_Paciente.aspx.cs" Inherits="CapaPresentacionExterna.Configuracion_Paciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cabecera" runat="server">
    <link href="../Herramientas/estilos/css/configuracion.css" rel="stylesheet" />
    <link href="Herramientas/plugins/airdatepicker/datepicker.css" rel="stylesheet" />
    <script src="Herramientas/estilos/js/mensajes-alert.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPacientes" runat="server">
    <form runat="server" id="fmConfiguracion" class="needs-validation" novalidate="novalidate">
        <div class="container-fluid w3-animate-zoom">
            <div class="row">
                <div class="col">
                    <div class="card shadow-none w3-border-teal border-top border-left-0 border-right-0 border-bottom-0">
                        <div class="card-body ">
                            <div class="container-fluid pt-2 pb-2 px-4">
                                <div class="row">
                                    <div class="col">
                                        <h5 class="font-weight-bold">DETALLES PERSONALES</h5>
                                        <asp:HiddenField ID="hfFechaNacimiento" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <h6 class="text-secondary">Administra los detalles personales que compartiste con FIMA, incluso tu nombre, información de contacto y más.</h6>
                                    </div>
                                </div>
                                <div class="row mt-3">

                                    <div class="col-xl-2 pt-2">
                                        <div class="row">
                                            <div class="col-12 col-sm-12 col-md-12 col-lg-2 col-xl-3">
                                                <img id="imagenModificarPaciente" class="img-lg" runat="server" src="~/Fotos/masculino.jpg" />
                                            </div>

                                        </div>
                                        <div class="row px-3 mt-4 pt-2">
                                            <div class="form-group w-100">
                                                <input type="file" name="img[]" id="fuploadFotoPaciente" class="file-upload-default " accept=".jpg, .jpeg, .png" runat="server" onchange="previewFileModificar()">
                                                <div class="input-group">
                                                    <input type="text" class="form-control file-upload-info d-none" readonly placeholder="* Seleccionar imagen" id="txtImagenModificarPaciente" runat="server">
                                                    <span class="input-group-append">
                                                        <button class="file-upload-browse btn btn-inverse-info rounded-0 border-light btn-sm w3-animate-zoom" style="width:89px;" type="button"><i class="glyphicon glyphicon-folder-open"></i><span class="ml-2"></span>Subir</button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-sm-12 col-md-12 col-lg-2 col-xl-12">
                                                <button class="btn btn-inverse-danger rounded-0 btn-sm w3-animate-zoom" type="button" onclick="trashFotoModificar()" id="btnSinFotoModificarPaciente" ><i class="fa fa-trash-alt"></i><span class="ml-1"></span>Sin foto</button>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="row">
                                            <div class="col">
                                                <label class="font-weight-normal">Nombre</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend bg-transparent">
                                                        <span class="input-group-text bg-transparent border-right-0">
                                                            <i class="fa fa-user-alt w3-text-teal" style="width: 20px;"></i>
                                                        </span>
                                                    </div>
                                                    <asp:TextBox ID="txtNombreModificarPaciente" class="form-control border-left-0" placeholder="* Nombre de paciente." runat="server" required="required" title="Nombre" pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{2,48}"></asp:TextBox>
                                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                    <div class="invalid-feedback font-size-15">Por favor, ingrese un nombre de pila.</div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <label class="font-weight-normal">Apellido</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend bg-transparent">
                                                        <span class="input-group-text bg-transparent border-right-0">
                                                            <i class="fa fa-user-alt w3-text-teal" style="width: 20px;"></i>
                                                        </span>
                                                    </div>
                                                    <asp:TextBox ID="txtApellidoModificarPaciente" runat="server" class="form-control border-left-0" placeholder="* Apellido de paciente." required="required" title="Apellido" pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{2,64}"></asp:TextBox>
                                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                    <div class="invalid-feedback font-size-15">Por favor, ingrese un apellido.</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-4">
                                            <div class="col">
                                                <label class="font-weight-normal">DNI</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend bg-transparent">
                                                        <span class="input-group-text bg-transparent border-right-0">
                                                            <i class="fa fa-address-card w3-text-teal" style="width: 20px;"></i>
                                                        </span>
                                                    </div>
                                                    <asp:TextBox ID="txtDniModificarPaciente" runat="server" class="form-control border-left-0" placeholder="* Número de documento." required="required"></asp:TextBox>
                                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                    <div class="invalid-feedback font-size-15">Por favor, ingrese un DNI.</div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <label class="font-weight-normal">Fecha de Nacimiento</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend bg-transparent">
                                                        <span class="input-group-text bg-transparent border-right-0">
                                                            <i class="fa fa-calendar-alt w3-text-teal" style="width: 20px;"></i>
                                                        </span>
                                                    </div>
                                                    <asp:TextBox ID="txtFechaNacimientoModificarPaciente" runat="server" class="form-control datepicker-here border-left-0" placeholder="* Fecha de nacimiento." required="required"></asp:TextBox>
                                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                    <div class="invalid-feedback font-size-15">Por favor, ingrese una fecha de nacimiento.</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-4">
                                            <div class="col">
                                                <label class="font-weight-normal">Email</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend bg-transparent">
                                                        <span class="input-group-text bg-transparent border-right-0">
                                                            <i class="fa fa-envelope w3-text-teal" style="width: 20px;"></i>
                                                        </span>
                                                    </div>
                                                    <asp:TextBox ID="txtEmailModificarPaciente" TextMode="Email" runat="server" class="form-control border-left-0" placeholder="* Correo electrónico." required="required"></asp:TextBox>
                                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                    <div class="invalid-feedback font-size-15">Por favor, ingrese una direccion de correo electronico.</div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <label class="font-weight-normal">Teléfono</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend bg-transparent">
                                                        <span class="input-group-text bg-transparent border-right-0">
                                                            <i class="fa fa-phone w3-text-teal" style="width: 20px;"></i>
                                                        </span>
                                                    </div>
                                                    <asp:TextBox ID="txtTelefonoModificarPaciente" TextMode="Phone" runat="server" class="form-control border-left-0" placeholder="* Teléfono celular (opcional)."></asp:TextBox>
                                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                    <div class="invalid-feedback font-size-15">Por favor, ingrese un número de telefono celular.</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <div class="col">
                                                <label class="font-weight-normal">Dirección</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend bg-transparent">
                                                        <span class="input-group-text bg-transparent border-right-0">
                                                            <i class="fa fa-map w3-text-teal" style="width: 20px;"></i>
                                                        </span>
                                                    </div>
                                                    <asp:TextBox ID="txtDireccionModificarPaciente" TextMode="SingleLine" runat="server" class="form-control border-left-0" placeholder="* Dirección." required="required"></asp:TextBox>
                                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                    <div class="invalid-feedback font-size-15">Por favor, ingrese una direccion.</div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <label class="font-weight-normal">Sexo</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend bg-transparent">
                                                        <span class="input-group-text bg-transparent border-right-0">
                                                            <i class="fa fa-female w3-text-teal" style="width: 20px;"></i>
                                                        </span>
                                                    </div>
                                                    <select class="custom-select border-left-0" style="height: 46px;" id="selectSexoModificarPaciente" runat="server" required="required">
                                                        <option value="" selected="selected">(Seleccionar sexo)</option>
                                                        <option value="1">Femenino</option>
                                                        <option value="2">Masculino</option>
                                                    </select>
                                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                    <div class="invalid-feedback font-size-15">Por favor, seleccione un sexo.</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row justify-content-end mt-5">
                                    <div class="col-xl-2">
                                        <asp:Button ID="btnGuardarCambios" runat="server" CssClass="btn text-white btn-success-success w3-hover-white w3-hover-text-teal btn-block" Text="Guardar" OnClick="btnGuardarCambios_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>


    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pie" runat="server">
    <script src="Herramientas/estilos/js/file-upload.js"></script>
    <script src="Herramientas/plugins/airdatepicker/datepicker.js"></script>
    <script src="Herramientas/plugins/airdatepicker/i18n/datepicker.es.js"></script>

    <script src="../Herramientas/estilos/js/configuracion.js"></script>

</asp:Content>
