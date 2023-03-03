<%-- 
    Document   : pedido
    Created on : 28 feb. 2023, 10:47:06
    Author     : kjlme
--%>

<%@page import="ModelDAO.ClienteDAO"%>
<%@page import="Model.Cliente"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Pedido"%>
<%@page import="ModelDAO.PedidoDAO"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://cdn.tailwindcss.com">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://unpkg.com/flowbite@1.4.0/dist/flowbite.js"></script>
        <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.4/dist/flowbite.min.css" />
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
        <style>
          .disabled {
            pointer-events: none;
            cursor: default;
            opacity: 0.4;
            }  
        </style>
        <title>Pedidos</title>
    </head>
    <body onload="closeModal('add-client-modal')">
        <%! PedidoDAO pedidoDao = new PedidoDAO(); %>
        <%
            List<Pedido> listaPedidos = new ArrayList<>();
            listaPedidos = pedidoDao.getPedidos();
            session.setAttribute("listaPedidos", listaPedidos);
            
            List<Cliente> listaCliente = new ArrayList<>();
            ClienteDAO clienteDao = new ClienteDAO();
            listaCliente = clienteDao.getClientes();
            
        %>
        <div class="w-full p-2 ">
            <a class="px-4 py-2 mt-2 text-sm font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline"
                               href="/Laboratorioo1-AFE/views/cliente.jsp">Clientes</a>
        </div>
        
        
        
        <%--<jsp:include page="../nav.jsp" />--%>
        <section class="antialiased  text-gray-600  px-4">
            <div class="flex flex-col justify-center items-center mt-20">
                <div class="w-full max-w-2xl mx-auto bg-white shadow-lg rounded-sm border border-gray-200">
                    <header class="px-5 py-4 border-b border-gray-100">
                        <h2 class="font-semibold text-gray-800">Pedidos</h2>
                    </header>
                    <div class="p-3">
                        <div class="overflow-x-auto">
                            <table class="table-auto w-full">
                                <thead class="text-xs font-semibold uppercase text-gray-400 bg-gray-50">
                                    <tr>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Cliente</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Fecha</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Total</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-center">Estado</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="text-sm divide-y divide-gray-100">
                                <c:forEach var="pedido" items="${listaPedidos}">
                                    <tr>
                                        <td class="p-2 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="font-medium text-gray-800"><c:out value="${pedido.cliente.getNombre()}" /></div>
                                            </div>
                                        </td>
                                        <td class="p-2 whitespace-nowrap">
                                            <div class="text-left"><c:out value="${pedido.getFecha()}"/></div>
                                        </td>
                                        <td class="p-2 whitespace-nowrap">
                                            <div class="text-left font-medium text-green-500"><c:out value="${pedido.getTotal()}"/></div>
                                        </td>
                                        <td class="p-2 whitespace-nowrap">
                                            <div class="text-md text-center"><c:out value="${pedido.getEstado()}"/></div>
                                        </td>
                                        <td class="p-2 whitespace-nowrap">
                                            <a class="bg-gray-200/40 rounded-full p-2 hover:bg-gray-300 transition-3 text-red-500" href="../pedidoController?action=delete&id=<c:out value='${pedido.getId_pedido()}'/>"/>Delete</a>
                                            <c:if test="${pedido.getEstado() == 'Entregado'}">
                                                <a class="bg-gray-200/40 rounded-full p-2 hover:bg-gray-300 transition-3 text-blue-500 disabled" href="updatePedido.jsp?id=<c:out value='${pedido.getId_pedido()}'/>"/>Update</a>
                                            </c:if>
                                            <c:if test="${pedido.getEstado() == 'En Camino'}">
                                                <a class="bg-gray-200/40 rounded-full p-2 hover:bg-gray-300 transition-3 text-blue-500" href="updatePedido.jsp?id=<c:out value='${pedido.getId_pedido()}'/>"/>Update</a>
                                            </c:if>
                                            <c:if test="${pedido.getEstado() == 'Pendiente'}">
                                                <a class="bg-gray-200/40 rounded-full p-2 hover:bg-gray-300 transition-3 text-blue-500" href="updatePedido.jsp?id=<c:out value='${pedido.getId_pedido()}'/>"/>Update</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <div><c:out value="${name}"/></div>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <button id="open-modal" class="fixed right-10 bottom-20 p-5 rounded-full bg-blue-600 text-white hover:bg-blue-700 shadow-lg transition" onclick="openModal('add-client-modal')">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
            </svg>
        </button>
        <!-- Modal -->

        <div id="add-client-modal" class="fixed top-0 left-0 right-0 bottom-0 zIndex-10 w-full h-screen bg-slate-900/80 flex justify-center items-center ">
            <div class="flex items-center justify-center p-12 bg-white">

                <div class="mx-auto w-full max-w-[550px]">
                    <div class="w-full flex justify-end">
                        <button id="close-modal" class="text-xl text-gray-400" onclick="closeModal('add-client-modal')">
                            X
                        </button>
                    </div>
                    <!-- Inicio de Form-->
                    <form action="../pedidoController?action=add" id="add-pedido-form">
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
                                        type="date"
                                        name="fecha"
                                        id="fecha"
                                        placeholder="Fecha"
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
                                        type="text"
                                        name="total"
                                        id="total"
                                        placeholder="999.99"
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
                            <select id="clientes" name="id_cliente" class="bg-gray-50 w-full border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                <option selected>Selecciona un cliente</option>
                                <%  
                                    for (int i = 0; i < listaCliente.size(); i++) {
                                        out.print("<option value=" + listaCliente.get(i).getId_cliente() + ">" + listaCliente.get(i).getNombre() + "</option>");

                                    }
                                %>

                            </select>
                                
                                 <label
                                for="estado"
                                class="mb-3 block mt-3 text-base font-medium text-[#07074D]"
                                >
                                Estado
                            </label>
                            <select id="estado" name="estado" class=" mb-5 bg-gray-50 w-full border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                <option selected>Selecciona el estado del pedido</option>
                                <option value="Pendiente">Pendiente</option>
                                <option value="En Camino">En Camino</option>
                                <option value="Entregado">Entregado</option
                            </select>
                           

                        </div>



                        <div>
                            <input
                                class="hover:shadow-form rounded-md bg-[#6A64F1] py-3 px-8 text-center text-base font-semibold text-white outline-none"
                                type="submit"
                                value="add"
                                name="action"
                                />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
