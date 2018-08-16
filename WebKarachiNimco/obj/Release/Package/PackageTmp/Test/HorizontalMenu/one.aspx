<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="one.aspx.cs" Inherits="WebKarachiNimco.Test.HorizontalMenu.one" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #slider-wrapper {
            width: 940px;
            height: 470px;
            margin: 50px auto;
            position: relative;
            margin-bottom: 0px;
            background: rgba(0, 0, 0, 0.5);
            overflow: hidden;
        }

        #s1 {
            padding: 6px;
            background: #000000;
            position: absolute;
            left: 50%;
            bottom: 25px;
            margin-left: -36px;
            border-radius: 20px;
            opacity: 0.3;
            cursor: pointer;
            z-index: 999;
        }

        #s2 {
            padding: 6px;
            background: #000000;
            position: absolute;
            left: 50%;
            bottom: 25px;
            margin-left: -12px;
            border-radius: 20px;
            opacity: 0.3;
            cursor: pointer;
            z-index: 999;
        }

        #s3 {
            padding: 6px;
            background: #000000;
            position: absolute;
            left: 50%;
            bottom: 25px;
            margin-left: 12px;
            border-radius: 20px;
            opacity: 0.3;
            cursor: pointer;
            z-index: 999;
        }

        #s4 {
            padding: 6px;
            background: #000000;
            position: absolute;
            left: 50%;
            bottom: 25px;
            margin-left: 36px;
            border-radius: 20px;
            opacity: 0.3;
            cursor: pointer;
            z-index: 999;
        }

            #s1:hover,
            #s2:hover,
            #s3:hover,
            #s4:hover {
                opacity: .50;
            }

        .inner-wrapper {
            width: 940px;
            height: 470px;
            position: absolute;
            top: 0;
            left: 0;
            margin-bottom: 0px;
            overflow: hidden;
        }

        .control {
            display: none;
        }

        #Slide1:checked ~ .overflow-wrapper {
            margin-left: 0%;
        }

        #Slide2:checked ~ .overflow-wrapper {
            margin-left: -100%;
        }

        #Slide3:checked ~ .overflow-wrapper {
            margin-left: -200%;
        }

        #Slide4:checked ~ .overflow-wrapper {
            margin-left: -300%;
        }

        #Slide1:checked + #s1 {
            opacity: 1;
        }

        #Slide2:checked + #s2 {
            opacity: 1;
        }

        #Slide3:checked + #s3 {
            opacity: 1;
        }

        #Slide4:checked + #s4 {
            opacity: 1;
        }

        .overflow-wrapper {
            width: 400%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            overflow-y: hidden;
            z-index: 1;
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            -o-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }

        .slide img {
            width: 25%;
            float: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="slider-wrapper">
                <div class="inner-wrapper">
                    <input checked type="radio" name="slide" class="control" id="Slide1" />
                    <label for="Slide1" id="s1"></label>
                    <input type="radio" name="slide" class="control" id="Slide2" />
                    <label for="Slide2" id="s2"></label>
                    <input type="radio" name="slide" class="control" id="Slide3" />
                    <label for="Slide3" id="s3"></label>
                    <input type="radio" name="slide" class="control" id="Slide4" />
                    <label for="Slide4" id="s4"></label>
                    <div class="overflow-wrapper">
                        <a class="slide" href="">
                            <img src="" /></a>
                        <a class="slide" href="">
                            <img src="../1.jpg" width="500px" /></a>
                        <a class="slide" href="">
                            <img src="../2.jpg" width="500px" /></a>
                        <a class="slide" href="">
                            <img src="../3.jpg" width="500px" /></a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
