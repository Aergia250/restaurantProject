<%-- 
    Document   : musterilogin
    Created on : 1 Ara 2023, 00:57:05
    Author     : w10
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giriş yap</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            /* 5332 x 2999px */
            background-image: url('resim/background.jpg');
            background-size: cover;
            background-position: center;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
                
        .loginbox{
            width: 320px;
            height: 470px;
            background: #000;
            color: #fff;
            top: 50%;
            left: 50%;
            position: absolute;
            transform: translate(-50%, -50%);
            box-sizing: border-box;
            padding: 70px 30px;
            
            border-radius: 20px;
        }
        
        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            position: absolute;
            top: -50px;
            left: calc(50% - 50px);
        }
        
        h1{
            margin: 0;
            padding: 0 0 20px;
            text-align: center;
            font-size: 22px;
        }
        
        .loginbox p{
            margin: 0;
            padding: 0;
            font-weight: bold;
        }
        
        .loginbox input{
            width: 100%;
            margin-bottom: 20px;
        }
        
        .loginbox input[type="text"], input[type="password"], input[type="email"]{
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 16px;
        }
        
        .loginbox input[type="submit"]
        {
            border: none;
            outline: none;
            height: 40px;
            background: #fb2525;
            font-size: 18px;
        }
        
        .loginbox input[type="submit"]:hover{
            cursor: pointer;
            background: #ffc107;
            color: #000;
        }
        
        .loginbox a{
            text-decoration: none;
            font-size: 12px;
            line-height: 20px;
            color: darkgrey;
        }
        
        .loginbox a:hover
        {
            color: #ffc107;
        }
    </style>
</head>
<body>
    <form method="POST" action="musteri_loginveri.jsp">
         
        <div class="loginbox">
            <img src="resim/avatar.png" class="avatar">
            <h1>Giriş Yap</h1>    

        <p>Kullanıcı adı:</p>
        <input type="text" id="email" name="isim" placeholder="Kullanıcı adınızı giriniz." maxlength="20" minlength="2" required>

            <p>E-mail:<p>
            <input type="email" id="email" name="email" placeholder="E-posta adresinizi giriniz." maxlength="25" required>

                <p>Şifre:</p>
                <input type="password" id="sifre" name="sifre" placeholder="Şifrenizi giriniz." maxlength="20" minlength="2" required>

                    <input type="submit" value="Giriş Yap">
                    <a href="musteriregister.jsp" class="button">Kayıt olmadın mı?</a>
        </div>
    </form>

</body>
</html>
