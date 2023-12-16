<%@ page import="proje.konum_rezervasyonu"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            * {
                margin: 0;
                padding: 0;
                font-family: 'Roboto', sans-serif;
            }

            .container {
                width: 100%;
                height: 100vh;
                background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url(resim/background3.jpg);
                background-position: center;
                background-size: cover;

                padding-left: 8%;
                padding-right: 8%;
                box-sizing: border-box;
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
                font-size: 100px;
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

            p:hover {
                color: #ffcc00;
            }

            .card {
                width: 200px;
                height: 230px;
                display: inline-block;
                border-radius: 10px;
                padding: 15px 25px;
                box-sizing: border-box;
                cursor: pointer;
                margin: 10px 15px;
                transition: transform 0.5s;

                background-position: center;
                background-size: cover;
            }

            .card1 {
                background-image: url(resim/background4.jpg);
            }
            .card2 {
                background-image: url(resim/background4.jpg);
            }
            .card3 {
                background-image: url(resim/background4.jpg);
            }

            .card:hover {
                transform: translateY(-10px);
            }

            h5 {
                color: #000;
                text-shadow: 0 0 5px #999;
                text-align: center;
                margin-top: 50px;
            }

            .card p {
                text-shadow: 0 0 15px #000;
                font-size: 8px;
                text-align: center;
            }

            button {
                width: 360px;
                color: #000;
                font-size: 24px;
                padding: 12px 0;
                backtround: #fff;
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
        </style>
    <title>JSP Page</title>
</head>
<body>

    <% String isim = (String) session.getAttribute("isimses");
        String email2 = (String) session.getAttribute("emailses");

        if (isim == null || email2 == null) {

            response.sendRedirect("musterilogin.jsp");

        } else {
            // Form submit edildiğinde bu kodu kullanabilirsiniz (örneğin, servlet veya JSP dosyasında):
            if (request.getParameter("iskender") != null
                    && request.getParameter("doner") != null
                    && request.getParameter("adana") != null
                    && request.getParameter("tavuksis") != null
                    && request.getParameter("beyti") != null
                    && request.getParameter("kola") != null
                    && request.getParameter("fanta") != null
                    && request.getParameter("ayran") != null) {

                String email = (String) session.getAttribute("emailses");

                String iskenderAdedi = request.getParameter("iskender");
                String donerAdedi = request.getParameter("doner");
                String adanaAdedi = request.getParameter("adana");
                String tavuksisAdedi = request.getParameter("tavuksis");
                String beytiAdedi = request.getParameter("beyti");
                String kolaAdedi = request.getParameter("kola");
                String fantaAdedi = request.getParameter("fanta");
                String ayranAdedi = request.getParameter("ayran");

                konum_rezervasyonu is = new konum_rezervasyonu();
                is.setEmail(email);
                is.setUrunAdetleri(iskenderAdedi, donerAdedi, adanaAdedi, tavuksisAdedi, beytiAdedi, kolaAdedi, fantaAdedi, ayranAdedi);
                is.yemekekle();
                is.hesapla();
                is.sonucekle();

                String masac = (String) session.getAttribute("masases");
                String saatc = (String) session.getAttribute("saatses");
                String tarihc = (String) session.getAttribute("tarihses");
    %>

<div class="container">
    <div class="row">
        <div class="col">
            <h1>Bizi tercih ettiğiniz için teşekkür ederiz.</h1>
            <a href="anasayfa.jsp"><button type="button">Anasayfa</button></a>
            <p></p>
        </div>
        <div class="col">
            <div class="card card1">
                <h5><%= "Masa"%></h5> 
                <h5><%=masac%></h5> 
                <p></p>
            </div>
            <div class="card card2">
                <h5><%= "Saat"%></h5> 
                <h5><%=saatc%></h5> 
                <p></p>
            </div>
            <div class="card card3">
                <h5><%= "Tarih"%></h5> 
                <h5><%=tarihc%></h5> 
                <p></p>
            </div>

        </div>
    </div>

    <div style="display: flex; flex-direction: row; flex-wrap: nowrap; justify-content: flex-start; align-items: center;">

        <p style="margin-right: 20px;">Toplam: <%= is.getSonuc()%>,00 TL</p>

        <% if (!iskenderAdedi.equals("0")) {%>
        <p style="margin-right: 20px;">İskender Adedi: <%= iskenderAdedi%></p>
        <% } %>

        <% if (!donerAdedi.equals("0")) {%>
        <p style="margin-right: 20px;">Döner Adedi: <%= donerAdedi%></p>
        <% } %>

        <% if (!adanaAdedi.equals("0")) {%>
        <p style="margin-right: 20px;">Adana Adedi: <%= adanaAdedi%></p>
        <% } %>

        <% if (!tavuksisAdedi.equals("0")) {%>
        <p style="margin-right: 20px;">Tavuk Şiş Adedi: <%= tavuksisAdedi%></p>
        <% } %>

        <% if (!beytiAdedi.equals("0")) {%>
        <p style="margin-right: 20px;">Beyti Adedi: <%= beytiAdedi%></p>
        <% } %>

        <% if (!kolaAdedi.equals("0")) {%>
        <p style="margin-right: 20px;">Kola Adedi: <%= kolaAdedi%></p>
        <% } %>

        <% if (!fantaAdedi.equals("0")) {%>
        <p style="margin-right: 20px;">Fanta Adedi: <%= fantaAdedi%></p>
        <% } %>

        <% if (!ayranAdedi.equals("0")) {%>
        <p>Ayran Adedi: <%= ayranAdedi%></p>
        <% } %>

    </div>

    <% }
        }%>           
</div>
</body>
</html>
