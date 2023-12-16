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
        .pano-icerigi{
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            min-width: 300px;
            border-radius: 5px 5px 0 0;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0,0,0,0.15);
        }
        .pano-icerigi thead tr{
            background-color: #black;
            color: #ffffff;
            text-align: left;
            font-weight: bold;
        }
        .pano-icerigi th,
        .pano-icerigi td{
            padding: 12px 15px;
        }
        .pano-icerigi tbody tr{
            border-bottom:1px solid #dddddd;
        }
        .pano-icerigi tbody tr:nth-of-type(even){
            background-color: #f0f8ff;
        }
        .pano-icerigi tbody tr:last-of-type{
            border-bottom: 2px;
            color: solid #000000;
        }
        
        h1{
            text-align: center;
        }
    </style>
</head>
<body>

    <%   String isim = (String) session.getAttribute("isimg");
        String email = (String) session.getAttribute("emailg");
        String sifreg = (String) session.getAttribute("sifreg");
        if (isim == null || email == null || sifreg == null) {

            response.sendRedirect("adminlogin.jsp");

        } else {
            List<Rezervasyon> rezervasyonlar = RezervasyonListele.listeleRezervasyon();

            if (!rezervasyonlar.isEmpty()) {
    %>
    <h1> Admin panel</h1>

    <table border="1" class="pano-icerigi">
        <tr>
            <th>ID</th>
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
                        <input type="submit" value="Sil">
                            </form>
                            </td>
                            </tr>
                            <%
                                }
                            %>
                            </table>
                            <%
                                } else {
                                    out.println("Listelenecek veri bulunamadı.");
                                }
                            %>

                            <%
                                }
                            %>
                            </body>
                            </html>
