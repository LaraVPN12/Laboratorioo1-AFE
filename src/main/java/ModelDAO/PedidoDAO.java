package ModelDAO;

import DB.Connect;
import Interface.IPedidoCRUD;
import Model.Pedido;

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

    private List getPedidoList(List<Pedido> list, String sql)    {
        try {
            conn = cn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setId_pedido(rs.getInt("id_pedido"));
                pedido.setId_cliente(rs.getInt("id_cliente"));
                pedido.setFecha(rs.getDate("fecha"));
                pedido.setTotal(rs.getDouble("total"));
                pedido.setEstado(rs.getString("estado"));
                list.add(pedido);
            }
        } catch (Exception e) {

        }
        return list;
    }

    @Override
    public List getPedidos() {
        List<Pedido> list = new ArrayList<>();
        String sql = "SELECT * FROM Pedido";
        return getPedidoList(list, sql);
    }

    @Override
    public List getPedido(int id_pedido) {
        List<Pedido> list = new ArrayList<>();
        String sql = "SELECT * FROM Pedido WHERE id_pedido = '" + id_pedido + "'";
        return getPedidoList(list, sql);
    }

    @Override
    public boolean addPedido(Pedido pedido) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO Pedido (id_cliente, fecha, total, estado) VALUES ('" + pedido.getId_cliente() + "', '" + pedido.getFecha() + "', '" + pedido.getTotal() + "', '" + pedido.getEstado() + "')";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        return true;
    }

    @Override
    public boolean updatePedido(Pedido pedido) throws ClassNotFoundException, SQLException{
        String sql = "UPDATE Pedido SET id_cliente = '" + pedido.getId_cliente() + "', fecha = '" + pedido.getFecha() + "', total = '" + pedido.getTotal() + "', estado = '" + pedido.getEstado() + "' WHERE id_pedido = '" + pedido.getId_pedido() + "'";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        return true;
    }
    @Override
    public boolean deletePedido(int id_pedido) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM Pedido WHERE id_pedido = '" + id_pedido + "'";
        conn = cn.getConnection();
        ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        return true;
    }
}
