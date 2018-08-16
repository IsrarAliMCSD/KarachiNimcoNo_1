<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucNewsAndEventDashBoard.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucNewsAndEventDashBoard" %>
<style>
    .ticker {
        height: 42px;
        overflow: hidden;
        line-height: 38px;
        background-color: #2a4424;
    }

    ul.ticker li span {
        background-color: #2a4424;
        border-right: 1px solid #fff color: #FFF;
        margin-right: 6px;
        font-size: 20px;
        padding: 10px 25px 10px 30px;
    }

    .ticker a:hover,
    .ticker li:hover {
        color: #D8D8D8;
    }

    .ticker a,
    .ticker li {
        color: #ffffff;
        font-size: 15px;
        background: #2a4424;
        border-width: 1px;
        list-style: none;
    }
</style>
<div class="container">
    <div class="row">
        <div class="col-12">

            <div>
                <ul class="ticker" style=" border: 1px solid #2a4424;">
                    <asp:Repeater ID="rptrNewsEvent" runat="server">
                        <ItemTemplate>
                            <li style="background-color:white; color:#000;" ><span style="color:#FFF;"><%# Eval("NewsEventTitle")%> &raquo;</span> <%# Eval("NewsEventDetail")%></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>
    var hoveredElement = null;

    function tick() {
        $('.ticker').filter(function (item) {
            return !$(this).is(hoveredElement)
        }).each(function () {
            $(this).find('li:first').slideUp(function () {
                $ticker = $(this).closest('.ticker');

                $(this).appendTo($ticker).slideDown();
            });
        });
    }
    setInterval(tick, 5000);


    $(function () {
        $('.ticker').hover(function () {
            hoveredElement = $(this);
        }, function () {
            hoveredElement = null;
        });
    });
</script>
