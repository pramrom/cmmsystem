﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/PatientMaster.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="DBProject.Patient.Pacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Pacientes - Nimbo</title>
    <style data-styles="">alert-dialog,duet-date-picker,vaccination-module,vaccine-table,auto-complete,vaccination-card,modal-dialog{visibility:hidden}.hydrated{visibility:inherit}</style>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="stylesheet" href="../media/vendor.css">
    <link rel="stylesheet" href="../media/nimbox.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="notifications"></div>
<div id="ember-basic-dropdown-wormhole"></div>   
<div id="ember1060" class="ember-view">

<div dir="rtr" class="ember-application-container__body">
  <div id="ember1118" class="ember-view"></div>

  <div class="ember-application__container">

<div class="ember-application__body">
      <div id="ember6284" class="_person-form-container_j32que ember-view"><div id="ember6293" class="feature-notification--full-width _feature-notification_1j0ju2 ember-view"></div>
<div id="ember6298" class="_form-sidebar_bf3ce0 ember-view"><h3 data-autoid="form-sidebar-heading" id="ember6311" class="_heading_jtnvkl ember-view">Nuevo paciente

</h3>

<div data-autoid="form-sidebar-avatar" id="ember6312" class="_upload-avatar_kgaadz ember-view"><img src="../media/avatar-placeholder-large.png" alt="Foto"/>

<label for="upload-avatar" class="button button--alternative">
    Adjuntar Foto
</label>

<input type="file" id="upload-avatar" class="ember-view">

</div>

<div data-autoid="form-sidebar-notes" id="ember6317" class="_internal-notes_1tuyqw ember-view"><label for="note-field" data-autoid="note-field-label">
  Notas internas
  <span class="_saving-status_1tuyqw">
    
  </span>
</label>

<textarea rows="6" id="note-field" data-autoid="note-field-textarea" class="ember-view"></textarea>

</div>

<div data-autoid="form-sidebar-alert" id="ember6326" class="_note-info_bf3ce0 _alert-box_er7zoe ember-view"><div data-autoid="alert-box--info">
      Estas notas sólo son visibles para el médico.

</div>
</div></div>

<div id="ember6331" class="_form-content_16ja5c ember-view"><div data-autoid="general-content" id="ember6344" class="ember-view"><h3 id="ember6345" class="_heading_jtnvkl _sub-heading-with-border_jtnvkl ember-view">Información General

</h3>


<div id="ember6346" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view"><div id="ember6347" class="_field_1mkkpr ember-view">  <label for="person-first-name" class="_required_1mkkpr">
    Nombre(s)
  </label>

        <input id="personfirstname" data-autoid="person-first-name" type="text" class="ember-view" runat="server"/>


</div>
<div id="ember6348" class="_field_1mkkpr ember-view">  <label for="person-last-name" class="_required_1mkkpr">
    Apellido(s)
  </label>

        <input id="personlastname" data-autoid="person-last-name" type="text" class="ember-view" runat="server"/>


</div>
</div>
<div id="ember6349" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view"><div id="ember6350" class="_field_1mkkpr ember-view">  <label for="person-born-at" class="_required_1mkkpr">
    Fecha de nacimiento
  </label>

      <input placeholder="DD-MM-AAAA" id="personbornat" data-autoid="person-born-at" type="text" class="ember-view" runat="server"/>


</div>
<div id="ember6361" class="_field_1mkkpr ember-view">  <label class="_required_1mkkpr">
    Sexo
  </label>

<div data-autoid="person-gender" id="ember6362" class="generic-select--theme _generic-select_34zh98 ember-view"><div id="ember6364" class="ember-basic-dropdown ember-view">
<div aria-owns="ember-basic-dropdown-content-ember6364" tabindex="0" data-ebd-id="ember6364-trigger" role="button" id="ember6365" class="ember-power-select-trigger ember-basic-dropdown-trigger ember-basic-dropdown-trigger--in-place ember-view">  
<span class="ember-power-select-status-icon"></span>
</div>
  <div id="ember-basic-dropdown-content-ember6364" style="display: none;" class="ember-basic-dropdown-content-placeholder"></div>

</div></div>

</div>
</div>
<div id="ember6369" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view"><div id="ember6370" class="_field_1mkkpr ember-view">  <label for="person-email" class="_required_1mkkpr">
    Email
  </label>

      <input id="personemail" data-autoid="person-email" type="email" class="ember-view" runat="server"/>


</div>
<div id="ember6371" class="_field_1mkkpr ember-view">  <label for="person-mobile" class="_required_1mkkpr">
    Teléfono móvil
  </label>

        <div id="ember6372" class="_input-with-country-select_1wehyq _generic-select_34zh98 ember-view"><div data-autoid="input-with-country-select__select-control" class="_country-select-wrapper_1wehyq">
<div id="ember6374" class="ember-basic-dropdown ember-view">
<div aria-owns="ember-basic-dropdown-content-ember6374" tabindex="0" data-ebd-id="ember6374-trigger" role="button" id="ember6375" class="ember-power-select-trigger ember-basic-dropdown-trigger ember-basic-dropdown-trigger--in-place ember-view">  
<span class="ember-power-select-status-icon"></span>
</div>
  <div id="ember-basic-dropdown-content-ember6374" style="display: none;" class="ember-basic-dropdown-content-placeholder"></div>

</div>
</div>

<input id="personmobile" data-autoid="input-with-country-select__input-control" type="tel" class="_input-control_1wehyq ember-view" runat="server"/>


</div>


</div>
</div>
<div id="ember6379" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view">  <div id="ember6380" class="_field_1mkkpr ember-view">
 

</div>
<div id="ember6381" class="_field_1mkkpr ember-view">
  <div id="ember6382" class="_checkbox-switch_1lvift ember-view">  <input id="without-cellphone" type="checkbox" data-autoid="checkbox-switch__input">

<label data-autoid="checkbox-switch__trigger" for="without-cellphone"></label>

<label data-autoid="checkbox-switch__label" for="without-cellphone">
  Sin celular

</label>
</div>


</div>
</div>
<div id="ember6383" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view"><div id="ember6384" class="_field_1mkkpr ember-view">  <label for="person-telephone">
    Teléfono
  </label>

      <input id="persontelephone" data-autoid="person-telephone" type="text" class="ember-view" runat="server"/>


</div>
<div id="ember6387" class="_field_1mkkpr ember-view">  <label for="person-identity-number">
    CURP (Clave Única de Registro de Población)
  </label>


        <input id="personidentitynumber" data-autoid="person-identity-number" type="text" class="ember-view" runat="server"/>


</div>
</div>
  <div class="_optional-fields_q6fna8">




  </div>

  <div>
    <div id="ember6388" class="_checkbox-switch_1lvift ember-view">  <input id="welcome-message" type="checkbox" data-autoid="checkbox-switch__input">

<label data-autoid="checkbox-switch__trigger" for="welcome-message"></label>

<label data-autoid="checkbox-switch__label" for="welcome-message">
  El paciente acepta recibir recordatorios y mensajes por whatsapp

      <span class="_status-active_1lvift">
        Activado
      </span>
</label>
</div>
  </div>

  <div>
    <div id="ember6389" class="_checkbox-switch_1lvift ember-view">  <input id="welcome-email" type="checkbox" data-autoid="checkbox-switch__input">

<label data-autoid="checkbox-switch__trigger" for="welcome-email"></label>

<label data-autoid="checkbox-switch__label" for="welcome-email">
  Mandar correo de bienvenida en su primer cita

      <span class="_status-active_1lvift">
        Activado
      </span>
</label>
</div>
  </div>
</div>

<div data-autoid="demographic-accordion" id="ember6394" class="ember-view">  <div id="ember6403" class="_skin-default_1fsxns _heading_jtnvkl _sub-heading-with-border_jtnvkl _accordion-header_1fsxns _show-body_1fsxns ember-view">      Información Demográfica

</div>
<div id="ember6408" class="ember-view">        <div data-autoid="demographic-content" id="ember6417" class="ember-view"><div id="ember6418" class="_fieldset_1kfu8s ember-view"><div id="ember6420" class="_field_1mkkpr ember-view">  <label for="person-address">
    Dirección
  </label>

      <input id="personaddress" type="text" class="ember-view" runat="server"/>


</div>
</div>
<div id="ember6421" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view"><div id="ember6422" class="_field_1mkkpr ember-view">  <label>
    País
  </label>

<div data-autoid="person-country" id="ember6423" class="generic-select--theme _generic-select_34zh98 ember-view"><div id="ember6425" class="ember-basic-dropdown ember-view">
<div aria-owns="ember-basic-dropdown-content-ember6425" tabindex="0" data-ebd-id="ember6425-trigger" role="button" id="ember6426" class="ember-power-select-trigger ember-basic-dropdown-trigger ember-basic-dropdown-trigger--in-place ember-view">  
<span class="ember-power-select-status-icon"></span>
</div>
  <div id="ember-basic-dropdown-content-ember6425" style="display: none;" class="ember-basic-dropdown-content-placeholder"></div>

</div></div>

</div>
<div id="ember6431" class="_field_1mkkpr ember-view">  <label>
    Estado
  </label>

<div data-autoid="person-state" id="ember6432" class="generic-select--theme _generic-select_34zh98 ember-view"><div id="ember6434" class="ember-basic-dropdown ember-view">
<div aria-disabled="true" aria-owns="ember-basic-dropdown-content-ember6434" data-ebd-id="ember6434-trigger" role="button" id="ember6435" class="ember-power-select-trigger ember-basic-dropdown-trigger ember-basic-dropdown-trigger--in-place ember-view">  
<span class="ember-power-select-status-icon"></span>
</div>
  <div id="ember-basic-dropdown-content-ember6434" style="display: none;" class="ember-basic-dropdown-content-placeholder"></div>

</div></div>


</div>
</div>
<div id="ember6439" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view"><div id="ember6440" class="_field_1mkkpr ember-view">  <label for="person-city">
    Ciudad
  </label>

      <input id="personcity" type="text" class="ember-view" runat="server"/>


</div>
<div id="ember6442" class="_field_1mkkpr ember-view">  <label for="person-zipcode">
    Código Postal
  </label>

      <input id="personzipcode" type="text" class="ember-view" runat="server"/>


</div>
</div>

<div id="ember6443" class="_fieldset_1kfu8s _two-fields-per-row_1kfu8s ember-view"><div id="ember6445" class="_field_1mkkpr ember-view">  <label for="person-address-external-number">
    Número exterior
  </label>

      <input id="personaddressexternalnumber" type="text" class="ember-view" runat="server"/>


</div>
<div id="ember6447" class="_field_1mkkpr ember-view">  <label for="person-internal-number">
    Número interior
  </label>

      <input id="addressinternalnumber" type="text" class="ember-view" runat="server"/>


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
</div></div>
</asp:Content>
