package proje;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class tumbilgi2 {

    private static String dbUrl = "jdbc:mysql://localhost:3306/restoran";
    private static String dbuser = "root";
    private static String dbpass = "";

    private String isim;
    private String email;
    private String tarih;
    private String masa;
    private String saat;
    private String iskender;
    private String doner;
    private String adana;
    private String tavukSis;
    private String beyti;
    private String kola;
    private String fanta;
    private String ayran;
    private int toplam;

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

    public String getTarih() {
        return tarih;
    }

    public void setTarih(String tarih) {
        this.tarih = tarih;
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

    public String getIskender() {
        return iskender;
    }

    public void setIskender(String iskender) {
        this.iskender = iskender;
    }

    public String getDoner() {
        return doner;
    }

    public void setDoner(String doner) {
        this.doner = doner;
    }

    public String getAdana() {
        return adana;
    }

    public void setAdana(String adana) {
        this.adana = adana;
    }

    public String getTavukSis() {
        return tavukSis;
    }

    public void setTavukSis(String tavukSis) {
        this.tavukSis = tavukSis;
    }

    public String getBeyti() {
        return beyti;
    }

    public void setBeyti(String beyti) {
        this.beyti = beyti;
    }

    public String getKola() {
        return kola;
    }

    public void setKola(String kola) {
        this.kola = kola;
    }

    public String getFanta() {
        return fanta;
    }

    public void setFanta(String fanta) {
        this.fanta = fanta;
    }

    public String getAyran() {
        return ayran;
    }

    public void setAyran(String ayran) {
        this.ayran = ayran;
    }

    public int getToplam() {
        return toplam;
    }

    public void setToplam(int toplam) {
        this.toplam = toplam;
    }

 

  public void bilgiCek() {
    try (Connection connection = DriverManager.getConnection(dbUrl, dbuser, dbpass)) {
        System.out.println("Veritabanına bağlantı başarılı!");
        String selectQuery = "SELECT * FROM rezervasyon_tablo WHERE email = ?";
        try (PreparedStatement selectStatement = connection.prepareStatement(selectQuery)) {
            selectStatement.setString(1, email);

            try (ResultSet resultSet = selectStatement.executeQuery()) {
                if (resultSet.next()) {
                    setIsim(resultSet.getString("isim"));
                    setEmail(resultSet.getString("email"));
                    setTarih(resultSet.getString("tarih"));
                    setMasa(resultSet.getString("masa"));
                    setSaat(resultSet.getString("saat"));
                    setIskender(resultSet.getString("iskender"));
                    setDoner(resultSet.getString("doner"));
                    setAdana(resultSet.getString("adana"));
                    setTavukSis(resultSet.getString("tavukSis"));
                    setBeyti(resultSet.getString("beyti"));
                    setKola(resultSet.getString("kola"));
                    setFanta(resultSet.getString("fanta"));
                    setAyran(resultSet.getString("ayran"));
                    setToplam(resultSet.getInt("toplam"));
                } else {
                    System.out.println("Belirtilen email'e sahip veri bulunamadı.");
                }
            }
        }
    } catch (SQLException e) {
        System.out.println("Veritabanına bağlantı hatası:");
        e.printStackTrace();
    }
}


   
}