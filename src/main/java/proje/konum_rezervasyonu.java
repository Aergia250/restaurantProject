/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proje;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author w10
 */
public class konum_rezervasyonu {

    String dbUrl = "jdbc:mysql://localhost:3306/restoran";
    String dbuser = "root";
    String dbpass = "";

    boolean etest = true;
    boolean saattest = true;

    String isim;
    String email;
    String masa;
    String saat;
    String tarih;

    String iskenderadet;
    String doneradet;
    String adanaadet;
    String tavuksisadet;
    String beytiadet;
    String kolaadet;
    String fantaadet;
    String ayranadet;

    int sonuc;

    public void setUrunAdetleri(String iskenderadet, String doneradet, String adanaadet, String tavuksisadet, String beytiadet, String kolaadet, String fantaadet, String ayranadet) {
        this.iskenderadet = iskenderadet;
        this.doneradet = doneradet;
        this.adanaadet = adanaadet;
        this.tavuksisadet = tavuksisadet;
        this.beytiadet = beytiadet;
        this.kolaadet = kolaadet;
        this.fantaadet = fantaadet;
        this.ayranadet = ayranadet;
    }

    public String getTarih() {
        return tarih;
    }

    public int getSonuc() {
        return sonuc;
    }

    public void setTarih(String tarih) {
        this.tarih = tarih;
    }

    public boolean isEtest() {
        return etest;
    }

    public boolean isSaattest() {
        return saattest;
    }

    public String getIsim() {
        return isim;
    }

    public void setIsim(String isim) {
        this.isim = isim;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMasa() {
        return masa;
    }

    public void setMasa(String masa) {
        this.masa = masa;
    }

    public String getSaat() {
        return saat;
    }

    public void setSaat(String saat) {
        this.saat = saat;
    }

    public void kontrol() {
        //mail kontrol.
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbuser, dbpass);
            PreparedStatement stmt = con.prepareStatement("SELECT email FROM rezervasyon_tablo");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String vemail = rs.getString("email");
                if (email.equals(vemail)) {
                    etest = false;
                }
            }

        } catch (Exception e) {
            System.out.println("email sorguya girmedi." + e);
        }

        //saat ve masa kontrol.
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbuser, dbpass);
            PreparedStatement stmt = con.prepareStatement("SELECT masa,saat,tarih FROM rezervasyon_tablo");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String vmasa = rs.getString("masa");
                String vsaat = rs.getString("saat");
                String vtarih = rs.getString("tarih");

                if (saat.equals(vsaat) && masa.equals(vmasa) && tarih.equals(vtarih)) {
                    saattest = false;

                }

            }

        } catch (Exception e) {
            System.out.println(" saat ve masa sorguya girmedi." + e);
        }

    }

    public void ekle() {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbuser, dbpass);
            PreparedStatement stmt = con.prepareStatement("INSERT INTO rezervasyon_tablo (isim, email, masa,saat,tarih) VALUES (?, ?, ?,?,?)");
            stmt.setString(1, isim);
            stmt.setString(2, email);
            stmt.setString(3, masa);
            stmt.setString(4, saat);
            stmt.setString(5, tarih);
            stmt.execute();
            con.close();

        } catch (Exception e) {
            System.out.println("Driver bulunamadı." + e);
        }

    }

    public void yemekekle() {
        try {
            String sql = "UPDATE rezervasyon_tablo SET iskender = ?, doner = ?, adana = ?, tavuksis = ?, beyti = ?, kola = ?, fanta = ?, ayran = ? WHERE email = ?";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbuser, dbpass);
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, iskenderadet);
            stmt.setString(2, doneradet);
            stmt.setString(3, adanaadet);
            stmt.setString(4, tavuksisadet);
            stmt.setString(5, beytiadet);
            stmt.setString(6, kolaadet);
            stmt.setString(7, fantaadet);
            stmt.setString(8, ayranadet);
            stmt.setString(9, email);

            stmt.executeUpdate();
            con.close();

        } catch (Exception e) {
            System.out.println("Driver bulunamadı." + e);
        }

    }

    public void hesapla() {
        sonuc = ((150 * Integer.parseInt(iskenderadet)) + (150 * Integer.parseInt(doneradet)) + (150 * Integer.parseInt(adanaadet)) + (100 * Integer.parseInt(tavuksisadet)) + (150 * Integer.parseInt(beytiadet)) + (15 * Integer.parseInt(kolaadet)) + (15 * Integer.parseInt(fantaadet)) + (15 * Integer.parseInt(ayranadet)));

    }

    public void sonucekle() {
        try {
            String sql = "UPDATE rezervasyon_tablo SET toplam=? WHERE email = ?";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(dbUrl, dbuser, dbpass);
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, sonuc);
            stmt.setString(2, email);

            stmt.executeUpdate();
            con.close();

        } catch (Exception e) {
            System.out.println("Driver bulunamadı." + e);
        }

    }

   
      
    }
    
    
    


           