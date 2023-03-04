package Interface;

import Model.Cliente;

import java.sql.SQLException;
import java.util.List;

public interface IClienteCRUD {
    public List getClientes() throws ClassNotFoundException, SQLException;
    public List getCliente(int id_cliente) throws ClassNotFoundException, SQLException;
    public List getClientePorNombre(String nombre) throws ClassNotFoundException, SQLException;
    public boolean addCliente(Cliente cliente) throws ClassNotFoundException, SQLException;
    public boolean updateCliente(Cliente cliente) throws ClassNotFoundException, SQLException;
    public boolean deleteCliente(int id_cliente) throws ClassNotFoundException, SQLException;
}
