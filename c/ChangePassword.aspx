<%@ Page Title="" Language="C#" MasterPageFile="~/c.master" AutoEventWireup="true"
    CodeFile="ChangePassword.aspx.cs" Inherits="c_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_heading" runat="Server">
    Change your Password
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_placeholder" runat="Server">
<br /><br />
<div style="padding-left:30px;">
    <asp:ChangePassword ID="ChangePassword1" runat="server" ContinueDestinationPageUrl="~/c/Default.aspx"
       >
        <ChangePasswordTemplate>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Current Password:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td style="color:Red;">
                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword"
                            ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword1">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td style="color:Red;">
                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                            ErrorMessage="New Password is required." ToolTip="New Password is required."
                            ValidationGroup="ChangePassword1">* Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td style="color:Red;">
                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                            ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required."
                            ValidationGroup="ChangePassword1">* Required</asp:RequiredFieldValidator>
                            <br />
                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                            ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry."
                            ValidationGroup="ChangePassword1"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="right">
                        <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword"
                            Text="Change Password" ValidationGroup="ChangePassword1" />
                    </td>
               
                </tr>
            </table>
            <br />
            <span style="color:Red">
             <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
            </span>
        </ChangePasswordTemplate>
        <SuccessTemplate>
            <table>
                <tr>
                    <td>
                        <table cellpadding="0">
                             <tr>
                                <td>
                                    Your password has been changed!
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" CommandName="Continue"
                                        Text="Continue" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </SuccessTemplate>
    </asp:ChangePassword>

</div>
</asp:Content>
