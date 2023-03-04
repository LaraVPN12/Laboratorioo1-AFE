package ModelDAO;

import DB.Connect;
import Interface.IPedidoCRUD;
import Model.Pedido;
import Model.Cliente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class PedidoDAO implements IPedidoCRUD {

    Connect cn = new Connect();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    private List getPedidoList(List<Pedido> list, String sql) throws ClassNotFoundException, SQLException {
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cc = new Cliente();
                Pedido pedido = new Pedido();
                pedido.setId_pedido(rs.getInt("id_pedido"));
                pedido.setId_cliente(rs.getInt("id_cliente"));
                cc.setId_cliente(pedido.getId_cliente());
                cc.setNombre(rs.getString("nombre"));
                cc.setDireccion(rs.getString("direccion"));
                cc.setTelefono(rs.getString("telefono"));
                cc.setEmail(rs.getString("email"));
                pedido.setCliente(cc);
                pedido.setFecha(rs.getString("fecha"));
                pedido.setTotal(rs.getDouble("total"));
                pedido.setEstado(rs.getString("estado"));
                list.add(pedido);
            }
        } catch (Exception e) {

        }
        return list;
    }

    @Override
    public List getPedidos() throws ClassNotFoundException, SQLException {
        List<Pedido> list = new ArrayList<>();
            String sql = "SELECT * FROM Pedidos pp INNER JOIN Clientes cc ON pp.id_cliente = cc.id_cliente";
        return getPedidoList(list, sql);
    }

    @Override
    public List getPedido(int id_pedido) throws ClassNotFoundException, SQLException {
        List<Pedido> list = new ArrayList<>();
        String sql = "SELECT * FROM Pedidos WHERE id_pedido = '" + id_pedido + "'";
        //String sql = "SELECT * FROM Pedidos WHERE id_pedido = 3";
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setId_pedido(rs.getInt("id_pedido"));
                pedido.setId_cliente(rs.getInt("id_cliente"));
                pedido.setFecha(rs.getString("fecha"));
                pedido.setTotal(rs.getDouble("total"));
                pedido.setEstado(rs.getString("estado"));
                list.add(pedido);
            }
        } catch (Exception e) {

        }
        return list;
    }

    @Override
    public boolean addPedido(Pedido pedido) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO Pedidos (id_cliente, fecha, total, estado) VALUES ('" + pedido.getId_cliente() + "', '" + pedido.getFecha() + "', '" + pedido.getTotal() + "', '" + pedido.getEstado() + "')";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        return true;
    }

    @Override
    public boolean updatePedido(Pedido pedido) throws ClassNotFoundException, SQLException{
        String sql = "UPDATE Pedidos SET estado = '" + pedido.getEstado() + "' WHERE id_pedido = '" + pedido.getId_pedido() + "'";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        return true;
    }
    @Override
    public boolean deletePedido(int id_pedido) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM Pedidos WHERE id_pedido = '" + id_pedido + "'";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        return true;
    }
    
    public String getNombreById(int id_cliente) throws ClassNotFoundException, SQLException {
        String response = "";
        String sql = "SELECT nombre FROM Clientes WHERE id_cliente = '" + id_cliente + "'";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            response += rs.getString("nombre");   
        }
        return response;
    }
}
