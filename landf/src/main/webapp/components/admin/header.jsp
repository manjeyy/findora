<%
    String sectionLabel = (String) request.getAttribute("sectionLabel");
    if (sectionLabel == null) { sectionLabel = "Admin Console"; }
    String pageTitle = (String) request.getAttribute("pageTitle");
    if (pageTitle == null) { pageTitle = ""; }
    String pageActionsHtml = (String) request.getAttribute("pageActionsHtml");
%>
<header class="sticky top-0 z-30 bg-slate-50/80 backdrop-blur-md flex justify-between items-center px-6 py-6 w-full rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
    <div class="flex flex-col">
        <p class="text-xs font-semibold uppercase tracking-[0.2em] text-sky-700"><%= sectionLabel %></p>
        <h1 class="mt-1 text-3xl font-extrabold tracking-tight text-slate-900"><%= pageTitle %></h1>
        <nav class="flex gap-2 text-xs font-medium text-outline mt-1 uppercase tracking-widest">
            <span>Admin</span>
            <span class="text-outline-variant">/</span>
            <span><%= pageTitle %></span>
        </nav>
    </div>
    <div class="flex items-center gap-6">
        <% if (pageActionsHtml != null) { out.print(pageActionsHtml); } %>
        <button class="p-2 text-slate-500 hover:bg-slate-200/50 transition-colors rounded-full">
            <span class="material-symbols-outlined" data-icon="notifications">notifications</span>
        </button>
        <div class="w-10 h-10 rounded-full bg-surface-container-high border-2 border-primary-fixed overflow-hidden">
            <img alt="User profile" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDk_qdDayT819rczjRNBJJg2OXxtayh53zxEWhcz7PjrznFZYQ0sYwwOQBe8mgKYIlZZZ_UKKuzhSlUJErt6Dz2SRk3UGELHS6TkD2Hi3UvWA7EjNHagRdP_cJjxYs_EzZCkJa0hz7U3ZDVKk0nPvXEx_cuBUMHjy53FKI2BsM4-51sZal0y9Z6rPh9H8Og3EdWcuTzHa-mIUb9hqzFNfYZZgTqvHSDdgSlyfO8ooha7toAKD22kLdat9EeF2VJZA4tcISky7hPwa0"/>
        </div>
    </div>
</header>
