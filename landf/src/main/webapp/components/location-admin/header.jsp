<% String sectionLabel = (String) request.getAttribute("sectionLabel");
    if (sectionLabel == null) {
        sectionLabel = "Location Admin";
    }
    String pageTitle = (String) request.getAttribute("pageTitle");
    if (pageTitle == null) {
        pageTitle = "Assigned Location";
    }
    String searchPlaceholder = (String) request.getAttribute("searchPlaceholder");
    if (searchPlaceholder == null) {
        searchPlaceholder = "Search the location ledger...";
    }
    String pageActionsHtml = (String) request.getAttribute("pageActionsHtml");
%>
<header class="sticky top-0 z-30 w-full border-b border-slate-200/70 bg-white/80 backdrop-blur-xl">
    <div class="flex items-center justify-between gap-6 px-8 py-4">
        <div class="flex items-center gap-5">
            <div class="relative hidden md:block"><span
                    class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400">search</span>
                <input class="w-80 rounded-full border border-slate-200 bg-slate-50 py-2 pl-10 pr-4 text-sm outline-none transition focus:border-teal-500 focus:bg-white"
                       placeholder="<%= searchPlaceholder %>" type="text"/></div>
            <div><p class="text-[10px] font-bold uppercase tracking-[0.18em] text-teal-700"><%= sectionLabel %>
            </p>
                <h2 class="text-lg font-bold text-slate-900"><%= pageTitle %>
                </h2></div>
        </div>
        <div class="flex items-center gap-3"><% if (pageActionsHtml != null) {
            out.print(pageActionsHtml);
        } %>
            <button class="rounded-full p-2 text-slate-500 transition hover:bg-slate-100 hover:text-slate-900"><span
                    class="material-symbols-outlined">notifications</span></button>
            <div class="h-9 w-9 overflow-hidden rounded-full bg-slate-200">
                <img alt="Location admin profile"
                     class="h-full w-full object-cover"
                     src="https://lh3.googleusercontent.com/aida-public/AB6AXuDUl2D4Wbik8W4xK0-k5e5A8jB0e4D9sV5s6PzP4wM6Hh9Zz8mYw2Lk6zV0fW8wM9fLqQYxR3u4YkZ8C7xU2dM4xgQ6k9F3m3Yh8Qwzq8Qv9mQ1N1A0r6M2j5t8sL3G4Y0"/>
            </div>
        </div>
    </div>
</header>