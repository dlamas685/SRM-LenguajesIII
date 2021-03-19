<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Interna.Master" AutoEventWireup="true" CodeBehind="Crear_Horarios.aspx.cs" Inherits="CapaPresentacionInterna.Crear_Horarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Herramientas/plugins/airdatepicker/datepicker.css" rel="stylesheet" />
    <link href="../Herramientas/plugins/mdtimepicker/mdtimepicker.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="server">
    <form runat="server" id="fmCrearHorarios" class="needs-validation" novalidate="novalidate">
        <div class="container-fluid">
            <div class="row mb-4">
                <div class="col">

                    <h3 class="text-center  font-weight-bold">ASIGNAR HORARIOS PARA MÉDICOS</h3>
                </div>
            </div>
        </div>
        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link border border-bottom-0 w3-text-white w3-pink" id="nav-seleccionarMedico-tab"  data-toggle="tab" href="#nav-seleccionarMedico" role="tab" aria-controls="nav-seleccionarMedico" aria-selected="true"><i class="fa fa-mouse"></i><span id="spanTituloOT" class="ml-1">PASO 1: SELECCIONAR MÉDICO</span> </a>
                <a class="nav-item nav-link border border-bottom-0 text-secondary bg-white disabled" id="nav-definirHorarios-tab" data-toggle="tab" href="#nav-definirHorarios" role="tab" aria-controls="nav-definirHorarios" aria-selected="false"><i class="fa fa-list-ol"></i><span class="ml-1">PASO 2: DEFINIR HORARIOS</span></a>
                <a class="nav-item nav-link border border-bottom-0 text-secondary bg-white disabled" id="nav-registrarHorarios-tab" data-toggle="tab" href="#nav-registrarHorarios" role="tab" aria-controls="nav-registrarHorarios" aria-selected="false"><i class="fa fa-sign-in-alt"></i><span class="ml-1">PASO 3: REGISTRAR HORARIOS</span></a>

            </div>
        </nav>
        <div class="tab-content bg-white shadow rounded-bottom" id="nav-tabContent">


            <div class="tab-pane fade show active px-4 py-4 w3-animate-zoom" id="nav-seleccionarMedico" role="tabpanel" aria-labelledby="nav-seleccionarMedico-tab">
                <div class="container-fluid ">
                    <asp:HiddenField ID="hfIdMedicoRegistrarHorarios" runat="server" />
                    <div class="row">
                        <div class="col">
                            <div class="card shadow-none border-0">
                                <div class="card-body ">
                                    <div class="container-fluid py-5 px-5 shadow ">
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
                                                        <select class="custom-select" style="height: 46px;" id="selectMedicoRegistrarHorarios" runat="server" required="required">
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
                                                        <asp:TextBox ID="txtDniRegistrarHorarios" ReadOnly="true" class="form-control" placeholder="* DNI del médico" runat="server" required="required"></asp:TextBox>
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
                                                        <asp:TextBox ID="txtEspecialidadRegistrarMedico" ReadOnly="true" class="form-control" placeholder="* Especialidad del médico" runat="server" required="required"></asp:TextBox>
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
                                                        <asp:TextBox ID="txtSexoRegistrarMedico" ReadOnly="true" class="form-control" placeholder="* Sexo del médico" runat="server" required="required"></asp:TextBox>
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
                    <div class="row justify-content-end mt-3 px-4">
                        <div class="col-xl-3">
                            <button class="btn text-white btn-success-success w3-hover-white w3-hover-text-teal btn-block" type="button" onclick="irPasoDos()"><i class="fa fa-arrow-alt-circle-right"></i><span class="ml-1">Siguiente</span></button>
                        </div>
                    </div>
                </div>
            </div>



            <div class="tab-pane fade px-4 py-4 w3-animate-zoom" id="nav-definirHorarios" role="tabpanel" aria-labelledby="nav-definirHorarios-tab">
                <div class="container-fluid">
                    <div class="row mt-3 px-4">
                        <div class="col">
                            <div class="card w3-border-pink  px-5 py-5 shadow border-0">
                                <div class="card-header bg-white border-0">
                                    <div class="row">
                                        <div class="col">
                                            <span class="text-dark font-weight-medium">Médico:</span><span class="ml-1 text-dark font-weight-normal" id="spanMedico"></span>
                                        </div>
                                        <div class="col">
                                            <span class="text-dark font-weight-medium">Especialidad:</span><span class="ml-1 text-dark font-weight-normal" id="spanEspecialidad"></span>
                                        </div>
                                    </div>
                                    <div class="row mt-5">
                                        <div class="col">
                                            <span class="text-dark font-weight-medium">HORARIOS DE ATENCIÓN:</span>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col">
                                            <span class="text-secondary font-weight-medium">Para continuar debe agregar por lo menos un horario de atención.</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table id="ListaHorarios" class="table  table-borderless table-hover text-center bg-light" style="width: 100%">
                                        <thead class="w3-pale-red w3-text-pink">
                                            <tr>
                                                <th>Fecha</th>
                                                <th>Hora de Entrada</th>
                                                <th>Hora de Salida</th>
                                                <th>Modificar</th>
                                                <th>Eliminar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <div class="row justify-content-end mt-3">
                                        <div class="col-xl-3">
                                            <button class="btn btn-success-success text-white w3-hover-white w3-hover-text-teal  btn-sm float-right" type="button" onclick="abrirModalAgregarHorarios()"><i class="fa fa-plus-square"></i><span class="ml-1"></span>Añadir horario</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row justify-content-end mt-2 px-4">
                        <div class="col-xl-3">
                            <button class="btn btn-primary text-white w3-hover-white w3-hover-text-blue border-primary btn-block" onclick="volverPasoUno()" type="button"><i class="fa fa-mouse"></i><span class="ml-1"></span>Seleccionar Médico</button>

                        </div>
                        <div class="col-xl-3">
                            <button class="btn text-white btn-success-success w3-hover-white w3-hover-text-teal btn-block" type="button" onclick="irPasoTres()"><i class="fa fa-calendar-plus"></i><span class="ml-1">Generar Horarios</span></button>
                        </div>
                    </div>
                    <div class="row mt-5 d-none">
                        <table id="ListaHorariosBD" class="table table-borderless table-hover text-center" style="width: 100%">
                            <thead class="w3-pale-red w3-text-pink">
                                <tr>
                                    <th>ID Medico</th>
                                    <th>ID Horario</th>
                                    <th>Fecha</th>
                                    <th>Hora de Entrada</th>
                                    <th>Hora de Salida</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade px-4 py-4 w3-animate-zoom" id="nav-registrarHorarios" role="tabpanel" aria-labelledby="nav-registrarHorarios-tab">
            <div class="container-fluid">
                    <div class="row mt-3 px-4">
                        <div class="col">
                            <div class="card w3-border-pink  px-5 py-5 shadow border-0">
                                <div class="card-header bg-white border-0">
                                    <div class="row">
                                        <div class="col">
                                            <span class="text-secondary font-weight-normal float-right">Fecha del día:<span class="text-secondary font-weight-normal ml-1" id="fechaDia"></span></span>
                                        </div>
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col">
                                            <span class="text-dark font-weight-medium">DATOS PERSONALES:</span>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col">
                                            <span class="text-secondary font-weight-medium">Médico:</span><span class="ml-1 font-weight-normal text-secondary" id="spanMedicoResumen"></span>
                                        </div>
                                        <div class="col">
                                            <span class="text-secondary font-weight-medium">Especialidad:</span><span class="ml-1 font-weight-normal text-secondary" id="spanEspecialidadResumen"></span>
                                        </div>
                                    </div>
                                    <div class="row mt-5">
                                        <div class="col">
                                            <span class="text-dark font-weight-medium">PROXIMOS HORARIOS DE ATENCIÓN:</span>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col">
                                            <span class="text-secondary font-weight-medium">Para continuar debe agregar por lo menos un horario de atención.</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table id="ResumenHorariosRegistrar" class="table  table-borderless table-hover text-center bg-light" style="width: 100%">
                                        <thead class="w3-pale-red w3-text-pink">
                                            <tr>
                                                <th>Fecha</th>
                                                <th>Hora de Entrada</th>
                                                <th>Hora de Salida</th>

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
                    <div class="row justify-content-end mt-2 px-4">
                        <div class="col-xl-3">
                            <button class="btn btn-primary text-white w3-hover-white w3-hover-text-blue border-primary btn-block" onclick="volverPasoDos()" type="button"><i class="fa fa-edit"></i><span class="ml-1"></span>Modificar Horarios</button>

                        </div>
                        <div class="col-xl-3">
                            <button class="btn text-white btn-success-success w3-hover-white w3-hover-text-teal btn-block" type="button" onclick="RegistrarHorariosAtencion()"><i class="fa fa-sign-in-alt"></i><span class="ml-1">Registrar</span></button>
                        </div>
                    </div>
                    
                </div>
        </div>
        </div>

        




        <div class="modal fade" id="modalHorariosAtencion" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:HiddenField ID="hfFechaModificar" runat="server" Value="" />
                        <span class="modal-title m-auto font-weight-medium" id="exampleModalLongTitle">HORARIOS DE ATENCIÓN</span>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid px-5 py-4">
                            <div id="modificar" style="display:none;">
                                <div class="row">
                                    <label class="font-weight-medium">Fecha de Atención:</label>
                                </div>
                                <div class="row">
                                    <div class="input-group">
                                        <div class="input-group-prepend bg-transparent">
                                            <span class="input-group-text bg-transparent">
                                                <i class="fa fa-calendar-alt w3-text-pink" style="width: 20px;"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="txtFechaAtencionModificar" class="form-control" ReadOnly="true" placeholder="* Ingresar fecha de atención." runat="server"></asp:TextBox>
                                        <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                        <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                    </div>
                                </div>
                            </div>

                            <div id="añadir">
                            <div class="row">
                                <label class="font-weight-medium">Fecha de Atención:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <div class="input-group-prepend bg-transparent">
                                        <span class="input-group-text bg-transparent">
                                            <i class="fa fa-calendar-alt w3-text-pink" style="width: 20px;"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="txtFechaAtencion" class="form-control datepicker-here" placeholder="* Ingresar fecha de atención." runat="server" required="required"></asp:TextBox>
                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                    <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                </div>
                            </div>
                                </div>
                            <div class="row mt-5">
                                <label class="font-weight-medium">Hora de Entrada:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <div class="input-group-prepend bg-transparent">
                                        <span class="input-group-text bg-transparent">
                                            <i class="glyphicon glyphicon-time w3-text-pink" style="width: 20px;"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="txtHoraAtencionEntrada" class="form-control timepicker" placeholder="* Ingresar hora de entrada" runat="server" required="required"></asp:TextBox>
                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                    <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                </div>
                            </div>
                            <div class="row mt-5">
                                <label class="font-weight-medium">Hora de Salida:</label>
                            </div>
                            <div class="row">
                                <div class="input-group">
                                    <div class="input-group-prepend bg-transparent">
                                        <span class="input-group-text bg-transparent">
                                            <i class="glyphicon glyphicon-time w3-text-pink" style="width: 20px;"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox ID="txtHoraAtencionSalida" class="form-control timepicker-blue" placeholder="* Ingresar hora de salida" runat="server" required="required"></asp:TextBox>
                                    <div class="valid-feedback font-size-15">¡Se ve bien!</div>
                                    <div class="invalid-feedback font-size-15">Por favor, ingrese datos correctos en este campo.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btnModificarHorario" class="btn btn-primary w3-text-white w3-hover-white w3-hover-text-blue btn-sm float-right" style="display:none;" onclick="validarModalHorario('M')"><i class="fa fa-edit"></i><span class="ml-1">Modificar</span></button>
                        <button type="button" id="btnAñadirHorario" class="btn btn-success-success w3-text-white w3-hover-white w3-hover-text-teal btn-sm float-right" onclick="validarModalHorario('A')"><i class="fa fa-plus-square"></i><span class="ml-1">Añadir</span></button>
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
    <script src="Herramientas/estilos/js/crear-horarios.js"></script>
</asp:Content>
