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
    <meta name="apple-mobile-web-app-title" content="Nimbo"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <meta name="ember-cli-head-start" content=""/>
    <meta name="ember-cli-head-end" content=""/>   

    <link rel="stylesheet" href="../media/vendor.css"/>
    <link rel="stylesheet" href="../media/nimbox.css"/>
    <link rel="stylesheet" href="../media/custom.css"/>

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
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="notifications"></div>
    <div id="ember-basic-dropdown-wormhole"></div>       
    <div id="modal-overlays" dir="rtr"></div>

    <div data-autoid="enable-push-notifications" id="ember1585" class="_feature-notification_1j0ju2 ember-view">
        <div class="_feature-message_1j0ju2">
            Para recibir notificaciones cuando una consulta va a empezar y algunas otras
                        <a role="button" data-autoid="app-status-modal-action" data-ember-action="" data-ember-action-1586="1586">haz click aquí para habilitarlos.
                        </a>
            <button type="button" class="close _dismiss-action_1j0ju2" data-ember-action="" data-ember-action-1587="1587">
                x
            </button>
        </div>
    </div>

    <div class="ember-application__body">
        <div id="ember8499" class="ember-view">
            <div class="_person-profile_1pgp7n">
                <div id="ember8500" class="_widget-box-container_1kdhi6 ember-view">
                    <div data-autoid="general-info" id="ember8501" class="_general-info_19fr1i ember-view">
                        <div id="ember8502" class="_info-header_1klpxd ember-view">
                            <div style="background-image: url(/assets/images/avatar-placeholder-large-b21c7a23e82b1f068eb966e32f8efdac.png)" id="ember8503" class="_avatar-image_1tv5h6 _avatar-image_1tv5h6--is-big ember-view">
                            </div>

                            <div class="_name_1klpxd">
                                <div class="_header-actions_1klpxd">
                                    Sandra Pamela  Cardoso García
                                    <button data-autoid="header-actions-toggle" id="ember8504" class=" _toggle-dropdown_1dy3qg fa fa-ellipsis-h ember-view"></button>
                                </div>

                                <div class="_info-person_1klpxd">
                                    03/07/2003 - 20 años
                                    <a role="button" data-autoid="info-header-toggleBody" class="_toggle-view_1klpxd ember-tooltip-target" data-ember-action="" data-ember-action-8505="8505">
                                        <i class="fa fa-angle-double-down"></i>

                                        <div id="ember8506" class="ember-tooltip-base ember-view">
                                            <div id="ember8507" class="ember-view">
                                                <div>
                                                    Para dejar una nota interna o mostrar todos los datos generales de tu paciente, da lick aquí.
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div data-autoid="note-field" id="ember8508" class="_internal-notes_1tuyqw ember-view">
                            <label for="note-field" data-autoid="note-field-label">
                                Notas internas
                                <span class="_saving-status_1tuyqw">

                                </span>
                            </label>

                            <textarea placeholder="Estas notas sólo son visibles para el médico." rows="6" id="note-field" data-autoid="note-field-textarea" class="ember-view"></textarea>

                        </div>

                    </div>

                    <ul id="ember8509" class="_vital-signs-set-container_hxb1qe ember-view">
                        <div id="ember8510" class="_widget-box_l8wwyk ember-view">
                            <div data-autoid="widget-box-header" class="_header_l8wwyk">
                                Últimos signos vitales

                                <div class="_header-items_l8wwyk">
                                    <div id="ember8512" class="_popmenu_gyhhe9 ember-view">
                                        <div data-autoid="handle" id="ember8513" class="_handle_gyhhe9 _header-action_l8wwyk _popover-handle_1e6s0i ember-view">
                                            <i class="fa fa-ellipsis-h"></i>

                                        </div>
                                        <div id="ember8514" class="ember-view">
                                            <!---->
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div style="" class="_body_l8wwyk--has-padding  _body_l8wwyk">

                                <div data-autoid="vital-signs-set-basic" id="ember8515" class="ember-view">
                                    <li id="ember8519" class="_vital-sign_8x0tfa ember-view">
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

                                    <li id="ember8523" class="_vital-sign_8x0tfa ember-view">
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

                                    <li id="ember8527" class="_vital-sign_8x0tfa ember-view">
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
                                    <li id="ember8532" class="_vital-sign_8x0tfa ember-view">
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

                                    <li id="ember8536" class="_vital-sign_8x0tfa ember-view">
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

                                    <li id="ember8540" class="_vital-sign_8x0tfa ember-view">
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

                                    <li id="ember8544" class="_vital-sign_8x0tfa ember-view">
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

        <div data-autoid="upload-files-person-profile" id="ember8557" class="ember-view">
            <div id="ember8558" class="_widget-box_l8wwyk ember-view">
                <div data-autoid="widget-box-header" class="_header_l8wwyk">
                    Archivos

                    <div class="_header-items_l8wwyk">

                    </div>
                </div>

                <div style="" class="_body_l8wwyk--has-padding  _body_l8wwyk">
                    <span class="_empty-status_u7zs43">
                        No se han subido archivos.
                    </span>

                    <div id="ember8559" class="_button-upload-file_1xib8y ember-view">
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
    <div id="ember8560" class="_widget-box-container_1kdhi6 ember-view">
        <div data-autoid="medical-history" id="ember8561" class="ember-view">
            <div id="ember8562" class="_widget-box_l8wwyk ember-view">
                <div data-autoid="widget-box-header" class="_header_l8wwyk">
                    Antecedentes

                    <div class="_header-items_l8wwyk">

                    </div>
                </div>

                <div style="" class="_body_l8wwyk--has-padding _body_l8wwyk--flexbox _body_l8wwyk">

                    <div id="ember8563" class=" ember-view">
                        <h2 data-autoid="allergy-section" id="ember8564" class="_record-title_1wtm69 ember-view">
                            Alergias


                        </h2>
                        <!---->
                        <!---->
                        <div id="ember8565" class="_record-body_okqhna _record-body_okqhna--view-mode ember-view">
                            <div id="ember8566" class="_allergies-record_1kd7wc ember-view"><!----></div>


                            <!---->
                        </div>
                    </div>
                    <div id="ember8568" class=" ember-view">
                        <h2 data-autoid="record-title-pathological" id="ember8569" class="_record-title_1wtm69 ember-view">
                            Antecedentes Patológicos


                        </h2>
                        <!---->
                        <!---->
                        <div id="ember8570" class="_record-body_okqhna _record-body_okqhna--view-mode ember-view">
                            <div id="ember8571" class="_no-to-all_1qzc88 ember-view">
                                <!---->
                                <div id="ember8572" class="_medical-records_1d3apu ember-view">
                                    <!---->
                                    <div id="ember8573" class="ember-view">


                                    </div>
                                </div>

                            </div>


                            <!---->
                        </div>
                    </div>
                    <div id="ember8620" class=" ember-view">
                        <h2 data-autoid="record-title-non-pathological" id="ember8621" class="_record-title_1wtm69 ember-view">
                            Antecedentes No Patológicos


                        </h2>
                        <!---->
                        <!---->
                        <div id="ember8622" class="_record-body_okqhna _record-body_okqhna--view-mode ember-view">
                            <div id="ember8623" class="_no-to-all_1qzc88 ember-view">
                                <!---->
                                <div id="ember8624" class="_medical-records_1d3apu ember-view">
                                    <!---->
                                    <div id="ember8625" class="ember-view">

                                    </div>
                                </div>

                            </div>


                            <!---->
                        </div>
                    </div>
                    <div id="ember8645" class=" ember-view">
                        <h2 data-autoid="record-title-heredo-familial" id="ember8646" class="_record-title_1wtm69 ember-view">
                            Antecedentes Heredofamiliares


                        </h2>
                        <!---->
                        <!---->
                        <div id="ember8647" class="_record-body_okqhna _record-body_okqhna--view-mode ember-view">
                            <div id="ember8648" class="_no-to-all_1qzc88 ember-view">
                                <!---->
                                <div id="ember8649" class="_medical-records_1d3apu ember-view">
                                    <!---->
                                    <div id="ember8650" class="ember-view">


                                    </div>
                                </div>

                            </div>


                            <!---->
                        </div>
                    </div>
                    <div id="ember8670" class=" ember-view">
                        <h2 data-autoid="record-title-gineco-obstetrics" id="ember8671" class="_record-title_1wtm69 ember-view">
                            Antecedentes Gineco-Obstetricios


                        </h2>
                        <!---->
                        <!---->
                        <div id="ember8672" class="_record-body_okqhna _record-body_okqhna--view-mode ember-view">
                            <div id="ember8673" class="_no-to-all_1qzc88 ember-view">
                                <!---->
                                <div id="ember8674" class="_medical-records_1d3apu ember-view">
                                    <!---->
                                    <div id="ember8675" class="ember-view">

                                    </div>
                                </div>

                            </div>


                            <!---->
                        </div>
                    </div>
                    <div id="ember8716" class=" ember-view"><!----></div>
                    <div id="ember8722" class=" ember-view"><!----></div>
                    <div id="ember8727" class=" ember-view"><!----></div>
                    <div id="ember8733" class=" ember-view"><!----></div>
                    <div id="ember8735" class=" ember-view"><!----></div>
                    <div id="ember8740" class=" ember-view"><!----></div>

                </div>

                <!---->
            </div>
        </div>

        <vaccination-module style="width: 100%; margin-bottom: 15px;" class="hydrated">
            <div class="vaccination-module">
                <div class="vaccination-module-head">
                    <div class="title"> vacunas </div>
                </div>
                <auto-complete id="autocomplete" class="hydrated">
                    <template shadowrootmode="open">
                        <div class="xeph-div">
                            <input class="xeph-input input-search" type="text" placeholder="Buscar vacuna...">
                            <ul class="xeph-ul" role="listbox" hidden=""></ul>
                        </div>
                    </template>
                </auto-complete>
                <vaccine-table class="hydrated">
                    <div>
                        <modal-dialog id="modal" class="hydrated">
                            <template shadowrootmode="open">
                                <div>
                                    <div class="overlay">
                                        <div class="modal-window">
                                            <div class="modal-window__content">
                                                <div class="modal-header">
                                                    <h4 class="title">Eliminar vacuna</h4>
                                                </div>
                                                <div class="message">Se eliminara la vacuna. ¿Desea continuar?</div>
                                                <div class="line-header"></div>
                                                <div class="button-group">
                                                    <button class="btn-cancel">Cancelar</button>
                                                    <button class="btn-delete">Eliminar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </template>
                        </modal-dialog>
                    </div>
                </vaccine-table>
                <vaccination-card class="hydrated">
                    <div class="vaccineCardFormat" id="vaccineCardFormat">
                        <div class="vaccination-card" style="visibility: hidden; font-family: &quot;Proxima Nova&quot;, &quot;Helvetica Neue&quot;;">
                            <div style="display: flex;">
                                <h2 style="position: relative; color: gray; left: 90px; font-family: &quot;Proxima Nova&quot;, &quot;Helvetica Neue&quot;;">CENTRO MEDICO MUJER</h2>
                                <img style="width: 50px; height: 50px; position: relative; right: -250px; top: 10px;">
                            </div>
                            <div>
                                <h3> Paciente: Sandra Pamela  Cardoso García</h3>
                                <h4>Fecha de nacimiento: 2003-07-03</h4>
                            </div>
                            <table class="vaccine-table-card" style="border: 1px solid black; border-collapse: collapse; table-layout: fixed; font-family: &quot;Proxima Nova&quot;, &quot;Helvetica Neue&quot;;">
                                <tr style="border: 1px solid black; text-align: center; font-family: &quot;Proxima Nova&quot;, &quot;Helvetica Neue&quot;;">
                                    <th style="border: 1px solid black; text-align: center; font-family: &quot;Proxima Nova&quot;, &quot;Helvetica Neue&quot;;"> vacuna</th>
                                    <th style="border: 1px solid black; text-align: center; font-family: &quot;Proxima Nova&quot;, &quot;Helvetica Neue&quot;;"> Lote </th>
                                    <th style="border: 1px solid black; text-align: center; font-family: &quot;Proxima Nova&quot;, &quot;Helvetica Neue&quot;;"> Fecha de aplicación</th>
                                    <th style="border: 1px solid black; text-align: center; font-family: &quot;Proxima Nova&quot;, &quot;Helvetica Neue&quot;;"> Proxima dosis</th>
                                    <th style="border: 1px solid black; text-align: center; font-family: &quot;Proxima Nova&quot;, &quot;Helvetica Neue&quot;;"> Notas </th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </vaccination-card>
            </div>
        </vaccination-module>

        <div id="ember8745" class="_widget-box_l8wwyk ember-view">
            <div data-autoid="widget-box-header" class="_header_l8wwyk">
                Medicamentos Activos

                <div class="_header-items_l8wwyk">

                </div>
            </div>

            <div style="" class="_body_l8wwyk--has-padding  _body_l8wwyk">
                <div id="ember8746" class="ember-view">
                    <div class="_search_z4kprp _search_1r1ilb">
                        <div id="ember8747" class="ember-view"></div>

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
        <div data-autoid="person-profile-medical-note" id="ember8749" class="ember-view">
            <div id="ember8750" class="ember-view">
                <div id="ember8751" class="_widget-box-container_1kdhi6 ember-view">
                    <div data-autoid="addon-medical-note-box-edit" id="ember8752" class="_widget-box_l8wwyk ember-view">
                        <div data-autoid="widget-box-header" class="_header_l8wwyk">
                            Notas de Historia Clínica

                            <div class="_header-items_l8wwyk">

                                <div id="ember8754" class="_popmenu_tpm7t2 ember-view">
                                    <div data-autoid="toggle-template-list--progressNotes" id="ember8755" class="_handle_tpm7t2 _header-action_l8wwyk _popover-handle_1e6s0i ember-view ember-tooltip-target">
                                        <i class="fa fa-file-text-o"></i>
                                        Plantillas

                                        <div id="ember8756" class="ember-tooltip-base ember-view">
                                            <div id="ember8757" class="ember-view">
                                                <div>
                                                    Guardar o usar plantilla
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div id="ember8758" class="ember-view"><!----></div>

                                </div>

                            </div>
                        </div>

                        <div style="" class="  _body_l8wwyk">
                            <div id="ember8759" class=" _wysiwyg-editor_2x3vh5 ember-view">
                                <div id="ember8760" class="ember-view" style="box-sizing: border-box; height: 150px;">
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
                                        <div class="tui-popup-wrapper te-popup-add-image tui-editor-popup" style="display: none;">
                                            <div class="tui-popup-header">
                                                <span class="tui-popup-title">Insertar imagen</span>
                                                <div class="tui-popup-header-buttons">
                                                    <button type="button" class="tui-popup-close-button"></button>
                                                </div>
                                            </div>
                                            <div class="tui-popup-body">
                                                <div class="te-tab-section">
                                                    <div class="te-tab">
                                                        <button type="button" data-index="0" class="te-tab-active">Archivo</button>
                                                        <button type="button" data-index="1">URL</button>
                                                    </div>
                                                </div>
                                                <div class="te-url-type">
                                                    <label for="">URL de la imagen</label>
                                                    <input type="text" class="te-image-url-input">
                                                </div>
                                                <form enctype="multipart/form-data" class="te-file-type te-tab-active">
                                                    <label for="">Seleccionar archivo de imagen</label>
                                                    <input type="file" class="te-image-file-input" accept="image/*">
                                                </form>
                                                <label for="url">Descripción</label>
                                                <input type="text" class="te-alt-text-input">
                                                <div class="te-button-section">
                                                    <button type="button" class="te-ok-button">Aceptar</button>
                                                    <button type="button" class="te-close-button">Cancelar</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tui-popup-wrapper te-popup-table-utils" style="display: none;">
                                            <div class="tui-popup-body">
                                                <button type="button" class="te-table-add-row">Agregar fila</button>
                                                <button type="button" class="te-table-add-col">Agregar columna</button>
                                                <button type="button" class="te-table-remove-row">Eliminar fila</button>
                                                <button type="button" class="te-table-remove-col">Eliminar columna</button>
                                                <hr>
                                                <button type="button" class="te-table-col-align-left">Alinear a la izquierda</button>
                                                <button type="button" class="te-table-col-align-center">Centrar</button>
                                                <button type="button" class="te-table-col-align-right">Alinear a la derecha</button>
                                                <hr>
                                                <button type="button" class="te-table-remove">Eliminar tabla</button>
                                            </div>
                                        </div>
                                        <div class="tui-popup-wrapper te-popup-code-block-languages" style="display: none; z-index: 10000;">
                                            <div class="tui-popup-body">
                                                <button type="button" class="te-popup-code-block-lang-1c active" data-lang="1c">1c</button>
                                                <button type="button" class="te-popup-code-block-lang-abnf" data-lang="abnf">abnf</button>
                                                <button type="button" class="te-popup-code-block-lang-accesslog" data-lang="accesslog">accesslog</button>
                                                <button type="button" class="te-popup-code-block-lang-actionscript" data-lang="actionscript">actionscript</button>
                                                <button type="button" class="te-popup-code-block-lang-ada" data-lang="ada">ada</button>
                                                <button type="button" class="te-popup-code-block-lang-angelscript" data-lang="angelscript">angelscript</button>
                                                <button type="button" class="te-popup-code-block-lang-apache" data-lang="apache">apache</button>
                                                <button type="button" class="te-popup-code-block-lang-applescript" data-lang="applescript">applescript</button>
                                                <button type="button" class="te-popup-code-block-lang-arcade" data-lang="arcade">arcade</button>
                                                <button type="button" class="te-popup-code-block-lang-cpp" data-lang="cpp">cpp</button>
                                                <button type="button" class="te-popup-code-block-lang-arduino" data-lang="arduino">arduino</button>
                                                <button type="button" class="te-popup-code-block-lang-armasm" data-lang="armasm">armasm</button>
                                                <button type="button" class="te-popup-code-block-lang-xml" data-lang="xml">xml</button>
                                                <button type="button" class="te-popup-code-block-lang-asciidoc" data-lang="asciidoc">asciidoc</button>
                                                <button type="button" class="te-popup-code-block-lang-aspectj" data-lang="aspectj">aspectj</button>
                                                <button type="button" class="te-popup-code-block-lang-autohotkey" data-lang="autohotkey">autohotkey</button>
                                                <button type="button" class="te-popup-code-block-lang-autoit" data-lang="autoit">autoit</button>
                                                <button type="button" class="te-popup-code-block-lang-avrasm" data-lang="avrasm">avrasm</button>
                                                <button type="button" class="te-popup-code-block-lang-awk" data-lang="awk">awk</button>
                                                <button type="button" class="te-popup-code-block-lang-axapta" data-lang="axapta">axapta</button>
                                                <button type="button" class="te-popup-code-block-lang-bash" data-lang="bash">bash</button>
                                                <button type="button" class="te-popup-code-block-lang-basic" data-lang="basic">basic</button>
                                                <button type="button" class="te-popup-code-block-lang-bnf" data-lang="bnf">bnf</button>
                                                <button type="button" class="te-popup-code-block-lang-brainfuck" data-lang="brainfuck">brainfuck</button>
                                                <button type="button" class="te-popup-code-block-lang-cal" data-lang="cal">cal</button>
                                                <button type="button" class="te-popup-code-block-lang-capnproto" data-lang="capnproto">capnproto</button>
                                                <button type="button" class="te-popup-code-block-lang-ceylon" data-lang="ceylon">ceylon</button>
                                                <button type="button" class="te-popup-code-block-lang-clean" data-lang="clean">clean</button>
                                                <button type="button" class="te-popup-code-block-lang-clojure" data-lang="clojure">clojure</button>
                                                <button type="button" class="te-popup-code-block-lang-clojure-repl" data-lang="clojure-repl">clojure-repl</button>
                                                <button type="button" class="te-popup-code-block-lang-cmake" data-lang="cmake">cmake</button>
                                                <button type="button" class="te-popup-code-block-lang-coffeescript" data-lang="coffeescript">coffeescript</button>
                                                <button type="button" class="te-popup-code-block-lang-coq" data-lang="coq">coq</button>
                                                <button type="button" class="te-popup-code-block-lang-cos" data-lang="cos">cos</button>
                                                <button type="button" class="te-popup-code-block-lang-crmsh" data-lang="crmsh">crmsh</button>
                                                <button type="button" class="te-popup-code-block-lang-crystal" data-lang="crystal">crystal</button>
                                                <button type="button" class="te-popup-code-block-lang-cs" data-lang="cs">cs</button>
                                                <button type="button" class="te-popup-code-block-lang-csp" data-lang="csp">csp</button>
                                                <button type="button" class="te-popup-code-block-lang-css" data-lang="css">css</button>
                                                <button type="button" class="te-popup-code-block-lang-d" data-lang="d">d</button>
                                                <button type="button" class="te-popup-code-block-lang-markdown" data-lang="markdown">markdown</button>
                                                <button type="button" class="te-popup-code-block-lang-dart" data-lang="dart">dart</button>
                                                <button type="button" class="te-popup-code-block-lang-delphi" data-lang="delphi">delphi</button>
                                                <button type="button" class="te-popup-code-block-lang-diff" data-lang="diff">diff</button>
                                                <button type="button" class="te-popup-code-block-lang-django" data-lang="django">django</button>
                                                <button type="button" class="te-popup-code-block-lang-dns" data-lang="dns">dns</button>
                                                <button type="button" class="te-popup-code-block-lang-dockerfile" data-lang="dockerfile">dockerfile</button>
                                                <button type="button" class="te-popup-code-block-lang-dos" data-lang="dos">dos</button>
                                                <button type="button" class="te-popup-code-block-lang-dsconfig" data-lang="dsconfig">dsconfig</button>
                                                <button type="button" class="te-popup-code-block-lang-dts" data-lang="dts">dts</button>
                                                <button type="button" class="te-popup-code-block-lang-dust" data-lang="dust">dust</button>
                                                <button type="button" class="te-popup-code-block-lang-ebnf" data-lang="ebnf">ebnf</button>
                                                <button type="button" class="te-popup-code-block-lang-elixir" data-lang="elixir">elixir</button>
                                                <button type="button" class="te-popup-code-block-lang-elm" data-lang="elm">elm</button>
                                                <button type="button" class="te-popup-code-block-lang-ruby" data-lang="ruby">ruby</button>
                                                <button type="button" class="te-popup-code-block-lang-erb" data-lang="erb">erb</button>
                                                <button type="button" class="te-popup-code-block-lang-erlang-repl" data-lang="erlang-repl">erlang-repl</button>
                                                <button type="button" class="te-popup-code-block-lang-erlang" data-lang="erlang">erlang</button>
                                                <button type="button" class="te-popup-code-block-lang-excel" data-lang="excel">excel</button>
                                                <button type="button" class="te-popup-code-block-lang-fix" data-lang="fix">fix</button>
                                                <button type="button" class="te-popup-code-block-lang-flix" data-lang="flix">flix</button>
                                                <button type="button" class="te-popup-code-block-lang-fortran" data-lang="fortran">fortran</button>
                                                <button type="button" class="te-popup-code-block-lang-fsharp" data-lang="fsharp">fsharp</button>
                                                <button type="button" class="te-popup-code-block-lang-gams" data-lang="gams">gams</button>
                                                <button type="button" class="te-popup-code-block-lang-gauss" data-lang="gauss">gauss</button>
                                                <button type="button" class="te-popup-code-block-lang-gcode" data-lang="gcode">gcode</button>
                                                <button type="button" class="te-popup-code-block-lang-gherkin" data-lang="gherkin">gherkin</button>
                                                <button type="button" class="te-popup-code-block-lang-glsl" data-lang="glsl">glsl</button>
                                                <button type="button" class="te-popup-code-block-lang-gml" data-lang="gml">gml</button>
                                                <button type="button" class="te-popup-code-block-lang-go" data-lang="go">go</button>
                                                <button type="button" class="te-popup-code-block-lang-golo" data-lang="golo">golo</button>
                                                <button type="button" class="te-popup-code-block-lang-gradle" data-lang="gradle">gradle</button>
                                                <button type="button" class="te-popup-code-block-lang-groovy" data-lang="groovy">groovy</button>
                                                <button type="button" class="te-popup-code-block-lang-haml" data-lang="haml">haml</button>
                                                <button type="button" class="te-popup-code-block-lang-handlebars" data-lang="handlebars">handlebars</button>
                                                <button type="button" class="te-popup-code-block-lang-haskell" data-lang="haskell">haskell</button>
                                                <button type="button" class="te-popup-code-block-lang-haxe" data-lang="haxe">haxe</button>
                                                <button type="button" class="te-popup-code-block-lang-hsp" data-lang="hsp">hsp</button>
                                                <button type="button" class="te-popup-code-block-lang-htmlbars" data-lang="htmlbars">htmlbars</button>
                                                <button type="button" class="te-popup-code-block-lang-http" data-lang="http">http</button>
                                                <button type="button" class="te-popup-code-block-lang-hy" data-lang="hy">hy</button>
                                                <button type="button" class="te-popup-code-block-lang-inform7" data-lang="inform7">inform7</button>
                                                <button type="button" class="te-popup-code-block-lang-ini" data-lang="ini">ini</button>
                                                <button type="button" class="te-popup-code-block-lang-irpf90" data-lang="irpf90">irpf90</button>
                                                <button type="button" class="te-popup-code-block-lang-isbl" data-lang="isbl">isbl</button>
                                                <button type="button" class="te-popup-code-block-lang-java" data-lang="java">java</button>
                                                <button type="button" class="te-popup-code-block-lang-javascript" data-lang="javascript">javascript</button>
                                                <button type="button" class="te-popup-code-block-lang-jboss-cli" data-lang="jboss-cli">jboss-cli</button>
                                                <button type="button" class="te-popup-code-block-lang-json" data-lang="json">json</button>
                                                <button type="button" class="te-popup-code-block-lang-julia" data-lang="julia">julia</button>
                                                <button type="button" class="te-popup-code-block-lang-julia-repl" data-lang="julia-repl">julia-repl</button>
                                                <button type="button" class="te-popup-code-block-lang-kotlin" data-lang="kotlin">kotlin</button>
                                                <button type="button" class="te-popup-code-block-lang-lasso" data-lang="lasso">lasso</button>
                                                <button type="button" class="te-popup-code-block-lang-ldif" data-lang="ldif">ldif</button>
                                                <button type="button" class="te-popup-code-block-lang-leaf" data-lang="leaf">leaf</button>
                                                <button type="button" class="te-popup-code-block-lang-less" data-lang="less">less</button>
                                                <button type="button" class="te-popup-code-block-lang-lisp" data-lang="lisp">lisp</button>
                                                <button type="button" class="te-popup-code-block-lang-livecodeserver" data-lang="livecodeserver">livecodeserver</button>
                                                <button type="button" class="te-popup-code-block-lang-livescript" data-lang="livescript">livescript</button>
                                                <button type="button" class="te-popup-code-block-lang-llvm" data-lang="llvm">llvm</button>
                                                <button type="button" class="te-popup-code-block-lang-lsl" data-lang="lsl">lsl</button>
                                                <button type="button" class="te-popup-code-block-lang-lua" data-lang="lua">lua</button>
                                                <button type="button" class="te-popup-code-block-lang-makefile" data-lang="makefile">makefile</button>
                                                <button type="button" class="te-popup-code-block-lang-mathematica" data-lang="mathematica">mathematica</button>
                                                <button type="button" class="te-popup-code-block-lang-matlab" data-lang="matlab">matlab</button>
                                                <button type="button" class="te-popup-code-block-lang-maxima" data-lang="maxima">maxima</button>
                                                <button type="button" class="te-popup-code-block-lang-mel" data-lang="mel">mel</button>
                                                <button type="button" class="te-popup-code-block-lang-mercury" data-lang="mercury">mercury</button>
                                                <button type="button" class="te-popup-code-block-lang-mipsasm" data-lang="mipsasm">mipsasm</button>
                                                <button type="button" class="te-popup-code-block-lang-mizar" data-lang="mizar">mizar</button>
                                                <button type="button" class="te-popup-code-block-lang-perl" data-lang="perl">perl</button>
                                                <button type="button" class="te-popup-code-block-lang-mojolicious" data-lang="mojolicious">mojolicious</button>
                                                <button type="button" class="te-popup-code-block-lang-monkey" data-lang="monkey">monkey</button>
                                                <button type="button" class="te-popup-code-block-lang-moonscript" data-lang="moonscript">moonscript</button>
                                                <button type="button" class="te-popup-code-block-lang-n1ql" data-lang="n1ql">n1ql</button>
                                                <button type="button" class="te-popup-code-block-lang-nginx" data-lang="nginx">nginx</button>
                                                <button type="button" class="te-popup-code-block-lang-nimrod" data-lang="nimrod">nimrod</button>
                                                <button type="button" class="te-popup-code-block-lang-nix" data-lang="nix">nix</button>
                                                <button type="button" class="te-popup-code-block-lang-nsis" data-lang="nsis">nsis</button>
                                                <button type="button" class="te-popup-code-block-lang-objectivec" data-lang="objectivec">objectivec</button>
                                                <button type="button" class="te-popup-code-block-lang-ocaml" data-lang="ocaml">ocaml</button>
                                                <button type="button" class="te-popup-code-block-lang-openscad" data-lang="openscad">openscad</button>
                                                <button type="button" class="te-popup-code-block-lang-oxygene" data-lang="oxygene">oxygene</button>
                                                <button type="button" class="te-popup-code-block-lang-parser3" data-lang="parser3">parser3</button>
                                                <button type="button" class="te-popup-code-block-lang-pf" data-lang="pf">pf</button>
                                                <button type="button" class="te-popup-code-block-lang-pgsql" data-lang="pgsql">pgsql</button>
                                                <button type="button" class="te-popup-code-block-lang-php" data-lang="php">php</button>
                                                <button type="button" class="te-popup-code-block-lang-plaintext" data-lang="plaintext">plaintext</button>
                                                <button type="button" class="te-popup-code-block-lang-pony" data-lang="pony">pony</button>
                                                <button type="button" class="te-popup-code-block-lang-powershell" data-lang="powershell">powershell</button>
                                                <button type="button" class="te-popup-code-block-lang-processing" data-lang="processing">processing</button>
                                                <button type="button" class="te-popup-code-block-lang-profile" data-lang="profile">profile</button>
                                                <button type="button" class="te-popup-code-block-lang-prolog" data-lang="prolog">prolog</button>
                                                <button type="button" class="te-popup-code-block-lang-properties" data-lang="properties">properties</button>
                                                <button type="button" class="te-popup-code-block-lang-protobuf" data-lang="protobuf">protobuf</button>
                                                <button type="button" class="te-popup-code-block-lang-puppet" data-lang="puppet">puppet</button>
                                                <button type="button" class="te-popup-code-block-lang-purebasic" data-lang="purebasic">purebasic</button>
                                                <button type="button" class="te-popup-code-block-lang-python" data-lang="python">python</button>
                                                <button type="button" class="te-popup-code-block-lang-q" data-lang="q">q</button>
                                                <button type="button" class="te-popup-code-block-lang-qml" data-lang="qml">qml</button>
                                                <button type="button" class="te-popup-code-block-lang-r" data-lang="r">r</button>
                                                <button type="button" class="te-popup-code-block-lang-reasonml" data-lang="reasonml">reasonml</button>
                                                <button type="button" class="te-popup-code-block-lang-rib" data-lang="rib">rib</button>
                                                <button type="button" class="te-popup-code-block-lang-roboconf" data-lang="roboconf">roboconf</button>
                                                <button type="button" class="te-popup-code-block-lang-routeros" data-lang="routeros">routeros</button>
                                                <button type="button" class="te-popup-code-block-lang-rsl" data-lang="rsl">rsl</button>
                                                <button type="button" class="te-popup-code-block-lang-ruleslanguage" data-lang="ruleslanguage">ruleslanguage</button>
                                                <button type="button" class="te-popup-code-block-lang-rust" data-lang="rust">rust</button>
                                                <button type="button" class="te-popup-code-block-lang-sas" data-lang="sas">sas</button>
                                                <button type="button" class="te-popup-code-block-lang-scala" data-lang="scala">scala</button>
                                                <button type="button" class="te-popup-code-block-lang-scheme" data-lang="scheme">scheme</button>
                                                <button type="button" class="te-popup-code-block-lang-scilab" data-lang="scilab">scilab</button>
                                                <button type="button" class="te-popup-code-block-lang-scss" data-lang="scss">scss</button>
                                                <button type="button" class="te-popup-code-block-lang-shell" data-lang="shell">shell</button>
                                                <button type="button" class="te-popup-code-block-lang-smali" data-lang="smali">smali</button>
                                                <button type="button" class="te-popup-code-block-lang-smalltalk" data-lang="smalltalk">smalltalk</button>
                                                <button type="button" class="te-popup-code-block-lang-sml" data-lang="sml">sml</button>
                                                <button type="button" class="te-popup-code-block-lang-sqf" data-lang="sqf">sqf</button>
                                                <button type="button" class="te-popup-code-block-lang-sql" data-lang="sql">sql</button>
                                                <button type="button" class="te-popup-code-block-lang-stan" data-lang="stan">stan</button>
                                                <button type="button" class="te-popup-code-block-lang-stata" data-lang="stata">stata</button>
                                                <button type="button" class="te-popup-code-block-lang-step21" data-lang="step21">step21</button>
                                                <button type="button" class="te-popup-code-block-lang-stylus" data-lang="stylus">stylus</button>
                                                <button type="button" class="te-popup-code-block-lang-subunit" data-lang="subunit">subunit</button>
                                                <button type="button" class="te-popup-code-block-lang-swift" data-lang="swift">swift</button>
                                                <button type="button" class="te-popup-code-block-lang-taggerscript" data-lang="taggerscript">taggerscript</button>
                                                <button type="button" class="te-popup-code-block-lang-yaml" data-lang="yaml">yaml</button>
                                                <button type="button" class="te-popup-code-block-lang-tap" data-lang="tap">tap</button>
                                                <button type="button" class="te-popup-code-block-lang-tcl" data-lang="tcl">tcl</button>
                                                <button type="button" class="te-popup-code-block-lang-tex" data-lang="tex">tex</button>
                                                <button type="button" class="te-popup-code-block-lang-thrift" data-lang="thrift">thrift</button>
                                                <button type="button" class="te-popup-code-block-lang-tp" data-lang="tp">tp</button>
                                                <button type="button" class="te-popup-code-block-lang-twig" data-lang="twig">twig</button>
                                                <button type="button" class="te-popup-code-block-lang-typescript" data-lang="typescript">typescript</button>
                                                <button type="button" class="te-popup-code-block-lang-vala" data-lang="vala">vala</button>
                                                <button type="button" class="te-popup-code-block-lang-vbnet" data-lang="vbnet">vbnet</button>
                                                <button type="button" class="te-popup-code-block-lang-vbscript" data-lang="vbscript">vbscript</button>
                                                <button type="button" class="te-popup-code-block-lang-vbscript-html" data-lang="vbscript-html">vbscript-html</button>
                                                <button type="button" class="te-popup-code-block-lang-verilog" data-lang="verilog">verilog</button>
                                                <button type="button" class="te-popup-code-block-lang-vhdl" data-lang="vhdl">vhdl</button>
                                                <button type="button" class="te-popup-code-block-lang-vim" data-lang="vim">vim</button>
                                                <button type="button" class="te-popup-code-block-lang-x86asm" data-lang="x86asm">x86asm</button>
                                                <button type="button" class="te-popup-code-block-lang-xl" data-lang="xl">xl</button>
                                                <button type="button" class="te-popup-code-block-lang-xquery" data-lang="xquery">xquery</button>
                                                <button type="button" class="te-popup-code-block-lang-zephir" data-lang="zephir">zephir</button>
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
border-top-color: #0176fe" id="ember8761" class="_loading-spinner_v3bqta _inline_v3bqta ember-view">
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

        <div id="ember8765" class="ember-view"><!----></div>


    </div>

    <div id="ember8766" class="_widget-box-container_1kdhi6 ember-view">
        <div data-autoid="consultations" id="ember8767" class="ember-view">
            <div class="_header-buttons_alrpq4">
                <button data-autoid="consultations-main-action" class="button button--tall _start-consultation_alrpq4 ember-tooltip-target" data-ember-action="" data-ember-action-8768="8768">
                    Iniciar Nueva Consulta

                    <div id="ember8769" class="ember-tooltip-base ember-view">
                        <div id="ember8770" class="ember-view">
                            <div>
                                Crear consulta sin cita previa
                            </div>
                        </div>
                    </div>
                </button>

                <button data-autoid="show-follow-up-reminder-button" class="button button--alternative button--tall _follow-up-reminder_alrpq4 ember-tooltip-target" data-ember-action="" data-ember-action-8771="8771">
                    <i aria-hidden="true" class="fa fa-clock-o"></i>
                    <div id="ember8772" class="ember-tooltip-base ember-view">
                        <div id="ember8773" class="ember-view">
                            <div>
                                Programar Recordatorio
                            </div>
                        </div>
                    </div>
                </button>
            </div>

            <!---->
            <div data-autoid="new-consultation-schedule" id="ember8774" class="_new-consultation-schedule_1ebajo ember-view">
                <button class="_header-toggler_1ebajo" data-ember-action="" data-ember-action-8775="8775">
                    <span>Agendar consulta</span>
                    <span class="_toggler_1ebajo"></span>
                </button>

                <!---->
            </div>

            <div data-autoid="follow-up-reminder-list" id="ember8776" class="ember-view">
                <!---->
            </div>

            <div class="_title-list_alrpq4">
                <strong class="_heading_alrpq4 _heading_1ni3qz">Consultas agendadas
                </strong>
                <div id="ember8777" class="_switch_alrpq4 _checkbox-switch_1lvift ember-view">
                    <input id="view-canceled-appointments-form" type="checkbox" data-autoid="checkbox-switch__input">

                    <label data-autoid="checkbox-switch__trigger" for="view-canceled-appointments-form"></label>

                    <label data-autoid="checkbox-switch__label" for="view-canceled-appointments-form">
                        Ver citas canceladas

                        <!---->
                    </label>
                </div>
            </div>
            <div data-autoid="consultation-schedules-list" id="ember8778" class="ember-view">
                <div id="ember8785" class="ember-view">
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
                                    <div id="ember8786" class="ember-view">
                                        <div class="_actions_16c14z">
                                            <button data-autoid="edit-popup-cancel" class="button _delete_16c14z ember-tooltip-target" data-ember-action="" data-ember-action-8787="8787">

                                                <i class="fa fa-trash-o"></i>

                                                <div id="ember8788" class="ember-tooltip-base ember-view">
                                                    <div id="ember8789" class="ember-view">
                                                        <div>
                                                            Cancelar
                                                        </div>
                                                    </div>
                                                </div>
                                            </button>

                                            <div class="_actions-right_16c14z">
                                                <button data-autoid="edit-popup-confirm" class="button _confirm_16c14z ember-tooltip-target" data-ember-action="" data-ember-action-8790="8790">

                                                    <i class="fa fa-check"></i>

                                                    <div id="ember8791" class="ember-tooltip-base ember-view">
                                                        <div id="ember8792" class="ember-view">
                                                            <div>
                                                                Confirmar
                                                            </div>
                                                        </div>
                                                    </div>
                                                </button>
                                                <button data-autoid="edit-popup-arrival-at" class="button _arrival-at_16c14z ember-tooltip-target" data-ember-action="" data-ember-action-8793="8793">
                                                    <div id="ember8794" class="ember-tooltip-base ember-view">
                                                        <div id="ember8795" class="ember-view">
                                                            <div>
                                                                Paciente llegó
                                                            </div>
                                                        </div>
                                                    </div>
                                                </button>

                                                <span>
                                                    <button data-autoid="start-consultation-0" type="submit" id="ember8796" class="button _start-consultation_16c14z async-button default ember-view">
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
            <div id="ember8780" class="ember-view">
                <strong class="_heading_1ni3qz">Consultas iniciadas
                </strong>

                <p data-autoid="no-results" class="_no-results_1ni3qz">
                    Aun no hay consultas iniciadas
                </p>

                <div id="ember8781" class="ember-view">
                    <!---->
                </div>
            </div>
        </div>

        <div id="ember87810" class="ember-view">
            <strong class="_heading_1ni3qz">Descarga de Concentimientos 
            </strong>

            <div id="ember87811" class="ember-view">
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

    <div id="ember807" class="ember-view">
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
                <a href="https://app.nimbo-x.com/person/4896564" class="shepherd-cancel-link">✕</a>
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
                <a href="https://app.nimbo-x.com/person/4896564" class="shepherd-cancel-link">✕</a>
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
