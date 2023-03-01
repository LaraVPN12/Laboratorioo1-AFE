package ModelDAO;

import DB.Connect;
import Interface.IClienteCRUD;
import Model.Cliente;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ClienteDAO implements IClienteCRUD {

    Connect cn = new Connect();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    private List getClienteList(List<Cliente> list, String sql) {
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId_cliente(rs.getInt("id_cliente"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setEmail(rs.getString("email"));
                list.add(cliente);
            }
        } catch (Exception e) {

        }
        return list;
    }

    @Override
    public List getClientes() {
        List<Cliente> list = new ArrayList<>();
        String sql = "SELECT * FROM Clientes";
        return getClienteList(list, sql);
    }

    @Override
    public List getCliente(int id_cliente) {
        List<Cliente> list = new ArrayList<>();
        String sql = "SELECT * FROM Clientes WHERE id_cliente = '" + id_cliente + "'";
        return getClienteList(list, sql);
    }

    @Override
    public boolean addCliente(Cliente cliente) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO Clientes (nombre, direccion, telefono, email) VALUES ('" + cliente.getNombre() + "', '" + cliente.getDireccion() + "', '" + cliente.getTelefono() + "', '" + cliente.getEmail() + "')";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        return true;
    }

    @Override
    public boolean updateCliente(Cliente cliente) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE Clientes SET nombre = '" + cliente.getNombre() + "', direccion = '" + cliente.getDireccion() + "', telefono = '" + cliente.getTelefono() + "', email = '" + cliente.getEmail() + "' WHERE id_cliente = '" + cliente.getId_cliente() + "'";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        return true;
    }

    @Override
    public boolean deleteCliente(int id_cliente) throws ClassNotFoundException, SQLException{
        String sql = "DELETE FROM Clientes WHERE id_cliente = '" + id_cliente + "'";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        return true;
    }
}
