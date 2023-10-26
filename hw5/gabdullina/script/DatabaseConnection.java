import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static Connection connection;
    private static final String URL = "jdbc:postgresql://localhost:5432/database_for_user";
    private static final String USER = "postgres";
    private static final String PASSWORD = "0206";

    public static Connection getConnection()  {
        if (connection == null) {

            try {
                Class.forName("org.postgresql.Driver");

                connection = DriverManager.getConnection(
                        URL,
                        USER,
                        PASSWORD);
            } catch (ClassNotFoundException | SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return connection;
    }
}
