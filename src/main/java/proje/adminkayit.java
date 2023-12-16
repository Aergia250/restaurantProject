/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proje;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author w10
 */
public class adminkayit {

    String dbUrl = "jdbc:mysql://localhost:3306/restoran";
    String dbuser = "root";
    String dbpass = "";
    boolean test = true;
    boolean logintest = true;

    public boolean isLogintest() {
        return logintest;
    }

    public boolean isTest() {
        return test;
    }
 public String sifreleme(String sifre) {
        String hashedSifre = hashPassword(sifre);
      return   hashedSifre;
    }
 
  private String hashPassword(String plainTextPassword) {
        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
    }
  
  private boolean checkPass(String plainPassword, String hashedPassword) {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
  
    public void ekleme(String isim, String email, String sifre) {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbuser, dbpass);
            PreparedStatement stmt = con.prepareStatement("INSERT INTO admin_tablo (isim, email, sifre) VALUES (?, ?, ?)");
            stmt.setString(1, isim);
            stmt.setString(2, email);
            stmt.setString(3, sifre);
            stmt.execute();
            con.close();

        } catch (Exception e) {
            System.out.println("Driver bulunamadı." + e);
        }
    }

    public void mkontrol(String emailkayit) {

        try {
            String dbUrl = "jdbc:mysql://localhost:3306/restoran";
            String dbuser = "root";
            String dbpass = "";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbuser, dbpass);
            PreparedStatement stmt = con.prepareStatement("SELECT email FROM admin_tablo");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String vemail = rs.getString("email");
                if (emailkayit.equals(vemail)) {
                    test = false;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void loginkontrol(String isimgiris, String emailgiris, String sifregiris) {

        try {
            String dbUrl = "jdbc:mysql://localhost:3306/restoran";
            String dbuser = "root";
            String dbpass = "";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbuser, dbpass);
            PreparedStatement stmt = con.prepareStatement("SELECT isim, email, sifre FROM admin_tablo");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String visim = rs.getString("isim");
                String vemail = rs.getString("email");
                String vsifre = rs.getString("sifre");

                if (isimgiris.equals(visim) && emailgiris.equals(vemail) && checkPass(sifregiris, vsifre)) {
                    logintest = false;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        adminkayit is = new adminkayit();

    }

}
