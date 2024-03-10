<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="Inventario.aspx.cs" Inherits="DB_Project.Inventario" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Administración</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/assets/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/assets/css/form-elements.css" />
    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="../media/Chaft2.css"/>
    <link rel="stylesheet" href="../media/Chaft.css"/>
    <script src="/assets/js/jquery-1.11.1.min.js"></script>
    <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="/assets/js/jquery.backstretch.min.js"></script>
    <script src="/assets/js/scripts.js"></script>
    <script src="../assets/js/jquery-3.7.1.min.js"></script>
    <script src="../assets/js/jquery.dataTables.min.js"></script>
    <script src="../assets/js/dataTables.cellEdit.js"></script>
    <link href="../assets/css/datatables.min.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        html {
            background-image: url("/assets/staff8.jpg");
            background-size: cover;
            background-position: 0 -90px;
            background-attachment: fixed;
        }

        body {
            background: none !important;
        }

        .backstretch {
            display: none !important;
        }

        .grad {
            background: linear-gradient(to right, rgba(30, 160, 130, 0.15),rgba(0, 148, 255, 1));
            border-radius: 8px;
        }

        #space {
            padding-bottom: 50px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#loading').hide();

            const dataSet = "{'data': " + "<%=WordConsent%>" + "}";

            const table = new DataTable('#example', {
                ajax: '../assets/data.txt',
                searching: false,
                pageLength: 15,
                dom: 'rtip',
                columns: [
                    { 'data': 'MATERIAL'},
                    { 'data': 'INGRESO'},
                    { 'data': 'EGRESO'},
                    {
                        data: null, "sClass": "binCentered", render: function (data, type, row) {
                            var numFormat = $.fn.dataTable.render.number(",", ".", 0, "").display;
                            var total = parseInt(data.INGRESO) - parseInt(data.EGRESO);
                            return numFormat(total);
                        }
                    }
                ]                
            });

            table.MakeCellsEditable({
                "onUpdate": myCallbackFunction
            });

            function myCallbackFunction(updatedCell, updatedRow, oldValue) {
                console.log("The new value for the cell is: " + updatedCell.data());
                console.log("The old value for that cell was: " + oldValue);
                console.log("The values for each cell in that row are: " + updatedRow.data());
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                    
                        <div class="form-top">
                            
                                <h3>Inventario</h3>
                                <div id="chavo87811" class="ember-view">
                                    <table id="example" class="display" width="100%">
                                        <thead>
                                            <tr>
                                                <th>MATERIAL</th>
                                                <th>INGRESO</th>
                                                <th>EGRESO</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            
                        </div>
                    </div>                
            </div>
            <br />        
    </form>
</asp:Content>
