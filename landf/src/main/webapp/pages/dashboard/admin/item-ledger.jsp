<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.landf.features.admin.AdminDashboardStats" %>
<%@ page import="com.landf.features.admin.AdminItemView" %>
<%! private String escapeHtml(String value) {
    if (value == null) {
        return "";
    }
    return value.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
}
%>
<% List<AdminItemView> items = (List<AdminItemView>) request.getAttribute("items");
    AdminDashboardStats stats = (AdminDashboardStats) request.getAttribute("stats");
    String authUsername = (String) request.getAttribute("authUsername");
    String contextPath = request.getContextPath();
    if (items == null) {
        items = List.of();
    }
    if (stats == null) {
        stats = new AdminDashboardStats(0, 0, 0, 0, 0, 0, 0);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Item Ledger | Admin</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
          rel="stylesheet">
    <style> body {
        font-family: 'Inter', sans-serif;
        background: linear-gradient(170deg, #eff6ff 0%, #f8fafc 48%, #e2e8f0 100%);
    }

    h1, h2, h3 {
        font-family: 'Manrope', sans-serif;
    }

    .material-symbols-outlined {
        font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
    } </style>
</head>
<body class="min-h-screen text-slate-900">
<%@ include file="/components/admin/sidebar.jsp" %>
<main class="ml-64 min-h-screen flex flex-col">
    <div class="mx-auto max-w-7xl px-6 py-10"><% request.setAttribute("pageTitle", "Item Ledger");
        String actions = "<a href=\"" + contextPath + "/admin/items\" class=\"rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100\">Back to Items</a>";
        actions += "<a href=\"" + contextPath + "/admin/locations/new\" class=\"rounded-xl border border-sky-700 bg-sky-700 px-4 py-2 text-sm font-semibold text-white ml-2\">Add Location</a>";
        request.setAttribute("pageActionsHtml", actions); %>
        <%@ include file="/components/admin/header.jsp" %>
        <section class="mt-6 grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Open Items</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= stats.getOpenItems() %>
                </p></article>
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Pending Claims</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= stats.getPendingClaims() %>
                </p></article>
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Pending Reports</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= stats.getPendingReports() %>
                </p></article>
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Pending Locations</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= stats.getPendingLocations() %>
                </p></article>
        </section>
        <section class="mt-6 rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
            <div class="flex flex-wrap items-end justify-between gap-4">
                <div><h2 class="text-2xl font-bold tracking-tight">Ledger view</h2>
                    <p class="mt-1 text-sm text-slate-600">Inventory records with direct moderation actions.</p></div>
                <div class="flex flex-wrap gap-2">
                    <button class="rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100">
                        Filter
                    </button>
                    <button class="rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100">
                        Export
                    </button>
                </div>
            </div>
            <div class="mt-6 grid gap-4 lg:grid-cols-2"><% for (AdminItemView item : items) { %>
                <article class="rounded-3xl border border-slate-200 bg-slate-50 p-5 shadow-sm">
                    <div class="flex flex-wrap items-start justify-between gap-3">
                        <div><p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">
                            Item <%= item.getItemId() %>
                        </p>
                            <h3 class="mt-1 text-xl font-bold text-slate-900"><%= escapeHtml(item.getTitle()) %>
                            </h3>
                            <p class="mt-1 text-sm text-slate-600"><%= escapeHtml(item.getType()) %>
                                | <%= escapeHtml(item.getCategory()) %>
                            </p></div>
                        <span class="rounded-full border border-slate-300 bg-white px-3 py-1 text-xs font-semibold text-slate-700"><%= escapeHtml(item.getStatus()) %></span>
                    </div>
                    <div class="mt-4 grid gap-3 sm:grid-cols-2">
                        <div class="rounded-2xl bg-white p-4"><p
                                class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Reporter</p>
                            <p class="mt-2 font-semibold text-slate-900"><%= escapeHtml(item.getReporterUsername()) %>
                            </p></div>
                        <div class="rounded-2xl bg-white p-4"><p
                                class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Location</p>
                            <p class="mt-2 font-semibold text-slate-900"><%= escapeHtml(item.getLocationName()) %>
                            </p></div>
                    </div>
                    <div class="mt-4 rounded-2xl bg-white p-4 text-sm text-slate-600"><p
                            class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Moderation
                        status</p>
                        <p class="mt-2 font-semibold text-slate-900"><%= escapeHtml(item.getModerationStatus()) %>
                        </p>
                        <p class="mt-2 text-xs text-slate-500">Created: <%= escapeHtml(item.getCreatedAt()) %>
                        </p></div>
                    <form method="post" action="<%= contextPath %>/admin/items/moderate"
                          class="mt-5 flex flex-wrap items-center gap-2"><input type="hidden" name="itemId"
                                                                                value="<%= item.getItemId() %>"> <select
                            name="action"
                            class="rounded-xl border border-slate-300 px-3 py-2 text-xs outline-none ring-sky-500 focus:ring-2">
                        <option value="close">Close</option>
                        <option value="reopen">Reopen</option>
                        <option value="flag">Flag</option>
                        <option value="mark_spam">Mark Spam</option>
                    </select>
                        <button type="submit"
                                class="rounded-xl border border-sky-700 bg-sky-700 px-4 py-2 text-xs font-semibold text-white">
                            Apply
                        </button>
                    </form>
                </article>
                <% } %> <% if (items.isEmpty()) { %>
                <div class="col-span-full rounded-3xl border border-dashed border-slate-300 bg-slate-50 px-6 py-12 text-center text-sm text-slate-500">
                    No item records available.
                </div>
                <% } %></div>
        </section>
        <%@ include file="/components/footer.jsp" %>
    </div>
</main>
</body>
</html>
