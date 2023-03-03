<%-- 
    Document   : updateClienteForm
    Created on : 2 mar. 2023, 01:31:48
    Author     : kjlme
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ModelDAO.ClienteDAO"%>
<%@page import="Model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Cliente</title>
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
        <%!Cliente cliente = new Cliente();%>
        
        <%
            List<Cliente> list = new ArrayList<>();
            if(request.getParameter("id") != null) {
                ClienteDAO clienteDao = new ClienteDAO();
                int id_cliente = Integer.parseInt(request.getParameter("id"));
                list = clienteDao.getCliente(id_cliente);
                cliente = list.get(0);
            }
        %>
        <div id="add-client-modal" class="fixed top-0 left-0 right-0 bottom-0 zIndex-10 w-full h-screen bg-slate-900/80 flex justify-center items-center ">
            <div class="flex items-center justify-center p-12 bg-white">

                <div class="mx-auto w-full max-w-[550px]">
                    <!-- Inicio de Form-->
                    <form action="../clienteController?action=update&id=<%out.print(cliente.getId_cliente());%>" id="add-client-form">
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
                                        value="<%out.print(cliente.getNombre());%>"
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
                                        value="<%out.print(cliente.getTelefono());%>"
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
                                value="<%out.print(cliente.getDireccion());%>"
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
                                        value="<%out.print(cliente.getEmail());%>"
                                        class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"
                                        />
                                </div>
                            </div>

                        </div>



                        <div>
                            <input type="hidden" name="id" value="<%out.print(cliente.getId_cliente());%>"/>
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
