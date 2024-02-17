<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="DBProject.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <h1 style="text-align: center; background-color: #CCCCCC">
            <strong>Estadísticas de la clínica</strong>
        </h1>
        
        <div style="margin-left: 70px">
            <br />
            <br />        
            <h4><strong>Número total de médicos registrados: </strong></h4>
            <asp:Label ID="TotalPatients" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
            <br />
            <br />
            <h4><strong>Total de pacientes registrados: </strong></h4>
            <asp:Label ID="Total_Doctors" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
            <br />
            <br />
            <h4><strong>Ingresos totales: </strong></h4>
            <asp:Label ID="TotalIncome" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-4">
                    <h3><strong>Citas actuales&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Información del departamento</strong></h3>                    
                    <asp:GridView ID="Appointment_view" runat="server" ForeColor="Black" ItemStyle-Width="300px" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="left" Width="600px">
                        <AlternatingRowStyle BackColor="White" />
                        <RowStyle Width="150%" />
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                </div>
                <div class="col-4">

                </div>
                <div class="col-4">
                    <asp:GridView ID="department_View" runat="server" CellPadding="4" ForeColor="Black" Height="50px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" GridLines="Vertical" HorizontalAlign="Center" Width="500px" >
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                </div>
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
        <br />
        <br />
    </form>
</asp:Content>
