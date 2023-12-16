import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class kayit {

    String isim;
    String email;
    String sifre;

    // Veritabanı bağlantı bilgileri
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/your_database";
    private static final String JDBC_USER = "your_username";
    private static final String JDBC_PASSWORD = "your_password";

    // Global Connection nesnesi
    private static Connection connection;

    // Constructor içinde bağlantıyı oluşturun
    public kayit() {
        try {
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
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

    public String getSifre() {
        return sifre;
    }

    public void setSifre(String sifre) {
        this.sifre = sifre;
    }

    // Veritabanına kayıt ekleme metodu
    public void ekleVeritabanina() {
        if (emailVarMi()) {
            System.out.println("Bu e-posta zaten kullanılıyor.");
            return;
        }

        try {
            String sql = "INSERT INTO your_table_name (isim, email, sifre) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, isim);
                statement.setString(2, email);
                statement.setString(3, sifre);
                statement.executeUpdate();
                System.out.println("Kayıt başarıyla eklendi.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private boolean emailVarMi() {
        try {
            String sql = "SELECT * FROM your_table_name WHERE email = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, email);
                try (ResultSet resultSet = statement.executeQuery()) {
                    return resultSet.next();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }
}
