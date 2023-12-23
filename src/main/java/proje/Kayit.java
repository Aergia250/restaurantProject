package proje;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.mindrot.jbcrypt.BCrypt;

public class Kayit {

    boolean test = true;
    String dbUrl = "jdbc:mysql://localhost:3306/restoran";
    String dbuser = "root";
    String dbpass = "";
    String emailkayit;
    boolean logintest = true;


    public boolean isLogintest() {
        return logintest;
    }

    public boolean isTest() {
        return test;
    }

    public void setEmailkayit(String emailkayit) {
        this.emailkayit = emailkayit;
    }

    public void mkontrol() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbuser, dbpass);
            PreparedStatement stmt = con.prepareStatement("SELECT email FROM kullanici_tablo");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String vemail = rs.getString("email");
                if (emailkayit.equals(vemail)) {
                    test = false;
                }
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String sifreleme(String sifre) {
        String hashedSifre = hashPassword(sifre);
      return   hashedSifre;
    }

    public void ekleme( String isim, String email, String sifre) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbuser, dbpass);

            PreparedStatement stmt = con.prepareStatement("INSERT INTO kullanici_tablo (isim, email, sifre) VALUES (?, ?, ?)");
            stmt.setString(1, isim);
            stmt.setString(2, email);
            stmt.setString(3, sifre);
            stmt.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String hashPassword(String plainTextPassword) {
        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
    }

    public void loginkontrol(String isimgiris, String emailgiris, String sifregiris) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbuser, dbpass);
            PreparedStatement stmt = con.prepareStatement("SELECT isim, email, sifre FROM kullanici_tablo WHERE email = ?");
            stmt.setString(1, emailgiris);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String visim = rs.getString("isim");
                String vemail = rs.getString("email");
                String vsifre = rs.getString("sifre");

                if (isimgiris.equals(visim) && emailgiris.equals(vemail) && checkPass(sifregiris, vsifre)) {
                    logintest = false;
                }
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    private boolean checkPass(String plainPassword, String hashedPassword) {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
public static void main(String[] args) {
 
    }
}
