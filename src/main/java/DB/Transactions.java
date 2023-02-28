
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Transactions {
    //Conexion a DB
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Connection connection;
        Class.forName("org.postgresql.Driver");
        connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/pedidos", "postgres", "KevinLara");
        return connection;
    }
}
