<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Interna.Master" AutoEventWireup="true" CodeBehind="Confirmar_Rechazar_Reservas.aspx.cs" Inherits="CapaPresentacionInterna.Confirmar_Rechazar_Reservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Herramientas/estilos/js/mensajes-alert.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="server">
    <form runat="server" id="fmListarReservas" class="needs-validation" novalidate="novalidate">
        <div class="container-fluid ">
            <div class="row mb-4">
                <div class="col">
                    <h3 class="text-center font-weight-bold">RESERVAS PENDIENTES</h3>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card shadow w3-border-pink w3-animate-zoom border-top border-left-0 border-right-0 border-bottom-0 px-5 py-4">
                        <br />
                        <div class="card-body ">
                            <table id="ListaReservas" class="table table-borderless table-hover text-center bg-light" style="width: 100%">
                                <thead class="w3-pale-red w3-text-pink">
                                    <tr>
                                        <th>ID</th>
                                        <th>N#</th>
                                        <th>Paciente</th>
                                        <th>Médico</th>
                                        <th>Especialidad</th>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Consulta</th>
                                        <th>Email</th>
                                        <th>Teléfono</th>
                                        <th>Sexo</th>
                                        <th>Confirmar</th>
                                        <th>Rechazar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>

                            </table>

                        </div>
                    </div>
                </div>
            </div>


        </div>

        <asp:HiddenField ID="hfIdReserva" runat="server" Value="" />

        <div class="modal fade" id="modalConfirmarReserva" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bolder m-auto">CONFIRMACIÓN DE RESERVA</h5>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid px-5 py-4">
                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="row mx-3">
                                        <label class="font-weight-medium">Paciente:</label>
                                    </div>
                                    <div class="row mx-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-user-alt w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtPacienteConfirmarReserva" class="form-control" placeholder="* Nombre y Apellido de paciente" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                    <div class="row mx-3">
                                        <label class="font-weight-medium">Email del paciente:</label>
                                    </div>
                                    <div class="row mx-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-at w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtEmailPacienteConfirmarReserva" class="form-control" placeholder="* Correo electronico del paciente" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-xl-6">
                                    <div class="row mx-3">
                                        <label class="font-weight-medium">Médico:</label>
                                    </div>
                                    <div class="row mx-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-user-md w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtMedicoConfirmarReserva" class="form-control" placeholder="* Nombre y Apellido del médico" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                    <div class="row mx-3 ">
                                        <label class="font-weight-medium">Especialidad:</label>
                                    </div>
                                    <div class="row mx-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-star w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtEspecialidadConfirmarReserva" class="form-control" placeholder="* Especialidad del médico." runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-xl-6">
                                    <div class="row mx-3">
                                        <label class="font-weight-medium">Fecha de Atención:</label>
                                    </div>
                                    <div class="row mx-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-calendar-alt w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtFechaAtencionConfirmarReserva" class="form-control" placeholder="* Fecha de atención." runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6">

                                    <div class="row mx-3">
                                        <label class="font-weight-medium">Hora de Atención:</label>
                                    </div>
                                    <div class="row mx-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="glyphicon glyphicon-time w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtHoraAtencionConfirmarReserva" class="form-control" placeholder="* Hora de atención" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-xl-12">
                                    <div class="row mx-3">
                                        <label class="font-weight-medium">Descripción:</label>
                                    </div>
                                    <div class="row mx-3">
                                        <div class="input-group">
                                            <asp:TextBox ID="txtDescripcionConfirmarReserva" Rows="3" TextMode="MultiLine" class="form-control" placeholder="* Ingresar una descripción para la reserva." runat="server"></asp:TextBox>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnConfirmarReserva" runat="server" Text="Confirmar" CssClass="btn btn-success-success w3-text-white w3-hover-white w3-hover-text-teal btn-sm float-right" OnClick="btnConfirmarReserva_Click" />
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
                                    <asp:TextBox ID="txtPacienteRechazoReserva" class="form-control border-left border-secondary" placeholder="* Nombre y Apellido de paciente." runat="server"></asp:TextBox>
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
                                    <asp:TextBox ID="txtEmailPacienteRechazoReserva" class="form-control border-left border-secondary" placeholder="* Dirección de correo electronico." runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <label class="font-weight-medium">Motivo:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <asp:TextBox ID="txtMotivoRechazoReserva" Rows="3" TextMode="MultiLine" class="form-control" placeholder="* Ingresar un motivo de rechazo para la reserva." runat="server"></asp:TextBox>
                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                    <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnRechazarReserva" runat="server" Text="Rechazar" CssClass="btn btn-danger w3-text-white w3-hover-white w3-hover-text-red btn-sm float-right" OnClick="btnRechazarReserva_Click" />
                        <button type="button" class="btn btn-secondary w3-text-white w3-hover-white w3-hover-text-black btn-sm float-right" onclick="cerrarModalRechazarReserva()"><i class="fa fa-times"></i><span class="ml-1">Salir</span></button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="Herramientas/estilos/js/listar-reservas.js"></script>
</asp:Content>
