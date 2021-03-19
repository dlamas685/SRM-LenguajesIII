<%@ Page Title="" Language="C#" MasterPageFile="~/Vista Interna/MasterPage-Clinica.Master" AutoEventWireup="true" CodeBehind="Listar_Horarios_Medicos.aspx.cs" Inherits="CapaPresentacion.Vista_Interna.Listar_Horarios_Medicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Herramientas/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="server">
    <form runat="server" id="fmGestionarHorarios" class="needs-validation" novalidate="novalidate">
        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col">
                    <h3 class="text-center">VER AGENDA DE MÉDICO</h3>
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
                                                <select class="custom-select form-control border border-left border-secondary border-secondary text-black" style="height: 46px; outline: none; cursor: pointer;" id="selectMedicoGenerarAgenda" runat="server" required="required">
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
                                                <asp:TextBox ID="txtDniGenerarAgenda" ReadOnly="true" class="form-control border-left border-secondary" placeholder="* DNI del médico" runat="server" required="required"></asp:TextBox>
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
                                                <asp:TextBox ID="txtEspecialidadGenerarAgenda" ReadOnly="true" class="form-control border-left border-secondary" placeholder="* Especialidad del médico" runat="server" required="required"></asp:TextBox>
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
                                                <asp:TextBox ID="txtSexoGenerarAgenda" ReadOnly="true" class="form-control border-left border-secondary" placeholder="* Sexo del médico" runat="server" required="required"></asp:TextBox>
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
                            <div class="row mt-4">
                                <div class="col-xl-6">
                                    <div class="row mx-2">
                                        <label class="font-weight-medium">Seleccionar Rango de Fecha:</label>
                                    </div>
                                    <div class="row mx-2">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                                    <i class="fa fa-calendar-alt w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtRangoFechaGenerarAgenda" class="form-control border-left border-secondary" placeholder="* Seleccionar un rango de fechas." runat="server" required="required"></asp:TextBox>
                                            <button class="btn btn-success rounded-0 border-secondary border-left-0 w3-hover-white w3-hover-text-black" style="background: #29cc97;"><i class="fa fa-calendar-check"></i></button>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, seleccione un médico.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                    <div class="row mx-2 pt-5">
                                        <label class="font-weight-medium w3-text-gray"><span class="mr-1">Dar click en el botón</span><i class="fa fa-calendar-check ml-1"></i><span class="ml-1"> para generar la agenda.</span></label>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="card-body ">
                            <h5>AGENDA PARA EL RANGO DE FECHA SELECCIONADO</h5>
                            <span class="ml-1" id="spanRangoFecha"></span>
                            <table id="ListaFechas" class="table table-striped table-bordered table-hover w3-pink" style="width: 100%">
                                <thead class="text-center">
                                    <tr>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="row justify-content-end mt-3">
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
    <script src="../Herramientas/plugins/daterangepicker/moment.min.js"></script>
    <script src="../Herramientas/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="../Herramientas/estilos/js/listar-horarios-medicos.js"></script>
</asp:Content>
