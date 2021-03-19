<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Interna.Master" AutoEventWireup="true" CodeBehind="Inicio_Pagina_Interna.aspx.cs" Inherits="CapaPresentacionInterna.Inicio_Pagina_Interna" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Herramientas/plugins/airdatepicker/datepicker.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="server">

    <form runat="server" id="fmInicioInterno" class="needs-validation" novalidate="novalidate">
        <div class="content-wrapper bg-transparent">
            <div class="content">
                <div class="row">
                    <div class="col-xl-3 col-sm-6">
                        <div class="card card-mini mb-4">
                            <div class="card-body">
                                <asp:Label ID="lblCantReservas" runat="server" CssClass="mb-1" Text="Label"></asp:Label>
                                <p>Cantidad de Reservas Registradas</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6">
                        <div class="card card-mini  mb-4">
                            <div class="card-body">
                                <asp:Label ID="lblCantEmpleados" CssClass="mb-1" runat="server" Text="Label"></asp:Label>
                                <p>Cantidad de Empleados Registrados</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6">
                        <div class="card card-mini mb-4">
                            <div class="card-body">
                                <asp:Label ID="lblCantPacientes" CssClass="mb-1" runat="server" Text="Label"></asp:Label>
                                <p>Cantidad de Pacientes Registrados</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6">
                        <div class="card card-mini mb-4">
                            <div class="card-body">
                                <asp:Label ID="lblCantMedicos" CssClass="mb-1" runat="server" Text="Label"></asp:Label>
                                <p>Cantidad de Médicos Registrados</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-8 col-md-12">
                        <div class="card bg-transparent shadow-none border-0">
                            <div class="card-body">
                                <table id="ListaReservasTOP" class="table table-borderless table-hover text-center bg-light shadow" style="width: 100%">
                                    <thead class="w3-pale-red w3-text-pink">
                                        <tr>
                                            <th>N#</th>
                                            <th>Paciente</th>
                                            <th>Médico</th>
                                            <th>Especialidad</th>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Situación</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-12">

                        <div class="datepicker-here ml-4"></div>
                    </div>
                </div>
            </div>

        </div>
        
    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    
    <script src="Herramientas/plugins/airdatepicker/datepicker.js"></script>
    <script src="Herramientas/plugins/airdatepicker/i18n/datepicker.es.js"></script>
    <script src="Herramientas/estilos/js/pagina-inicio.js"></script>
</asp:Content>
