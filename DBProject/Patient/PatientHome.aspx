<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/PatientMaster.Master" AutoEventWireup="true" CodeBehind="PatientHome.aspx.cs" Inherits="DBProject.Patient.PatientHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../assets/js/jquery-3.7.1.min.js"></script>  
    <script src="../assets/js/jquery.dataTables.min.js"></script>  
    <link href="../assets/css/datatables.min.css" rel="stylesheet" />  
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />  

<title>Patient's Home</title>
    <script>
        $(document).ready(function () {
            const dataSet = <%=AgentOptInStatus%>;

            new DataTable('#example', {
                columns: [
                    { title: 'ID' },
                    { title: 'Name' },
                    { title: 'gender' },
                    { title: 'dateOfBirth' }
                ],
                data: dataSet
            });
        });
    </script>


</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
    <div style="background-image:url(/assets/img/backgrounds/PatientHome.jpg); background-position:center; background-size:20px">

        <br />
        <h1><strong style="margin:37%">Your Information</strong></h1>
        <br /><br />

        <div style="margin-left: 70px">

            <table id="example" class="display" width="100%"></table>

        </div>

    </div>

</asp:Content>
