<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="DBProject.Inventario1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Inventario</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1, user-scalable=0" />
    <meta name="msapplication-TileColor" content="#FFF" />
    <meta name="theme-color" content="#278bfe" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="ember-cli-head-start" content="" />
    <meta name="ember-cli-head-end" content="" />
    <link rel="stylesheet" href="../media/Chaft.css" />
    <link rel="stylesheet" href="../media/Chaft2.css" />
    <script src="../assets/js/jquery-3.7.1.min.js"></script>
    <script src="../assets/js/jquery.dataTables.min.js"></script>
    <link href="../assets/css/datatables.min.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <script>
        $(document).ready(function () {
            $('#loading').hide();
            $('#ContentPlaceHolder1_lblIdPaciente').hide();
            const dataSet = <%=WordConsent%>;
            const table = new DataTable('#example', {
                searching: false,
                pageLength: 15,
                dom: 'rtip',
                columns: [
                    { title: '' },
                    {
                        data: null,
                        defaultContent:
                            '<div class="action-buttons">' +
                            '<span class="edit"><i class="fa fa-download"></i></span> ' +
                            '<span class="cancel"></span>' +
                            '</div>',
                        className: 'row-edit dt-center',
                        orderable: false,
                        rowCallback: function (row, data, index) {
                            $('td:eq(6)', row).html('<a href="' + data.filepath + '/' + data.fileName + '" download>Download</a>');
                        }
                    }
                ],
                data: dataSet
            });
            // Activate an inline edit on click of a table cell
            table.on('click', 'tbody tr', function (e) {
                $('#loading').show();
                var docto = table.row(this).data();
                var doctorSelect = document.getElementById("ContentPlaceHolder1_DropDownDoctors");
                var selectedDoctor = document.getElementById("ContentPlaceHolder1_DoctorActual").textContent;
                var IdPaciente = document.getElementById("ContentPlaceHolder1_lblIdPaciente").innerHTML;

                if (selectedDoctor == "--- Seleccione un Doctor ---") {
                    alert("Necesita seleccionar un doctor antes de generar un consentimiento");
                    $('#loading').hide();
                    return;
                }

                $.ajax({
                    type: "POST",
                    url: '/Patient/Agenda.aspx/createConsentimiento',
                    data: '{docto: "' + docto + '", doctor: "' + selectedDoctor + '", paciente: "' + IdPaciente + '"}',
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        console.log(data);
                        let link = document.createElement("a");
                        link.download = docto;
                        link.href = window.location.origin + '/Temp-TemplateWord/' + docto;
                        link.click();
                        $('#loading').hide();
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            });
            $('.head').click(function () {
                $(this).toggleClass('active');
                $(this).parent().find('.arrow').toggleClass('arrow-animate');
                $(this).parent().find('.content').slideToggle(280);
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
