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
        if (action.equalsIgnoreCase("getall")) {
            request.setAttribute("clientes", clienteDao.getClientes());
            request.getRequestDispatcher("./views/cliente.jsp").forward(request, response);
        }
        if (action.equals("add")) {
            String nombre, telefono, correo, direccion;
            nombre = request.getParameter("nombre");
            telefono = request.getParameter("telefono");
            correo = request.getParameter("email");
            direccion = request.getParameter("direccion");

            cliente.setNombre(nombre);
            cliente.setTelefono(telefono);
            cliente.setEmail(correo);
            cliente.setDireccion(direccion);

            try {
                clienteDao.addCliente(cliente);
                response.sendRedirect("./views/cliente.jsp");
            } catch (Exception ex) {
                System.out.println(ex);
            }
        }
        if (action.equals("update")) {
            int id_cliente;
            String nombre, telefono, correo, direccion;
            id_cliente = Integer.parseInt(request.getParameter("id"));
            nombre = request.getParameter("nombre");
            telefono = request.getParameter("telefono");
            correo = request.getParameter("email");
            direccion = request.getParameter("direccion");

            cliente.setId_cliente(id_cliente);
            cliente.setNombre(nombre);
            cliente.setTelefono(telefono);
            cliente.setEmail(correo);
            cliente.setDireccion(direccion);

            try {
                clienteDao.updateCliente(cliente);
                response.sendRedirect("./views/cliente.jsp");
            } catch (Exception ex) {
                System.out.println(ex);
            }
        }

        if (action.equals("delete")) {
            int id_cliente = Integer.parseInt(request.getParameter("id"));
            try {
                clienteDao.deleteCliente(id_cliente);
                response.sendRedirect("./views/cliente.jsp");
            } catch (Exception ex) {
                System.out.println(ex);
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
