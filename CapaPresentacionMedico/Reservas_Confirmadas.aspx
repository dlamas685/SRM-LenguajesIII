<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Interna.Master" AutoEventWireup="true" CodeBehind="Reservas_Confirmadas.aspx.cs" Inherits="CapaPresentacionInterna.Reservas_Confirmadas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Herramientas/estilos/js/mensajes-alert.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="server">
    <form runat="server" id="fmReservasConfirmadas" class="needs-validation" novalidate="novalidate">
        <div class="container-fluid ">
            <div class="row mb-4">
                <div class="col">
                    <h3 class="text-center font-weight-bold">RESERVAS CONFIRMADAS</h3>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card shadow w3-border-pink w3-animate-zoom border-top border-left-0 border-right-0 border-bottom-0 px-5 py-4">
                        <br />
                        <div class="card-body ">
                            <table id="ListaReservasConfirmadas" class="table table-borderless table-hover text-center bg-light" style="width: 100%">
                                <thead class="w3-pale-red w3-text-pink">
                                    <tr>
                                        <th>ID</th>
                                        <th>N#</th>
                                        <th>Confirmada por</th>
                                        <th>Paciente</th>
                                        <th>Teléfono</th>
                                        <th>Médico</th>
                                        <th>Especialidad</th>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Observación</th>
                                        <th>DNI</th>
                                        <th>EMAIL</th>
                                        <th>Situación</th>
                           
                                        <th>Cancelar</th>
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

        <div class="modal fade" id="modalCancelarReserva" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bolder m-auto">CANCELACION DE RESERVA</h5>
                        <asp:HiddenField ID="hfIdReserva" runat="server" />
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
                                    <asp:TextBox ID="txtPacienteCancelarReserva" class="form-control border-left border-secondary" placeholder="* Nombre y Apellido de paciente." runat="server"></asp:TextBox>
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
                                    <asp:TextBox ID="txtEmailPacienteCancelarReserva" class="form-control border-left border-secondary" placeholder="* Dirección de correo electronico." runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <label class="font-weight-medium">Motivo:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <asp:TextBox ID="txtMotivoCancelarReserva" Rows="3" TextMode="MultiLine" class="form-control" placeholder="* Ingresar un motivo de cancelacion para la reserva." runat="server" required="required"></asp:TextBox>
                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                    <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnCancelarReserva" runat="server" Text="Confirmar" CssClass="btn btn-primary w3-text-white w3-hover-white w3-hover-text-blue btn-sm float-right" OnClick="btnCancelarReserva_Click" />
                        <button type="button" class="btn btn-secondary w3-text-white w3-hover-white w3-hover-text-black btn-sm float-right" onclick="salirModalCancelarReserva()"><i class="fa fa-times"></i><span class="ml-1">Salir</span></button>
                    </div>
                </div>
            </div>
        </div>

    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="Herramientas/estilos/js/reservas-confirmadas.js"></script>
</asp:Content>
