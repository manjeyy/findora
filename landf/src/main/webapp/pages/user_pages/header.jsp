<%
    String sectionLabel = (String) request.getAttribute("sectionLabel");
    if (sectionLabel == null) {
        sectionLabel = "Location Admin";
    }

    String pageTitle = (String) request.getAttribute("pageTitle");
    if (pageTitle == null) {
        pageTitle = "Assigned Location";
    }

    String pageActionsHtml = (String) request.getAttribute("pageActionsHtml");

    String searchPlaceholder = (String) request.getAttribute("searchPlaceholder");
    if (searchPlaceholder == null) {
        searchPlaceholder = "Search the location ledger...";
    }
%>

<header class="fixed top-0 left-64 right-0 h-20 bg-white border-b border-slate-200 z-50 flex items-center justify-between px-6">

    <!-- Left: Section + Title -->
    <div class="flex flex-col justify-center">
        <p class="text-xs font-semibold uppercase tracking-wider text-slate-400"><%= sectionLabel %></p>
        <h2 class="text-lg font-semibold text-slate-800"><%= pageTitle %></h2>
    </div>

    <!-- Center: Search -->
    <div class="flex-1 flex justify-center px-6">
        <div class="relative w-full max-w-md">
            <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400">search</span>
            <input type="text" placeholder="<%= searchPlaceholder %>"
                   class="w-full bg-slate-100 border border-slate-200 rounded-lg py-2 pl-10 pr-4 text-sm focus:outline-none focus:ring-2 focus:ring-teal-500/20 focus:bg-white transition"/>
        </div>
    </div>

    <!-- Right: Actions -->
    <div class="flex items-center gap-4">
        <% if (pageActionsHtml != null) { %>
        <div class="hidden md:block"><%= pageActionsHtml %></div>
        <% } %>

        <!-- Notifications -->
        <button class="relative p-2 rounded-full hover:bg-slate-100 transition">
            <span class="material-symbols-outlined text-slate-600">notifications</span>
            <span class="absolute top-1.5 right-1.5 w-2 h-2 bg-red-500 rounded-full"></span>
        </button>

        <!-- Profile -->
        <div class="h-9 w-9 rounded-full overflow-hidden border border-slate-200">
            <img alt="Location admin profile" class="h-full w-full object-cover" src="https://img.freepik.com/free-photo/closeup-shot-beautiful-butterfly-with-interesting-textures-orange-petaled-flower_181624-7640.jpg?semt=ais_hybrid&w=740&q=80"/>
        </div>
    </div>
</header>
<div class="w-full h-20"></div>