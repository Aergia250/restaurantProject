<%@ page import="proje.RezervasyonListele" %>
<%@ page import="proje.RezervasyonSil" %>
<%@ page import="java.util.List" %>
<%@ page import="proje.Rezervasyon" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <title>adminpanel</title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
        @import url('https://fonts.googleapis.com/css?family=Abel|Aguafina+Script|Artifika|Athiti|Condiment|Dosis|Droid+Serif|Farsan|Gurajada|Josefin+Sans|Lato|Lora|Merriweather|Noto+Serif|Open+Sans+Condensed:300|Playfair+Display|Rasa|Sahitya|Share+Tech|Text+Me+One|Titillium+Web');

        * {
            margin: 0;
            padding: 0;
            outline: none;
            border: none;
            text-decoration: none;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
            overflow: hidden;
        }

        body {
            background: rgb(226, 226, 226);
        }


        .container {
            width: 100%;
            height: 100vh;



            box-sizing: border-box;
        }

        .navbar {
            height: 8%;
            display: flex;
            align-items: center;
            background-color: #34AF6D;
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
            height: calc(100vh - 60px);
            align-items: center;
        }

        .col {
            flex-basis: 50%;
        }


        a{
            position: relative;
            width: 280px;
            font-size: 14px;
            color: rgb(85, 83, 83);
            display: table;
            padding: 10px;
        }

        a:hover{
            background: #eee;
        }
        a:hover i{
            color: #34AF6D;
            transition: 0.5s;
        }
        /* MAin Section */
        .main{
            position: relative;
            padding: 20px;
            width: 100%;
        }

        /*Attendance List serction  */
        .attendance{
            margin-top: 60px;
            text-transform: capitalize;
            padding-left: 4%;
            padding-right: 8%;
        }
        .attendance-list{
            width: 105%;
            padding: 10px;
            margin-top: 10px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
        }
        .table{
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 15px;
            min-width: 100%;
            overflow: hidden;
            border-radius: 5px 5px 0 0;
        }
        table thead tr{
            color: #fff;
            background: #34AF6D;
            text-align: left;
            font-weight: bold;
        }
        .table th,
        .table td{
            padding: 12px 15px;
        }
        .table tbody tr{
            border-bottom: 1px solid #ddd;
        }
        .table tbody tr:nth-of-type(odd){
            background: #f3f3f3;
        }

        table thead th:nth-child(4),
        table tbody td:nth-child(4) {
            width: 150px; /* Adjust the width as needed */
            white-space: nowrap; /* Prevent text wrapping */
            overflow: hidden; /* Hide overflowing content */
            text-overflow: ellipsis; /* Display ellipsis (...) for overflow */
        }

        table thead th:nth-child(6),
        table tbody td:nth-child(6) {
            width: 150px; /* Adjust the width as needed */
            white-space: nowrap; /* Prevent text wrapping */
            overflow: hidden; /* Hide overflowing content */
            text-overflow: ellipsis; /* Display ellipsis (...) for overflow */
        }

        .table tbody tr:last-of-type{
            border-bottom: 2px solid #4AD489;
        }
        .table button{
            padding: 6px 20px;
            border-radius: 10px;
            cursor: pointer;
            background: transparent;
            border: 1px solid #4AD489;

        }
        .table button:hover{
            background: #4AD489;
            color: #fff;
            transition: 0.5rem;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            margin-left: 20px;
            font-size: 2rem; /* Use relative units for font size */
            font-weight: bold; /* Make the text bold */
            color: #eee; /* Set a specific color for the text */
            text-transform: uppercase; /* Convert text to uppercase */

            letter-spacing: 1px; /* Adjust the letter spacing as needed */
            font-family: 'Amaranth', sans-serif;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .footer {
            background-color: #34AF6D;
            color: #fff;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;

        }

        p {
            margin-right: 20px;
            background: white;
            border: 1px solid #4AD489;
            border-radius: 4px;
            font-family: 'Rum Raisin', sans-serif;
            padding: 10px;

        }

        .no-data-message {
            text-align: center;
            margin-top: 10px;
            padding: 10px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .no-data-message p {
            margin: 250px;
            padding: 100px;
        }

    </style>
</head>
<body>

    <%
        String isim = (String) session.getAttribute("isimg");
        String email = (String) session.getAttribute("emailg");
        String sifreg = (String) session.getAttribute("sifreg");
        Cookie[] cookies = request.getCookies();

        String isimCerez = null;
        String emailCerez = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("isimc")) {
                    isimCerez = cookie.getValue();
                } else if (cookie.getName().equals("emailc")) {
                    emailCerez = cookie.getValue();
                }
            }
        }

        if (isim == null || email == null || sifreg == null) {

            response.sendRedirect("adminlogin.jsp");

        } else {
            List<Rezervasyon> rezervasyonlar = RezervasyonListele.listeleRezervasyon();

            if (!rezervasyonlar.isEmpty()) {
    %>

<div class="container">
    <div class="navbar">      
        <h1> Admin panel</h1>
        <nav>
            <ul>
                <!-- <li><p>Kullanıcı adı | <%= isimCerez%></p></li> -->
                <li><p>E-mail | <%= emailCerez%></p></li> 
            </ul>
        </nav>
    </div>

    <div class="container">
        <section class="main">
            <section class="attendance">
                <div class="attendance-list">


                    <table border="1" class="table">
                        <thead>
                            <tr>
                                <th>Müşteri No</th>
                                <th>İsim</th>
                                <th>Email</th>
                                <th>Tarih</th>
                                <th>Masa</th>
                                <th>Saat</th>
                                <th>İskender</th>
                                <th>Döner</th>
                                <th>Adana</th>
                                <th>Tavuk Sis</th>
                                <th>Beyti</th>
                                <th>Kola</th>
                                <th>Fanta</th>
                                <th>Ayran</th>
                                <th>Toplam</th>
                                <th>İşlemler</th>
                            </tr>
                        </thead>
                        <%
                            for (Rezervasyon rezervasyon : rezervasyonlar) {
                        %>
                        <tr>
                            <td><%= rezervasyon.getId()%></td>
                            <td><%= rezervasyon.getIsim()%></td>
                            <td><%= rezervasyon.getEmail()%></td>
                            <td><%= rezervasyon.getTarih()%></td>
                            <td><%= rezervasyon.getMasa()%></td>
                            <td><%= rezervasyon.getSaat()%></td>
                            <td><%= rezervasyon.getIskender()%></td>
                            <td><%= rezervasyon.getDoner()%></td>
                            <td><%= rezervasyon.getAdana()%></td>
                            <td><%= rezervasyon.getTavukSis()%></td>
                            <td><%= rezervasyon.getBeyti()%></td>
                            <td><%= rezervasyon.getKola()%></td>
                            <td><%= rezervasyon.getFanta()%></td>
                            <td><%= rezervasyon.getAyran()%></td>
                            <td><%= rezervasyon.getToplam()%></td>
                            <td>
                                <form action="admin_rezervasyon_sil.jsp" method="post">
                                    <input type="hidden" name="id" value="<%= rezervasyon.getId()%>">                          
                                        <button type="submit">Sil</button>
                                </form>
                            </td>
                        </tr>

                        <%
                            }
                        %>
                    </table>
                </div>
            </section>
        </section>
    </div>
    <% } else {%>
    <div class="container">
        <div class="navbar">      
            <h1> Admin panel</h1>
            <nav>
                <ul>
                    <!-- <li><p>Kullanıcı adı | <%= isimCerez%></p></li> -->
                    <li><p>E-mail | <%= emailCerez%></p></li> 
                </ul>
            </nav>
        </div>
        <div class="no-data-message">
            <p>Listelenecek veri bulunamadı.</p>
        </div>
        <% } %>

        <%
            }
        %>

        <div class="footer">
            <br>
            <button><a href="anasayfa.jsp">Çıkış Yap</a></button>
            <br>
        </div>
        </body>
        </html>
