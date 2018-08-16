<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucHomeSliderView.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucHomeSliderView" %>


<style>
    .sliderBody {
        position: relative;
        height: 100%;
    }

    .swiper-container {
        width: 100%;
        height: 100%;
    }

    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }

    html, body, #form1, .main-slider-wrapper {
        height: 100%;
    }
</style>

<div class="swiper-container">
    <div id="slide" class="swiper-wrapper">
    </div>
    <div class="swiper-pagination"></div>
</div>
<script src="/Framework/Slider/swiper.min.js"></script>

<script>
    $(document).ready(function () {
        $.ajax({
            type: "POST",
            url: "Home.aspx/GetslideImages",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                for (var item = 0; item < data.d.length; item++) {
                    $("#slide").append("<div class='swiper-slide'>" +
                                        " <span class='sliderTitle'> " + data.d[item].HomeSliderTitle + "<br> " +
                                        " <span class='sliderSubTitle'>" + data.d[item].HomSliderSubTitle + "</span></span>" +
                                             //"<span class='sliderSubTitle'> " + data.d[item].HomSliderSubTitle + "</span>" +
                                        //" <span class='sliderSubTitle'> " + data.d[item].HomSliderSubTitle + "</span>" +
                                        " <img style='max-height: 535px; min-height: 535px; width: 80%;' src='/Images/HomeSlider/" + data.d[item].HomeSliderId + data.d[item].ImageURL + "'</div>");
                }
                var swiper = new Swiper('.swiper-container', {
                    autoplay: {
                        delay: 5000,
                    },
                    speed: 400,
                    pagination: {
                        el: '.swiper-pagination',
                        clickable: true,
                    },
                }).init();
                $("#resultarea").text(data);
            },
            error: function (data) {
                $("#resultarea").text(data);
            }
        });



        //  $("#slide").append(
        //     " <div class='swiper-slide' style='background-color: green;'>Slide 1</div>" +
        //      " <div class='swiper-slide'>Slide 2</div>" +
        //" <div class='swiper-slide'>Slide 3</div>  " +
        //" <div class='swiper-slide'>Slide 4</div>  " +
        //" <div class='swiper-slide'>Slide 5</div>  " +
        //" <div class='swiper-slide'>Slide 6</div>  " +
        //" <div class='swiper-slide'>Slide 7</div>  " +
        //" <div class='swiper-slide'>Slide 8</div>  " +
        //" <div class='swiper-slide'>Slide 9</div>  " +
        //" <div class='swiper-slide'>Slide 10</div>");

    });


</script>
