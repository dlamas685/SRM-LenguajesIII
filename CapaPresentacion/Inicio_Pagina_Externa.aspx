<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Externa.Master" AutoEventWireup="true" CodeBehind="Inicio_Pagina_Externa.aspx.cs" Inherits="CapaPresentacionExterna.Inicio_Pagina_Externa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cabecera" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPacientes" runat="server">
    <section class="w3-section h-100 " data-section="home" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row" data-scrollax-parent="true">
                <div class="col-md-12 pt-5">
                    <div class="m-auto text-center">
                        <span class="w3-animate-fading" style="font-family: 'Audiowide'; font-size: 30px; font-weight: bold;">Bienvenido a FIMA</span>
                        <h3 class="mb-4 w3-text-teal font-weight-medium w3-animate-top">Estamos aquí para su cuidado</h3>
                        <p class="mb-4 font-weight-medium w3-animate-top">La ortopedia y traumatología es la especialidad médica que se encarga de la investigación, manejo médico, quirúrgico y rehabilitación de las patologías de origen traumático y no traumático que afectan al aparato locomotor (huesos, articulaciones, músculos y tendones) en extremidades y columna vertebral. Traumatología tres cerritos es un completo equipo de médicos que le brinda atención integral en las distintas subespecialidades.</p>
                        <div class="row w3-animate-right">
                            <div class="col" >
                                <div class="card border-0 shadow-none card-img " >
                                     <img class="img-fluid img-thumbnail shadow" src="images/doc-5.jpg" />
                                </div>
                            </div>
                            <div class="col">
                                <div class="card  border-0 shadow-none  card-img ">

                                        <img class="img-fluid img-thumbnail shadow" src="images/doc-7.jpg" />

                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <p><a href="Solicitar_Reservas.aspx" class="btn w3-pale-green w3-border-teal py-3 px-4 w3-text-teal w3-hover-text-white w3-hover-teal w3-animate-zoom">Solicitar hora</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pie" runat="server">
</asp:Content>
