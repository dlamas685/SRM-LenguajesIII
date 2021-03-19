<%@ Page Title="" Language="C#" MasterPageFile="~/Vista Interna/MasterPage-Clinica.Master" AutoEventWireup="true" CodeBehind="Listar_Reservas.aspx.cs" Inherits="CapaPresentacion.Vista_Interna.Listar_Reservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="server">
    <form runat="server" id="fmListarReservas" class="needs-validation" novalidate="novalidate">
        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col">
                    <h3 class="text-center">RESERVAS REALIZADAS</h3>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card shadow-none w3-border-pink border-top border-left-0 border-right-0 border-bottom-0">
                        <br />
                        <div class="card-body ">
                            <table id="ListaReservas" class="table table-striped table-borderless table-hover w3-pink" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>N#</th>
                                        <th>Paciente</th>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Medico</th>
                                        <th>Consulta</th>
                                        <th>Email</th>
                                        <th>Telefono</th>
                                        <th>Sexo</th>
                                        <th>Confirmar</th>
                                        <th>Rechazar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>

                            </table>
                            <div class="row justify-content-end mt-3">
                                <div class="col-xl-2">
                                    <button class="btn w3-pink text-white w3-hover-white w3-hover-text-pink w3-border-pink btn-sm float-right" type="button" onclick="abriModalConfirmarReserva()"><i class="fa fa-plus-square"></i><span class="ml-1"></span>Confirmar</button>
                                </div>
                                <div class="col-xl-2">
                                    <button class="btn w3-pink text-white w3-hover-white w3-hover-text-pink w3-border-pink btn-sm float-right" type="button" onclick="abriModalRechazarReserva()"><i class="fa fa-plus-square"></i><span class="ml-1"></span>Rechazar</button>
                                </div>
                            </div>
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

        <div class="modal fade" id="modalConfirmarReserva" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bolder m-auto">CONFIRMACIÓN DE RESERVA</h5>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid px-5 py-4">
                            <div class="row ">
                                <label class="font-weight-medium">Paciente:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <div class="input-group-prepend bg-transparent">
                                        <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                            <i class="fa fa-user-alt w3-text-pink" style="width: 20px;"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="txtPacienteConfirmarReserva" ReadOnly="true" class="form-control border-left border-secondary" placeholder="* Nombre y Apellido de paciente" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <label class="font-weight-medium">Médico:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <div class="input-group-prepend bg-transparent">
                                        <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                            <i class="fa fa-user-md w3-text-pink" style="width: 20px;"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="txtMedicoConfirmarReserva" ReadOnly="true" class="form-control border-left border-secondary" placeholder="* Nombre y Apellido del médico" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <label class="font-weight-medium">Fecha de Atención:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <div class="input-group-prepend bg-transparent">
                                        <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                            <i class="fa fa-calendar-alt w3-text-pink" style="width: 20px;"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="txtFechaAtencionConfirmarReserva" ReadOnly="true" class="form-control datepicker-here border-left border-secondary" placeholder="* Fecha de atención." runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <label class="font-weight-medium">Hora de Atención:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <div class="input-group-prepend bg-transparent">
                                        <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                            <i class="glyphicon glyphicon-time w3-text-pink" style="width: 20px;"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="txtHoraAtencionConfirmarReserva" ReadOnly="true" class="form-control border-left border-secondary" placeholder="* Hora de atención" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <label class="font-weight-medium">Descripción:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <asp:TextBox ID="txtDescripcionConfirmarReserva" Rows="3" TextMode="MultiLine" required="required" class="form-control" placeholder="* Ingresar una descripción para la reserva." runat="server"></asp:TextBox>
                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                    <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success-success w3-text-white w3-hover-white w3-hover-text-teal btn-sm float-right" onclick="confirmarSolicitud()"><i class="glyphicon glyphicon-ok"></i><span class="ml-1">Confirmar</span></button>
                        <button type="button" class="btn btn-secondary w3-text-white w3-hover-white w3-hover-text-black btn-sm float-right" onclick="cerrarModalConfirmarReserva()"><i class="fa fa-times"></i><span class="ml-1">Salir</span></button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalRechazarReserva" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bolder m-auto">RECHAZO DE RESERVA</h5>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid px-5 py-4">
                            <div class="row ">
                                <label class="font-weight-medium">Paciente:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <div class="input-group-prepend bg-transparent">
                                        <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                            <i class="fa fa-user-alt w3-text-pink" style="width: 20px;"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="txtPacienteRechazoReserva" ReadOnly="true" class="form-control border-left border-secondary" placeholder="* Nombre y Apellido de paciente." runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <label class="font-weight-medium">Email del paciente:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <div class="input-group-prepend bg-transparent">
                                        <span class="input-group-text bg-transparent border-right-0 border-secondary">
                                            <i class="fa fa-at w3-text-pink" style="width: 20px;"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="txtEmailPacienteRechazoReserva" ReadOnly="true" class="form-control border-left border-secondary" placeholder="* Dirección de correo electronico." runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <label class="font-weight-medium">Motivo:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <asp:TextBox ID="txtMotivoRechazoReserva" Rows="3" TextMode="MultiLine" required="required" class="form-control" placeholder="* Ingresar un motivo de rechazo para la reserva." runat="server"></asp:TextBox>
                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                    <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger w3-text-white w3-hover-white w3-hover-text-red btn-sm float-right" onclick="rechazarReserva()"><i class="fa fa-window-close"></i><span class="ml-1">Rechazar</span></button>
                        <button type="button" class="btn btn-secondary w3-text-white w3-hover-white w3-hover-text-black btn-sm float-right" onclick="cerrarModalRechazarReserva()"><i class="fa fa-times"></i><span class="ml-1">Salir</span></button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="../Herramientas/estilos/js/listar-reservas.js"></script>

</asp:Content>
