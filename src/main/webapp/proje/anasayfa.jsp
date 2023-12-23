<%-- 
    Document   : projedeneme1
    Created on : 15 Ara 2023, 23:43:54
    Author     : Aidon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

        <style>
            * {
                margin: 0;
                padding: 0;
                font-family: 'Roboto', sans-serif;
            }

            html, body {
                margin: 0;
                padding: 0;
                background-color: #000;
            }

            .container {
                width: 100%;
                height: 100vh;
                background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url(resim/anasayfa2.jpg);
                background-position: center;
                background-size: cover;

                padding-left: 4%;
                padding-right: 8%;
                box-sizing: border-box;
            }

            .navbar {
                height: 12%;
                display: flex;
                align-items: center;
            }

            .logo {
                width: 80px;
                cursor: pointer;
            }


            nav {
                flex: 1;
                text-align: right;
            }

            nav ul li {
                list-style: none;
                display: inline-block;
                margin-left: 60px;
            }

            nav ul li a {
                text-decoration: none;
                color: #fff;
                font-size: 13px;
            }

            .row {
                display: flex;
                height: 88%;
                align-items: center;
            }

            .col {
                flex-basis: 50%;
            }

            h1 {
                color: #fff;
                font-size: 80px;
                margin-bottom: 100px;
            }

            p {
                color: #fff;
                font-size: 20px;
                line-height: 1.5;
                font-family: 'Arial', sans-serif; /* Choose a suitable font */
                margin-bottom: 20px; /* Add some spacing at the bottom */
                text-align: justify; /* Justify text for a clean look */
                letter-spacing: 1px; /* Add a slight letter spacing */
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5); /* Add a subtle text shadow */
                transition: color 0.3s ease-in-out; /* Add a smooth color transition */
                
            }

            h5 {
                color: #fff;
                text-shadow: 0 0 5px #999;
            }

            button {
                width: 180px;
                color: #000;
                font-size: 15px;
                padding: 12px 0;
                background: #fff;
                border: 0;
                border-radius: 20px;
                outline: none;
                margin-top: 30px;
                cursor: pointer;
                transition: transorm 0.5s;
                transform-origin: center;
            }

            button:hover {
                transform: scale(1.1);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .footer {

                background-color: #000; /* Set the background color to black */
                color: #fff; /* Set the text color to white */
                padding: 20px; /* Add some padding to the footer content */
                text-align: left; /* Center align the text in the footer */

            }

            .footer p {
                padding: 20px; /* Add some padding to the footer content */
                margin: 0; /* Remove any default margin */
            }

            #lab_social_icon_footer i {
                font-size: 3em; /* This is the font size for the social icons */
                margin: 0 10px;
                text-align: center;
                text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
                cursor: pointer;
            }

        </style>
        <title>Anasayfa</title>
    </head>
    <body>
    <div class="container">
        <div class="navbar"> 
            <img src="resim/chef.png" class="logo">
                <nav>
                    <ul>
                        <li><a href="musterilogin.jsp"><button type="button">Kullanıcı Giriş</button></a></li>
                        <li><a href="adminlogin.jsp"><button type="button">Admin Giriş</button></a></li> 
                    </ul>
                </nav>
        </div>

        <div class="row">
            <div class="col">
                <h1>Restaurant City</h1>
                <p>Mükemmel bir lezzet ve sıradışı bir deneyim için</p>
            </div>
        </div>


    </div>
</body>
    <%@ include file="footer.jsp" %>
            </html>
