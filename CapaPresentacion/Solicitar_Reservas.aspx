<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Externa.Master" AutoEventWireup="true" CodeBehind="Solicitar_Reservas.aspx.cs" Inherits="CapaPresentacionExterna.Listar_Medicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cabecera" runat="server">
    <link href="../Herramientas/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />
    <script src="Herramientas/estilos/js/mensajes-alert.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPacientes" runat="server">
        <form runat="server" id="fmSolicitarReserva" class="needs-validation" novalidate="novalidate">
        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col">
                    <h3 class="text-center font-weight-bold">SOLICITAR RESERVA</h3>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card shadow w3-border-teal border-top border-left-0 border-right-0 border-bottom-0 w3-animate-zoom px-4">
                        <div class="card-body ">
                            <div class="container-fluid py-4 px-4">
                                <div class="row mt-4">
                                <div class="col-xl-6">
                                    <div class="row mx-2">
                                        <label class="font-weight-medium">Especialidad:</label>
                                    </div>
                                    <div class="row mx-2">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-star w3-text-teal" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <select class="custom-select" style="height: 46px;" id="selectEspecialidadMedicoSolicitarReserva" runat="server">
                                                <option value="" selected="selected">(Seleccionar especialidad)</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                    <div class="row mx-2">
                                        <label class="font-weight-medium">Fecha de Reserva:</label>
                                    </div>
                                    <div class="row mx-2">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-calendar-alt w3-text-teal" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtFechaBuscarDisponibilidades" class="form-control datepicker-here bg-transparent" placeholder="* Seleccionar una fecha de reserva." runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4 justify-content-start">
                                <div class="col-xl-3">
                                    <div class="row mx-2">
                                        <button class="btn btn-light border-secondary w3-hover-border-teal btn-rounded btn-block w3-hover-teal w3-hover-text-white" type="button" onclick="BuscarDisponibilidades()"><i class="fa fa-search"></i><span class="ml-1">Buscar médicos</span></button>
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
                    <div class="card shadow w3-border-teal border-top border-left-0 border-right-0 border-bottom-0 w3-animate-right px-5 py-4 w3-animate-left" id="cardbodySolicitarReserva" style="display:none;">
                        <div class="card-body ">
                            <span class="text-left font-weight-medium ml-1">Lista de Médicos Disponibles</span>
                            <br />
                            <span class="ml-1" id="spanRangoFecha"></span>
                            <table id="ListaMedicos" class="table table-borderless table-hover text-center" style="width: 100%">
                                <thead class="w3-pale-green w3-text-teal">
                                    <tr>
                                        <th>ID</th>
                                        <th>N#</th>
                                        <th>Imagen</th>
                                        <th>Apellido y Nombre</th>
                                        <th>Fecha de Nacimiento</th>
                                        <th>CUIL</th>
                                        <th>Edad</th>
                                        <th>Sexo</th>
                                        <th>ID Especialidad</th>
                                        <th>Especialidad</th>
                                        <th>Telefono</th>
                                        <th>Descripción</th>
                                        <th>Solicitar</th>
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

            <div class="modal fade" id="modalSolicitarReserva" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bolder m-auto">SOLICITUD DE RESERVA</h5>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid px-5 py-4">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-3">
                                    <asp:HiddenField ID="hfIdMedico" runat="server" Value="" />
                                    <asp:HiddenField ID="hfIdHorario" runat="server" Value="" />
                                    <asp:HiddenField ID="hfIdHorarioHora" runat="server" Value=""/>
                                    <div class="row mt-2">
                                        <div class="col">
                                            <img src="Fotos/masculino.jpg" class="img-thumbnail img-fluid" runat="server" id="imagenMedico" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-9">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Médico:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-user-md w3-text-teal" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtMedicoSolicitarReserva" ReadOnly="true" class="form-control" placeholder="* Apellido y Nombre del médico." runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row mt-4 px-3">
                                        <label class="font-weight-medium">Especialidad:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-star w3-text-teal" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtEspecialidadMedicoSolicitarReserva" ReadOnly="true" class="form-control" placeholder="* Especialidad del médico." runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row py-4">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Fecha:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-calendar-alt w3-text-teal" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <select class="custom-select" style="height: 46px;" id="selectFechaReservaSolicitarReserva" runat="server" required="required">
                                                <option value="" selected="selected">(Seleccionar fecha de reserva)</option>
                                            </select>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, seleccione una fecha para la reserva.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 w3-animate-zoom" id="colHoraReserva" style="display:none;">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Hora:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="glyphicon glyphicon-time w3-text-teal" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <select class="custom-select" style="height: 46px;" id="selectHorarReservaSolicitarReserva" runat="server" required="required">
                                                <option value="" selected="selected">(Seleccionar hora de reserva)</option>
                                            </select>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, seleccione una hora para la reserva.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row ">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6 col-xl-12">
                                    <div class="row px-3">
                                        <label class="font-weight-medium">Consulta:</label>
                                    </div>
                                    <div class="row px-3">
                                        <div class="input-group">
                                            <asp:TextBox ID="txtConsultaSolicitarReserva" Rows="3" TextMode="MultiLine" class="form-control" placeholder="* Ingresar una consulta para la reserva." runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnRegistrarReserva" runat="server" Text="Solicitar" CssClass="btn btn-success-success w3-text-white w3-hover-white w3-hover-text-teal btn-sm float-right" OnClick="btnRegistrarReserva_Click" />
                        <button type="button" class="btn btn-secondary w3-text-white w3-hover-white w3-hover-text-black btn-sm float-right" onclick="cerrarModalSolicitarReserva()"><i class="fa fa-times"></i><span class="ml-1">Salir</span></button>
                    </div>
                </div>
            </div>
        </div>

    </form>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pie" runat="server">
    <script src="../Herramientas/plugins/daterangepicker/moment.min.js"></script>
    <script src="../Herramientas/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="Herramientas/estilos/js/solicitar-reserva.js"></script>
</asp:Content>
