<!doctype html>
<!--[if lt IE 7 ]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>VR Siddhartha Engineering College | Training and Placement</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/favicon.ico">
    <link rel="apple-touch-icon" href="/apple-touch-icon.png">
    <link rel="stylesheet" href="css/style.css?v=2">
    <script src="js/libs/modernizr-1.7.min.js"></script>
    <style>
        body
        {
            font: 13px/15px Trebuchet MS,Verdana;
            background-color: #AAC5E1;
        }
        #content1
        {
            width: 430px;
            margin: 0 auto;
            padding: 10px 20px 20px 20px;
            background-color: #fff;
            border: solid 8px #52B8DA;
            box-shadow: #888 0px 0px 8px;
        }
        h3.heading
        {
            height: 40px;
            width: 430px;
            margin: 0 auto;
            margin-top: 100px;
            background-color: #52B8DA;
            line-height: 40px;
            text-align: center;
            border-radius: 5px 5px 0px 0px;
            font-size: 22px;
            color: #fff;
        }
        label
        {
            display: block;
            padding: 4px;
            font-size: 15px;
        }
        input[type="text"], input[type="password"]
        {
            border: 1px solid #CCCCCC;
            font-family: Helvetica,Arial,sans-serif;
            font-size: 1.1em;
            font-weight: bold;
            padding: 4px;
            width: 320px;
            margin-bottom: 13px;
            border-radius: 5px;
            height: 20px;
        }
        input[type="button"], input[type="submit"]
        {
            padding: 5px 8px;
            border-radius: 4px;
            border: solid 1px #d2d2d2;
            font-family: Helvetica,Arial,sans-serif;
        }
        input[type="button"]:hover, input[type="submit"]:hover
        {
            background-color:#52B8DA;
            color:#fff;
            border-radius: 4px;
        }
        input[type="submit"].login
        {
            padding: 5px 15px;
        }
        input[type="submit"].login:hover
        {
        }
        footer.bottom
        {
          position:fixed;
          height:40px;
          width:100%;
          bottom:0px;
          left:0px;  
          background-color:#1F69AD;
          font-size:15px;
          line-height:40px;
          text-align:center;
          color:#fff;
        }
        header.top
        {
            background:#0C477F url("img/bg-header.jpg") no-repeat center bottom;
    height: 100px;
    overflow: hidden;
    width: 100%;
    color:transparent;
     box-shadow: #888 0px 0px 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
        <header class="top">
   
    </header>
        <div role="main">
            <h3 class="heading">
              T and P, Login</h3>
            <div id="content1">
                <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Default.aspx">
                    <LayoutTemplate>
                        <br />
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name</asp:Label>
                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                        <span style="line-height: 20px; color:Red;">
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                            ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">* Required</asp:RequiredFieldValidator>
                         </span>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password</asp:Label>
                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                        <span style="line-height: 20px; color:Red;">
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">* Required</asp:RequiredFieldValidator>
                        </span>
                            <br />
                            <asp:CheckBox ID="RememberMe" runat="server" Text="" />
                            Remember me next time.
                            <br />
                            <span style="line-height: 30px; color: Red;">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </span>
                            <br />
                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" CssClass="login"
                                ValidationGroup="Login1" /> </table>
                    </LayoutTemplate>
                </asp:Login>
            </div>
        </div>
        <footer class="bottom">
        Designed and maintained by VRSEC WebGroup - <strong>Department of Computer Science and Engineering</strong>
    </footer>
    </div>
    <!-- eo #container -->
    </form>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.js"></script>
    <script>        window.jQuery || document.write("<script src='js/libs/jquery-1.5.1.min.js'>\x3C/script>")</script>
    <!-- scripts concatenated and minified via ant build script-->
    <script src="js/plugins.js"></script>
    <script src="js/script.js"></script>
    <!-- end scripts-->
    <!--[if lt IE 7 ]>
    <script src="js/libs/dd_belatedpng.js"></script>
    <script>DD_belatedPNG.fix("img, .png_bg");</script>
  <![endif]-->
    <script>
        var _gaq = [["_setAccount", "UA-XXXXX-X"], ["_trackPageview"]]; // Change UA-XXXXX-X to be your site's ID 
        (function (d, t) {
            var g = d.createElement(t), s = d.getElementsByTagName(t)[0]; g.async = 1;
            g.src = ("https:" == location.protocol ? "//ssl" : "//www") + ".google-analytics.com/ga.js";
            s.parentNode.insertBefore(g, s)
        } (document, "script"));
    </script>
</body>
</html>
