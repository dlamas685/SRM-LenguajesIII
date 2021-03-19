<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Interna.Master" AutoEventWireup="true" CodeBehind="Ver_Horarios.aspx.cs" Inherits="CapaPresentacionInterna.Ver_Horarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Herramientas/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="server">
     <form runat="server" id="fmVerHorarios" class="needs-validation" novalidate="novalidate">
        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col">
                    <h3 class="text-center font-weight-bold">LISTAR HORARIOS DE MÉDICO</h3>
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
                                                <select class="custom-select" style="height: 46px;" id="selectMedicoGenerarListaHorarios" runat="server" required="required">
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
                                                <asp:TextBox ID="txtDniListaHorarios" ReadOnly="true" class="form-control" placeholder="* DNI del médico" runat="server"></asp:TextBox>
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
                                                <asp:TextBox ID="txtEspecialidadListaHorarios" ReadOnly="true" class="form-control" placeholder="* Especialidad del médico" runat="server"></asp:TextBox>
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
                                                <asp:TextBox ID="txtSexoListaHorarios" ReadOnly="true" class="form-control" placeholder="* Sexo del médico" runat="server"></asp:TextBox>
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
                    <div class="card shadow w3-border-pink border-top border-left-0 border-right-0 border-bottom-0 w3-animate-right px-4" id="cardListaHorariosAtencion" style="display:none;">
                        <div class="card-header bg-white border-0">
                            <div class="row mt-4 mb-4">
                                <div class="col-xl-6">
                                    <div class="row mx-2">
                                        <label class="font-weight-medium">Seleccionar Rango de Fecha:</label>
                                    </div>
                                    <div class="row mx-2">
                                        <div class="input-group">
                                            <div class="input-group-prepend bg-transparent">
                                                <span class="input-group-text bg-transparent border-right-0">
                                                    <i class="fa fa-calendar-alt w3-text-pink" style="width: 20px;"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtRangoFechaGenerarListaHorarios"  ReadOnly="true" class="form-control" placeholder="* Seleccionar un rango de fechas." runat="server" required="required"></asp:TextBox>
                                            <button class="btn btn-success-success rounded-0 border-secondary border-left-0 w3-hover-white w3-hover-text-black w3-text-white" type="button" onclick="GenerarListaHorarios()"><i class="fa fa-calendar-check"></i></button>
                                            <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                            <div class="invalid-feedback font-size-15">Por favor, seleccione un médico.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                    <div class="row mx-2 pt-5">
                                        <label class="font-weight-medium w3-text-gray"><span class="mr-1">Dar click en el botón</span><i class="fa fa-calendar-check ml-1"></i><span class="ml-1"> para generar la lista de horarios.</span></label>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="card-body w3-animate-bottom" id="cardBodyListarHorarios" style="display:none;">
                            <span class="text-left font-weight-medium">Lista de Horarios de Atención</span>
                            <br />
                            <span class="ml-1" id="spanRangoFecha"></span>
                            <table id="ListaFechas" class="table table-borderless table-hover text-center" style="width: 100%">
                                <thead class="w3-text-pink w3-pale-red">
                                    <tr>
                                        <th>ID</th>
                                        <th>#N</th>
                                        <th>Fecha</th>
                                        <th>Hora Inicio</th>
                                        <th>Hora Fin</th>
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

          
        </div>

        

    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="../Herramientas/plugins/daterangepicker/moment.min.js"></script>
    <script src="../Herramientas/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="../Herramientas/estilos/js/listar-horarios-medicos.js"></script>
</asp:Content>
