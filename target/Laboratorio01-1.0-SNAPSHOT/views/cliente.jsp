<%@page import="ModelDAO.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.Cliente" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
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
        <title>Cliente</title>
    </head>
    <body onload="closeModal('add-client-modal')">
        <%
            List<Cliente> listaCliente = new ArrayList<>();
            ClienteDAO clienteDao = new ClienteDAO();
            listaCliente = clienteDao.getClientes();
            session.setAttribute("listaClientes", listaCliente);
        %>
       <div class="w-full p-2 ">
            <a class="px-4 py-2 mt-2 text-sm font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 md:ml-4 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline"
                               href="/Laboratorioo1-AFE/views/pedido.jsp">Pedidos</a>
        </div>
        <%--<jsp:include page="../nav.jsp" />--%>
        <section class="antialiased  text-gray-600  px-4">
            <div class="flex flex-col justify-center items-center mt-20">
                <div class="w-full max-w-2xl mx-auto bg-white shadow-lg rounded-sm border border-gray-200">
                    <header class="px-5 py-4 border-b border-gray-100">
                        <h2 class="font-semibold text-gray-800">Customers</h2>
                    </header>
                    <div class="p-3">
                        <div class="overflow-x-auto">
                            <table class="table-auto w-full">
                                <thead class="text-xs font-semibold uppercase text-gray-400 bg-gray-50">
                                    <tr>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Nombre</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Email</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-left">Telefono</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-center">Direccion</div>
                                        </th>
                                        <th class="p-2 whitespace-nowrap">
                                            <div class="font-semibold text-center">Actions</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="text-sm divide-y divide-gray-100">
                                    <c:forEach var="cliente" items="${listaClientes}">
                                        <tr>
                                            <td class="p-2 whitespace-nowrap">
                                                <div class="flex items-center">
                                                    <div class="font-medium text-gray-800"><c:out value="${cliente.getNombre()}"/></div>
                                                </div>
                                            </td>
                                            <td class="p-2 whitespace-nowrap">
                                                <div class="text-left"><c:out value="${cliente.getEmail()}"/></div>
                                            </td>
                                            <td class="p-2 whitespace-nowrap">
                                                <div class="text-left font-medium text-green-500"><c:out value="${cliente.getTelefono()}"/></div>
                                            </td>
                                            <td class="p-2 whitespace-nowrap">
                                                <div class="text-md text-center"><c:out value="${cliente.getDireccion()}"/></div>
                                            </td>
                                            <td class="p-2 whitespace-nowrap">
                                                <a class="bg-gray-200/40 rounded-full p-2 hover:bg-gray-300 transition-3 text-red-500" href="../clienteController?action=delete&id=<c:out value='${cliente.getId_cliente()}'/>">Delete</a>
                                                <a class="bg-gray-200/40 rounded-full p-2 hover:bg-gray-300 transition-3 text-blue-500" href="updateClienteForm.jsp?id=<c:out value='${cliente.getId_cliente()}'/>">Update</a>
                                            </td>
                                        </tr>
                                
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
                    <form action="/Laboratorioo1-AFE/clienteController?action=add" id="add-client-form">
                        <div class="-mx-3 flex flex-wrap">
                            <div class="w-full px-3 sm:w-1/2">
                                <div class="mb-5">
                                    <label
                                        for="nombre"
                                        class="mb-3 block text-base font-medium text-[#07074D]"
                                        >
                                        Nombre
                                    </label>
                                    <input
                                        type="text"
                                        name="nombre"
                                        id="nombre"
                                        placeholder="John Doe..."
                                        class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                                        />
                                </div>
                            </div>
                            <div class="w-full px-3 sm:w-1/2">
                                <div class="mb-5">
                                    <label
                                        for="telefono"
                                        class="mb-3 block text-base font-medium text-[#07074D]"
                                        >
                                        Telefono
                                    </label>
                                    <input
                                        type="text"
                                        name="telefono"
                                        id="telefono"
                                        placeholder="74785545"
                                        class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                                        />
                                </div>
                            </div>
                        </div>
                        <div class="mb-5">
                            <label
                                for="direccion"
                                class="mb-3 block text-base font-medium text-[#07074D]"
                                >
                                Direccion
                            </label>
                            <input
                                type="text"
                                name="direccion"
                                id="direccion"
                                placeholder="Santa Ana, El Salvador"
                                class="w-full appearance-none rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                                />
                        </div>

                        <div class="-mx-3 flex flex-wrap">
                            <div class="w-full px-3 sm:w-1/2">
                                <div class="mb-5">
                                    <label
                                        for="email"
                                        class="mb-3 block text-base font-medium text-[#07074D]"
                                        >
                                        Email
                                    </label>
                                    <input
                                        type="email"
                                        name="email"
                                        id="email"
                                        placeholder="Johndoe@gmail.com"
                                        class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                                        />
                                </div>
                            </div>

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