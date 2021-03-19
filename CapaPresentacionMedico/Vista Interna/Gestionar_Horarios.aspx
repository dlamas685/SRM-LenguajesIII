<%@ Page Title="" Language="C#" MasterPageFile="~/Vista Interna/MasterPage-Clinica.Master" AutoEventWireup="true" CodeBehind="Gestionar_Horarios.aspx.cs" Inherits="CapaPresentacion.Vista_Interna.Gestionar_Horarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Herramientas/plugins/airdatepicker/datepicker.css" rel="stylesheet" />
    <link href="../Herramientas/plugins/mdtimepicker/mdtimepicker.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="server">

    <form runat="server" id="fmGestionarHorarios" class="needs-validation" novalidate="novalidate">
        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col">
                    <h3 class="text-center">REGISTRAR HORARIOS PARA MEDICOS</h3>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card shadow-none w3-border-pink border-top border-left-0 border-right-0 border-bottom-0">
                        <div class="card-body ">
                            <div class="container-fluid py-4 px-4">
                                <div class="row">
                                    <div class="col">
                                        <div class="row">
                                            <label class="font-weight-medium">Seleccionar Médico:</label>
                                        </div>
                                        <div class="row">
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                        <i class="fa fa-user-md w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <select class="custom-select form-control border border-left border-secondary border-secondary text-black" style="height: 46px; outline: none; cursor: pointer;" id="selectMedicoRegistrarHorarios" runat="server" required="required">
                                                    <option value="" selected="selected">(Seleccionar médico)</option>
                                                </select>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, seleccione un médico.</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="row mx-2">
                                            <label class="font-weight-medium">DNI:</label>
                                        </div>
                                        <div class="row mx-2">
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                        <i class="fa fa-address-card w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtDniRegistrarHorarios" ReadOnly="true" class="form-control border-left border-secondary" placeholder="* DNI del médico" runat="server" required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <div class="row">
                                            <label class="font-weight-medium">Especialidad:</label>
                                        </div>
                                        <div class="row">
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                        <i class="fa fa-star w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtEspecialidadRegistrarMedico" ReadOnly="true" class="form-control border-left border-secondary" placeholder="* Especialidad del médico" runat="server" required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="row mx-2">
                                            <label class="font-weight-medium">Sexo:</label>
                                        </div>
                                        <div class="row mx-2">
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                        <i class="fa fa-female w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtSexoRegistrarMedico" ReadOnly="true" class="form-control border-left border-secondary" placeholder="* Sexo del médico" runat="server" required="required"></asp:TextBox>
                                                <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                                <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row mt-3">
                <div class="col">
                    <div class="card shadow-none w3-border-pink border-top border-left-0 border-right-0 border-bottom-0">
                        <div class="card-header bg-white border-0">
                            <h5>HORARIOS DE ATENCION</h5>
                            <span class="ml-1" id="spanRangoFecha"></span>
                        </div>
                        <div class="card-body ">
                            <table id="ListaHorarios" class="table table-striped table-bordered table-hover w3-pink" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Modificar</th>
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <div class="row justify-content-end mt-3">
                                <div class="col-xl-2">
                                    <button class="btn w3-pink text-white w3-hover-white w3-hover-text-pink w3-border-pink btn-sm float-right" type="button" onclick="abriModalHorarios()"><i class="fa fa-plus-square"></i><span class="ml-1"></span>Agregar horario</button>
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
                    <button class="btn btn-primary text-white w3-hover-white w3-hover-text-blue border-primary btn-block"><i class="fa fa-arrow-alt-circle-left"></i><span class="ml-1"></span>Volver</button>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalHorariosAtencion" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">HORARIOS DE ATENCIÓN</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid px-5 py-4">
                            <div class="row">
                                <label class="font-weight-medium">Fecha de Atención:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <div class="input-group-prepend bg-transparent">
                                        <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                            <i class="fa fa-calendar-alt w3-text-pink" style="width: 20px;"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="txtFechaAtencion" class="form-control datepicker-here border-left border-secondary" placeholder="* Ingresar fecha de atención." runat="server" required="required"></asp:TextBox>
                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                    <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                </div>
                            </div>
                            <div class="row mt-5">
                                <label class="font-weight-medium">Hora de Atención:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <div class="input-group-prepend bg-transparent">
                                        <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                            <i class="glyphicon glyphicon-time w3-text-pink" style="width: 20px;"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="txtHoraAtencion" class="form-control border-left border-secondary timepicker" placeholder="* Ingresar hora de atención" runat="server" required="required"></asp:TextBox>
                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                    <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary w3-text-white w3-hover-white w3-hover-text-blue btn-sm float-right"><i class="fa fa-plus-square"></i><span class="ml-1">Añadir</span></button>
                        <button type="button" class="btn btn-secondary w3-text-white w3-hover-white w3-hover-text-black btn-sm float-right" onclick="cerrarModalHorarios()"><i class="fa fa-times"></i><span class="ml-1">Salir</span></button>
                    </div>
                </div>
            </div>
        </div>

    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="../Herramientas/plugins/mdtimepicker/mdtimepicker.js"></script>
    <script src="../Herramientas/plugins/airdatepicker/datepicker.js"></script>
    <script src="../Herramientas/plugins/airdatepicker/i18n/datepicker.es.js"></script>
    <script src="../Herramientas/estilos/js/gestionar-horarios.js"></script>

</asp:Content>
