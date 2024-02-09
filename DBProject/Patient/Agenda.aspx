<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/PatientMaster.Master" AutoEventWireup="true" CodeBehind="Agenda.aspx.cs" Inherits="DBProject.PatientMG.Agenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Agenda</title>
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

                if (selectedDoctor == "--- Seleccione un Doctor ---") {
                    alert("Necesita seleccionar un doctor antes de generar un consentimiento");
                    $('#loading').hide();
                    return;
                }

                $.ajax({
                    type: "POST",
                    url: '/Patient/Agenda.aspx/createConsentimiento',
                    data: '{docto: "' + docto + '", doctor: "' + selectedDoctor + '"}',
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="notifications"></div>
    <div id="chavo-basic-dropdown-wormhole"></div>
    <div id="modal-overlays" dir="rtr">
    </div>
    <div id="loading"></div>
    <div class="ember-application__body">
        <div id="chavo8499" class="ember-view">
            <div class="_person-profile_1pgp7n">
                <div id="chavo8500" class="_widget-box-container_1kdhi6 ember-view">
                    <div data-autoid="general-info" id="chavo8501" class="_general-info_19fr1i ember-view">
                        <h3><strong>Consulta Actual</strong></h3>
                        <div id="chavo8502" class="_info-header_1klpxd ember-view">
                            <div class="_name_1klpxd">
                                <div class="_header-actions_1klpxd">
                                    <asp:Label ID="nombrePaciente" runat="server" Text="Label"></asp:Label>
                                    <button data-autoid="header-actions-toggle" id="chavo8504" class=" _toggle-dropdown_1dy3qg fa fa-ellipsis-h ember-view"></button>
                                </div>
                                <div class="_info-person_1klpxd">
                                    Edad: <asp:Label ID="edadPaciente" runat="server" Text="Label"></asp:Label>                                    
                                </div>
                                <div class="_info-person_1klpxd">
                                    Doctor: <asp:Label ID="DoctorActual" runat="server" Text="Label"></asp:Label>                                    
                                </div>
                            </div>
                        </div>

                    </div>

                    <dv data-autoid="consultations" id="chavo8767" class="ember-view">
                        <div id="chavo8780" class="ember-view">
                            <strong class="_heading_1ni3qz">Seleccionar un Doctor</strong>
                            <div id="chavo8781" class="ember-view">
                                <asp:DropDownList ID="DropDownDoctors" runat="server" OnSelectedIndexChanged="Selection_Change" OnTextChanged="Selection_Change"></asp:DropDownList>
                            </div>
                        </div>                        
                        <br />
                        <div class="_header-buttons_alrpq4">
                            <asp:Button ID="btnGuardarConsulta" runat="server" Text="Agregar Consulta" class="button button--tall _start-consultation_alrpq4 ember-tooltip-target" OnClientClick="return checkDecision();" OnClick="Button1_Click1"/>
                            <div id="chavo8769" class="ember-tooltip-base ember-view">
                                <div id="chavo8770" class="ember-view">
                                    <div>
                                        Crear consulta sin cita previa
                                    </div>
                                </div>
                            </div>
                            <button data-autoid="show-follow-up-reminder-button" class="button button--alternative button--tall _follow-up-reminder_alrpq4 ember-tooltip-target" data-ember-action="" data-ember-action-8771="8771">
                                <i aria-hidden="true" class="fa fa-clock-o"></i>
                                <div id="chavo8772" class="ember-tooltip-base ember-view">
                                    <div id="chavo8773" class="ember-view">
                                        <div>
                                            Programar Recordatorio
                                        </div>
                                    </div>
                                </div>
                            </button>
                        </div>
                        <!---->

                        <div class="_title-list_alrpq4">
                            <strong class="_heading_alrpq4 _heading_1ni3qz">Consultas guardadas
                            </strong>
                            <div id="chavo8777" class="_switch_alrpq4 _checkbox-switch_1lvift ember-view">
                                <input id="view-canceled-appointments-form" type="checkbox" data-autoid="checkbox-switch__input"/>
                                <label data-autoid="checkbox-switch__trigger" for="view-canceled-appointments-form"></label>
                                <label data-autoid="checkbox-switch__label" for="view-canceled-appointments-form">Ver citas canceladas</label>
                            </div>
                        </div>

                        <div data-autoid="consultation-schedules-list" id="chavo8778" class="ember-view" style="width: 515px;">
	                        <div id="chavo8785"  style="border:1px;">		
                                <div id = "DivINeedToAddStuffTo" runat="server" />
	                        </div>		
                        </div>
                    </div>

                <div id="chavo8560" class="_widget-box-container_1kdhi6 ember-view">
                            <br />
                            <br />
                    <div data-autoid="medical-history" id="chavo8561">
                        <div data-autoid="widget-box-header" class="_header_l8wwyk">
                            <h3><strong>Antecedentes</strong></h3>
                    <div class="_header-items_l8wwyk">
                    </div>
                        </div>
                        <div style="" class="container-accordion">
                            <div class="accordion-1">
                                <div id="chavo8563" class="head">
                                    <h2 data-autoid="record-title-pathological" id="chavo8569a" class="_record-title_1wtm69 ember-view">Alergias
                                    </h2>
                                </div>
                                <div class="content">
                                    <div id="chavo2414" class="">
                                        <div id="chavo2419" class="">
                                            <div class="_no-allergies_1kd7wc">
                                                <label>
                                                    El paciente no tiene alergias conocidas
                                            <input data-autoid="no-allergies" type="checkbox" id="no-allergies" class="ember-checkbox ember-view" />
                                                </label>
                                            </div>
                                            <div class="_other-allergies_1kd7wc">
                                                <label class="_title_1kd7wc">
                                                    Otras alergias                                       
                                                </label>
                                                <textarea data-autoid="medical-records-allergies" id="Otrasalergias" class="textarea--expand-on-focus ember-text-area ember-view" runat="server"></textarea>
                                            </div>
                                        </div>
                                        <div id="chavo3096" class="_record-actions_me0a7f ember-view">
                                            <asp:Button ID="btnAlergias" runat="server" class="button button--tall _start-consultation_alrpq4 ember-tooltip-target" OnClick="Button1_Click" Text="Guardar" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-1">
                                <div id="chavo8568" class="head">
                                    <h2 data-autoid="record-title-pathological" id="chavo8569" class="_record-title_1wtm69 ember-view">Antecedentes Patológicos
                                    </h2>
                                </div>
                                <div class="content _no-to-all_1qzc88 ember-view">
                                    <div class="_link_1qzc88">
                                        <a href="javascript:noAllAP()" data-ember-action="" data-ember-action-3070="3070">No a todo</a>
                                    </div>
                                    <div id="chavo2443" class="_medical-records_1d3apu ember-view">
                                        <ul data-autoid="medical-records" id="chavo3099" class="_medical-record-list-item_1d3apu ember-view">
                                            <li id="chavo3101" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Hospitalización Previa
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group1" id="chavo3120" class="ember-view" runat="server"/>Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group1" id="chavo3122" class="ember-view" runat="server"/>No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3124" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Cirugías Previas
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group2" id="chavo3127" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group2" id="chavo3129" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3131" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Diabetes
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group3" id="chavo3134" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group3" id="chavo3136" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3138" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Enfermedades Tiroideas
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group4" id="chavo3141" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group4" id="chavo3143" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3145" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Hipertensión Arterial
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group5" id="chavo3148" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group5" id="chavo3150" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3152" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Cardiopatias
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group6" id="chavo3155" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group6" id="chavo3157" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3159" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Traumatismos
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group7" id="chavo3162" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group7" id="chavo3164" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3166" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Cáncer
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group8" id="chavo3169" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group8" id="chavo3171" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3173" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Tuberculosis
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group9" id="chavo3176" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group9" id="chavo3178" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3180" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Transfusiones
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="groupa" id="chavo3183" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="groupa" id="chavo3185" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3187" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Patologías Respiratorias
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="groupb" id="chavo3190" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="groupb" id="chavo3192" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3194" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Patologías Gastrointestinales
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="groupc" id="chavo3197" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="groupc" id="chavo3199" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3201" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Enfermedades de Transmisión Sexual
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="groupd" id="chavo3204" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="groupd" id="chavo3206" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3208" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Enfermedad Renal Crónica
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="groupe" id="chavo3211" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="groupe" id="chavo3213" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3215" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Otros
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="groupf" id="chavo3218" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="groupf" id="chavo3220" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div id="chavo3201a" class="_record-actions_me0a7f ember-view">                                        
                                        <asp:Button ID="btnAP2" runat="server" OnClick="btnAP2_Click" Text="Guardar" class="button button--tall _start-consultation_alrpq4 ember-tooltip-target"/>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-1">
                                <div id="chavo8620" class="head">
                                    <h2 data-autoid="record-title-non-pathological" id="chavo8621" class="_record-title_1wtm69 ember-view">Antecedentes No Patológicos
                                    </h2>
                                </div>
                                <div class="content _no-to-all_1qzc88 ember-view">
                                    <div id="chavo2505" class="_record-body_okqhna ember-view">
                                        <div id="chavo2506" class="_no-to-all_1qzc88 ember-view">
                                            <div class="_link_1qzc88">
                                                <a href="javascript:noAllANP()" data-ember-action="" data-ember-action-3268="3268">No a todo
                                                </a>
                                            </div>
                                            <div id="chavo2507" class="_medical-records_1d3apu ember-view">
                                                <ul data-autoid="medical-records" id="chavo3269" class="_medical-record-list-item_1d3apu ember-view">
                                                    <li id="chavo3271" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                            Actividad Física
                                                        </div>
                                                        <div class="_radio-buttons_9k179t">
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="true" name="group0" id="chavo3274" class="ember-view" runat="server" />Si
                                                            </label>
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="false" name="group0" id="chavo3276" class="ember-view" runat="server" />No
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3278" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                            Tabaquismo
                                                        </div>
                                                        <div class="_radio-buttons_9k179t">
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="true" name="group1" id="chavo3281" class="ember-view" runat="server" />Si
                                                            </label>
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="false" name="group1" id="chavo3283" class="ember-view" runat="server" />No
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3285" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                            Alcoholismo
                                                        </div>
                                                        <div class="_radio-buttons_9k179t">
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="true" name="group2" id="chavo3288" class="ember-view" runat="server" />Si
                                                            </label>
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="false" name="group2" id="chavo3290" class="ember-view" runat="server" />No
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3292" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                            Uso de otras sustancias (Drogas)
                                                        </div>
                                                        <div class="_radio-buttons_9k179t">
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="true" name="group3" id="chavo3295" class="ember-view" runat="server" />Si
                                                            </label>
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="false" name="group3" id="chavo3297" class="ember-view" runat="server" />No
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3299" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                            Vacuna o Inmunización reciente
                                                        </div>
                                                        <div class="_radio-buttons_9k179t">
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="true" name="group4" id="chavo3302" class="ember-view" runat="server" />Si
                                                            </label>
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="false" name="group4" id="chavo3304" class="ember-view" runat="server" />No
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3306" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                            Otros
                                                        </div>
                                                        <div class="_radio-buttons_9k179t">
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="true" name="group5" id="chavo3309" class="ember-view" runat="server" />Si
                                                            </label>
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="false" name="group5" id="chavo3311" class="ember-view" runat="server" />No
                                                            </label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div id="chavo3312" class="_record-actions_me0a7f ember-view">                                            
                                            <asp:Button ID="btnANP2" runat="server" OnClick="btnANP2_Click" Text="Guardar" class="button button--tall _start-consultation_alrpq4 ember-tooltip-target"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-1">
                                <div id="chavo8645" class="head">
                                    <h2 data-autoid="record-title-heredo-familial" id="chavo8646" class="_record-title_1wtm69 ember-view">Antecedentes Heredofamiliares
                                    </h2>
                                </div>
                                <div class="content _no-to-all_1qzc88 ember-view">
                                    <div class="_link_1qzc88">
                                        <a href="javascript:noAllAHF()" data-ember-action="" data-ember-action-3070="3070">No a todo</a>
                                    </div>
                                    <div id="chavo2532" class="_medical-records_1d3apu ember-view">
                                        <ul data-autoid="medical-records" id="chavo3333" class="_medical-record-list-item_1d3apu ember-view">
                                            <li id="chavo3335" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Diabetes
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group0" id="chavo3338" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group0" id="chavo3340" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3342" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Cardiopatías
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group1" id="chavo3345" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group1" id="chavo3347" class="ember-view" runat="server" />No
                                                    </label>
                                            </li>
                                            <li id="chavo3349" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Hipertensión Arterial
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group2" id="chavo3352" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group2" id="chavo3354" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3356" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Enfermedades Tiroideas
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group3" id="chavo3359" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group3" id="chavo3361" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3363" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Enfermedad Renal Crónica
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group4" id="chavo3366" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group4" id="chavo3368" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                            <li id="chavo3370" class="_medical-record_1d3apu ember-view">
                                                <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                    Otros
                                                </div>
                                                <div class="_radio-buttons_9k179t">
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="true" name="group5" id="chavo3373" class="ember-view" runat="server" />Si
                                                    </label>
                                                    <label class="ember-radio-button  ">
                                                        <input type="radio" value="false" name="group5" id="chavo3375" class="ember-view" runat="server" />No
                                                    </label>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div id="chavo3201b" class="_record-actions_me0a7f ember-view">                                        
                                        <asp:Button ID="btnAHF2" runat="server" OnClick="btnAHF2_Click" Text="Guardar" class="button button--tall _start-consultation_alrpq4 ember-tooltip-target"/>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-1">
                                <div id="chavo8670" class="head">
                                    <h2 data-autoid="record-title-gineco-obstetrics" id="chavo8671" class="_record-title_1wtm69 ember-view">Antecedentes Gineco-Obstetricios</h2>
                                </div>
                                <div class="content _no-to-all_1qzc88 ember-view">
                                    <div id="chavo2555" class="_record-body_okqhna ember-view">
                                        <div id="chavo2556" class="_no-to-all_1qzc88 ember-view">
                                            <div class="_link_1qzc88">
                                                <a href="javascript:noAllAGO()" data-ember-action="" data-ember-action-3396="3396">No a todo</a>
                                            </div>
                                            <div id="chavo2557" class="_medical-records_1d3apu ember-view">
                                                <ul data-autoid="medical-records" id="chavo3397" class="_medical-record-list-item_1d3apu ember-view">
                                                    <li id="chavo3399" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            Fecha de primera menstruación
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo3401" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3402" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3403" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3405" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            Fecha de última menstruación
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo3407" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3408" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3409" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3411" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            Características menstruación
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo3413" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3414" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3415" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>

                                                    <div id="chavo8670a">
                                                        <h4 data-autoid="record-title-gineco-obstetrics" id="chavo8671a" class="ember-view">REPORTE EMBARAZOS</h4>
                                                    </div>

                                                    <li id="chavo3411a" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            Gestas
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo34131a" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3414a" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo341a5" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>

                                                    <li id="chavo3411b" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            Parto
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo34132b" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3414b" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3415b" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>

                                                    <li id="chavo3411b" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            CESAREA
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo34133b" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3414b" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3415b" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>

                                                    <li id="chavo3411b" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            ABORTO
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo34134b" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3414b" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3415b" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>

                                                    <li id="chavo3411b" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            ILE
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo34135b" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3414b" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3415b" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>

                                                    <div id="chavo8670a">
                                                        <h4 data-autoid="record-title-gineco-obstetrics" id="chavo86716a" class="ember-view">REPORTE UTRASONIDO</h4>
                                                    </div>

                                                    <li id="chavo3411a" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            LCC TAMAÑO
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo34137a" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3414a" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo341a5" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>

                                                    <li id="chavo3411a" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            LCC SEMANAS
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo34138c" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3414a" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo341a5" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>

                                                    <li id="chavo3411b" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            SG TAMAÑO
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo34139b" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3414b" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3415b" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>

                                                    <li id="chavo3411b" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            SG SEMANAS
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo34130b" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3414b" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3415b" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>

                                                    <li id="chavo3411b" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            ABORTO INCOMPETO
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo3413ab" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3414b" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3415b" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>

                                                    <li id="chavo3411b" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            SEMANAS
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo3413b" class="_deny-field_oxheyk ember-text-field ember-view" runat="server"/>
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3414b" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3415b" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>

                                                    <li id="chavo3417" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                            Embarazos
                                                        </div>
                                                        <div class="_radio-buttons_9k179t">
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="true" name="group0" id="chavo3420" class="ember-view" runat="server" />Si
                                                            </label>
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="false" name="group0" id="chavo3422" class="ember-view" runat="server" />No
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3424" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                            Cáncer Cérvico
                                                        </div>
                                                        <div class="_radio-buttons_9k179t">
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="true" name="group1" id="chavo3427" class="ember-view" runat="server" />Si
                                                            </label>
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="false" name="group1" id="chavo3429" class="ember-view" runat="server" />No
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3431" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                            Cáncer Uterino
                                                        </div>
                                                        <div class="_radio-buttons_9k179t">
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="true" name="group2" id="chavo3434" class="ember-view" runat="server" />Si
                                                            </label>
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="false" name="group2" id="chavo3436" class="ember-view" runat="server" />No
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3438" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                            Cáncer de Mama
                                                        </div>
                                                        <div class="_radio-buttons_9k179t">
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="true" name="group3" id="chavo3441" class="ember-view" runat="server" />Si
                                                            </label>
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="false" name="group3" id="chavo3443" class="ember-view" runat="server" />No
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3445" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                            Actividad sexual del paciente
                                                        </div>
                                                        <div class="_radio-buttons_9k179t">
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="true" name="group4" id="chavo3448" class="ember-view" runat="server" />Si
                                                            </label>
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="false" name="group4" id="chavo3450" class="ember-view" runat="server" />No
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3452" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            Método de Planificación Familiar
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo3454" class="_deny-field_oxheyk ember-text-field ember-view">
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3455" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3456" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3458" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                            Terapia de reemplazo hormonal
                                                        </div>
                                                        <div class="_radio-buttons_9k179t">
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="true" id="chavo3461" class="ember-view" runat="server" />Si
                                                            </label>
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="false" id="chavo3463" class="ember-view" runat="server" />No
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3465" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            Ultimo Papanicolau
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo3467" class="_deny-field_oxheyk ember-text-field ember-view">
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3468" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3469" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3471" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                                            Ultima Mastografía
                                                        </div>
                                                        <div class=" _deny-field-container_oxheyk">
                                                            <input data-autoid="deny-field" type="text" id="chavo3473" class="_deny-field_oxheyk ember-text-field ember-view">
                                                            <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                                                <div id="chavo3474" class="ember-tooltip-base ember-view">
                                                                    <div id="chavo3475" class="ember-view">
                                                                        <div>
                                                                            n/a
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li id="chavo3477" class="_medical-record_1d3apu ember-view">
                                                        <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                                            Otros
                                                        </div>
                                                        <div class="_radio-buttons_9k179t">
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="true" id="chavo3480" class="ember-view" runat="server" />Si
                                                            </label>
                                                            <label class="ember-radio-button  ">
                                                                <input type="radio" value="false" id="chavo3482" class="ember-view" runat="server" />No
                                                            </label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div id="chavo3483" class="_record-actions_me0a7f ember-view">
                                            <asp:Button ID="btnAGO2" runat="server" OnClick="btnAGO2_Click" Text="Guardar" class="button button--tall _start-consultation_alrpq4 ember-tooltip-target"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <section>
                        <!---->
                    </section>
                    <div id="chavo8765" class="ember-view">
                        <div data-autoid="upload-files-person-profile" id="chavo8557" class="ember-view">
                            <div id="chavo8558" class="_widget-box_l8wwyk ember-view">
                                <div data-autoid="widget-box-header" class="_header_l8wwyk">Archivos
                                    <div class="_header-items_l8wwyk">
                                    </div>
                                </div>
                                <div style="" class="_body_l8wwyk--has-padding  _body_l8wwyk">
                                    <span class="_empty-status_u7zs43">No se han subido archivos.
                                    </span>
                                    <div id="chavo8559" class="_button-upload-file_1xib8y ember-view">
                                        <input data-autoid="button-upload-file-upload" type="file" id="button-upload-file-upload" class="ember-view"/>
                                        <label for="button-upload-file-upload" class="button button--outline button--has-icon">Adjuntar archivo</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="chavo8766" class="_widget-box-container_1kdhi6 ember-view">

                    <div id="chavo87810" class="ember-view">
                        <h3><strong>Descarga de Concentimientos</strong></h3>
                        <div id="chavo87811" class="ember-view">
                            <table id="example" class="display" width="100%">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th></th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <!---->
            </div>
        </div>
    </div>
    <div id="flash-messages">
    </div>
    <div id="chavo807" class="ember-view" style="height: 120px;">
    </div>
    <div class="intercom-lightweight-app">
        <div class="intercom-lightweight-app-launcher intercom-launcher" role="button" tabindex="0" aria-label="Abrir Intercom Messenger" aria-live="polite">
            <div class="intercom-lightweight-app-launcher-icon intercom-lightweight-app-launcher-icon-open">
            </div>
            <div class="intercom-lightweight-app-launcher-icon intercom-lightweight-app-launcher-icon-minimize">
            </div>
        </div>
    </div>
    <div class="shepherd-step shepherd shepherd-element shepherd-theme-arrows shepherd-transparent-text shepherd-has-title shepherd-has-cancel-link shepherd-element-attached-middle shepherd-element-attached-left shepherd-target-attached-middle shepherd-target-attached-right" data-id="person-index-1" style="top: 0px; left: 0px; position: absolute; transform: translateX(436px) translateY(226px) translateZ(0px);">
        <div class="shepherd-content">
            <header>
                <h3 class="shepherd-title">Datos del Paciente</h3>
                <a href="" class="shepherd-cancel-link">✕</a>
            </header>
            <div class="shepherd-text">
                <p>Aquí puedes ver y editar la información demográfica de los pacientes.</p>
            </div>
            <footer>
                <ul class="shepherd-buttons">
                    <li>
                        <a class="shepherd-button shepherd-button-secondary shepherd__person-index-1">Salir</a>
                    </li>
                    <li>
                        <a class="shepherd-button shepherd-button-primary">Siguiente</a>
                    </li>
                </ul>
            </footer>
        </div>
    </div>
    <div class="tui-tooltip" style="display: none;">
        <div class="arrow"></div>
        <span class="text"></span>
    </div>
    <div class="shepherd-step shepherd shepherd-element shepherd-theme-arrows shepherd-transparent-text shepherd-has-title shepherd-has-cancel-link shepherd-element-attached-middle shepherd-element-attached-left shepherd-target-attached-middle shepherd-target-attached-right" data-id="application-1" style="top: 0px; left: 0px; position: absolute; transform: translateX(59px) translateY(136px) translateZ(0px);">
        <div class="shepherd-content">
            <header>
                <h3 class="shepherd-title">Reportes</h3>
                <a href="" class="shepherd-cancel-link">✕</a>
            </header>
            <div class="shepherd-text">
                <p>Genera reportes a tu medida sobre tus consultas y ve tus métricas de uso.</p>
            </div>
            <footer>
                <ul class="shepherd-buttons">
                    <li>
                        <a class="shepherd-button shepherd-button-secondary">Salir</a>
                    </li>
                    <li>
                        <a class="shepherd-button shepherd-button-primary">Siguiente</a>
                    </li>
                </ul>
            </footer>
        </div>
    </div>

<script type="text/javascript">

    function checkDecision() {
        if (document.getElementById("ContentPlaceHolder1_DropDownDoctors").value == "0") {
            alert("Necesita seleccionar un doctor para guardar la consulta");
            return false;
        }
        else {
            $('#loading').hide();
            return true;
        }
    }

    function noAllAP() {
        if (document.getElementById("ContentPlaceHolder1_chavo3122".trim()).checked) {
            document.getElementById("ContentPlaceHolder1_chavo3122".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3129".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3136".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3143".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3150".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3157".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3164".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3171".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3178".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3185".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3192".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3199".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3206".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3213".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3220".trim()).checked = false;
        }
        else {
            document.getElementById("ContentPlaceHolder1_chavo3122".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3129".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3136".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3143".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3150".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3157".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3164".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3171".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3178".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3185".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3192".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3199".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3206".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3213".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3220".trim()).checked = true;
        }
    }

    function noAllANP() {
        if (document.getElementById("ContentPlaceHolder1_chavo3276".trim()).checked) {
            document.getElementById("ContentPlaceHolder1_chavo3276".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3283".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3290".trim()).checked = false
            document.getElementById("ContentPlaceHolder1_chavo3297".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3304".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3311".trim()).checked = false;
        }
        else {
            document.getElementById("ContentPlaceHolder1_chavo3276".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3283".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3290".trim()).checked = true
            document.getElementById("ContentPlaceHolder1_chavo3297".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3304".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3311".trim()).checked = true;
        }
    }

    function noAllAHF() {
        if (document.getElementById("ContentPlaceHolder1_chavo3340".trim()).checked) {
            document.getElementById("ContentPlaceHolder1_chavo3340".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3347".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3354".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3361".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3368".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3375".trim()).checked = false;
        }
        else {
            document.getElementById("ContentPlaceHolder1_chavo3340".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3347".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3354".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3361".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3368".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3375".trim()).checked = true;
        }
    }

    function noAllAGO() {
        if (document.getElementById("ContentPlaceHolder1_chavo3422".trim()).checked) {
            document.getElementById("ContentPlaceHolder1_chavo3422".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3429".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3436".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3443".trim()).checked = false;
            document.getElementById("ContentPlaceHolder1_chavo3450".trim()).checked = false;
        }
        else {
            document.getElementById("ContentPlaceHolder1_chavo3422".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3429".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3436".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3443".trim()).checked = true;
            document.getElementById("ContentPlaceHolder1_chavo3450".trim()).checked = true;
        }
    }


    function Func() {
        $('#loading').hide();
    }


</script>
</asp:Content>
