package Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import ModelDAO.ClienteDAO;

@WebServlet(name = "Cliente", value = "/Cliente")
public class Cliente extends HttpServlet {
    ClienteDAO clienteDao = new ClienteDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("getall")){
            request.setAttribute("clientes", clienteDao.getClientes());
            request.getRequestDispatcher("./views/cliente.jsp").forward(request, response);
        }
        //System.out.println(action);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
