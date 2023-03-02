<%@ page import="java.util.List" %>
<%@ page import="Model.Cliente" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.tailwindcss.com">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <script defer src="../index.js"></script>
    <title>Cliente</title>
</head>
<body onload="closeModal('add-client-modal')">
<div style="max-width:700px; margin: 100px auto;">
    <%!
        List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
    %>
    <form class="flex items-center bg-transparent">

        <div class="relative w-full">
            <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor"
                     viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                          clip-rule="evenodd"></path>
                </svg>
            </div>
            <input type="text" id="voice-search"
                   class=" focus:outline-none bg-white shadow-md  rounded-lg block w-full pl-10 p-2.5   "
                   placeholder="Search Mockups, Logos, Design Templates..." required="">

        </div>
        <button type="submit"
                class=" rounded-md inline-flex items-center py-2.5 px-3 ml-2 text-sm font-medium text-white bg-blue-700 border border-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
            <svg aria-hidden="true" class="mr-2 -ml-1 w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                 xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
            </svg>Search
        </button>
    </form>

</div>

<section class="antialiased  text-gray-600  px-4">
    <div class="flex flex-col justify-center">
        <!-- Table -->
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
<%--                        <c:forEach var="cliente" begin="1" end="8">--%>
<%--                            <c:out value="${cliente}"/>--%>
<%--                        </c:forEach>--%>
                        <tr>
                            <td class="p-2 whitespace-nowrap">
                                <div class="flex items-center">
                                    <div class="w-10 h-10 flex-shrink-0 mr-2 sm:mr-3"><img class="rounded-full" src="https://raw.githubusercontent.com/cruip/vuejs-admin-dashboard-template/main/src/images/user-36-05.jpg" width="40" height="40" alt="Alex Shatov"></div>
                                    <div class="font-medium text-gray-800">Alex Shatov</div>
                                </div>
                            </td>
                            <td class="p-2 whitespace-nowrap">
                                <div class="text-left">alexshatov@gmail.com</div>
                            </td>
                            <td class="p-2 whitespace-nowrap">
                                <div class="text-left font-medium text-green-500">$2,890.66</div>
                            </td>
                            <td class="p-2 whitespace-nowrap">
                                <div class="text-lg text-center">??</div>
                            </td>
                            <td class="p-2 whitespace-nowrap">
                                <button class="bg-gray-200/40 rounded-full p-2 hover:bg-gray-300 transition-3 text-red-500">del</button>
                                <button class="bg-gray-200/40 rounded-full p-2 hover:bg-gray-300 transition-3 text-blue-500">update</button>
                            </td>
                        </tr>
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

<%--<div id="add-client-modal" class="fixed top-0 left-0 right-0 bottom-0 zIndex-10 w-full h-screen bg-slate-900/80 flex justify-center items-center ">--%>
<%--    <div class="flex items-center justify-center p-12 bg-white">--%>

<%--        <div class="mx-auto w-full max-w-[550px]">--%>
<%--            <div class="w-full flex justify-end">--%>
<%--                <button id="close-modal" class="text-xl text-gray-400" onclick="closeModal('add-client-modal')">--%>


<%--                    X--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <form action="https://formbold.com/s/FORM_ID" method="POST">--%>
<%--                <div class="-mx-3 flex flex-wrap">--%>
<%--                    <div class="w-full px-3 sm:w-1/2">--%>
<%--                        <div class="mb-5">--%>
<%--                            <label--%>
<%--                                    for="nombre"--%>
<%--                                    class="mb-3 block text-base font-medium text-[#07074D]"--%>
<%--                            >--%>
<%--                                Nombre--%>
<%--                            </label>--%>
<%--                            <input--%>
<%--                                    type="text"--%>
<%--                                    name="nombre"--%>
<%--                                    id="nombre"--%>
<%--                                    placeholder="John Doe..."--%>
<%--                                    class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"--%>
<%--                            />--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="w-full px-3 sm:w-1/2">--%>
<%--                        <div class="mb-5">--%>
<%--                            <label--%>
<%--                                    for="telefono"--%>
<%--                                    class="mb-3 block text-base font-medium text-[#07074D]"--%>
<%--                            >--%>
<%--                                Telefono--%>
<%--                            </label>--%>
<%--                            <input--%>
<%--                                    type="text"--%>
<%--                                    name="telefono"--%>
<%--                                    id="telefono"--%>
<%--                                    placeholder="74785545"--%>
<%--                                    class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"--%>
<%--                            />--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="mb-5">--%>
<%--                    <label--%>
<%--                            for="direccion"--%>
<%--                            class="mb-3 block text-base font-medium text-[#07074D]"--%>
<%--                    >--%>
<%--                        Direccion--%>
<%--                    </label>--%>
<%--                    <input--%>
<%--                            type="text"--%>
<%--                            name="direccion"--%>
<%--                            id="direccion"--%>
<%--                            placeholder="Santa Ana, El Salvador"--%>
<%--                            class="w-full appearance-none rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"--%>
<%--                    />--%>
<%--                </div>--%>

<%--                <div class="-mx-3 flex flex-wrap">--%>
<%--                    <div class="w-full px-3 sm:w-1/2">--%>
<%--                        <div class="mb-5">--%>
<%--                            <label--%>
<%--                                    for="email"--%>
<%--                                    class="mb-3 block text-base font-medium text-[#07074D]"--%>
<%--                            >--%>
<%--                                Email--%>
<%--                            </label>--%>
<%--                            <input--%>
<%--                                    type="email"--%>
<%--                                    name="email"--%>
<%--                                    id="email"--%>
<%--                                    placeholder="Johndoe@gmail.com"--%>
<%--                                    class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"--%>
<%--                            />--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                </div>--%>



<%--                <div>--%>
<%--                    <button--%>
<%--                            class="hover:shadow-form rounded-md bg-[#6A64F1] py-3 px-8 text-center text-base font-semibold text-white outline-none"--%>
<%--                    >--%>
<%--                        Submit--%>
<%--                    </button>--%>

<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


</body>
</html>