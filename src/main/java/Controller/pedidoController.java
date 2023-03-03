package Controller;

import ModelDAO.PedidoDAO;
import Model.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "pedidoController", value = "/pedidoController")
public class pedidoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PedidoDAO pedidoDao = new PedidoDAO();
        Pedido pedido = new Pedido();

        String action = request.getParameter("action");
        if (action.equals("add")) {
            int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
            double total = Double.parseDouble(request.getParameter("total"));
            String estado = request.getParameter("estado");
            String fecha = request.getParameter("fecha");

            pedido.setId_cliente(id_cliente);
            pedido.setEstado(estado);
            pedido.setFecha(fecha);
            pedido.setTotal(total);

            try {
                pedidoDao.addPedido(pedido);
                response.sendRedirect("./views/pedido.jsp");
            } catch (Exception ex) {
                System.out.println(ex);
            }
        }

        if (action.equals("update")) {
            String estado = request.getParameter("estado"); 
            int id_pedido = Integer.parseInt(request.getParameter("id"));
            pedido.setEstado(estado);
            pedido.setId_pedido(id_pedido);

            try {
                pedidoDao.updatePedido(pedido);
                response.sendRedirect("./views/pedido.jsp");
            } catch (Exception ex) {
                System.out.println(ex);
            }
        }
        if (action.equals("delete")) {
            int id_pedido = Integer.parseInt(request.getParameter("id"));
            try {
                pedidoDao.deletePedido(id_pedido);
                response.sendRedirect("./views/pedido.jsp");
            } catch (Exception ex) {
                System.out.println(ex);
            }

        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
