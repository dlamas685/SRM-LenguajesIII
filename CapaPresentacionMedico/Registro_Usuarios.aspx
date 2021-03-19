<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Interna.Master" AutoEventWireup="true" CodeBehind="Registro_Usuarios.aspx.cs" Inherits="CapaPresentacionInterna.Registro_Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Herramientas/estilos/js/mensajes-alert.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="server">
    <form runat="server" id="fmRegistroUsuarios" class="needs-validation" novalidate="novalidate">

        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col">
                    <asp:HiddenField ID="hfIdEspecialidad" runat="server" Value="" />
                    <h3 class="text-center  font-weight-bold">GESTIONAR USUARIOS</h3>
                </div>
            </div>

        </div>

        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link border border-bottom-0 w3-text-pink bg-white w3-hover-pink" id="nav-registrarUsuario-tab" data-toggle="tab" href="#nav-registrarUsuario" role="tab" aria-controls="nav-registrarUsuario" aria-selected="true" onclick="IrRegistrarUsuario()"><i class="fa fa-sign-in-alt"></i><span class="ml-1">REGISTRAR USUARIO</span> </a>
                <a class="nav-item nav-link border border-bottom-0 w3-text-pink bg-white w3-hover-pink" id="nav-modificarUsuarios-tab" data-toggle="tab" href="#nav-modificarUsuarios" role="tab" aria-controls="nav-modificarUsuarios" aria-selected="false" onclick="IrListaUsuario()"><i class="fa fa-list-ol"></i><span class="ml-1">LISTA DE USUARIOS</span></a>
            </div>
        </nav>
        <div class="tab-content bg-white shadow rounded-bottom" id="nav-tabContent">


            <div class="tab-pane fade show active px-5 py-5 w3-animate-zoom" id="nav-registrarUsuario" role="tabpanel" aria-labelledby="nav-registrarUsuario-tab">
                <div class="container-fluid ">
                    <div class="row">
                        <div class="col">
                            <div class="card shadow w3-border-pink border-top border-left-0 border-right-0 border-bottom-0">
                                <div class="card-body ">
                                    <div class="container-fluid py-4 px-4">
                                        <div class="row">
                                            <div class="col">
                                                <div class="row px-2">
                                                    <label class="font-weight-medium">Nombre:</label>
                                                </div>
                                                <div class="row px-2">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend bg-transparent">
                                                            <span class="input-group-text bg-transparent border-right-0">
                                                                <i class="fa fa-user-alt w3-text-pink" style="width: 20px;"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox ID="txtNombreRegistrarUsuario" class="form-control" placeholder="* Ingresar el nombre del empleado." title="Nombre" pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{2,48}" runat="server" required="required"></asp:TextBox>
                                                        <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                        <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="row px-2">
                                                    <label class="font-weight-medium">Apellido:</label>
                                                </div>
                                                <div class="row px-2">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend bg-transparent">
                                                            <span class="input-group-text bg-transparent border-right-0">
                                                                <i class="fa fa-user-alt w3-text-pink" style="width: 20px;"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox ID="txtApellidoRegistrarUsuario" class="form-control" placeholder="* Ingresar el apellido del empleado." title="Apellido" pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{2,64}" runat="server" required="required"></asp:TextBox>
                                                        <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                        <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <div class="col">
                                                <div class="row px-2">
                                                    <label class="font-weight-medium">Usuario:</label>
                                                </div>
                                                <div class="row px-2">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend bg-transparent">
                                                            <span class="input-group-text bg-transparent border-right-0">
                                                                <i class="fa fa-user-plus w3-text-pink" style="width: 20px;"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox ID="txtUsuarioRegistrarUsuario" class="form-control" placeholder="* Ingresar un nombre de usuario para el empleado." runat="server" required="required"></asp:TextBox>
                                                        <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                        <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="row px-2">
                                                    <label class="font-weight-medium">Contraseña:</label>
                                                </div>
                                                <div class="row px-2">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend bg-transparent">
                                                            <span class="input-group-text bg-transparent border-right-0">
                                                                <i class="fa fa-lock w3-text-pink" style="width: 20px;"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox ID="txtContraseñaRegistrarUsuario" class="form-control" TextMode="Password" placeholder="* Ingresar una contraseña para el empleado." runat="server" required="required"></asp:TextBox>
                                                        <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                        <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <div class="col">
                                                <div class="row px-2">
                                                    <label class="font-weight-medium">Foto:</label>
                                                </div>
                                                <div class="row px-2">
                                                    <div class="form-group w-100">
                                                        <input type="file" name="img[]" id="fuploadFotoUsuario" class="file-upload-default" accept=".jpg, .jpeg, .png" runat="server" onchange="previewFileRegistrar()">
                                                        <div class="input-group col-xs-12">
                                                            <input type="text" class="form-control file-upload-info" readonly placeholder="Seleccionar imagen" id="txtImagenRegistrarUsuario" runat="server" style="height: 46px;">
                                                            <span class="input-group-append">
                                                                <button class="file-upload-browse btn btn-inverse-info border border-left-0" type="button"><i class="glyphicon glyphicon-folder-open"></i><span class="ml-2">Subir</span></button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row px-2">
                                                    <div class="col-12 col-sm-12 col-md-12 col-lg-2 col-xl-4">
                                                        <img id="imagenRegistrarUsuario" class="img-thumbnail img-lg" runat="server" src="~/Fotos/user.jpg" />
                                                    </div>
                                                    <div class="col-12 col-sm-12 col-md-12 col-lg-10 col-xl-8">
                                                        <button class="btn btn-inverse-danger btn-rounded my-4 w3-animate-zoom float-left" type="button" onclick="trashFotoRegistrar()" id="btnSinFotoRegistrarUsuario" style="display: none;"><i class="fa fa-trash-alt"></i><span class="ml-1"></span>Sin foto</button>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="row justify-content-end mt-4 ">
                        <div class="col-xl-3 col-lg-4">
                            <asp:Button ID="btnRegistrarUsuario" CssClass="btn text-white w3-hover-white btn-success-success w3-hover-text-teal btn-block" runat="server" Text="Registrar" OnClick="btnRegistrarUsuario_Click" />
                        </div>

                    </div>
                </div>
            </div>
            <div class="tab-pane fade py-4 w3-animate-zoom" id="nav-modificarUsuarios" role="tabpanel" aria-labelledby="nav-modificarUsuarios-tab">
                <div class="container-fluid">
                    <div class="row mt-3">
                        <div class="col px-5">
                            <div class="card shadow border-0">
                                <div class="card-header bg-white border-0">
                                    <div class="row mt-3">
                                        <div class="col">
                                            <span class="text-dark font-weight-medium">LISTA DE USUARIOS REGISTRADOS</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table id="ListaEmpleados" class="table table-borderless table-hover text-center bg-light" style="width: 100%">
                                        <thead class="w3-pale-red w3-text-pink">
                                            <tr>
                                                <th>ID</th>
                                                <th>N#</th>
                                                <th>Imagen</th>
                                                <th>Nombre de Usuario</th>
                                                <th>Apellido y Nombre</th>
                                                <th>Fecha de Creacion</th>
                                                <th>Eliminar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>

                                    </table>


                                </div>
                            </div>
                        </div>
                    </div>

                    <br />


                </div>
            </div>


        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="Herramientas/estilos/js/registro-usuarios.js"></script>
    <script src="Herramientas/estilos/js/file-upload.js"></script>

    
</asp:Content>
