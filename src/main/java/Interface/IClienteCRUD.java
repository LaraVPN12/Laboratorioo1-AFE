
package Interface;

import Model.Cliente;
import java.sql.SQLException;
import java.util.List;

public interface IClienteCRUD {
    public List getCliente();
    public Cliente getCliente(int id_cliente);
    public boolean addPedido(Cliente cliente)throws ClassNotFoundException, SQLException;
    public boolean updatePedido(Cliente cliente);
    public boolean deletePedido(int id_cliente);
}
