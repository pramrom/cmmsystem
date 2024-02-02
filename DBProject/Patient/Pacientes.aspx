<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/PatientMaster.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="DBProject.Patient.Pacientes" %>
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
    <link rel="stylesheet" href="../media/Chaft2.css"/>
    <link rel="stylesheet" href="../media/Chaft.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="notifications"></div>
    <div id="ember-basic-dropdown-wormhole"></div>
    <div id="ember1060" class="ember-view">
        <div dir="rtr" class="ember-application-container__body">
            <div id="ember1118" class="ember-view"></div>
            <div class="ember-application__container">
                <div class="ember-application__body">
                    <div id="ember6284" class="">
                        
                        <div id="ember6331" style="width: 800px;">
                            <div data-autoid="general-content" id="ember6344" class="ember-view">
                                <h3 id="ember6345" class="_heading_jtnvkl _sub-heading-with-border_jtnvkl ember-view">Información General
                                </h3>
                                <div id="ember6346" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">
                                    <div id="ember6347" class="_field_1mkkpr ember-view">
                                        <label for="person-first-name" class="_required_1mkkpr">
                                            Nombre(s)
                                        </label>
                                        <input id="personfirstname" data-autoid="person-first-name" type="text" class="ember-view" runat="server" />
                                    </div>
                                    <div id="ember6348" class="_field_1mkkpr ember-view">
                                        <label for="person-last-name" class="_required_1mkkpr">
                                            Apellido(s)
                                        </label>
                                        <input id="personlastname" data-autoid="person-last-name" type="text" class="ember-view" runat="server" />
                                    </div>
                                </div>
                            <div id="ember6383" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">
                                <div id="ember6384" class="_field_1mkkpr ember-view">  
                                    <label for="person-telephone">Teléfono</label>
                                    <input id="persontelephone" data-autoid="person-telephone" type="text" class="ember-view" runat="server"/>
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
                                                    País
                                                </label>
                                                <input id="txtPais" type="text" class="ember-view" runat="server" />
                                            </div>
                                            <div id="ember6431" class="_field_1mkkpr ember-view">
                                                <label>
                                                    Estado
                                                </label>
                                                <input id="txtEstado" type="text" class="ember-view" runat="server" />
                                            </div>
                                        </div>
                                        <div id="ember6418" class="_fieldset_1kfu8s ember-view">
                                            <div id="ember6420" class="_field_1mkkpr ember-view">
                                                <label for="person-address">
                                                    Domicilio
                                                </label>
                                                <input id="personaddress" type="text" class="ember-view" runat="server" />
                                            </div>
                                        </div>
                                        <div id="ember6443" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">
                                            <div id="ember6445" class="_field_1mkkpr ember-view">
                                                <label for="person-address-external-number">
                                                    Número exterior
                                                </label>
                                                <input id="personaddressexternalnumber" type="text" class="ember-view" runat="server" />
                                            </div>
                                            <div id="ember6447" class="_field_1mkkpr ember-view">
                                                <label for="person-internal-number">
                                                    Número interior
                                                </label>
                                                <input id="addressinternalnumber" type="text" class="ember-view" runat="server" />
                                            </div>
                                        </div>
                                        <div id="ember6439" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">
                                            <div id="ember6440" class="_field_1mkkpr ember-view">
                                                <label for="person-city">
                                                    Colonia
                                                </label>
                                                <input id="personcity" type="text" class="ember-view" runat="server" />
                                            </div>
                                            <div id="ember6442" class="_field_1mkkpr ember-view">
                                                <label for="person-zipcode">
                                                    Código Postal
                                                </label>
                                                <input id="personzipcode" type="text" class="ember-view" runat="server" />
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
                                <button data-autoid="person-cancel" class="button--text" data-ember-action="" data-ember-action-6453="6453">
                                    Cancelar
                                </button>
                                <button runat="server" onserverclick="ember6454_ServerClick" data-autoid="person-submit" type="submit" id="ember6454" class="button async-button default ember-view">
                                    Guardar Paciente
                                </button>
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
</asp:Content>
