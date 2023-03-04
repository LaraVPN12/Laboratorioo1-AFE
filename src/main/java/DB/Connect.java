
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
    //Conexion a DB
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Connection connection;
        Class.forName("org.postgresql.Driver");
        connection=DriverManager.getConnection("jdbc:postgresql://containers-us-west-63.railway.app:7884/railway", "postgres", "jZ0RLFdiiwyETRUp85FI");
        return connection;
    }
}
