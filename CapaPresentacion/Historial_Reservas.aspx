<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Externa.Master" AutoEventWireup="true" CodeBehind="Historial_Reservas.aspx.cs" Inherits="CapaPresentacionExterna.Historial_Reservas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cabecera" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPacientes" runat="server">
            <form runat="server" id="fmReservas" class="needs-validation" novalidate="novalidate">
        <div class="container-fluid ">
            <div class="row mb-4">
                <div class="col">
                    <h3 class="text-center font-weight-bold">HISTORIAL DE RESERVAS</h3>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card shadow w3-border-teal w3-animate-zoom border-top border-left-0 border-right-0 border-bottom-0 px-5 py-4">
                        <br />
                        <div class="card-body ">
                            <table id="ListaReservas" class="table table-borderless table-hover text-center bg-light" style="width: 100%">
                                <thead class="w3-pale-green w3-text-teal">
                                    <tr>
                                        <th>ID</th>
                                        <th>N#</th>
                                        <th>Médico</th>
                                        <th>Especialidad</th>
                                        <th>Fecha</th>
                                        <th>Hora</th> 
                                        <th>Situación</th>
                                        <th>Motivo/Observación</th>                                      
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
<asp:Content ID="Content3" ContentPlaceHolderID="pie" runat="server">
    <script src="Herramientas/estilos/js/historial-reservas.js"></script>
</asp:Content>
