<% String sectionLabel = (String) request.getAttribute("sectionLabel");
    if (sectionLabel == null) {
        sectionLabel = "Admin Console";
    }
    String pageTitle = (String) request.getAttribute("pageTitle");
    if (pageTitle == null) {
        pageTitle = "Administrator";
    }
    String pageActionsHtml = (String) request.getAttribute("pageActionsHtml");
    String searchPlaceholder = (String) request.getAttribute("searchPlaceholder");
    if (searchPlaceholder == null) {
        searchPlaceholder = "Search institutional data...";
    }
%>
<header class="bg-slate-50 sticky top-0 z-30 flex justify-between items-center px-8 py-4 w-full">
    <div class="flex items-center gap-6">
        <div class="relative flex items-center">
            <span class="material-symbols-outlined absolute left-3 text-slate-400" data-icon="search">search</span>
            <input class="bg-surface-container-highest border-none rounded-full py-2 pl-10 pr-4 text-sm w-80 focus:ring-2 focus:ring-primary/20"
                   placeholder="<%= searchPlaceholder %>" type="text"/>
        </div>
        <div class="ml-4">
            <p class="text-xs font-semibold uppercase tracking-[0.12em] text-sky-700"><%= sectionLabel %>
            </p>
            <h2 class="text-lg font-bold"><%= pageTitle %>
            </h2>
        </div>
    </div>
    <div class="flex items-center gap-4">
        <div class="hidden md:block mr-4">
            <% if (pageActionsHtml != null) {
                out.print(pageActionsHtml);
            } %>
        </div>
        <button class="p-2 rounded-full hover:bg-slate-200/50 transition-colors relative">
            <span class="material-symbols-outlined text-slate-500" data-icon="notifications">notifications</span>
            <span class="absolute top-2 right-2 w-2 h-2 bg-secondary rounded-full"></span>
        </button>
        <div class="h-8 w-8 rounded-full overflow-hidden border border-primary/10">
            <img alt="User profile"
                 data-alt="professional portrait of a high-level system administrator in a clean modern setting with soft lighting"
                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuDwUKQRQgbtbmFV-mnM9Mis2cq643Zy80lvMYrtAm93EU7-zvUQgVRhSR7DttDxhIQrX02B9Dnw5A5z4MSQUMsbfZzI1C2fEhbR_jXuPJiagLJ1DrnzrJubEm6mtnH7BLhDs5mWQUGY36lynfJD1rmeZiGaWjc7LjPcUj__MB75hXWt5bguKdEsWmirFs-Y3pSBJQFhyjKCQJufA93jAB8C-YQA85lbvrlTWQLpjgNiozFqOGyHEy6i0_-eRaVmiCKIt6-JNVUyes"/>
        </div>
    </div>
</header>
