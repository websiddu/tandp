<%@ Control Language="C#" AutoEventWireup="true" CodeFile="anbd.ascx.cs" Inherits="s_anbd" %>
<style>
    .subj
    {
        font-size:15px;
        padding-bottom:10px;
    }
    .time
    {
        font-size:11px;
        font-style:italic;
        padding-bottom:5px;
        border-bottom:dashed 1px #333;
    }
    .bod
    {
        padding-top:10px;
        padding-bottom:10px;
        border-bottom:dashed 1px #333;
    }
</style>
<div style="padding:10px;" >
<div class="subj">
<strong>Subject :</strong>
<asp:Label ID="Label1" runat="server" Text='<%# Bind("subject") %>'></asp:Label>
</div>
<div class="time">
   <i> Published On:</i>
<asp:Label ID="Label3" runat="server" Text='<%# Bind("date") %>'></asp:Label>
</div>

<div class="bod">
<strong>Content :</strong>
<asp:Label ID="Label2" runat="server" Text='<%# Bind("body") %>'></asp:Label>
</div>
</div>
