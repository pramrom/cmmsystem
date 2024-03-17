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


        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                    
                        <div class="form-top">
                            
                                <h3>Inventario</h3>

                                <div id="chavo8765" class="ember-view" style="background-color: #fafcfe !important;">
                                    <div data-autoid="upload-files-person-profile" id="chavo8557" class="ember-view">
                                        <div id="chavo8558" class="_widget-box_l8wwyk ember-view">
                                            <div data-autoid="widget-box-header" class="_header_l8wwyk">
                                                Archivos
                                        <div class="_header-items_l8wwyk">
                                        </div>
                                            </div>
                                            <div style="" class="_body_l8wwyk--has-padding  _body_l8wwyk">

                                                <asp:FileUpload ID="FileUpload1" runat="server" class="button button--tall _start-consultation_alrpq4 ember-tooltip-target" Width="799px" />
                                                <asp:Button runat="server" Text="Subir Archivo" ID="btnUpload" OnClick="btnUpload_Click" class="button button--tall _start-consultation_alrpq4 ember-tooltip-target"></asp:Button>
                                                <asp:Label ID="lblMessage" runat="server" class="_empty-status_u7zs43" Text="No se han subido archivos."></asp:Label>

                                                <asp:DataList ID="DataListContent" runat="server" OnItemCommand="ButtonDownloadContent" Style="padding: 0px!important" CellPadding="4" ForeColor="#333333" RepeatColumns="1" Width="800px">
                                                    <AlternatingItemStyle BackColor="White" />
                                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                                    <ItemTemplate>
                                                        <table class="table">  
                                                            <tr>  
                                                                <td style="width: 30px;" >                                                                     
                                                                    <img src='<%# DataBinder.Eval(Container.DataItem,"Icon") %>' id="ImgIcon" style="width: 20px;"></img>
                                                                </td>  
                                                                <td  style="width: 600px;">  
                                                                    <asp:LinkButton ID="ButtonDownload" runat="server" Style="padding-left: 5px; text-decoration: none"
                                                                        ToolTip="Click here to download" CommandName="Download" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"DownLoadLink") %>'
                                                                        Text=' <%# DataBinder.Eval(Container.DataItem,"FileName") %>'></asp:LinkButton>
                                                                </td>  
                                                                <td>  
                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" CommandArgument='<%# Eval("DownLoadLink") %>'
                                                                        Style="text-decoration: none; font-size: large; color: red;" runat="server" OnClick="DeleteFile" />
                                                                </td>  
                                                            </tr>  
                                                        </table> 
                                                    </ItemTemplate>
                                                    <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                                </asp:DataList>

                                                <div id="chavo8559" class="_button-upload-file_1xib8y ember-view">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                        </div>
                    </div>                
            </div>
            <br />        
    </form>
</asp:Content>
