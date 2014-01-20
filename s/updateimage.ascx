<%@ Control Language="C#" AutoEventWireup="true" CodeFile="updateimage.ascx.cs" Inherits="s_updateimage" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

         
                <div style="text-align:center; display:block;">
                <asp:Image  CssClass="img_border" ID="Image1" runat="server"  />
                </div>
                <br />
                <div style="text-align:center; display:block;">

<h3 class="h3block">Upload Image!(Use a 3:4 dimensions images. most preferably 300px(width)x400px(height)</h3>
               <center>
                    <telerik:RadProgressManager ID="RadProgressManager1" runat="server" />
                    <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" AllowedFileExtensions="jpg,png,bmp,gif,jpeg,JPG,JPEG,PNG"
                        AutoAddFileInputs="False" MaxFileInputsCount="1" OnFileUploaded="RadAsyncUpload1_FileUploaded"
                        Skin="Outlook" TargetFolder="~/student_images/" Height="37px" 
                        Width="213px" >
                    </telerik:RadAsyncUpload>
                    <telerik:RadProgressArea ID="RadProgressArea1" runat="server" ProgressIndicators="TotalProgressBar, CurrentFileName, TimeElapsed, TimeEstimated, TransferSpeed"
                        Skin="Outlook" Width="557px" >
                    </telerik:RadProgressArea>
                </center>
   
</div>
<div style="text-align:center; display:block;">
  <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
           
                <asp:Button ID="Button1" runat="server" Text="Upload" 
    onclick="Button1_Click" />
    </div>
          