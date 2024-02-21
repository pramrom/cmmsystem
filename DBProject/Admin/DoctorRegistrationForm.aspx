<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="DoctorRegistrationForm.aspx.cs" Inherits="DB_Project.DoctorRegistrationForm" %>

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
    <style type="text/css">
        html {
            background-image: url("/assets/Doctor.jpg");
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div id="myclass">

            <!-- Top content -->
            <!--  Doctor registration form start honay laga hai :)-->
            <div class="container myclass">
                <div class="row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <div class="form-box" id="spaces">
                            <div class="form-top">
                                <div class="form-top-left">
                                    <h3>Regístrar a un Doctor</h3>
                                    <asp:Label ID="Msg" runat="server" ForeColor="Blue" Visible="False" Font-Bold="True" Font-Size="Large" Font-Strikeout="False"></asp:Label>
                                </div>
                            </div>
                            <div class="form-bottom">
                                <!-- sign up form start honay laga hai :)-->
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="NameValidator" runat="server" ErrorMessage="* Requiredo" Display="dynamic" Font-Bold="False" SetFocusOnError="True" ControlToValidate="Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="Name" runat="server" type="text" class="form-username form-control" placeholder="Nombre" MaxLength="50"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="* Required0" ControlToValidate="BirthDate" ID="BDateReqiured" Display="Dynamic" Font-Bold="False" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="BirthDateValidator" runat="server" ErrorMessage="Birth Date Format Not Correct" ControlToValidate="BirthDate" Display="Dynamic" ValidationExpression="((?:0[1-9])|(?:1[0-2]))\/((?:0[0-9])|(?:[1-2][0-9])|(?:3[0-1]))\/(\d{4})" ForeColor="Red" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="BirthDate" runat="server" type="text" class="form-username form-control" placeholder="Fecha de Naciemiento (mm/dd/yyyy)"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RegularExpressionValidator ID="EmailformatValidator" runat="server" ErrorMessage="Formato de correo incorrecto" Display="Dynamic" ControlToValidate="Email" SetFocusOnError="True" ValidationExpression="(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|&quot;(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*&quot;)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <asp:CustomValidator runat="server" Display="Dynamic" ControlToValidate="Email" ID="DoctorValidate"
                                        ForeColor="Red" ErrorMessage="" OnServerValidate="ValidateDoctorEmail" SetFocusOnError="True"></asp:CustomValidator>
                                    <asp:RequiredFieldValidator runat="server" ErrorMessage="* Requiredo" ControlToValidate="Email" ID="RequiredFieldValidator3" Display="Dynamic" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="Email" runat="server" type="text" class="form-username form-control" placeholder="Correo : persono@ejemplo.com"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Requiredo" ControlToValidate="Password" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Las contraseñas no coinciden" ControlToValidate="Password" ControlToCompare="cPassword" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                    <asp:TextBox ID="Password" runat="server" type="password" class="form-username form-control" placeholder="Nuevo Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="cPassword" runat="server" type="password" class="form-username form-control" placeholder="Confirmar Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Solo Numeros" ControlToValidate="Phone" ValidationExpression='^[0-9]+$' Font-Strikeout="False" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="Phone" runat="server" type="text" class="form-username form-control" placeholder="Telefono"></asp:TextBox>
                                </div>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorp" runat="server" ErrorMessage="Solo Numeros" ControlToValidate="Salary" ValidationExpression='^[0-9]+$' Font-Strikeout="False" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Solo Numeros" ControlToValidate="Charges_per_visit" ValidationExpression='^[0-9]+$' Font-Strikeout="False" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Rango de experience debe ser (0-5)" MinimumValue="0" MaximumValue="5" Type="Integer" ControlToValidate="Exp" Display="Dynamic" ForeColor="Red"></asp:RangeValidator>
                                <div class="form-group">
                                    <asp:TextBox ID="Salary" runat="server" type="text" placeholder="Salario" Width="221px">0</asp:TextBox>
                                    <asp:TextBox ID="Charges_per_visit" runat="server" type="text" placeholder="Cargos por consulta" Width="227px">0</asp:TextBox>
                                    <asp:TextBox ID="Exp" runat="server" type="text" placeholder="Experiencia (0-5)" Width="229px">0</asp:TextBox>
                                </div>
                                <asp:CustomValidator runat="server" Display="Dynamic" ControlToValidate="Email" ID="DV"
                                    ForeColor="Red" ErrorMessage="" OnServerValidate="DepartmentValidate" SetFocusOnError="True"></asp:CustomValidator>
                                <div class="form-group">
                                    <asp:DropDownList ID="Department" runat="server" Width="228px" Height="39px">
                                        <asp:ListItem Text="Seleccione un Depatmento" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Cardiology" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Orthopaedics" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="ENT" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Physiotherapy" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Neurology" Value="5"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="Qualification" runat="server" type="text" placeholder="Calificación" Width="228px"></asp:TextBox>
                                    <asp:TextBox ID="spec" runat="server" type="text" placeholder="Especialización" Width="228px"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="Address" runat="server" class="form-username form-control" type="text" placeholder="Dirección"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RadioButton name="Gender" ID="Male" GroupName="Gender" runat="server" Text="Hombre"  value="M" />
                                    
                                    <asp:RadioButton name="Gender" ID="Female" GroupName="Gender" runat="server" Text="Mujer" Checked="true" value="F" />
                                </div>
                                <asp:Button Text="Agregar Doctor" runat="server" type="submit" class="button button--tall _start-consultation_alrpq4 ember-tooltip-target" OnClick="DoctorRegister"></asp:Button>
                                <!-- onclick="signup" -->
                                <!-- sing up ends here -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
