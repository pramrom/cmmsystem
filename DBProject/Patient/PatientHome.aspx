<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/PatientMaster.Master" AutoEventWireup="true" CodeBehind="PatientHome.aspx.cs" Inherits="DBProject.PatientMG.PatientHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../assets/js/jquery-3.7.1.min.js"></script>  
    <script src="../assets/js/jquery.dataTables.min.js"></script>  
    <link href="../assets/css/datatables.min.css" rel="stylesheet" />  
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />  
<title>Patient's Home</title>
    <script>
        $(document).ready(function () {
            const dataSet = <%=AgentOptInStatus%>;
            const table = new DataTable('#example', {
                columns: [
                    { title: 'ID' },
                    { title: 'Nombre' },
                    { title: 'Sexo' },
                    { title: 'Fecha Nacimiento' },
                    {
                        title: 'Consulta',
                        render: function (data, type, full, meta, row) {
                            return '<button data-id="' + full[0] + '" class="btn" type="button">Iniciar</button>';
                        }
                    }
                ],
                data: dataSet
            });
            // Activate an inline edit on click of a table cell
            table.on('click', 'tbody td.row-edit', function (e) {
                var id = $(this).attr("data-id");
                window.location.href = 'agenda.aspx?Id=' + id;
            });
            // Delete row
            table.on('click', 'tbody span.remove', function (e) {
                editor.remove(this.parentNode, {
                    title: 'Delete record',
                    message: 'Are you sure you wish to delete this record?',
                    buttons: 'Delete'
                });
            });
            $(document).on("click", ".btn", function (e) {
                var id = $(this).attr("data-id");
                console.log(id);
                window.location.href = 'agenda.aspx?Id=' + id;
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1 style="font-family: 'Times New Roman', Times, serif; border-radius: 5px; text-decoration: underline; background-color: #CCCCCC">
            <strong style="margin: 45%">Pacientes</strong>
        </h1>        
        <br /><br />
        <div style="margin-left: 20px">
            <table id="example" class="display" width="100%">
                <thead>
                    <tr>                        
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Sexo</th>
                        <th>Fecha Nacimiento</th>
                        <th></th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
