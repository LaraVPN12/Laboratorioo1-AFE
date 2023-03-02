package Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import Model.Cliente;
import ModelDAO.ClienteDAO;

@WebServlet(name = "clienteController", value = "/clienteController")
public class clienteController extends HttpServlet {
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ClienteDAO clienteDao = new ClienteDAO();
        Cliente cliente = new Cliente();
        
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("getall")){
            request.setAttribute("clientes", clienteDao.getClientes());
            request.getRequestDispatcher("./views/cliente.jsp").forward(request, response);
        }
        if(action.equals("add")){
            String nombre, telefono, correo, direccion;
            nombre = request.getParameter("nombre");
            telefono = request.getParameter("telefono");
            correo = request.getParameter("email");
            direccion = request.getParameter("direccion");
            
            cliente.setNombre(nombre);
            cliente.setTelefono(telefono);
            cliente.setEmail(correo);
            cliente.setDireccion(direccion);
            
            try{
                clienteDao.addCliente(cliente);
                request.getRequestDispatcher("../views/cliente.jsp").forward(request, response);
            } catch(Exception ex) {
                System.out.println(ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
