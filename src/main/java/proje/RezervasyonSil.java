/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proje;
 import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author w10
 */
public class RezervasyonSil {
 
     private static String dbUrl = "jdbc:mysql://localhost:3306/restoran";
    private static String dbuser = "root";
    private static String dbpass = "";

    public static void rezervasyonuSil(int rezervasyonId) {
        try (Connection connection = DriverManager.getConnection(dbUrl, dbuser, dbpass)) {
            String deleteQuery = "DELETE FROM `rezervasyon_tablo` WHERE `ID` = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                preparedStatement.setInt(1, rezervasyonId);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


