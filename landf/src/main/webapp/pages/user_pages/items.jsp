<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.landf.features.admin.AdminItemView" %>
<%! private String escapeHtml(String value) {
    if (value == null) {
        return "";
    }
    return value.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
}
%>
<% List<AdminItemView> items = (List<AdminItemView>) request.getAttribute("items");
    String authUsername = (String) request.getAttribute("authUsername");
    String flashSuccess = (String) request.getAttribute("flashSuccess");
    String flashError = (String) request.getAttribute("flashError");
    String contextPath = request.getContextPath();
    if (items == null) {
        items = List.of();
    }
    int openItems = 0;
    int closedItems = 0;
    int flaggedItems = 0;
    int spamItems = 0;
    for (AdminItemView item : items) {
        String status = item.getStatus() == null ? "" : item.getStatus();
        String moderation = item.getModerationStatus() == null ? "" : item.getModerationStatus();
        if ("open".equalsIgnoreCase(status)) {
            openItems++;
        }
        if ("closed".equalsIgnoreCase(status)) {
            closedItems++;
        }
        if ("flagged".equalsIgnoreCase(moderation)) {
            flaggedItems++;
        }
        if ("spam".equalsIgnoreCase(moderation)) {
            spamItems++;
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Items | Admin</title>
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
    <div class="mx-auto max-w-7xl px-6 py-10"><% request.setAttribute("pageTitle", "Item Moderation");
        String actions = "<a href=\"" + contextPath + "/admin/items/ledger\" class=\"rounded-xl border border-sky-700 bg-sky-700 px-4 py-2 text-sm font-semibold text-white\">Open Ledger</a>";
        actions += "<a href=\"" + contextPath + "/admin/locations/new\" class=\"rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100 ml-2\">Add Location</a>";
        request.setAttribute("pageActionsHtml", actions); %>
        <%@ include file="/components/admin/header.jsp" %>
        <% if (flashSuccess != null && !flashSuccess.isBlank()) { %>
        <div class="mt-6 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm font-medium text-emerald-700"><%= escapeHtml(flashSuccess) %>
        </div>
        <% } %> <% if (flashError != null && !flashError.isBlank()) { %>
        <div class="mt-6 rounded-2xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm font-medium text-rose-700"><%= escapeHtml(flashError) %>
        </div>
        <% } %>
        <section class="mt-6 grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">All Items</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= items.size() %>
                </p></article>
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Open</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= openItems %>
                </p></article>
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Flagged</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= flaggedItems %>
                </p></article>
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Spam / Closed</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= spamItems + closedItems %>
                </p></article>
        </section>
        <section class="mt-6 rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
            <div class="flex flex-wrap items-end justify-between gap-4">
                <div><h2 class="text-2xl font-bold tracking-tight">Inventory ledger</h2>
                    <p class="mt-1 text-sm text-slate-600">Use moderation actions to close, reopen, flag, or mark
                        spam.</p></div>
                <div class="flex flex-wrap gap-2">
                    <button class="rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100">
                        Filter
                    </button>
                    <button class="rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100">
                        Export
                    </button>
                </div>
            </div>
            <div class="mt-6 overflow-x-auto rounded-2xl border border-slate-200">
                <table class="min-w-full divide-y divide-slate-200 text-sm">
                    <thead class="bg-slate-50">
                    <tr class="text-left text-xs font-semibold uppercase tracking-[0.15em] text-slate-500">
                        <th class="px-4 py-3">Item</th>
                        <th class="px-4 py-3">Reporter</th>
                        <th class="px-4 py-3">Status</th>
                        <th class="px-4 py-3">Moderation</th>
                        <th class="px-4 py-3">Action</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 bg-white"><% for (AdminItemView item : items) { %>
                    <tr class="align-top hover:bg-slate-50">
                        <td class="px-4 py-4"><p class="font-semibold text-slate-900"><%= escapeHtml(item.getTitle()) %>
                        </p>
                            <p class="mt-1 text-xs text-slate-500">ID: <%= item.getItemId() %>
                                | <%= escapeHtml(item.getType()) %>
                            </p>
                            <p class="text-xs text-slate-500">Category: <%= escapeHtml(item.getCategory()) %>
                            </p>
                            <p class="text-xs text-slate-500">Location: <%= escapeHtml(item.getLocationName()) %>
                            </p>
                            <p class="text-xs text-slate-500">Created: <%= escapeHtml(item.getCreatedAt()) %>
                            </p></td>
                        <td class="px-4 py-4 text-slate-700"><%= escapeHtml(item.getReporterUsername()) %>
                        </td>
                        <td class="px-4 py-4"><span
                                class="rounded-full border border-slate-300 bg-slate-50 px-3 py-1 text-xs font-semibold text-slate-700"><%= escapeHtml(item.getStatus()) %></span>
                        </td>
                        <td class="px-4 py-4"><span
                                class="rounded-full border border-slate-300 bg-slate-50 px-3 py-1 text-xs font-semibold text-slate-700"><%= escapeHtml(item.getModerationStatus()) %></span>
                        </td>
                        <td class="px-4 py-4">
                            <form method="post" action="<%= contextPath %>/admin/items/moderate"
                                  class="flex flex-wrap items-center gap-2"><input type="hidden" name="itemId"
                                                                                   value="<%= item.getItemId() %>">
                                <select name="action"
                                        class="rounded-xl border border-slate-300 px-3 py-2 text-xs outline-none ring-sky-500 focus:ring-2">
                                    <option value="approve">Approve</option>
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
                        </td>
                    </tr>
                    <% } %> <% if (items.isEmpty()) { %>
                    <tr>
                        <td colspan="5" class="px-4 py-10 text-center text-sm text-slate-500">No item records
                            available.
                        </td>
                    </tr>
                    <% } %></tbody>
                </table>
            </div>
        </section>
        <%@ include file="/components/footer.jsp" %>
    </div>
</main>
</body>
</html>
