<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rezervasyon Formu</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
            <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
            <script>
                $(function () {
                    $("#tarih").datepicker({
                        dateFormat: "dd-mm-yy", // Gün/Ay/Yıl formatı
                        monthNames: [
                            "Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran",
                            "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"
                        ],
                        dayNamesMin: ["Pz", "Pt", "Sa", "Ça", "Pe", "Cu", "Ct"],
                        firstDay: 1,
                        minDate: 1 // Bugünden önceki tarihleri devre dışı bırak
                    });
                });
            </script>
            <style>
                body {
                    font-family: 'Arial', sans-serif;
                    background-color: #f8f9fa;
                    padding: 20px;
                }

                .mavi-header {
                    background-color: #007bff;
                    color: #fff;
                    padding: 20px;
                    text-align: right;
                    border-radius: 5px;
                    margin-bottom: 20px;
                }

                form {
                    max-width: 400px;
                    margin: 0 auto;
                    background-color: #ffffff;
                    padding: 15px;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }

                label {
                    display: block;
                    margin-bottom: 8px;
                }

                input,
                select {
                    width: 100%;
                    padding: 8px;
                    margin-bottom: 15px;
                    box-sizing: border-box;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                }

                input[type="submit"] {
                    background-color: #007bff;
                    color: #ffffff;
                    cursor: pointer;
                }

                input[type="submit"]:hover {
                    background-color: #0056b3;
                }

                .musteri-panel {
                    background-color: #ffffff;
                    padding: 15px;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }
            </style> 

            </head>

            <body>

                <!-- Mavi Header -->
            <div class="mavi-header">
                <%
                    String isim = (String) session.getAttribute("isimses");
                    String email = (String) session.getAttribute("emailses");
                    out.println("Kullanıcı adınız:" + isim);// isim mail burda
                    out.println("E-mailiniz:" + email);

                    if (isim == null || email == null) {

                        response.sendRedirect("musterilogin.jsp");

                    } else {
                %>

            </div>


            <!-- Rezervasyon Formu -->
            <form action="musteri_siparispanel.jsp" method="post">   

                <label for="masa_ad">Tarih:</label>
                <input id="tarih" type="text" name="tarih" required >

                    <label for="rezervasyon_saat_araligi">Rezervasyon Saati:</label>
                    <select id="rezervasyon_saat_araligi" name="saat" required>
                        <option value="11-12">11:00 - 12:00</option>
                        <option value="12-13">12:00 - 13:00</option>
                        <option value="13-14">13:00 - 14:00</option>
                        <option value="14-15">14:00 - 15:00</option>
                        <option value="15-16">15:00 - 16:00</option>
                        <option value="16-17">16:00 - 17:00</option>
                        <option value="17-18">17:00 - 18:00</option>
                        <option value="18-19">18:00 - 19:00</option>
                        <option value="19-20">19:00 - 20:00</option>
                        <option value="20-21">20:00 - 21:00</option>
                    </select>

                    <label for="masa_ad">Masa Adı:</label>
                    <select id="masa_ad" name="masa_ad" required>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                    </select>

                    <input type="submit" value="Rezervasyon Yap">
                        </form>


                        <!-- Müşteri Paneli -->
                        <div class="musteri-panel">
                            müşteri panel
                        </div>
                        <%
                            }
                        %>
                        <!-- Bootstrap JS ve Popper.js -->
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                        </body>
                        </html>


