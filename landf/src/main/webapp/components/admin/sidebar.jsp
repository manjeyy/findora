<aside class="bg-slate-100 h-screen w-64 fixed left-0 top-0 flex flex-col py-8 px-4 font-manrope text-sm z-40">
    <div class="mb-10 px-2">
        <h1 class="text-lg font-bold text-teal-900">Findora Admin</h1>
        <p class="text-[10px] text-slate-500 uppercase tracking-widest font-semibold">Institutional Ledger</p>
    </div>

    <nav class="flex-1 space-y-1">
        <a class="flex items-center gap-3 px-3 py-3 rounded-lg transition-all duration-300 ease-in-out <%= "dashboard".equalsIgnoreCase((String) request.getAttribute("activeSection")) ? "text-teal-900 font-bold border-r-4 border-orange-500 bg-white/50" : "text-slate-500 hover:bg-white hover:text-teal-800" %>"
           href="<%= request.getContextPath() %>/admin/dashboard">
            <span class="material-symbols-outlined" data-icon="dashboard">dashboard</span>
            <span>Dashboard</span>
        </a>

        <a class="flex items-center gap-3 px-3 py-3 rounded-lg transition-all duration-300 ease-in-out <%= "items".equalsIgnoreCase((String) request.getAttribute("activeSection")) ? "text-teal-900 font-bold border-r-4 border-orange-500 bg-white/50" : "text-slate-500 hover:bg-white hover:text-teal-800" %>"
           href="<%= request.getContextPath() %>/admin/items">
            <span class="material-symbols-outlined" data-icon="inventory_2">inventory_2</span>
            <span>Items</span>
        </a>

        <a class="flex items-center gap-3 px-3 py-3 rounded-lg transition-all duration-300 ease-in-out <%= "locations".equalsIgnoreCase((String) request.getAttribute("activeSection")) ? "text-teal-900 font-bold border-r-4 border-orange-500 bg-white/50" : "text-slate-500 hover:bg-white hover:text-teal-800" %>"
           href="<%= request.getContextPath() %>/admin/locations">
            <span class="material-symbols-outlined" data-icon="location_on">location_on</span>
            <span>Locations</span>
        </a>

        <a class="flex items-center gap-3 px-3 py-3 rounded-lg transition-all duration-300 ease-in-out <%= "users".equalsIgnoreCase((String) request.getAttribute("activeSection")) ? "text-teal-900 font-bold border-r-4 border-orange-500 bg-white/50" : "text-slate-500 hover:bg-white hover:text-teal-800" %>"
           href="<%= request.getContextPath() %>/admin/users">
            <span class="material-symbols-outlined" data-icon="group">group</span>
            <span>Users</span>
        </a>

        <a class="flex items-center gap-3 px-3 py-3 rounded-lg transition-all duration-300 ease-in-out <%= "claims".equalsIgnoreCase((String) request.getAttribute("activeSection")) ? "text-teal-900 font-bold border-r-4 border-orange-500 bg-white/50" : "text-slate-500 hover:bg-white hover:text-teal-800" %>"
           href="<%= request.getContextPath() %>/admin/claims">
            <span class="material-symbols-outlined" data-icon="assignment_turned_in">assignment_turned_in</span>
            <span>Claims</span>
        </a>

        <a class="flex items-center gap-3 px-3 py-3 rounded-lg transition-all duration-300 ease-in-out <%= "reports".equalsIgnoreCase((String) request.getAttribute("activeSection")) ? "text-teal-900 font-bold border-r-4 border-orange-500 bg-white/50" : "text-slate-500 hover:bg-white hover:text-teal-800" %>"
           href="<%= request.getContextPath() %>/admin/reports">
            <span class="material-symbols-outlined" data-icon="analytics">analytics</span>
            <span>Reports</span>
        </a>
    </nav>

    <div class="mt-auto pt-6 border-t border-outline-variant/10">
        <a href="<%= request.getContextPath() %>/auth/logout" class="w-full flex items-center justify-center gap-2 bg-red-100 text-red-700 py-3 rounded-lg font-bold hover:bg-red-200 transition-all active:scale-95">
            <span class="material-symbols-outlined text-sm">logout</span>
            Logout
        </a>
    </div>
</aside>
