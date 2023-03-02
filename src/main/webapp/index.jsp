<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
<jsp:include page="nav.jsp" />
<div>
    <section class="py-24 flex items-center min-h-screen justify-center bg-white">
        <div class="mx-auto max-w-[43rem]">
            <div class="text-center">
                <h1 class="mt-3 text-[3.5rem] font-bold leading-[4rem] tracking-tight text-black">Administra tus clientes desde acá con facilidad</h1>
                <p class="mt-3 text-lg leading-relaxed text-slate-400">Specify helps you unify your brand identity by collecting, storing and distributing design tokens and assets — automatically.</p>
            </div>

            <div class="mt-6 flex items-center justify-center gap-4">
                <a href="Cliente?action=getall" class="transform rounded-md bg-indigo-600/95 px-5 py-3 font-medium text-white transition-colors hover:bg-indigo-700">Get started for free</a>
            </div>
        </div>
    </section>
</div>
</body>
</html>