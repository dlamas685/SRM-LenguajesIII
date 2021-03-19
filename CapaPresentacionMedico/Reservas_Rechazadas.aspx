<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Interna.Master" AutoEventWireup="true" CodeBehind="Reservas_Rechazadas.aspx.cs" Inherits="CapaPresentacionInterna.Reservas_Rechazadas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="server">
    <form runat="server" id="fmReservasRechazadas" class="needs-validation" novalidate="novalidate">
        <div class="container-fluid ">
            <div class="row mb-4">
                <div class="col">
                    <h3 class="text-center font-weight-bold">RESERVAS RECHAZADAS</h3>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card shadow w3-border-pink w3-animate-zoom border-top border-left-0 border-right-0 border-bottom-0 px-5 py-4">
                        <br />
                        <div class="card-body ">
                            <table id="ListaReservasRechazadas" class="table table-borderless table-hover text-center bg-light" style="width: 100%">
                                <thead class="w3-pale-red w3-text-pink">
                                    <tr>
                                        <th>ID</th>
                                        <th>N#</th>
                                        <th>Rechazado por</th>
                                        <th>Paciente</th>
                                        <th>Médico</th>
                                        <th>Especialidad</th>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Motivo</th>
                                        <th>Situación</th>
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
    <script src="Herramientas/estilos/js/reservas-rechazadas.js"></script>
</asp:Content>
