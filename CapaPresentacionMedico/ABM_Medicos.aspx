<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Interna.Master" AutoEventWireup="true" CodeBehind="ABM_Medicos.aspx.cs" Inherits="CapaPresentacionInterna.ABM_Medicos" %>

<%@ MasterType VirtualPath="~/MasterPage-Interna.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Herramientas/plugins/customfile/css/custominputfile.css" rel="stylesheet" />
    <link href="../Herramientas/plugins/airdatepicker/datepicker.css" rel="stylesheet" />

    <script src="Herramientas/estilos/js/mensajes-alert.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="server">
    <form runat="server" id="fmABMMedicos" class="needs-validation" novalidate="novalidate">



        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col">
                    <asp:HiddenField ID="hfIdEspecialidad" runat="server" Value="" />
                    <h3 class="text-center  font-weight-bold">GESTIONAR MÉDICOS</h3>
                </div>
            </div>

        </div>

        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link border border-bottom-0 w3-text-pink bg-white w3-hover-pink" id="nav-registrarMedico-tab" data-toggle="tab" href="#nav-registrarMedico" role="tab" aria-controls="nav-registrarMedico" aria-selected="true" onclick="IrRegistrarMedico()"><i class="fa fa-sign-in-alt"></i><span class="ml-1">REGISTRAR MÉDICO</span> </a>
                <a class="nav-item nav-link border border-bottom-0 w3-text-pink bg-white w3-hover-pink" id="nav-modificarMedicos-tab" data-toggle="tab" href="#nav-modificarMedicos" role="tab" aria-controls="nav-modificarMedicos" aria-selected="false" onclick="IrListaMedico()"><i class="fa fa-list-ol"></i><span class="ml-1">LISTA DE MÉDICOS</span></a>
            </div>
        </nav>
        <div class="tab-content bg-white shadow rounded-bottom" id="nav-tabContent">


            <div class="tab-pane fade show active px-5 py-5 w3-animate-zoom" id="nav-registrarMedico" role="tabpanel" aria-labelledby="nav-registrarMedico-tab">
                <div class="container-fluid ">
                    <div class="row">
                        <div class="col">
                            <div class="card shadow w3-border-pink border-top border-left-0 border-right-0 border-bottom-0">
                                <div class="card-body ">
                                    <div class="container-fluid py-4 px-4">
                                        <div class="row">
                                            <label class="font-weight-medium">Nombre:</label>
                                        </div>
                                        <div class="row">
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-user-alt w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtNombreRegistrarMedico" class="form-control" placeholder="* Ingresar el nombre del médico." title="Nombre" pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{2,48}" runat="server" required="required" ></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                            </div>

                                        </div>
                                        <div class="row mt-4">
                                            <label class="font-weight-medium">Apellido:</label>
                                        </div>
                                        <div class="row">
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-user-alt w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtApellidoRegistrarMedico" class="form-control" placeholder="* Ingresar el apellido del médico." title="Apellido" pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{2,64}" runat="server" required="required" ></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <label class="font-weight-medium">CUIL:</label>
                                        </div>
                                        <div class="row">
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-address-card w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtCuilRegistrarMedico" class="form-control" placeholder="* Ingresar el CUIL del médico." runat="server" required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <label class="font-weight-medium">Teléfono:</label>
                                        </div>
                                        <div class="row">
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-phone w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtTelefonoRegistrarMedico" class="form-control" placeholder="* Ingresar el número de telefono del médico." runat="server" required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <label class="font-weight-medium">Sexo:</label>
                                        </div>
                                        <div class="row pb-4">
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-female w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <select class="custom-select" style="height: 46px;" id="selectSexoRegistrarMedico" runat="server" required="required">
                                                    <option value="" selected="selected">(Seleccionar sexo)</option>
                                                    <option value="1">Femenino</option>
                                                    <option value="2">Masculino</option>
                                                </select>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, seleccione un sexo.</div>
                                            </div>
                                        </div>
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card shadow w3-border-pink border-top border-left-0 border-right-0 border-bottom-0">
                                <div class="card-body ">
                                    <div class="container-fluid py-4 px-4">
                                        <div class="row ">
                                            <label class="font-weight-medium">Fecha de Nacimiento:</label>
                                        </div>
                                        <div class="row">
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-calendar-alt w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtFechaNacimientoRegistrarMedico" class="form-control datepicker-here" placeholder="* Ingresar la fecha de nacimiento del médico." runat="server" required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <label class="font-weight-medium">Especialidad:</label>
                                        </div>
                                        <div class="row">
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-star w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <select class="custom-select" style="height: 46px;" id="selectEspecialidadesRegistrarMedico" runat="server" required="required">
                                                    <option value="" selected="selected">(Seleccionar especialidad)</option>
                                                </select>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, seleccione una especialidad.</div>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <label class="font-weight-medium">Descripción:</label>
                                        </div>
                                        <div class="row">
                                            <div class="input-group">
                                                <asp:TextBox ID="txtDescripcionRegistrarMedico" Rows="3" TextMode="MultiLine" class="form-control" placeholder="Ingresar una descripcion para el médico." runat="server"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <label class="font-weight-medium">Foto:</label>
                                        </div>
                                        <div class="row ">
                                            <div class="form-group w-100">
                                                <input type="file" name="img[]" id="fuploadFotoMedico" class="file-upload-default" accept=".jpg, .jpeg, .png" runat="server" onchange="previewFileRegistrar()">
                                                <div class="input-group col-xs-12">
                                                    <input type="text" class="form-control file-upload-info" readonly placeholder="Seleccionar imagen" id="txtImagenRegistrarMedico" style="height: 46px;">
                                                    <span class="input-group-append">
                                                        <button class="file-upload-browse btn btn-inverse-info border border-left-0" type="button"><i class="glyphicon glyphicon-folder-open"></i><span class="ml-2">Subir</span></button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-sm-12 col-md-12 col-lg-2 col-xl-4">
                                                <img id="imagenRegistrarMedico" class="img-thumbnail img-lg" runat="server" src="~/Fotos/masculino.jpg" />
                                            </div>
                                            <div class="col-12 col-sm-12 col-md-12 col-lg-10 col-xl-8">
                                                <button class="btn btn-inverse-danger btn-rounded my-4" type="button" onclick="trashFotoRegistrar()" id="btnSinFotoRegistrarMedico" style="display: none;"><i class="fa fa-trash-alt"></i><span class="ml-1"></span>Sin foto</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row justify-content-end mt-4 ">
                        <div class="col-xl-3">
                            <asp:Button ID="btnRegistrarMedico" CssClass="btn text-white w3-hover-white btn-success-success w3-hover-text-teal btn-block" runat="server" Text="Registrar" OnClick="btnRegistrarMedico_Click" />
                        </div>
                        <div class="col-xl-3">
                            <button class="btn btn-secondary text-white w3-hover-white w3-hover-text-dark border-secondary btn-block" type="button" onclick="limpiarCampos()">Limpiar Campos</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade py-4 w3-animate-zoom" id="nav-modificarMedicos" role="tabpanel" aria-labelledby="nav-modificarMedicos-tab">
                <div class="container-fluid">
                    <div class="row mt-3">
                        <div class="col px-5">
                            <div class="card shadow border-0">
                                <div class="card-header bg-white border-0">
                                    <div class="row mt-3">
                                        <div class="col">
                                            <span class="text-dark font-weight-medium">LISTA DE MÉDICOS REGISTRADOS</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table id="ListaMedicos" class="table table-borderless table-hover text-center bg-light" style="width:100%">
                                        <thead class="w3-pale-red w3-text-pink" >
                                            <tr>
                                                <th>N#</th>
                                                <th>Imagen</th>
                                                <th>Apellido y Nombre</th>
                                                <th>Fecha de Nacimiento</th>
                                                <th>CUIL</th>
                                                <th>Edad</th>
                                                <th>Sexo</th>
                                                <th>ID Especialidad</th>
                                                <th>Especialidad</th>
                                                <th>Teléfono</th>
                                                <th>Descripción</th>
                                                <th>Estado Foto</th>
                                                <th>Modificar</th>
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

        <div class="modal fade" id="modalModificarMedico" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:HiddenField ID="hfIdEspecialidadModificar" runat="server" Value="" />
                        <asp:HiddenField ID="hfIdMedico" runat="server" Value="" />
                        <h5 class="modal-title font-weight-bolder m-auto">MODIFICAR MÉDICO</h5>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid px-5 py-4">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-2 col-xl-2">
                                    <div class="row px-3">
                                        <img id="imagenMedico" class="img-thumbnail img-lg" runat="server" />
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-10 col-xl-10 px-4">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Foto:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="form-group w-100">
                                            <input type="file" name="img[]" id="fuploadMedicoModificar" accept="image/*" class="file-upload-default" onchange="previewFile()" runat="server">
                                            <div class="input-group col-xs-12">
                                                <input type="text" id="txtImagenModificar" runat="server" class="form-control file-upload-info" readonly placeholder="* Cambiar imagen" style="height: 46px;">
                                                <span class="input-group-append">
                                                    <button class="file-upload-browse btn btn-inverse-primary border border-left-0 rounded-0" type="button"><i class="glyphicon glyphicon-folder-open"></i><span class="ml-2">Subir</span></button>
                                                </span>
                                                <button class="btn btn-inverse-danger border border-left-0 rounded-0" id="btnQuitarImagen" type="button" onclick="trashFile()"><i class="fa fa-trash-alt"></i><span class="ml-1">Sin foto</span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row mt-5">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Nombre:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-user-alt w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtNombreMedicoModificar" class="form-control" placeholder="* Ingresar el nombre del médico." runat="server" title="Nombre" pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{2,48}"></asp:TextBox>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Apellido:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-user-alt w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtApellidoMedicoModificar" class="form-control" placeholder="* Ingresar el apellido del médico." runat="server"  title="Apellido" pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{2,64}"></asp:TextBox>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">CUIL:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-address-card w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtCuilMedicoModificar" class="form-control" placeholder="* Ingresar el CUIL del médico." runat="server"></asp:TextBox>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Teléfono:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-phone w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtTelefonoMedicoModificar" class="form-control" placeholder="* Ingresar el número de telefono del médico." runat="server"></asp:TextBox>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Sexo:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-female w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <select class="custom-select" style="height: 46px;" id="selectSexoMedicoModificar" runat="server">
                                                <option value="" selected="selected">(Seleccionar sexo)</option>
                                                <option value="1">Femenino</option>
                                                <option value="2">Masculino</option>
                                            </select>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, seleccione un sexo.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Fecha de Nacimiento:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-calendar-alt w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtFechaNacimientoMedicoModificar" class="form-control" placeholder="* Ingresar la fecha de nacimiento del médico." runat="server"></asp:TextBox>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Especialidad:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-star w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <select class="custom-select" style="height: 46px;" id="selectEspecialidadMedicoModificar" runat="server">
                                                <option value="" selected="selected">(Seleccionar especialidad)</option>
                                            </select>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, seleccione una especialidad.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Descripción:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                            <asp:TextBox ID="txtDescripcionMedicoModificar" Rows="3" TextMode="MultiLine" class="form-control" placeholder="* Ingresar una descripcion para el médico." runat="server"></asp:TextBox>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnModificarMedico" runat="server" CssClass="btn btn-primary w3-text-white w3-hover-white w3-hover-text-blue btn-sm float-right" OnClick="btnModificarMedico_Click" Text="Modificar" />
                        <button type="button" class="btn btn-secondary w3-text-white w3-hover-white w3-hover-text-black btn-sm float-right" onclick="cerrarModalModificarMedico()"><i class="fa fa-times"></i><span class="ml-1">Salir</span></button>
                    </div>
                </div>
            </div>
        </div>

    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="Herramientas/estilos/js/file-upload.js"></script>

    <script src="../Herramientas/plugins/airdatepicker/datepicker.js"></script>
    <script src="../Herramientas/plugins/airdatepicker/i18n/datepicker.es.js"></script>
    <script src="../Herramientas/plugins/customfile/js/jquery.Jcrop.min.js"></script>
    <script src="../Herramientas/plugins/customfile/js/custominputfile.min.js"></script>
    <script src="../Herramientas/plugins/customfile/js/custominputfile.min-es.js"></script>

    <script src="../Herramientas/estilos/js/abm-medicos.js"></script>



</asp:Content>
