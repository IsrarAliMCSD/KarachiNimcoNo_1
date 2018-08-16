<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="two.aspx.cs" Inherits="WebKarachiNimco.Test.HorizontalMenu.two" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/css/materialize.min.css'>

    <link href="../jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" />


    <style>
        .slider .indicators .indicator-item {
            background-color: #666666;
            border: 3px solid #ffffff;
            -webkit-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            -moz-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }

            .slider .indicators .indicator-item.active {
                background-color: #ffffff;
            }

        .slider {
            width: 900px;
            margin: 0 auto;
        }

            .slider .indicators {
                bottom: 60px;
                z-index: 100;
                /* text-align: left; */
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="slider">
                <ul class="slides">
                    <li>
                        <img src="../1.jpg" width="600px" />

                        <!-- random image -->
                        <div class="caption center-align">
                            <h3>This is our big Tagline!</h3>
                            <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                        </div>
                    </li>
                    <li>
                        <img src="../3.jpg" width="600px" />
                        <!-- random image -->
                        <div class="caption left-align">
                            <h3>Left Aligned Caption</h3>
                            <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                        </div>
                    </li>
                    <li>
                        <img src="../3.jpg" width="600px" />
                        <!-- random image -->
                        <div class="caption right-align">
                            <h3>Right Aligned Caption</h3>
                            <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                        </div>
                    </li>
                    <li>
                        <img src="../4.jpg" width="600px" />
                        <!-- random image -->
                        <div class="caption center-align">
                            <h3>This is our big Tagline!</h3>
                            <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </form>
    <script src="../jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
    <script src="materialize.min.js"></script>
    <script>

        $(document).ready(function () {
            $('.slider').slider();
        });
    </script>

</body>
</html>
