<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
        <title>JSP Page</title>
        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;

            }

            body {
                background-color: #f3f3f3;
                font-family: 'Poppins', sans-serif;
            }

            .menu {
                padding: 0 10px 30px 10px;
                display: grid;
                grid-template-columns: repeat( auto-fit, minmax(350px, 1fr));
                grid-gap: 30px 50px;
            }

            .heading{
                background-color: #cb202d;
                color: #ffffff;
                margin-bottom: 30px;
                padding: 30px 0;
                grid-column: 1/-1;
                text-align: center;
            }

            .heading>h1{
                font-weight: 400;
                font-size: 30px;
                letter-spacing: 10px;
                margin-bottom: 10px;
            }

            .heading>h3{
                font-weight: 600;
                font-size: 22px;
                letter-spacing: 5px;
            }

            .food-items {
                display: grid;
                position: relative;
                grid-template-rows: auto 1fr;
                border-radius: 15px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1)
            }

            .food-items img {
                position: relative;
                width: 100%;
                height: 432px;
                border-radius: 15px 15px 0 0;
            }

            h1 {
                grid-column: 1/-1;
                text-align: center;
            }

            .details {
                padding: 20px 10px;
                display: grid;
                grid-template-rows: auto 1fr 50px;
                grid-row-gap: 15px;
            }

            .details-sub {
                display: grid;
                grid-template-columns: auto auto;
            }

            .details-sub>h5 {
                font-weight: 600;
                font-size: 18px;
            }

            .price {
                text-align: right;
            }

            .details>p {
                color: #6f6f6f;
                font-size: 15px;
                line-height: 28px;
                font-weight: 400;
                align-self: stretch;
            }

            .custom-btn {

                font-weight: 400;
                font-size: 30px;
                letter-spacing: 2px;
                margin-bottom: 10px;

                width: 390px;
                height: 120px;
                color: #fff;
                border-radius: 5px;
                padding: 30px 75px;
                font-family: 'Lato', sans-serif;
                font-weight: 500;
                font-size: 24px;
                background: transparent;
                cursor: pointer;
                transition: all 0.3s ease;
                position: relative;
                display: block;
                box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
                    7px 7px 20px 0px rgba(0,0,0,.1),
                    4px 4px 5px 0px rgba(0,0,0,.1);
                outline: none;
                margin: 0 auto;
            }

            .custom-btn-jsp:hover {
                color: #f0094a;
            }

            .custom-btn-jsp:before,
            .custom-btn-jsp:after {
                content: '';
                position: absolute;
                width: 100%;
                height: 2px;
                background: #f0094a;
                transition: all 0.3s ease;
            }

            .custom-btn-jsp:before {
                top: 0;
            }

            .custom-btn-jsp:after {
                bottom: 0;
            }

            .custom-btn-jsp:hover:before,
            .custom-btn-jsp:hover:after {
                width: 0;
            }

            .btn-11 {
                border: none;
                background: rgb(176, 35, 61);
                background: linear-gradient(0deg, rgba(176, 35, 61, 1) 0%, rgba(142, 47, 71, 1) 100%);
                color: #fff;
                overflow: hidden;
            }
            .btn-11:hover {
                text-decoration: none;
                color: #fff;
            }
            .btn-11:before {
                position: absolute;
                content: '';
                display: inline-block;
                top: -180px;
                left: 0;
                width: 30px;
                height: 100%;
                background-color: #fff;
                animation: shiny-btn1 3s ease-in-out infinite;
            }
            .btn-11:hover{
                opacity: .7;
            }
            .btn-11:active{
                box-shadow:  4px 4px 6px 0 rgba(255,255,255,.3),
                    -4px -4px 6px 0 rgba(116, 125, 136, .2),
                    inset -4px -4px 6px 0 rgba(255,255,255,.2),
                    inset 4px 4px 6px 0 rgba(0, 0, 0, .2);
            }


            @-webkit-keyframes shiny-btn1 {
                0% {
                    -webkit-transform: scale(0) rotate(45deg);
                    opacity: 0;
                }
                80% {
                    -webkit-transform: scale(0) rotate(45deg);
                    opacity: 0.5;
                }
                81% {
                    -webkit-transform: scale(4) rotate(45deg);
                    opacity: 1;
                }
                100% {
                    -webkit-transform: scale(50) rotate(45deg);
                    opacity: 0;
                }
            }

            input[type="number"] {
                text-align: center;
                padding: 10px; /* Adjust this value based on your preference */
            }

            .icon {
                width: 30px; /* Adjust the width of the icon */
                height: 30px; /* Adjust the height of the icon */
                margin-right: 5px; /* Adjust the margin between the icon and text */
                margin-left: 5px; /* Adjust the margin between the icon and text */
                vertical-align: middle; /* Align the icon vertically with the text */
            }

        </style>
    </head>
    <body>
        <%        // burayı ekledim 
            String isim = (String) session.getAttribute("isimses");
            String email = (String) session.getAttribute("emailses");

            if (isim == null || email == null) {

                response.sendRedirect("musterilogin.jsp");

            } else {
        %>
        <form action="musteri_tumbilgi.jsp" method="POST">

            <div class="menu">
                <div class="heading">
                    <h1>THE BEST RESTAURANT</h1>
                    <h3>&mdash; MENU &mdash;</h3>
                    <br>
                    <img src="resim/warning.png" alt="Exclamation Mark" class="icon">
                        siparişinizi restoranımızda vermek istiyorsanız doğrudan 'satın al' butonuna basarak ilerleyiniz
                        <img src="resim/warning.png" alt="Exclamation Mark" class="icon">
                            </div>

                            <div class="food-items"> 
                                <img src="resim/iskender.jpg"> 
                                    <div class="details"> 
                                        <div class="details-sub"> 
                                            <h5>Tereyağlı İskender</h5>
                                            <h5 class="price"> 150 TL</h5>
                                        </div>
                                        <p>Yoğurtlu döner, taze ekmek ve tereyağı ile zenginleşen enfes bir lezzet.</p>
                                        <input type="number" id="iskender" name="iskender" value="0" min="0" max="15">
                                    </div>
                            </div>

                            <div class="food-items"> 
                                <img src="resim/doner.jpg"> 
                                    <div class="details"> 
                                        <div class="details-sub"> 
                                            <h5>Et Döner</h5>
                                            <h5 class="price"> 150 TL</h5>
                                        </div>
                                        <p>Marine edilmiş dana eti, özel baharatlarla pişirilip, sebzelerle harmanlanarak nefis bir lezzet sunar.</p>
                                        <input type="number" id="doner" name="doner" value="0" min="0" max="15">
                                    </div>
                            </div>

                            <div class="food-items"> 
                                <img src="resim/adanakebap.jpg"> 
                                    <div class="details"> 
                                        <div class="details-sub"> 
                                            <h5>Adana Kebap</h5>
                                            <h5 class="price"> 150 TL</h5>
                                        </div>
                                        <p>Özenle hazırlanan acılı kıyma, közde pişirilmiş, enfes lezzet sunar.</p>
                                        <input type="number" id="adana" name="adana" value="0" min="0" max="15">
                                    </div>
                            </div>

                            <div class="food-items"> 
                                <img src="resim/tavuksis.jpg"> 
                                    <div class="details"> 
                                        <div class="details-sub"> 
                                            <h5>Tavuk Şiş</h5>
                                            <h5 class="price"> 100 TL</h5>
                                        </div>
                                        <p>Marine edilmiş tavuk, kömür ateşinde özenle pişirilmiş, mükemmel bir lezzet.</p>
                                        <input type="number" id="tavuk_sis" name="tavuksis" value="0" min="0" max="15">
                                    </div>
                            </div>

                            <div class="food-items"> 
                                <img src="resim/beyti.jpg"> 
                                    <div class="details"> 
                                        <div class="details-sub"> 
                                            <h5>Beyti</h5>
                                            <h5 class="price"> 150 TL</h5>
                                        </div>
                                        <p>Nefis döner, taze baharatlarla sarılı, özel sos eşliğinde lezzet şöleni.</p>
                                        <input type="number" id="beyti" name="beyti" value="0" min="0" max="15">
                                    </div>
                            </div>

                            <div class="food-items"> 
                                <img src="resim/kola3.jpg"> 
                                    <div class="details"> 
                                        <div class="details-sub"> 
                                            <h5>Kola</h5>
                                            <h5 class="price"> 15 TL</h5>
                                        </div>
                                        <p>İçindeki gazlı hazzı keşfedin, ferahlatıcı ve klasik cola lezzeti.</p>
                                        <input type="number" id="kola" name="kola" value="0" min="0" max="15">
                                    </div>
                            </div>

                            <div class="food-items"> 
                                <img src="resim/fanta.jpg"> 
                                    <div class="details"> 
                                        <div class="details-sub"> 
                                            <h5>Fanta</h5>
                                            <h5 class="price"> 15 TL</h5>
                                        </div>
                                        <p>Canlandırıcı portakal lezzetiyle, enerji dolu bir içecek deneyimi.</p>
                                        <input type="number" id="fanta" name="fanta" value="0" min="0" max="15">
                                    </div>
                            </div>

                            <div class="food-items"> 
                                <img src="resim/ayran2.jpg"> 
                                    <div class="details"> 
                                        <div class="details-sub"> 
                                            <h5>Ayran</h5>
                                            <h5 class="price"> 15 TL</h5>
                                        </div>
                                        <p>Yoğurt ve tuzun mükemmel uyumuyla ferahlatıcı, geleneksel Türk içkisi.</p>
                                        <input type="number" id="ayran" name="ayran" value="0" min="0" max="15">
                                    </div>
                            </div>
                            </div>
                            <input class="custom-btn btn-11" type="submit" value="Satın Al">

                                </form>
                                <%
                                    }
                                %>
                                </body>
                                </html>

