<aside
  class="bg-slate-100 dark:bg-slate-950 h-screen w-64 fixed left-0 top-0 flex flex-col h-full py-8 px-4 font-manrope text-sm z-40"
>
  <div class="mb-10 px-4">
    <h2 class="text-lg font-bold text-teal-900 dark:text-teal-100">
      Findora Location Admin
    </h2>
    <p class="text-xs text-slate-500 uppercase tracking-widest mt-1">
      Location Steward
    </p>
  </div>
  <nav class="flex-1 space-y-1">
    <a
      class="flex items-center gap-3 px-4 py-3 text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out rounded-lg"
      href="<%= request.getContextPath() %>/location-admin"
    >
      <span class="material-symbols-outlined" data-icon="dashboard"
        >dashboard</span
      >
      Dashboard
    </a>
    <a
      class="flex items-center gap-3 px-4 py-3 text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out rounded-lg"
      href="<%= request.getContextPath() %>/location-admin/items"
    >
      <span class="material-symbols-outlined" data-icon="inventory_2"
        >inventory_2</span
      >
      Items
    </a>
    <a
      class="flex items-center gap-3 px-4 py-3 text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out rounded-lg"
      href="<%= request.getContextPath() %>/location-admin/locations"
    >
      <span class="material-symbols-outlined" data-icon="location_on"
        >location_on</span
      >
      Locations
    </a>
    <a
      class="flex items-center gap-3 px-4 py-3 text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out rounded-lg"
      href="<%= request.getContextPath() %>/location-admin/claims"
    >
      <span class="material-symbols-outlined" data-icon="assignment_turned_in"
        >assignment_turned_in</span
      >
      Claims
    </a>
    <a
      class="flex items-center gap-3 px-4 py-3 text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out rounded-lg"
      href="<%= request.getContextPath() %>/location-admin/reports"
    >
      <span class="material-symbols-outlined" data-icon="analytics"
        >analytics</span
      >
      Reports
    </a>
  </nav>
  <div class="mt-auto px-4">
    <button
      class="w-full bg-secondary text-on-secondary font-bold py-3 px-4 rounded-lg flex items-center justify-center gap-2 transition-all hover:shadow-lg active:opacity-80"
    >
      <span class="material-symbols-outlined text-sm" data-icon="add">add</span>
      Report Found Item
    </button>
  </div>
</aside>
