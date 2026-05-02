<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.landf.features.admin.AdminLocationView" %>
<%!
    private String escapeHtml(String value) {
        if (value == null) {
            return "";
        }

        return value
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
%>
<%
    List<AdminLocationView> locations = (List<AdminLocationView>) request.getAttribute("locations");
    String activeSection = String.valueOf(request.getAttribute("activeSection"));
    String locationScope = String.valueOf(request.getAttribute("locationScope"));
    String authUsername = (String) request.getAttribute("authUsername");
    String flashSuccess = (String) request.getAttribute("flashSuccess");
    String flashError = (String) request.getAttribute("flashError");
    String contextPath = request.getContextPath();

    if (locations == null) {
        locations = List.of();
    }

    boolean pendingOnly = "pending".equalsIgnoreCase(locationScope);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Locations | Admin</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: linear-gradient(170deg, #eff6ff 0%, #f8fafc 48%, #e2e8f0 100%); }
        h1, h2, h3 { font-family: 'Manrope', sans-serif; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
    </style>

</head>
<body class="min-h-screen text-slate-900">
<%@ include file="/components/admin/sidebar.jsp" %>
<main class="ml-64 min-h-screen flex flex-col">
    <div class="mx-auto max-w-7xl px-6 py-10">
    <%
        request.setAttribute("pageTitle", "Location Stewardship");
        String actions = "";
        actions += "<a href=\"" + contextPath + "/admin/locations\" class=\"rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold\">All Locations</a>";
        actions += "<a href=\"" + contextPath + "/admin/locations/pending\" class=\"rounded-xl border px-4 py-2 text-sm font-semibold ml-2\">Pending Queue</a>";
        actions += "<a href=\"" + contextPath + "/admin/locations/new\" class=\"rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100 ml-2\">Add Location</a>";
        request.setAttribute("pageActionsHtml", actions);
    %>
    <%@ include file="/components/admin/header.jsp" %>

    <% if (flashSuccess != null && !flashSuccess.isBlank()) { %>
    <div class="mt-6 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm font-medium text-emerald-700"><%= escapeHtml(flashSuccess) %></div>
    <% } %>

    <% if (flashError != null && !flashError.isBlank()) { %>
    <div class="mt-6 rounded-2xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm font-medium text-rose-700"><%= escapeHtml(flashError) %></div>
    <% } %>

    <section class="mt-6 grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
        <article class="rounded-2xl border border-slate-200 bg-white p-5">
            <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Visible Locations</p>
            <p class="mt-3 text-4xl font-bold text-slate-900"><%= locations.size() %></p>
        </article>
        <article class="rounded-2xl border border-slate-200 bg-white p-5">
            <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Mode</p>
            <p class="mt-3 text-2xl font-bold text-slate-900"><%= pendingOnly ? "Pending" : "All" %></p>
        </article>
        <article class="rounded-2xl border border-slate-200 bg-white p-5">
            <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Coordinates</p>
            <p class="mt-3 text-2xl font-bold text-slate-900">Lat / Lon</p>
        </article>
        <article class="rounded-2xl border border-slate-200 bg-white p-5">
            <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Workflow</p>
            <p class="mt-3 text-2xl font-bold text-slate-900">Review</p>
        </article>
    </section>

    <section class="mt-6 rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
        <div class="flex flex-wrap items-end justify-between gap-4">
            <div>
                <h2 class="text-2xl font-bold tracking-tight"><%= pendingOnly ? "Pending submissions" : "All registered locations" %></h2>
                <p class="mt-1 text-sm text-slate-600"><%= pendingOnly ? "Approve or reject new location requests." : "Operational overview of every location in the ledger." %></p>
            </div>
            <a href="<%= contextPath %>/admin/locations/new" class="rounded-xl border border-sky-700 bg-sky-700 px-4 py-2 text-sm font-semibold text-white">New Location</a>
        </div>

        <div class="mt-6 grid gap-4 lg:grid-cols-2">
            <% for (AdminLocationView location : locations) { %>
            <article class="rounded-3xl border border-slate-200 bg-slate-50 p-5 shadow-sm">
                <div class="flex flex-wrap items-start justify-between gap-3">
                    <div>
                        <h3 class="text-xl font-bold text-slate-900"><%= escapeHtml(location.getName()) %></h3>
                        <p class="mt-1 text-sm text-slate-600">Location ID <%= location.getLocationId() %> | Created by <%= escapeHtml(location.getCreatedBy()) %></p>
                    </div>
                    <span class="rounded-full border border-slate-300 bg-white px-3 py-1 text-xs font-semibold text-slate-700"><%= escapeHtml(location.getStatus()) %></span>
                </div>

                <div class="mt-4 grid gap-3 sm:grid-cols-2">
                    <div class="rounded-2xl bg-white p-4">
                        <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Latitude</p>
                        <p class="mt-2 text-lg font-bold text-slate-900"><%= location.getLatitude() %></p>
                    </div>
                    <div class="rounded-2xl bg-white p-4">
                        <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Longitude</p>
                        <p class="mt-2 text-lg font-bold text-slate-900"><%= location.getLongitude() %></p>
                    </div>
                </div>

                <div class="mt-4 space-y-1 text-sm text-slate-600">
                    <p>Created: <%= escapeHtml(location.getCreatedAt()) %></p>
                    <p>Reviewed: <%= escapeHtml(location.getReviewedAt()) %></p>
                    <p>Reviewer: <%= escapeHtml(location.getReviewedBy()) %></p>
                </div>

                <% if (location.getReviewNotes() != null && !location.getReviewNotes().isBlank()) { %>
                <div class="mt-4 rounded-2xl bg-white p-4 text-sm text-slate-600">
                    <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Review notes</p>
                    <p class="mt-2"><%= escapeHtml(location.getReviewNotes()) %></p>
                </div>
                <% } %>

                <% if (pendingOnly) { %>
                <form method="post" action="<%= contextPath %>/admin/locations/review" class="mt-5 space-y-3">
                    <input type="hidden" name="locationId" value="<%= location.getLocationId() %>">
                    <input type="text" name="notes" maxlength="255" placeholder="Review note"
                           class="w-full rounded-xl border border-slate-300 px-4 py-3 text-sm outline-none ring-sky-500 focus:ring-2">
                    <div class="flex flex-wrap gap-2">
                        <button type="submit" name="decision" value="approved" class="rounded-xl border border-emerald-600 bg-emerald-600 px-4 py-2 text-sm font-semibold text-white">Approve</button>
                        <button type="submit" name="decision" value="rejected" class="rounded-xl border border-rose-600 bg-rose-600 px-4 py-2 text-sm font-semibold text-white">Reject</button>
                    </div>
                </form>
                <% } %>
            </article>
            <% } %>

            <% if (locations.isEmpty()) { %>
            <div class="col-span-full rounded-3xl border border-dashed border-slate-300 bg-slate-50 px-6 py-12 text-center text-sm text-slate-500">
                No location records available.
            </div>
            <% } %>
        </div>
</section>
    <%@ include file="/components/footer.jsp" %>
    </div>
</main>
</body>
</html>
