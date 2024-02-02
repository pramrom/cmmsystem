<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/PatientMaster.Master" AutoEventWireup="true" CodeBehind="Agenda.aspx.cs" Inherits="DBProject.Patient.Agenda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Agenda</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1, user-scalable=0"/>
    <meta name="msapplication-TileColor" content="#FFF"/>
    <meta name="theme-color" content="#278bfe"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <meta name="ember-cli-head-start" content=""/>
    <meta name="ember-cli-head-end" content=""/>   
    <link rel="stylesheet" href="../media/Chaft.css"/>
    <link rel="stylesheet" href="../media/Chaft2.css"/>
    <script src="../assets/js/jquery-3.7.1.min.js"></script>  
    <script src="../assets/js/jquery.dataTables.min.js"></script>  
    <link href="../assets/css/datatables.min.css" rel="stylesheet" />  
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />  
    <script>
        $(document).ready(function () {
            const dataSet = <%=WordConsent%>;
            const table = new DataTable('#example', {
                searching: false,
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
                $.ajax({
                    type: "POST",
                    url: '/Patient/Agenda.aspx/createConsentimiento',
                    data: '{message: "HAI" }',
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        console.log(data);
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
                //let link = document.createElement("a");
                //link.download = table.row(this).data();
                //link.href = window.location.origin + '/TemplatesWord/' + table.row(this).data();
                //link.click();
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
    <div class="ember-application__body">
        <div id="chavo8499" class="ember-view">
            <div class="_person-profile_1pgp7n">
                <div id="chavo8500" class="_widget-box-container_1kdhi6 ember-view">
                    <div data-autoid="general-info" id="chavo8501" class="_general-info_19fr1i ember-view">
                        <div id="chavo8502" class="_info-header_1klpxd ember-view">                            
                            <div class="_name_1klpxd">
                                <div class="_header-actions_1klpxd">
                                    <asp:Label ID="nombrePaciente" runat="server" Text="Label"></asp:Label>
                                    <button data-autoid="header-actions-toggle" id="chavo8504" class=" _toggle-dropdown_1dy3qg fa fa-ellipsis-h ember-view"></button>
                                </div>
                                <div class="_info-person_1klpxd">
                                    03/07/2003 - 20 años
                                    <a role="button" data-autoid="info-header-toggleBody" class="_toggle-view_1klpxd ember-tooltip-target" data-ember-action="" data-ember-action-8505="8505">
                                        <i class="fa fa-angle-double-down"></i>
                                        <div id="chavo8506" class="ember-tooltip-base ember-view">
                                            <div id="chavo8507" class="ember-view">
                                                <div>
                                                    Para dejar una nota interna o mostrar todos los datos generales de tu paciente, da lick aquí.
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div data-autoid="note-field" id="chavo8508" class="_internal-notes_1tuyqw ember-view">
                            <label for="note-field" data-autoid="note-field-label">
                                Notas internas
                                <span class="_saving-status_1tuyqw">
                                </span>
                            </label>
                            <textarea placeholder="Estas notas sólo son visibles para el médico." rows="6" id="note-field" data-autoid="note-field-textarea" class="ember-view"></textarea>
                        </div>
                    </div>
                    <ul id="chavo8509" class="_vital-signs-set-container_hxb1qe ember-view">
                        <div id="chavo8510" class="_widget-box_l8wwyk ember-view">
                            <div data-autoid="widget-box-header" class="_header_l8wwyk">
                                Últimos signos vitales
                                <div class="_header-items_l8wwyk">
                                    <div id="chavo8512" class="_popmenu_gyhhe9 ember-view">
                                        <div data-autoid="handle" id="chavo8513" class="_handle_gyhhe9 _header-action_l8wwyk _popover-handle_1e6s0i ember-view">
                                            <i class="fa fa-ellipsis-h"></i>
                                        </div>
                                        <div id="chavo8514" class="ember-view">
                                            <!---->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="" class="_body_l8wwyk--has-padding  _body_l8wwyk">
                                <div data-autoid="vital-signs-set-basic" id="chavo8515" class="ember-view">
                                    <li id="chavo8519" class="_vital-sign_8x0tfa ember-view">
                                        <div class="_element_8x0tfa">
                                            <div class="_field_8x0tfa">
                                                <div class="_vital-sign-row_c5jvwj _vital-sign-row_184cp7 ">
                                                    <img src="../media/height.svg" alt="Estatura" class="_icon_c5jvwj">
                                                    <div class="_vital-sign-name_c5jvwj _vital-sign-name_184cp7">
                                                        Estatura
                                                    </div>
                                                    <div class="_vital-sign-data_c5jvwj _vital-sign-data_184cp7">
                                                        <div class="_vital-sign-data-value_c5jvwj _vital-sign-data-value_184cp7">
                                                            <div class="_vital-sign-value-readonly_c5jvwj _vital-sign-value-readonly_184cp7">
                                                                <!---->
                                                            </div>
                                                        </div>
                                                        <div class="_vital-sign-data-unit_c5jvwj">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="_graph_8x0tfa">
                                        </div>
                                    </li>
                                    <li id="chavo8523" class="_vital-sign_8x0tfa ember-view">
                                        <div class="_element_8x0tfa">
                                            <div class="_field_8x0tfa">
                                                <div class="_vital-sign-row_c5jvwj _vital-sign-row_184cp7 ">
                                                    <img src="../media/weight.svg" alt="Peso" class="_icon_c5jvwj">
                                                    <div class="_vital-sign-name_c5jvwj _vital-sign-name_184cp7">
                                                        Peso
                                                    </div>
                                                    <div class="_vital-sign-data_c5jvwj _vital-sign-data_184cp7">
                                                        <div class="_vital-sign-data-value_c5jvwj _vital-sign-data-value_184cp7">
                                                            <div class="_vital-sign-value-readonly_c5jvwj _vital-sign-value-readonly_184cp7">
                                                                <!---->
                                                            </div>
                                                        </div>
                                                        <div class="_vital-sign-data-unit_c5jvwj">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!---->
                                        </div>
                                        <div class="_graph_8x0tfa">
                                            <!---->
                                        </div>
                                    </li>
                                    <li id="chavo8527" class="_vital-sign_8x0tfa ember-view">
                                        <div class="_element_8x0tfa">
                                            <div class="_field_8x0tfa">
                                                <div class="_vital-sign-row_c5jvwj _vital-sign-row_184cp7 ">
                                                    <img src="../media/body_mass.svg" alt="Masa Corporal" class="_icon_c5jvwj">
                                                    <div class="_vital-sign-name_c5jvwj _vital-sign-name_184cp7">
                                                        Masa Corporal
                                                    </div>
                                                    <div class="_vital-sign-data_c5jvwj _vital-sign-data_184cp7">
                                                        <div class="_vital-sign-data-value_c5jvwj _vital-sign-data-value_184cp7">
                                                            <div class="_vital-sign-value-readonly_c5jvwj _vital-sign-value-readonly_184cp7">
                                                                <!---->
                                                            </div>
                                                        </div>
                                                        <div class="_vital-sign-data-unit_c5jvwj">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!---->
                                        </div>
                                        <div class="_graph_8x0tfa">
                                            <!---->
                                        </div>
                                    </li>
                                    <!---->
                                    <li id="chavo8532" class="_vital-sign_8x0tfa ember-view">
                                        <div class="_element_8x0tfa">
                                            <div class="_field_8x0tfa">
                                                <div class="_vital-sign-row_c5jvwj _vital-sign-row_184cp7 ">
                                                    <img src="../media/respiratory_rate.svg" alt="Frecuencia Respiratoria" class="_icon_c5jvwj">
                                                    <div class="_vital-sign-name_c5jvwj _vital-sign-name_184cp7">
                                                        Frecuencia Respiratoria
                                                    </div>
                                                    <div class="_vital-sign-data_c5jvwj _vital-sign-data_184cp7">
                                                        <div class="_vital-sign-data-value_c5jvwj _vital-sign-data-value_184cp7">
                                                            <div class="_vital-sign-value-readonly_c5jvwj _vital-sign-value-readonly_184cp7">
                                                                <!---->
                                                            </div>
                                                        </div>
                                                        <div class="_vital-sign-data-unit_c5jvwj">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!---->
                                        </div>
                                        <div class="_graph_8x0tfa">
                                            <!---->
                                        </div>
                                    </li>
                                    <li id="chavo8536" class="_vital-sign_8x0tfa ember-view">
                                        <div class="_element_8x0tfa">
                                            <div class="_field_8x0tfa">
                                                <div class="_vital-sign-row_c5jvwj _vital-sign-row_184cp7 ">
                                                    <img src="../media/systole.svg" alt="Sistólica" class="_icon_c5jvwj">
                                                    <div class="_vital-sign-name_c5jvwj _vital-sign-name_184cp7">
                                                        Sistólica
                                                    </div>
                                                    <div class="_vital-sign-data_c5jvwj _vital-sign-data_184cp7">
                                                        <div class="_vital-sign-data-value_c5jvwj _vital-sign-data-value_184cp7">
                                                            <div class="_vital-sign-value-readonly_c5jvwj _vital-sign-value-readonly_184cp7">
                                                                <!---->
                                                            </div>
                                                        </div>
                                                        <div class="_vital-sign-data-unit_c5jvwj">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!---->
                                        </div>
                                        <div class="_graph_8x0tfa">
                                            <!---->
                                        </div>
                                    </li>
                                    <li id="chavo8540" class="_vital-sign_8x0tfa ember-view">
                                        <div class="_element_8x0tfa">
                                            <div class="_field_8x0tfa">
                                                <div class="_vital-sign-row_c5jvwj _vital-sign-row_184cp7 ">
                                                    <img src="../media/diastole.svg" alt="Diastólica" class="_icon_c5jvwj">
                                                    <div class="_vital-sign-name_c5jvwj _vital-sign-name_184cp7">
                                                        Diastólica
                                                    </div>
                                                    <div class="_vital-sign-data_c5jvwj _vital-sign-data_184cp7">
                                                        <div class="_vital-sign-data-value_c5jvwj _vital-sign-data-value_184cp7">
                                                            <div class="_vital-sign-value-readonly_c5jvwj _vital-sign-value-readonly_184cp7">
                                                                <!---->
                                                            </div>
                                                        </div>
                                                        <div class="_vital-sign-data-unit_c5jvwj">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!---->
                                        </div>
                                        <div class="_graph_8x0tfa">
                                            <!---->
                                        </div>
                                    </li>
                                    <li id="chavo8544" class="_vital-sign_8x0tfa ember-view">
                                        <div class="_element_8x0tfa">
                                            <div class="_field_8x0tfa">
                                                <div class="_vital-sign-row_c5jvwj _vital-sign-row_184cp7 ">
                                                    <img src="../media/heart_rate.svg" alt="Frecuencia Cardiaca" class="_icon_c5jvwj">
                                                    <div class="_vital-sign-name_c5jvwj _vital-sign-name_184cp7">
                                                        Frecuencia Cardiaca
                                                    </div>
                                                    <div class="_vital-sign-data_c5jvwj _vital-sign-data_184cp7">
                                                        <div class="_vital-sign-data-value_c5jvwj _vital-sign-data-value_184cp7">
                                                            <div class="_vital-sign-value-readonly_c5jvwj _vital-sign-value-readonly_184cp7">
                                                                <!---->
                                                            </div>
                                                        </div>
                                                        <div class="_vital-sign-data-unit_c5jvwj">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!---->
                                        </div>
                                        <div class="_graph_8x0tfa">
                                            <!---->
                                        </div>
                                    </li>
                                </div>
                            </div>
            <!---->
        </div>
        <!----></ul>
        <div data-autoid="upload-files-person-profile" id="chavo8557" class="ember-view">
            <div id="chavo8558" class="_widget-box_l8wwyk ember-view">
                <div data-autoid="widget-box-header" class="_header_l8wwyk">
                    Archivos
                    <div class="_header-items_l8wwyk">
                    </div>
                </div>
                <div style="" class="_body_l8wwyk--has-padding  _body_l8wwyk">
                    <span class="_empty-status_u7zs43">
                        No se han subido archivos.
                    </span>
                    <div id="chavo8559" class="_button-upload-file_1xib8y ember-view">
                        <input data-autoid="button-upload-file-upload" type="file" id="button-upload-file-upload" class="ember-view">
                        <label for="button-upload-file-upload" class="button button--outline button--has-icon">
                            Adjuntar archivo
                        </label>
                    </div>
                </div>
                <!---->
            </div>
            <!---->
        </div>
    </div>
    <div id="chavo8560" class="_widget-box-container_1kdhi6 ember-view">
        <div data-autoid="medical-history" id="chavo8561" class="ember-view">
            <div id="chavo8562" class="_widget-box_l8wwyk ember-view">
                <div data-autoid="widget-box-header" class="_header_l8wwyk">
                    Antecedentes
                    <div class="_header-items_l8wwyk">
                    </div>
                </div>
                <div style="" class="container-accordion">
                    <div class="accordion-1">
                        <div id="chavo8563" class="head">
                            <h2 data-autoid="record-title-pathological" id="chavo8569a" class="_record-title_1wtm69 ember-view">
                                Alergias
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
                                    <asp:Button ID="btnAlergias" runat="server" class="_record-actions_me0a7f ember-view" OnClick="Button1_Click" Text="Guardar" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-1">
                        <div id="chavo8568" class="head">
                            <h2 data-autoid="record-title-pathological" id="chavo8569" class="_record-title_1wtm69 ember-view">
                                Antecedentes Patológicos
                            </h2>
                        </div>
                        <div class="content _no-to-all_1qzc88 ember-view">
                            <div class="_link_1qzc88">
                                <a href="#" data-ember-action="" data-ember-action-3070="3070">No a todo</a>
                            </div>
                            <div id="chavo2443" class="_medical-records_1d3apu ember-view"><ul data-autoid="medical-records" id="chavo3099" class="_medical-record-list-item_1d3apu ember-view">    
                                  <li id="chavo3101" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Hospitalización Previa
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3120" class="ember-view" runat="server">Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3122" class="ember-view" runat="server">No
                              </label>
                              </div>
                            </li>    
                            <li id="chavo3124" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Cirugías Previas
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3127" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3129" class="ember-view" runat="server"/>No
                              </label>
                              </div>
                            </li>    
                                  <li id="chavo3131" class="_medical-record_1d3apu ember-view">  
                                    <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                        Diabetes
                                    </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3134" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3136" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3138" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Enfermedades Tiroideas
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3141" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3143" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3145" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Hipertensión Arterial
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3148" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3150" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3152" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Cardiopatias
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3155" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3157" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>    
                                  <li id="chavo3159" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Traumatismos
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3162" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3164" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3166" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Cáncer
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3169" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3171" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>    
                                  <li id="chavo3173" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Tuberculosis
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3176" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3178" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3180" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Transfusiones
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3183" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3185" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>    
                                  <li id="chavo3187" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Patologías Respiratorias
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3190" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3192" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>    
                                  <li id="chavo3194" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Patologías Gastrointestinales
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3197" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3199" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>    
                                  <li id="chavo3201" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Enfermedades de Transmisión Sexual
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3204" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3206" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3208" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Enfermedad Renal Crónica
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3211" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3213" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3215" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Otros
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3218" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3220" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                            </ul></div>
                            <div id="chavo3201a" class="_record-actions_me0a7f ember-view">
                                <a data-autoid="record-actions-close" href="#" role="button">Guardar</a>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-1">
                        <div id="chavo8620" class="head">
                            <h2 data-autoid="record-title-non-pathological" id="chavo8621" class="_record-title_1wtm69 ember-view">
                                Antecedentes No Patológicos
                            </h2>
                        </div>
                        <div class="content _no-to-all_1qzc88 ember-view">
                            <div id="chavo2505" class="_record-body_okqhna ember-view">                <div id="chavo2506" class="_no-to-all_1qzc88 ember-view">  <div class="_link_1qzc88">
                                <a href="#" data-ember-action="" data-ember-action-3268="3268">
                                  No a todo
                                </a>
                              </div>
                            <div id="chavo2507" class="_medical-records_1d3apu ember-view"><ul data-autoid="medical-records" id="chavo3269" class="_medical-record-list-item_1d3apu ember-view">    
                                  <li id="chavo3271" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Actividad Física
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3274" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3276" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>    
                                  <li id="chavo3278" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Tabaquismo
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3281" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3283" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>    
                                  <li id="chavo3285" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Alcoholismo
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3288" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3290" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3292" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Uso de otras sustancias (Drogas)
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3295" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3297" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3299" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Vacuna o Inmunización reciente
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3302" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3304" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3306" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Otros
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3309" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3311" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                            </ul>
                            </div>
                            </div>
                              <div id="chavo3312" class="_record-actions_me0a7f ember-view"><a data-autoid="record-actions-close" href="#" role="button">
                              Guardar
                            </a>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-1">
                        <div id="chavo8645" class="head">
                            <h2 data-autoid="record-title-heredo-familial" id="chavo8646" class="_record-title_1wtm69 ember-view">
                                Antecedentes Heredofamiliares
                            </h2>
                        </div>
                        <div class="content _no-to-all_1qzc88 ember-view">
                            <div class="_link_1qzc88">
                                <a href="#" data-ember-action="" data-ember-action-3070="3070">No a todo</a>
                            </div>
                            <div id="chavo2532" class="_medical-records_1d3apu ember-view"><ul data-autoid="medical-records" id="chavo3333" class="_medical-record-list-item_1d3apu ember-view">    
                                  <li id="chavo3335" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Diabetes
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3338" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3340" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                <li id="chavo3342" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Cardiopatías
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3345" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3347" class="ember-view" runat="server" />No
                              </label>
                            </li>
                                  <li id="chavo3349" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Hipertensión Arterial
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3352" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3354" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3356" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Enfermedades Tiroideas
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3359" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3361" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3363" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Enfermedad Renal Crónica
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3366" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3368" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3370" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Otros
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3373" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3375" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                            </ul></div>
                            <div id="chavo3201b" class="_record-actions_me0a7f ember-view">
                                <a data-autoid="record-actions-close" href="#" role="button">Guardar</a>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-1">
                        <div id="chavo8670" class="head">
                            <h2 data-autoid="record-title-gineco-obstetrics" id="chavo8671" class="_record-title_1wtm69 ember-view">
                                Antecedentes Gineco-Obstetricios
                            </h2>
                        </div>
                        <div class="content _no-to-all_1qzc88 ember-view">
                            <div id="chavo2555" class="_record-body_okqhna ember-view">                <div id="chavo2556" class="_no-to-all_1qzc88 ember-view">  <div class="_link_1qzc88">
                                <a href="#" data-ember-action="" data-ember-action-3396="3396">
                                  No a todo
                                </a>
                              </div>
                            <div id="chavo2557" class="_medical-records_1d3apu ember-view"><ul data-autoid="medical-records" id="chavo3397" class="_medical-record-list-item_1d3apu ember-view">    
                                  <li id="chavo3399" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                Fecha de primera menstruación
                              </div>
                              <div class=" _deny-field-container_oxheyk">
                                <input data-autoid="deny-field" type="text" id="chavo3401" class="_deny-field_oxheyk ember-text-field ember-view">
                                <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                  <div id="chavo3402" class="ember-tooltip-base ember-view"><div id="chavo3403" class="ember-view">  <div>
                                  n/a
                              </div>
                            </div></div>
                                </button>
                              </div>
                            </li>    
                                  <li id="chavo3405" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                Fecha de última menstruación
                              </div>
                              <div class=" _deny-field-container_oxheyk">
                                <input data-autoid="deny-field" type="text" id="chavo3407" class="_deny-field_oxheyk ember-text-field ember-view">
                                <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                  <div id="chavo3408" class="ember-tooltip-base ember-view"><div id="chavo3409" class="ember-view">  <div>
                                  n/a
                              </div>
                            </div></div>
                                </button>
                              </div>
                            </li>    
                                  <li id="chavo3411" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                Características menstruación
                              </div>
                              <div class=" _deny-field-container_oxheyk">
                                <input data-autoid="deny-field" type="text" id="chavo3413" class="_deny-field_oxheyk ember-text-field ember-view">
                                <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                  <div id="chavo3414" class="ember-tooltip-base ember-view"><div id="chavo3415" class="ember-view">  <div>
                                  n/a
                              </div>
                            </div></div>
                                </button>
                              </div>
                            </li>    
                                  <li id="chavo3417" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Embarazos
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3420" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3422" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3424" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Cáncer Cérvico
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3427" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3429" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3431" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Cáncer Uterino
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3434" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3436" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3438" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Cáncer de Mama
                              </div>
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3441" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3443" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>
                                  <li id="chavo3445" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
                                Actividad sexual del paciente
                              </div>                                          
                              <div class="_radio-buttons_9k179t">
                              <label class="ember-radio-button  ">
                                <input type="radio" value="true" id="chavo3448" class="ember-view" runat="server" />Si
                              </label>
                              <label class="ember-radio-button  ">
                                <input type="radio" value="false" id="chavo3450" class="ember-view" runat="server" />No
                              </label>
                              </div>
                            </li>    
                                  <li id="chavo3452" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                Método de Planificación Familiar
                              </div>
                              <div class=" _deny-field-container_oxheyk">
                                <input data-autoid="deny-field" type="text" id="chavo3454" class="_deny-field_oxheyk ember-text-field ember-view">
                                <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                  <div id="chavo3455" class="ember-tooltip-base ember-view"><div id="chavo3456" class="ember-view">  <div>
                                  n/a
                              </div>
                            </div></div>
                                </button>
                              </div>
                            </li>    
                                  <li id="chavo3458" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
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
                                  <li id="chavo3465" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                Ultimo Papanicolau
                              </div>
                              <div class=" _deny-field-container_oxheyk">
                                <input data-autoid="deny-field" type="text" id="chavo3467" class="_deny-field_oxheyk ember-text-field ember-view">
                                <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                  <div id="chavo3468" class="ember-tooltip-base ember-view"><div id="chavo3469" class="ember-view">  <div>
                                  n/a
                              </div>
                            </div></div>
                                </button>
                              </div>
                            </li>    
                                  <li id="chavo3471" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_oxheyk _record-name_e768m7">
                                Ultima Mastografía
                              </div>
                              <div class=" _deny-field-container_oxheyk">
                                <input data-autoid="deny-field" type="text" id="chavo3473" class="_deny-field_oxheyk ember-text-field ember-view">
                                <button data-autoid="deny-action" class="_deny-action_oxheyk ember-tooltip-target">
                                  <div id="chavo3474" class="ember-tooltip-base ember-view"><div id="chavo3475" class="ember-view">  <div>
                                  n/a
                              </div>
                            </div></div>
                                </button>
                              </div>
                            </li>    
                                  <li id="chavo3477" class="_medical-record_1d3apu ember-view">  <div data-autoid="record-name" class="_record-name_9k179t _record-name_e768m7">
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
                            </ul></div>
                            </div>
                              <div id="chavo3483" class="_record-actions_me0a7f ember-view"><a data-autoid="record-actions-close" href="#" role="button">
                              Guardar
                            </a>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="chavo8745" class="_widget-box_l8wwyk ember-view">
            <div data-autoid="widget-box-header" class="_header_l8wwyk">
                Medicamentos Activos
                <div class="_header-items_l8wwyk">
                </div>
            </div>
            <div style="" class="_body_l8wwyk--has-padding  _body_l8wwyk">
                <div id="chavo8746" class="ember-view">
                    <div class="_search_z4kprp _search_1r1ilb">
                        <div id="chavo8747" class="ember-view"></div>
                        <!---->
                        <span class="twitter-typeahead" style="position: relative; display: inline-block;">
                            <input type="text" class="form-control search ember-text-field ember-view tt-hint" readonly="" autocomplete="off" spellcheck="false" tabindex="-1" style="position: absolute; top: 0px; left: 0px; border-color: transparent; box-shadow: none; opacity: 1; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(255, 255, 255);" dir="ltr"><input type="text" placeholder="Medicamentos" id="medical-history-prescription-drugs-search" class="form-control search ember-text-field ember-view tt-input" autocomplete="off" spellcheck="false" dir="auto" style="position: relative; vertical-align: top; background-color: transparent;"><pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: &quot;Proxima Nova&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre>
                            <div class="tt-menu" style="position: absolute; top: 100%; left: 0px; z-index: 100; display: none;">
                                <div class="tt-dataset tt-dataset-prescription_drugs"></div>
                            </div>
                        </span>
                        <div id="custom-drug" role="button" class="hidden _custom-drug_z4kprp _custom-procedure_1r1ilb" data-ember-action="" data-ember-action-8748="8748">
                            <div>
                                Agregar un medicamento manualmente
                            </div>
                        </div>
                    </div>
                    <!---->
                </div>
            </div>
            <!---->
        </div>
        <div data-autoid="person-profile-medical-note" id="chavo8749" class="ember-view">
            <div id="chavo8750" class="ember-view">
                <div id="chavo8751" class="_widget-box-container_1kdhi6 ember-view">
                    <div data-autoid="addon-medical-note-box-edit" id="chavo8752" class="_widget-box_l8wwyk ember-view">
                        <div data-autoid="widget-box-header" class="_header_l8wwyk">
                            Notas de Historia Clínica
                            <div class="_header-items_l8wwyk">
                                <div id="chavo8754" class="_popmenu_tpm7t2 ember-view">
                                    <div data-autoid="toggle-template-list--progressNotes" id="chavo8755" class="_handle_tpm7t2 _header-action_l8wwyk _popover-handle_1e6s0i ember-view ember-tooltip-target">
                                        <i class="fa fa-file-text-o"></i>
                                        Plantillas
                                        <div id="chavo8756" class="ember-tooltip-base ember-view">
                                            <div id="chavo8757" class="ember-view">
                                                <div>
                                                    Guardar o usar plantilla
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="chavo8758" class="ember-view"><!----></div>
                                </div>
                            </div>
                        </div>
                        <div style="" class="  _body_l8wwyk">
                            <div id="chavo8759" class=" _wysiwyg-editor_2x3vh5 ember-view">
                                <div id="chavo8760" class="ember-view" style="box-sizing: border-box; height: 150px;">
                                    <div class="tui-editor-defaultUI">
                                        <div class="te-toolbar-section">
                                            <div class="te-markdown-tab-section" style="display: none;">
                                                <div class="te-tab">
                                                    <button type="button" data-index="0" class="te-tab-active">Escribir</button>
                                                    <button type="button" data-index="1">Vista previa</button>
                                                </div>
                                            </div>
                                            <div class="tui-editor-defaultUI-toolbar">
                                                <button class="tui-heading tui-toolbar-icons" type="button"></button>
                                                <button class="tui-bold tui-toolbar-icons" type="button"></button>
                                                <button class="tui-italic tui-toolbar-icons" type="button"></button>
                                                <div class="tui-toolbar-divider"></div>
                                                <button class="tui-hrline tui-toolbar-icons" type="button"></button>
                                                <div class="tui-toolbar-divider"></div>
                                                <button class="tui-ul tui-toolbar-icons" type="button"></button>
                                                <button class="tui-ol tui-toolbar-icons" type="button"></button>
                                                <button class="tui-task tui-toolbar-icons" type="button"></button>
                                                <button class="tui-indent tui-toolbar-icons" type="button"></button>
                                                <button class="tui-outdent tui-toolbar-icons" type="button"></button>
                                                <div class="tui-toolbar-divider"></div>
                                                <button class="tui-table tui-toolbar-icons" type="button"></button>
                                                <button class="tui-link tui-toolbar-icons" type="button"></button>
                                                <button class="tui-image tui-toolbar-icons" type="button"></button>
                                                <div class="tui-popup-wrapper te-dropdown-toolbar" style="display: none;">
                                                    <div class="tui-popup-body">
                                                        <div class="tui-editor-defaultUI-toolbar"></div>
                                                    </div>
                                                </div>
                                                <div class="tui-popup-wrapper te-popup-add-table" style="display: none; position: absolute; width: 181px;">
                                                    <div class="tui-popup-body">
                                                        <div class="te-table-selection">
                                                            <div class="te-table-header" style="height: 17px; width: 151px;"></div>
                                                            <div class="te-table-body" style="height: 120px; width: 151px;"></div>
                                                            <div class="te-selection-area"></div>
                                                        </div>
                                                        <p class="te-description"></p>
                                                    </div>
                                                </div>
                                                <div class="tui-popup-wrapper te-heading-add" style="display: none; position: absolute;">
                                                    <div class="tui-popup-body">
                                                        <ul>
                                                            <li data-value="1" data-type="Heading">
                                                                <h1>Encabezado 1</h1>
                                                            </li>
                                                            <li data-value="2" data-type="Heading">
                                                                <h2>Encabezado 2</h2>
                                                            </li>
                                                            <li data-value="3" data-type="Heading">
                                                                <h3>Encabezado 3</h3>
                                                            </li>
                                                            <li data-value="4" data-type="Heading">
                                                                <h4>Encabezado 4</h4>
                                                            </li>
                                                            <li data-value="5" data-type="Heading">
                                                                <h5>Encabezado 5</h5>
                                                            </li>
                                                            <li data-value="6" data-type="Heading">
                                                                <h6>Encabezado 6</h6>
                                                            </li>
                                                            <li data-type="Paragraph">
                                                                <div>Párrafo</div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="te-editor-section">
                                            <div class="tui-editor te-ww-mode">
                                                <div class="te-md-container te-preview-style-tab">
                                                    <div class="te-editor te-tab-active">
                                                        <textarea style="display: none;"></textarea>
                                                        <div class="CodeMirror cm-s-default CodeMirror-wrap CodeMirror-empty" style="min-height: 116px;">
                                                            <div style="overflow: hidden; position: relative; width: 3px; height: 0px;">
                                                                <textarea autocorrect="off" autocapitalize="off" spellcheck="false" tabindex="0" style="position: absolute; bottom: -1em; padding: 0px; width: 1000px; height: 1em; outline: none;"></textarea>
                                                            </div>
                                                            <div class="CodeMirror-vscrollbar" tabindex="-1" cm-not-content="true">
                                                                <div style="min-width: 1px;"></div>
                                                            </div>
                                                            <div class="CodeMirror-hscrollbar" tabindex="-1" cm-not-content="true">
                                                                <div style="height: 100%; min-height: 1px;"></div>
                                                            </div>
                                                            <div class="CodeMirror-scrollbar-filler" cm-not-content="true"></div>
                                                            <div class="CodeMirror-gutter-filler" cm-not-content="true"></div>
                                                            <div class="CodeMirror-scroll" tabindex="-1">
                                                                <div class="CodeMirror-sizer" style="margin-left: 0px;">
                                                                    <div style="position: relative;">
                                                                        <div class="CodeMirror-lines" role="presentation">
                                                                            <div role="presentation" style="position: relative; outline: none;">
                                                                                <pre class="CodeMirror-placeholder" style="height: 0px; overflow: visible;">Empieza a escribir...</pre>
                                                                                <div class="CodeMirror-measure">
                                                                                    <pre class="CodeMirror-line-like"><span>xxxxxxxxxx</span></pre>
                                                                                </div>
                                                                                <div class="CodeMirror-measure"></div>
                                                                                <div style="position: relative; z-index: 1;"></div>
                                                                                <div class="CodeMirror-cursors"></div>
                                                                                <div class="CodeMirror-code" role="presentation"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div style="position: absolute; height: 30px; width: 1px;"></div>
                                                                <div class="CodeMirror-gutters" style="display: none;"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="te-md-splitter"></div>
                                                    <div class="te-preview" style="min-height: 116px;">
                                                        <div class="tui-editor-contents"></div>
                                                    </div>
                                                </div>
                                                <div class="te-ww-container">
                                                    <div class="te-editor" style="position: relative;">
                                                        <div contenteditable="true" class="tui-editor-contents tui-editor-contents-placeholder" style="min-height: 116px;" data-placeholder="Empieza a escribir...">
                                                            <div>
                                                                <br>
                                                            </div>
                                                        </div>
                                                        <div class="te-ww-block-overlay code-block-header" style="position: absolute; display: none; z-index: 1;">
                                                            <span>text</span>
                                                            <button type="button">Editor</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="te-mode-switch-section" style="display: none;">
                                            <div class="te-mode-switch">
                                                <button class="te-switch-button markdown" type="button">Markdown</button>
                                                <button class="te-switch-button wysiwyg active" type="button">WYSIWYG</button>
                                            </div>
                                        </div>
                                        <div class="tui-popup-wrapper te-popup-add-link tui-editor-popup" style="display: none;">
                                            <div class="tui-popup-header">
                                                <span class="tui-popup-title">Insertar enlace</span>
                                                <div class="tui-popup-header-buttons">
                                                    <button type="button" class="tui-popup-close-button"></button>
                                                </div>
                                            </div>
                                            <div class="tui-popup-body">
                                                <label for="url">URL</label>
                                                <input type="text" class="te-url-input">
                                                <label for="linkText">Texto del enlace</label>
                                                <input type="text" class="te-link-text-input">
                                                <div class="te-button-section">
                                                    <button type="button" class="te-ok-button">Aceptar</button>
                                                    <button type="button" class="te-close-button">Cancelar</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tui-popup-modal-background tui-popup-code-block-editor" style="display: none;">
                                            <div class="tui-popup-wrapper">
                                                <div class="tui-popup-header">
                                                    <span class="tui-popup-title">CodeBlock Editor<span class="te-input-language"><input type="text" maxlength="20" placeholder="Elegir idioma"></span></span>
                                                    <div class="tui-popup-header-buttons">
                                                        <button type="button" class="popup-editor-toggle-scroll active" style="display: inline-block;"></button>
                                                        <button type="button" class="popup-editor-toggle-preview active"></button>
                                                        <button type="button" class="popup-editor-toggle-fit"></button>
                                                        <button type="button" class="tui-popup-close-button"></button>
                                                    </div>
                                                </div>
                                                <div class="tui-popup-body">
                                                    <div class="popup-editor-body">
                                                        <div class="tui-split-scroll scroll-sync">
                                                            <div class="tui-split-scroll-wrapper">
                                                                <div class="tui-split-scroll-content">
                                                                    <div class="popup-editor-editor-wrapper tui-split-content-left">
<textarea style="display: none;"></textarea>
                                                                        <div class="CodeMirror cm-s-none CodeMirror-wrap">
                                                                            <div style="overflow: hidden; position: relative; width: 3px; height: 0px;">
<textarea autocorrect="off" autocapitalize="off" spellcheck="false" tabindex="0" style="position: absolute; bottom: -1em; padding: 0px; width: 1000px; height: 1em; outline: none;"></textarea>
                                                                            </div>
                                                                            <div class="CodeMirror-vscrollbar" tabindex="-1" cm-not-content="true">
                                                                                <div style="min-width: 1px;"></div>
                                                                            </div>
                                                                            <div class="CodeMirror-hscrollbar" tabindex="-1" cm-not-content="true">
                                                                                <div style="height: 100%; min-height: 1px;"></div>
                                                                            </div>
                                                                            <div class="CodeMirror-scrollbar-filler" cm-not-content="true"></div>
                                                                            <div class="CodeMirror-gutter-filler" cm-not-content="true"></div>
                                                                            <div class="CodeMirror-scroll" tabindex="-1">
                                                                                <div class="CodeMirror-sizer" style="margin-left: 0px;">
                                                                                    <div style="position: relative;">
                                                                                        <div class="CodeMirror-lines" role="presentation">
                                                                                            <div role="presentation" style="position: relative; outline: none;">
                                                                                                <div class="CodeMirror-measure">
<pre class="CodeMirror-line-like"><span>xxxxxxxxxx</span></pre>
                                                                                                </div>
                                                                                                <div class="CodeMirror-measure"></div>
                                                                                                <div style="position: relative; z-index: 1;"></div>
                                                                                                <div class="CodeMirror-cursors"></div>
                                                                                                <div class="CodeMirror-code" role="presentation"></div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div style="position: absolute; height: 30px; width: 1px;"></div>
                                                                                <div class="CodeMirror-gutters" style="display: none;"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="tui-split-content-right" style="top: 0px;">
                                                                        <div class="tui-editor-contents"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="tui-splitter"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="te-button-section">
                                                        <button type="button" class="te-ok-button">Aceptar</button>
                                                        <button type="button" class="te-close-button">Cancelar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <center class="hidden _loadingImage_2x3vh5">
                                    <div style="
width: 10px;
height: 10px;
border: 6px solid #e6edf2;
border-top-color: #0176fe" id="chavo8761" class="_loading-spinner_v3bqta _inline_v3bqta ember-view">
                                    </div>
                                    <span class="_text-loading_2x3vh5">
                                        Cargando imagen
                                    </span>
                                </center>
                            </div>
                            <!---->
                            <button data-autoid="save-response-template" class="button button--without--outline _save-response-template_p4ir14" data-ember-action="" data-ember-action-8762="8762">
                                <i class="fa fa-plus"></i>
                                Agregar como plantilla
                            </button>
                            <button class="_recorder_p4ir14" data-ember-action="" data-ember-action-8763="8763"><i class="fa fa-microphone"></i></button>
                            <button class="_save_p4ir14" data-ember-action="" data-ember-action-8764="8764">
                                Guardar
                            </button>
                        </div>
                        <!---->
                    </div>
                </div>
            </div>
        </div>
        <section>
            <!---->
        </section>
        <div id="chavo8765" class="ember-view"><!----></div>
    </div>
    <div id="chavo8766" class="_widget-box-container_1kdhi6 ember-view">
        <div data-autoid="consultations" id="chavo8767" class="ember-view">
            <div class="_header-buttons_alrpq4">
                <button data-autoid="consultations-main-action" class="button button--tall _start-consultation_alrpq4 ember-tooltip-target" data-ember-action="" data-ember-action-8768="8768">
                    Iniciar Nueva Consulta
                    <div id="chavo8769" class="ember-tooltip-base ember-view">
                        <div id="chavo8770" class="ember-view">
                            <div>
                                Crear consulta sin cita previa
                            </div>
                        </div>
                    </div>
                </button>
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
            <div data-autoid="new-consultation-schedule" id="chavo8774" class="_new-consultation-schedule_1ebajo ember-view">
                <button class="_header-toggler_1ebajo" data-ember-action="" data-ember-action-8775="8775">
                    <span>Agendar consulta</span>
                    <span class="_toggler_1ebajo"></span>
                </button>
                <!---->
            </div>
            <div data-autoid="follow-up-reminder-list" id="chavo8776" class="ember-view">
                <!---->
            </div>
            <div class="_title-list_alrpq4">
                <strong class="_heading_alrpq4 _heading_1ni3qz">Consultas agendadas
                </strong>
                <div id="chavo8777" class="_switch_alrpq4 _checkbox-switch_1lvift ember-view">
                    <input id="view-canceled-appointments-form" type="checkbox" data-autoid="checkbox-switch__input">
                    <label data-autoid="checkbox-switch__trigger" for="view-canceled-appointments-form"></label>
                    <label data-autoid="checkbox-switch__label" for="view-canceled-appointments-form">
                        Ver citas canceladas
                        <!---->
                    </label>
                </div>
            </div>
            <div data-autoid="consultation-schedules-list" id="chavo8778" class="ember-view">
                <div id="chavo8785" class="ember-view">
                    <div data-autoid="consultation-schedule-link" class="_consultation-schedule-link_vrqzle _consultation-link_1ni3qz">
                        <div data-autoid="consultations-consultation-schedule-item-0" class="_consultation-schedule-item_vrqzle _consultation-item_yh26d4">
                            <div data-autoid="consultation-schedule-date" class="_date_vrqzle _date_yh26d4">
                                <div data-autoid="consultation-schedule-day" class="_day_vrqzle _day_yh26d4">
                                    06
                                </div>
                                <div data-autoid="consultation-schedule-month" class="_month_vrqzle _month_yh26d4">
                                    Ene
                                </div>
                                <div data-autoid="consultation-schedule-year" class="_year_vrqzle _year_yh26d4">
                                    2024
                                </div>
                            </div>
                            <div data-autoid="consultation-schedule-details" class="_details_vrqzle _details_yh26d4">
                                <div class="_details-item_vrqzle">
                                    <div data-autoid="consultation-schedule-additional-info" class="_additional-info_vrqzle">
                                        <div data-autoid="consultation-schedule-account" class="_account_vrqzle">
                                            Centro Médico Mujer
                                        </div>
                                    </div>
                                    <div data-autoid="consultation-schedule-cause" class="_cause_vrqzle _cause_yh26d4">
                                        Ile
                                    </div>
                                    <div data-autoid="consultation-schedule-time" class="_time_vrqzle">
                                        9:00am a
                                        9:30am
                                    </div>
                                </div>
                                <div>
                                    <div id="chavo8786" class="ember-view">
                                        <div class="_actions_16c14z">
                                            <button data-autoid="edit-popup-cancel" class="button _delete_16c14z ember-tooltip-target" data-ember-action="" data-ember-action-8787="8787">
                                                <i class="fa fa-trash-o"></i>
                                                <div id="chavo8788" class="ember-tooltip-base ember-view">
                                                    <div id="chavo8789" class="ember-view">
                                                        <div>
                                                            Cancelar
                                                        </div>
                                                    </div>
                                                </div>
                                            </button>
                                            <div class="_actions-right_16c14z">
                                                <button data-autoid="edit-popup-confirm" class="button _confirm_16c14z ember-tooltip-target" data-ember-action="" data-ember-action-8790="8790">
                                                    <i class="fa fa-check"></i>
                                                    <div id="chavo8791" class="ember-tooltip-base ember-view">
                                                        <div id="chavo8792" class="ember-view">
                                                            <div>
                                                                Confirmar
                                                            </div>
                                                        </div>
                                                    </div>
                                                </button>
                                                <button data-autoid="edit-popup-arrival-at" class="button _arrival-at_16c14z ember-tooltip-target" data-ember-action="" data-ember-action-8793="8793">
                                                    <div id="chavo8794" class="ember-tooltip-base ember-view">
                                                        <div id="chavo8795" class="ember-view">
                                                            <div>
                                                                Paciente llegó
                                                            </div>
                                                        </div>
                                                    </div>
                                                </button>
                                                <span>
                                                    <button data-autoid="start-consultation-0" type="submit" id="chavo8796" class="button _start-consultation_16c14z async-button default ember-view">
                                                        Empezar
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!---->
                <!---->
            </div>
            <!---->
            <div id="chavo8780" class="ember-view">
                <strong class="_heading_1ni3qz">Seleccionar un Doctor</strong>
                <div id="chavo8781" class="ember-view">
                    <asp:DropDownList ID="DropDownDoctors" runat="server"></asp:DropDownList>
                </div>
            </div>
        </div>
        <div id="chavo87810" class="ember-view">
            <strong class="_heading_1ni3qz">Descarga de Concentimientos 
            </strong>
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
    <div id="chavo807" class="ember-view">
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
</asp:Content>
