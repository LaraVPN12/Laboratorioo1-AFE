<%-- 
    Document   : updatePedido
    Created on : Mar 2, 2023, 1:30:51 PM
    Author     : deuseli
--%>

<%@page import="ModelDAO.ClienteDAO"%>
<%@page import="ModelDAO.PedidoDAO"%>
<%@page import="Model.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Pedido</title>       
        <link rel="stylesheet" href="https://cdn.tailwindcss.com">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
        <script lang="Javascript">
            function openModal(id) {
    const modalOpen = document.getElementById(id);
    modalOpen.style.display = "flex";
    modalOpen.style.opacity = 1;
}

function closeModal(id) {
    const modal = document.getElementById(id);
    modal.style.display = "none";
    modal.style.opacity = 0;
}
        </script>
    </head>
    <body>
        <%!Pedido pedido = new Pedido();%>
        
        <%
            List<Pedido> list = new ArrayList<>();
            String nombre = "";
            if(request.getParameter("id") != null) {
                PedidoDAO pedidoDAO = new PedidoDAO();
                ClienteDAO clienteDAO = new ClienteDAO();
                int id_pedido = Integer.parseInt(request.getParameter("id"));
                list = pedidoDAO.getPedido(id_pedido);
                pedido = list.get(0);
                nombre = clienteDAO.getNombreById(pedido.getId_cliente());
            }
        %>
        <div id="add-client-modal" class="fixed top-0 left-0 right-0 bottom-0 zIndex-10 w-full h-screen bg-slate-900/80 flex justify-center items-center ">
            <div class="flex items-center justify-center p-12 bg-white">

                <div class="mx-auto w-full max-w-[550px]">
                     Inicio de Form
                    <!--<form action="../pedidoController?action=update&id=<%out.print(pedido.getId_pedido());%>" id="add-pedido-form">-->
                    <form action="../pedidoController" id="add-pedido-form">
                        <input type="hidden" name="id" value="<%out.print(pedido.getId_pedido());%>"/>
                        <div class="-mx-3 flex flex-wrap">

                            <div class="w-full px-3 sm:w-1/2">
                                <div class="mb-5">
                                    <label
                                        for="fecha"
                                        class="mb-3 block text-base font-medium text-[#07074D]"
                                        >
                                        Fecha
                                    </label>
                                    <input
                                        disabled="true"
                                        type="text"
                                        name="fecha"
                                        id="fecha"
                                        value="<%out.print(pedido.getFecha());%>"
                                        placeholder="John Doe..."
                                        class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                                        />
                                </div>
                            </div>
                            <div class="w-full px-3 sm:w-1/2">
                                <div class="mb-5">
                                    <label
                                        for="total"
                                        class="mb-3 block text-base font-medium text-[#07074D]"
                                        >
                                        total
                                    </label>
                                    <input
                                        disabled="true"
                                        type="text"
                                          value="<%out.print(pedido.getTotal());%>"
                                        name="total"
                                        id="total"
                                        placeholder="74785545"
                                        class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                                        />
                                </div>
                            </div>
                        </div>
                        <div class="mb-5">
                           


                            <label
                                for="id_cliente"
                                class="mb-3 block mt-5 text-base font-medium text-[#07074D]"
                                >
                                Cliente
                            </label>
                            <input
                                disabled="true"
                                type="text"
                                value="<%out.print(nombre);%>"
                                name="total"
                                id="total"
                                placeholder="74785545"
                                class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                                />
                            
                                
                                 <label
                                for="estado"
                                class="mb-3 block mt-3 text-base font-medium text-[#07074D]"
                                >
                                Estado
                            </label>
                            <select id="estado" name="estado"  class=" mb-5 bg-gray-50 w-full border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                <option selected><%out.print(pedido.getEstado());%></option>
                                <%
                                    switch (pedido.getEstado()) {
                                            case "Pendiente":
                                                %>
                                                <option value="En Camino">En Camino</option>
                                                <option value="Entregado">Entregado</option>
                                                <%
                                                break;
                                            case "En Camino":
                                                %>
                                                
                                                <option value="Entregado">Entregado</option>
                                                <%
                                                break;
                                            case "Entregado":
                                                break;
                                            default:
                                                throw new AssertionError();
                                        }
                                %>                                
                            </select>
                           

                        </div>



                        <div>
                            <input
                                class="hover:shadow-form rounded-md bg-[#6A64F1] py-3 px-8 text-center text-base font-semibold text-white outline-none"
                                type="submit"
                                value="update"
                                name="action"
                                />
                        </div>
                    </form>
                            <div class="my-5">
                                  <a href="/Laboratorioo1-AFE/views/cliente.jsp" class="hover:shadow-form rounded-md bg-[#6A64F1] py-3 px-8 text-center text-base font-semibold text-white outline-none">
                                    Cancel
                                    </a >
                                    
                            
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>
