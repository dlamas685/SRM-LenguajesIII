<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Interna.Master" AutoEventWireup="true" CodeBehind="Ver_Agenda_Diaria.aspx.cs" Inherits="CapaPresentacionInterna.Crear_agenda_diaria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="server">
    <form runat="server" id="fmVerHorarios" class="needs-validation" novalidate="novalidate">
        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col">
                    <h3 class="text-center font-weight-bold">AGENDA DIARIA</h3>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card shadow w3-border-pink border-top border-left-0 border-right-0 border-bottom-0 w3-animate-zoom px-4">
                        <div class="card-body ">
                            <div class="container-fluid py-4 px-4">
                                <div class="row">
                                    <div class="col">
                                        <div class="row">
                                            <label class="font-weight-medium">Médico:</label>
                                        </div>
                                        <div class="row">
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-user-md w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <select class="custom-select" style="height: 46px;" id="selectMedicoCrearAgenda" runat="server" required="required">
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
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-address-card w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtDniCrearAgenda" ReadOnly="true" class="form-control" placeholder="* DNI del médico" runat="server"></asp:TextBox>
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
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-star w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtEspecialidadCrearAgenda" ReadOnly="true" class="form-control" placeholder="* Especialidad del médico" runat="server"></asp:TextBox>
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
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="fa fa-female w3-text-pink" style="width: 20px;"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtSexoCrearAgenda" ReadOnly="true" class="form-control" placeholder="* Sexo del médico" runat="server"></asp:TextBox>
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
                    <div class="card shadow w3-border-pink border-top border-left-0 border-right-0 border-bottom-0 w3-animate-right px-4" id="cardCrearHorariosFecha" style="display:none;">
                        <div class="card-header bg-white border-0">
                            <div class="row mt-4 mb-4">
                                <div class="col-xl-6">
                                    <div class="row mx-2">
                                        <label class="font-weight-medium">Fecha:</label>
                                    </div>
                                    <div class="row mx-2">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-calendar-day w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <select class="custom-select" style="height: 46px;" id="selectFechaCrearAgenda" runat="server" required="required">
                                                <option value="" selected="selected">(Seleccionar fecha)</option>
                                            </select>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, seleccione un médico.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                    <div class="row mx-2 pt-4">
                                        <label class="font-weight-medium w3-text-gray mt-2"><span class="mr-1">Al seleccionar una fecha se mostrarán los horarios posibles de acuerdo a la hora de entrada y salida del médico.</span></label>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4 mb-2" >
                                <div class="col-xl-3 w3-animate-bottom" id="col1HorariosEntradaSalida" style="display:none">
                                    <div class="row mx-2">
                                        <label class="font-weight-medium text-secondary">Hora de Entrada:</label><span class="ml-1" id="spanHoraEntradaCrearAgenda"></span>
                                    </div>
                                </div>
                                <div class="col-xl-3 w3-animate-bottom" id="col2HorariosEntradaSalida" style="display:none">
                                    <div class="row mx-2">
                                        <label class="font-weight-medium text-secondary">Hora de Salida:</label><span class="ml-1" id="spanHoraSalidaCrearAgenda"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body w3-animate-bottom" id="cardBodyCrearHorarios" style="display:none;">
                            <span class="text-left font-weight-medium ml-1">Lista de Horas disponibles para la fecha</span>
                            <br />
                            <span class="ml-1" id="spanRangoFecha"></span>
                            <table id="ListaHorasFecha" class="table table-borderless table-hover text-center" style="width: 100%">
                                <thead class="w3-text-pink w3-pale-red">
                                    <tr>
                                        <th>ID</th>
                                        <th>N#</th>
                                        <th>Horas</th>
                                        <th>Estado</th>
                                        <th>Situación</th>
                                        <th>Acciones</th>
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



    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="Herramientas/estilos/js/crear-agenda-diaria.js"></script>

</asp:Content>
