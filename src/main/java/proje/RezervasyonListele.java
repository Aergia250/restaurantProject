package proje;

import com.sun.jndi.url.rmi.rmiURLContext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RezervasyonListele {
   
      private static String dbUrl = "jdbc:mysql://localhost:3306/restoran";
    private static String dbuser = "root";
    private static String dbpass = "";

    public static List<Rezervasyon> listeleRezervasyon() {
        List<Rezervasyon> rezervasyonlar = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(dbUrl, dbuser, dbpass)) {
            String selectQuery = "SELECT `ID`, `isim`, `email`, `tarih`, `masa`, `saat`, " +
                                 "`iskender`, `doner`, `adana`, `tavuksis`, `beyti`, `kola`, `fanta`, `ayran`, `toplam` " +
                                 "FROM `rezervasyon_tablo` WHERE 1";
            try (PreparedStatement stmt = connection.prepareStatement(selectQuery);
                 ResultSet resultSet = stmt.executeQuery()) {

                while (resultSet.next()) {
                    Rezervasyon rezervasyon = new Rezervasyon();
                    rezervasyon.setId(resultSet.getInt("ID"));
                    rezervasyon.setIsim(resultSet.getString("isim"));
                    rezervasyon.setEmail(resultSet.getString("email"));
                    rezervasyon.setTarih(resultSet.getString("tarih"));
                    rezervasyon.setMasa(resultSet.getString("masa"));
                    rezervasyon.setSaat(resultSet.getString("saat"));
                    rezervasyon.setIskender(resultSet.getString("iskender"));
                    rezervasyon.setDoner(resultSet.getString("doner"));
                    rezervasyon.setAdana(resultSet.getString("adana"));
                    rezervasyon.setTavukSis(resultSet.getString("tavuksis"));
                    rezervasyon.setBeyti(resultSet.getString("beyti"));
                    rezervasyon.setKola(resultSet.getString("kola"));
                    rezervasyon.setFanta(resultSet.getString("fanta"));
                    rezervasyon.setAyran(resultSet.getString("ayran"));
                    rezervasyon.setToplam(resultSet.getInt("toplam"));

                    rezervasyonlar.add(rezervasyon);
                }
            }
        } catch (SQLException e) {
                   e.printStackTrace();
        }

        return rezervasyonlar;
    }
      public static void main(String[] args) {
          RezervasyonListele is =new RezervasyonListele();
        is.listeleRezervasyon();

    }
    
}
