<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="myContent/Style/myLogin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">Sign In</h5>
                        <div class="form-signin">
                            <div class="form-label-group">
                                <asp:TextBox ID="txtUserName" runat="server" class="form-control form-control-sm" placeholder="Username" required></asp:TextBox>
                                <label for='<%= txtUserName.ClientID %>'>Username</label>
                            </div>

                            <div class="form-label-group">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control form-control-sm" placeholder="Password" required></asp:TextBox>
                                <label for='<%= txtPassword.ClientID %>'>Password</label>
                            </div>
                            <div class="my-4">
                                <div style="display: flex; justify-content: center;">
                                    <asp:Image ID="imgCaptcha" runat="server" ImageUrl="~/CreateCaptcha.aspx?New=1" Width="40%" Height="30px" class="rounded" />
                                    <asp:ImageButton ID="imgBtnCapchaRefresh" AlternateText="Refresh" runat="server" OnClick="imgBtnCapchaRefresh_Click" ImageUrl="~/Images/refresh.png" Width="10%" Height="30px" />
                                    <asp:TextBox ID="txtCaptcha" runat="server" placeholder="Captcha" Width="40%"  autocomplete="off"></asp:TextBox>
                                </div>
                            </div>
                            <%--<div class="custom-control custom-checkbox mb-3">
                                <input type="checkbox" class="custom-control-input" id="customCheck1">
                                <label class="custom-control-label" for="customCheck1">Remember password</label>
                            </div>--%>
                            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Sign in" class="btn btn-lg btn-primary btn-block text-uppercase btn-menuColor" Style="background-color: #008fcc;" />

                            <%--<hr class="my-4">
              <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

