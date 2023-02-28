
package Interface;

import Model.Pedido;
import java.sql.SQLException;
import java.util.List;

public interface IPedidoCRUD {
    public List getPedidos();
    public Pedido getPedidoo(int id_pedido);
    public boolean addPedido(Pedido pedido)throws ClassNotFoundException, SQLException;
    public boolean updatePedido(Pedido pedido);
    public boolean deletePedido(int id_pedido);
}
