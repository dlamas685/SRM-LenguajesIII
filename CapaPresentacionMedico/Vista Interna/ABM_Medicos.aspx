<%@ Page Title="" Language="C#" MasterPageFile="~/Vista Interna/MasterPage-Clinica.Master" AutoEventWireup="true" CodeBehind="ABM_Medicos.aspx.cs" Inherits="CapaPresentacion.Vista_Interna.ABM_Medicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Herramientas/plugins/customfile/css/custominputfile.css" rel="stylesheet" />
    <link href="../Herramientas/plugins/airdatepicker/datepicker.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="server">
    <form runat="server" id="fmABMMedicos" class="needs-validation" novalidate="novalidate">
        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col">
                    <h3 class="text-center">REGISTRAR MEDICOS</h3>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card shadow-none w3-border-pink border-top border-left-0 border-right-0 border-bottom-0">
                        <div class="card-body ">
                            <div class="container-fluid py-4 px-4">
                                <div class="row">
                                    <label class="font-weight-medium">Nombre:</label>
                                </div>
                                <div class="row">
                                    <div class="input-group">
                                        <div class="input-group-prepend bg-transparent">
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-user-alt w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="txtRegistrarMedico" class="form-control" placeholder="* Ingresar el nombre del medico." runat="server" required="required"></asp:TextBox>
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
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-user-alt w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="txtApellidoRegistrarMedico" class="form-control" placeholder="* Ingresar el apellido del medico." runat="server" required="required"></asp:TextBox>
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
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-address-card w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="txtCuilRegistrarMedico" class="form-control" placeholder="* Ingresar el CUIL del medico." runat="server" required="required"></asp:TextBox>
                                        <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                        <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <label class="font-weight-medium">Telefono:</label>
                                </div>
                                <div class="row">
                                    <div class="input-group">
                                        <div class="input-group-prepend bg-transparent">
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-phone w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="txtTelefonoRegistrarMedico" class="form-control" placeholder="* Ingresar el número de telefono del medico." runat="server" required="required"></asp:TextBox>
                                        <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                        <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <label class="font-weight-medium">Sexo:</label>
                                </div>
                                <div class="row pb-5">
                                    <div class="input-group">
                                        <div class="input-group-prepend bg-transparent">
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-female w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <select class="custom-select form-control border" style="height: 46px; outline: none; cursor: pointer;" id="selectSexoRegistrarMedico" runat="server" required="required">
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
                    <div class="card shadow-none w3-border-pink border-top border-left-0 border-right-0 border-bottom-0">
                        <div class="card-body ">
                            <div class="container-fluid py-4 px-4">
                                <div class="row ">
                                    <label class="font-weight-medium">Fecha de Nacimiento:</label>
                                </div>
                                <div class="row">
                                    <div class="input-group">
                                        <div class="input-group-prepend bg-transparent">
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-calendar-alt w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="txtFechaNacimientoRegistrarMedico" class="form-control datepicker-here" placeholder="* Ingresar la fecha de nacimiento del medico." runat="server" required="required"></asp:TextBox>
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
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-star w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <select class="custom-select form-control border" style="height: 46px; outline: none; cursor: pointer;" id="select1" runat="server" required="required">
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
                                        <asp:TextBox ID="txtDescripcionRegistrarMedico" Rows="3" TextMode="MultiLine" class="form-control" placeholder="* Ingresar una descripcion para el medico (opcional)." runat="server"></asp:TextBox>
                                        <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                        <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <label class="font-weight-medium">Foto:</label>
                                </div>
                                <div class="row ">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtFotoRegistrarMedico" runat="server" required="required"></asp:TextBox>
                                        <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                        <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-end mt-3">
                <div class="col-xl-3">
                    <button class="btn text-white w3-hover-white w3-hover-text-teal btn-block" style="background: #29cc97; border-color: #29cc97;"><i class="fa fa-sign-in-alt"></i><span class="ml-1">Registrar</span></button>
                </div>
                <div class="col-xl-3">
                    <button class="btn btn-secondary text-white w3-hover-white w3-hover-text-dark border-secondary btn-block"><i class="fa fa-trash-alt"></i><span class="ml-1"></span>Limpiar Campos</button>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <div class="card shadow-none w3-border-pink border-top border-left-0 border-right-0 border-bottom-0">
                        <div class="card-header bg-white border-0">
                            <h4>Lista de Medicos</h4>
                        </div>
                        <div class="card-body ">
                            <table id="ListaMedicos" class="table table-striped table-borderless table-hover w3-pink" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Imagen</th>
                                        <th>Nombre</th>
                                        <th>Apellido</th>
                                        <th>DNI</th>
                                        <th>Edad</th>
                                        <th>Especialidad</th>
                                        <th>Telefono</th>
                                        <th>Sexo</th>
                                        <th>Descripción</th>
                                        <th>Modificar</th>
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>

                            </table>
                            <div class="row justify-content-end mt-3">
                                <div class="col-xl-2">
                                    <button class="btn w3-pink text-white w3-hover-white w3-hover-text-pink w3-border-pink btn-sm float-right" type="button" onclick="abrirModalModificarMedico()"><i class="fa fa-plus-square"></i><span class="ml-1"></span>Modificar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modalModificarMedico" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bolder m-auto">MODIFICAR MÉDICO</h5>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid px-5 py-4">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Nombre:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                        <div class="input-group-prepend bg-transparent">
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-user-alt w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="txtNombreMedicoModificar" class="form-control" placeholder="* Ingresar el nombre del medico." runat="server"></asp:TextBox>
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
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-user-alt w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="txtApellidoMedicoModificar" class="form-control" placeholder="* Ingresar el apellido del medico." runat="server"></asp:TextBox>
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
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-address-card w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="txtCuilMedicoModificar" class="form-control" placeholder="* Ingresar el CUIL del medico." runat="server"></asp:TextBox>
                                        <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                        <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                    </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Telefono:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                        <div class="input-group-prepend bg-transparent">
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-phone w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="txtTelefonoMedicoModificar" class="form-control" placeholder="* Ingresar el número de telefono del medico." runat="server"></asp:TextBox>
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
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-female w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <select class="custom-select form-control border text-black" style="height: 46px; outline: none; cursor: pointer;" id="selectSexoMedicoModificar" runat="server">
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
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-calendar-alt w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="txtFechaNacimientoMedicoModificar" class="form-control" placeholder="* Ingresar la fecha de nacimiento del medico." runat="server"></asp:TextBox>
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
                                            <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                <i class="fa fa-star w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <select class="custom-select form-control border" style="height: 46px; outline: none; cursor: pointer;" id="selectEspecialidadMedicoModificar" runat="server" required="required">
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
                            <div class="row mt-4">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-12">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Foto:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                        <asp:TextBox ID="txtFotoMedicoModificar" runat="server"></asp:TextBox>
                                        <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                        <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                    </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success-success w3-text-white w3-hover-white w3-hover-text-teal btn-sm float-right" onclick="modificarMedico()"><i class="fa fa-edit"></i><span class="ml-1">Modificar</span></button>
                        <button type="button" class="btn btn-secondary w3-text-white w3-hover-white w3-hover-text-black btn-sm float-right" onclick="cerrarModalModificarMedico()"><i class="fa fa-times"></i><span class="ml-1">Salir</span></button>
                    </div>
                </div>
            </div>
        </div>

    </form>
</asp:Content>

<asp:Content ID="content3" ContentPlaceHolderID="footer" runat="server">
    <script src="../Herramientas/plugins/airdatepicker/datepicker.js"></script>
    <script src="../Herramientas/plugins/airdatepicker/i18n/datepicker.es.js"></script>
    <script src="../Herramientas/plugins/customfile/js/jquery.Jcrop.min.js"></script>
    <script src="../Herramientas/plugins/customfile/js/custominputfile.min.js"></script>
    <script src="../Herramientas/plugins/customfile/js/custominputfile.min-es.js"></script>
    <script src="../Herramientas/estilos/js/abm-medicos.js"></script>
</asp:Content>
