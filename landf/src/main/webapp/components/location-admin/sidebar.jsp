<%
    String activeSection = (String) request.getAttribute("activeSection");
    if (activeSection == null) {
        activeSection = "dashboard";
    }

    String baseLinkClass = "flex items-center gap-3 px-4 py-3 rounded-lg transition-all duration-200";
    String inactiveLinkClass = baseLinkClass + " text-slate-500 hover:bg-white hover:text-teal-800";
    String activeLinkClass = baseLinkClass + " bg-white text-teal-900 font-semibold";
%>

<aside class="bg-slate-100 h-screen w-64 fixed left-0 top-0 flex flex-col py-8 px-4 font-manrope text-sm z-40">

    <!-- Header -->
    <div class="mb-10 px-4">
        <h2 class="text-lg font-bold text-teal-900">Findora Location Admin</h2>
        <p class="text-xs text-slate-500 uppercase tracking-widest mt-1">
            Location Steward
        </p>
    </div>

    <!-- Navigation -->
    <nav class="flex-1 space-y-1">

        <a
                class="<%= "dashboard".equals(activeSection) ? activeLinkClass : inactiveLinkClass %>"
                href="<%= request.getContextPath() %>/location-admin/dashboard"
        >
            <span class="material-symbols-outlined">dashboard</span>
            Dashboard
        </a>

        <a
                class="<%= "items".equals(activeSection) ? activeLinkClass : inactiveLinkClass %>"
                href="<%= request.getContextPath() %>/location-admin/items"
        >
            <span class="material-symbols-outlined">inventory_2</span>
            Items
        </a>

        <a
                class="<%= "claims".equals(activeSection) ? activeLinkClass : inactiveLinkClass %>"
                href="<%= request.getContextPath() %>/location-admin/claims"
        >
            <span class="material-symbols-outlined">assignment_turned_in</span>
            Claims
        </a>

        <a
                class="<%= "reports".equals(activeSection) ? activeLinkClass : inactiveLinkClass %>"
                href="<%= request.getContextPath() %>/location-admin/reports"
        >
            <span class="material-symbols-outlined">analytics</span>
            Reports
        </a>

    </nav>

    <!-- Footer -->
    <div class="mt-auto px-4">
        <a
                href="<%= request.getContextPath() %>/auth/logout"
                class="w-full bg-red-100 text-red-700 font-bold py-3 px-4 rounded-lg flex items-center justify-center gap-2 transition-all hover:bg-red-200 active:opacity-80"
        >
            <span class="material-symbols-outlined text-sm">logout</span>
            Logout
        </a>
    </div>

</aside>