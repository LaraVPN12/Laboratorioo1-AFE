package Interface;

import Model.Pedido;

import java.sql.SQLException;
import java.util.List;

public interface IPedidoCRUD {
    public List getPedidos() throws ClassNotFoundException, SQLException;
    public List getPedido(int id_pedido) throws ClassNotFoundException, SQLException;
    public boolean addPedido(Pedido pedido) throws ClassNotFoundException, SQLException;
    public boolean updatePedido(Pedido pedido) throws ClassNotFoundException, SQLException;
    public boolean deletePedido(int id_pedido) throws ClassNotFoundException, SQLException;
}
