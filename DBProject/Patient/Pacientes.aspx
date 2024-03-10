<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/PatientMaster.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="DBProject.PatientMG.Pacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Pacientes</title>
    <style data-styles="">
        alert-dialog, duet-date-picker, vaccination-module, vaccine-table, auto-complete, vaccination-card, modal-dialog {
            visibility: hidden
        }
        .hydrated {
            visibility: inherit
        }
    </style>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link href="../assets/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" href="../media/Chaft2.css"/>
    <link rel="stylesheet" href="../media/Chaft.css"/>
    <script src="../assets/jquery-ui-1.11.4/jquery-ui.min.js"></script>
    <script src="../assets/jquery-ui-1.11.4/external/jquery/datepicker-es.js"></script>
    <script>
        $(function () {
            $("#ContentPlaceHolder1_personbornat").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1950:2030'
                }
            );
        });
        // Validates that the input string is a valid date formatted as "dd/mm/yyyy"
        function isValidDate(dateString)
        {
            // First check for the pattern
            if(!/^\d{1,2}\/\d{1,2}\/\d{4}$/.test(dateString))
                return false;

            // Parse the date parts to integers
            var parts = dateString.split("/");
            var day = parseInt(parts[1], 10);
            var month = parseInt(parts[0], 10);
            var year = parseInt(parts[2], 10);

            // Check the ranges of month and year
            if(year < 1000 || year > 3000 || month == 0 || month > 12)
                return false;

            var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

            // Adjust for leap years
            if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
                monthLength[1] = 29;

            // Check the range of the day
            return day > 0 && day <= monthLength[month - 1];
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="notifications"></div>
    <div id="ember-basic-dropdown-wormhole"></div>
    <div id="ember1060" class="ember-view">        
        <div dir="rtr" class="ember-application-container__body">
            <div id="ember1118" class="ember-view"></div>
            <div class="ember-application__container">                
                <div class="ember-application__body">
                    <h1 id="ember6345">
                        <asp:Label ID="lblTitulo" runat="server" Text="Label"></asp:Label>
                    </h1>
                    <br />
                    <br />
                    <div id="ember6284" class="">                        
                        <div id="ember6331" style="width: 800px;">
                            <div data-autoid="general-content" id="ember6344" class="ember-view">
                                
                                <div id="ember6346" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">
                                    <div id="ember6347" class="_field_1mkkpr ember-view">
                                        <label for="person-first-name" class="_required_1mkkpr">
                                            Nombre(s)
                                        </label>
                                        <input id="personfirstname" data-autoid="person-first-name" type="text" class="ember-view" runat="server" maxlength="30" />
                                    </div>
                                    <div id="ember6348" class="_field_1mkkpr ember-view">
                                        <label for="person-last-name" class="_required_1mkkpr">
                                            Apellido(s)
                                        </label>
                                        <input id="personlastname" data-autoid="person-last-name" type="text" class="ember-view" runat="server" maxlength="30"/>
                                    </div>
                                </div>
                        <div data-autoid="demographic-accordion" id="ember63940" class="ember-view">
                            <div id="ember6349" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">
                                <div id="ember6350" class="_field_1mkkpr ember-view">
                                    <label for="person-born-at" class="_required_1mkkpr">Fecha de nacimiento</label>
                                    <input placeholder="DD-MM-AAAA" id="personbornat" data-autoid="person-born-at" type="text" class="ember-view" runat="server" maxlength="10" />
                                </div>
                                <div id="ember6383" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">
                                    <div id="ember6384" class="_field_1mkkpr ember-view">
                                        <label for="person-telephone">Teléfono</label>
                                        <input id="persontelephone" data-autoid="person-telephone" type="text" class="ember-view" runat="server" maxlength="11" />
                                    </div>
                                </div>
                                <div id="ember64310" class="_field_1mkkpr ember-view">
                                    <label>
                                        
                                    </label>
                                    <input id="personCURP" type="text" class="ember-view" runat="server" maxlength="18" visible="false" />
                                </div>
                                <div id="ember64313" class="_field_1mkkpr ember-view">
                                    <label>
                                        Servicio Solicitado
                                    </label>
                                    <input id="personSerSol" type="text" class="ember-view" runat="server" maxlength="10" />
                                </div>
                            </div>
                            <div id="ember63491" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">
                                <div id="ember643101" class="_field_1mkkpr ember-view">
                                    <label>
                                        Cita programada
                                    </label>
                                    <input id="citaprogam" type="text" class="ember-view" runat="server" maxlength="10" />
                                </div>
                                <div id="ember64311" class="_field_1mkkpr ember-view">
                                    <label>
                                        Hora
                                    </label>
                                    <input id="hora" type="text" class="ember-view" runat="server" maxlength="10" />
                                </div>
                            </div
                            <div id="ember63490" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">
                                <div id="ember6351" class="_field_1mkkpr ember-view">
                                    <label for="person-born-at" class="_field_1mkkpr ember-view">Estado Civil</label>
                                    <input id="pedociv" type="text" class="ember-view" runat="server" maxlength="17" />
                                </div>
                                <div id="ember63830" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">
                                    <div id="ember6385" class="_field_1mkkpr ember-view">
                                        <label for="person-telephone">Nivel Educativo</label>
                                        <input id="pnedu" data-autoid="person-telephone" type="text" class="ember-view" runat="server" maxlength="17" />
                                    </div>
                                </div>
                                <div id="ember64312" class="_field_1mkkpr ember-view">
                                    <label>
                                        Ocupación
                                    </label>
                                    <input id="pocupa" type="text" class="ember-view" runat="server" maxlength="17" />
                                </div>
                            </div>
                            <br />
                            <div data-autoid="demographic-accordion" id="ember6394" class="ember-view">
                                <div id="ember6403" class="">
                                    Dirección
                                </div>
                                <div id="ember6408" class="ember-view">
                                    <div data-autoid="demographic-content" id="ember6417" class="ember-view">
                                        <div id="ember6421" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">
                                            <div id="ember6422" class="_field_1mkkpr ember-view">
                                                <label>
                                                    Estado
                                                </label>
                                                <input id="personPais" type="text" class="ember-view" runat="server" maxlength="50"/>
                                            </div>
                                            <div id="ember6431" class="_field_1mkkpr ember-view">
                                                <label>
                                                    Alcaldia
                                                </label>
                                                <input id="personEstado" type="text" class="ember-view" runat="server" maxlength="50"/>
                                            </div>
                                        </div>
                                        <div id="ember6418" class="_fieldset_1kfu8s ember-view">
                                            <div id="ember6420" class="_field_1mkkpr ember-view">
                                                <label for="person-address">
                                                    Domicilio
                                                </label>
                                                <input id="personaddress" type="text" class="ember-view" runat="server" maxlength="40"/>
                                            </div>
                                        </div>
                                        <div id="ember6443" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">
                                            <div id="ember6445" class="_field_1mkkpr ember-view">
                                                <label for="person-address-external-number">
                                                    Número exterior
                                                </label>
                                                <input id="personaddressexternalnumber" type="text" class="ember-view" runat="server" maxlength="10"/>
                                            </div>
                                            <div id="ember6447" class="_field_1mkkpr ember-view">
                                                <label for="person-internal-number">
                                                    Número interior
                                                </label>
                                                <input id="personaddressinternalnumber" type="text" class="ember-view" runat="server" maxlength="10"/>
                                            </div>
                                        </div>
                                        <div id="ember6439" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">
                                            <div id="ember6440" class="_field_1mkkpr ember-view">
                                                <label for="person-city">
                                                    Colonia
                                                </label>
                                                <input id="personColonia" type="text" class="ember-view" runat="server" maxlength="30"/>
                                            </div>
                                            <div id="ember6442" class="_field_1mkkpr ember-view">
                                                <label for="person-zipcode">
                                                    Código Postal
                                                </label>
                                                <input id="personzipcode" type="text" class="ember-view" runat="server" maxlength="5"/>
                                            </div>
                                        </div>
                                        <div id="ember64180" class="_fieldset_1kfu8s ember-view">
                                            <div id="ember6423" class="_field_1mkkpr ember-view">
                                                <label for="person-address">
                                                    Capturo
                                                </label>
                                                <input id="Capturo" type="text" class="ember-view" runat="server" maxlength="80"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div data-autoid="insurance-accordion" id="ember6448" class="ember-view"></div>
                            <div data-autoid="responsible-accordion" id="ember6449" class="ember-view"></div>
                            <div data-autoid="hotel-accordion" id="ember6450" class="ember-view"></div>
                            <div data-autoid="employee-accordion" id="ember6451" class="ember-view"></div>
                            <div data-autoid="custom-forms-accordion" id="ember6452" class="ember-view"></div>
                            <div class="_actions_16ja5c">
                                <asp:Button ID="btnGuardarConsulta" runat="server" Text="Guardar Paciente" class="button button--tall _start-consultation_alrpq4 ember-tooltip-target" OnClientClick="return validaPaciente();" OnClick="Button1_Click1"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="flash-messages">
            </div>
            <div id="ember1426" class="ember-view">
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function validaPaciente() {
            var strNombre = document.getElementById("ContentPlaceHolder1_personfirstname").value;
            if (strNombre.trim() == "") {
                alert("Nombre del paciente es requerido");
                return false;
            }

            var strNombre = document.getElementById("ContentPlaceHolder1_personlastname").value;
            if (strNombre.trim() == "") {
                alert("Apellido del paciente es requerido");
                return false;
            }

            var strNombre = document.getElementById("ContentPlaceHolder1_personbornat").value;
            if (strNombre.trim() == "") {
                alert("La fecha de naciemiento es requerida");
                return false;
            }

            if (isValidDate())
                return true;
            else
                return false;
            
        }
        // Validates that the input string is a valid date formatted as "mm/dd/yyyy"
        function isValidDate() {
            dateString = document.getElementById("ContentPlaceHolder1_personbornat").value;
            // First check for the pattern
            if (!/^\d{1,2}\/\d{1,2}\/\d{4}$/.test(dateString)) {
                alert('Formato de fecha incorrecto, debe ser DD/MM/YYYY')
                return false;
            }

            // Parse the date parts to integers
            var parts = dateString.split("/");
            var day = parseInt(parts[0], 10);
            var month = parseInt(parts[1], 10);
            var year = parseInt(parts[2], 10);

            // Check the ranges of month and year
            if (year < 1000 || year > 3000 || month == 0 || month > 12) {
                alert('Fecha invalida')
                return false;
            }

            var monthLength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

            // Adjust for leap years
            if (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
                monthLength[1] = 29;

            // Check the range of the day
            if (day > 0 && day <= monthLength[month - 1]) {
                return true
            }
            else {
                alert('Fecha invalida')
                return false;
            }
        };
    </script>
    </div>
    </div>
</asp:Content>
