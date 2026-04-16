<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.landf.features.admin.AdminDashboardStats" %>
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

    private String navClass(String activeSection, String target) {
        if (target.equals(activeSection)) {
            return "rounded-lg border border-sky-700 bg-sky-700 px-3 py-2 text-xs font-semibold text-white";
        }

        return "rounded-lg border border-slate-300 bg-white px-3 py-2 text-xs font-semibold text-slate-700 hover:bg-slate-100";
    }
%>
<%
    AdminDashboardStats stats = (AdminDashboardStats) request.getAttribute("stats");
    if (stats == null) {
        stats = new AdminDashboardStats(0, 0, 0, 0, 0, 0, 0);
    }

    String activeSection = (String) request.getAttribute("activeSection");
    if (activeSection == null) {
        activeSection = "dashboard";
    }

    String authUsername = (String) request.getAttribute("authUsername");
    String flashSuccess = (String) request.getAttribute("flashSuccess");
    String flashError = (String) request.getAttribute("flashError");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Lost and Found</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Space Grotesk', sans-serif;
            background-image: linear-gradient(170deg, #eff6ff 0%, #f8fafc 55%, #e2e8f0 100%);
        }
    </style>
</head>
<body class="min-h-screen text-slate-900">
<main class="mx-auto max-w-6xl px-6 py-10">
    <header class="rounded-2xl border border-slate-200 bg-white px-6 py-5">
        <div class="flex flex-wrap items-center justify-between gap-4">
            <div>
                <p class="text-xs font-semibold uppercase tracking-[0.2em] text-sky-700">Admin Console</p>
                <h1 class="mt-1 text-2xl font-bold">Lost &amp; Found Control Center</h1>
                <p class="mt-1 text-sm text-slate-600">Signed in as <span class="font-semibold"><%= escapeHtml(authUsername) %></span></p>
            </div>
            <a href="<%= request.getContextPath() %>/auth/logout"
               class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100">
                Logout
            </a>
        </div>
        <nav class="mt-4 flex flex-wrap gap-2">
            <a href="<%= request.getContextPath() %>/admin/dashboard" class="<%= navClass(activeSection, "dashboard") %>">Dashboard</a>
            <a href="<%= request.getContextPath() %>/admin/locations" class="<%= navClass(activeSection, "locations") %>">Locations</a>
            <a href="<%= request.getContextPath() %>/admin/claims" class="<%= navClass(activeSection, "claims") %>">Claims</a>
            <a href="<%= request.getContextPath() %>/admin/items" class="<%= navClass(activeSection, "items") %>">Items</a>
            <a href="<%= request.getContextPath() %>/admin/users" class="<%= navClass(activeSection, "users") %>">Users</a>
            <a href="<%= request.getContextPath() %>/admin/reports" class="<%= navClass(activeSection, "reports") %>">Reports</a>
        </nav>
    </header>

    <% if (flashSuccess != null && !flashSuccess.isBlank()) { %>
    <div class="mt-6 rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm font-medium text-emerald-700">
        <%= escapeHtml(flashSuccess) %>
    </div>
    <% } %>

    <% if (flashError != null && !flashError.isBlank()) { %>
    <div class="mt-6 rounded-xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm font-medium text-rose-700">
        <%= escapeHtml(flashError) %>
    </div>
    <% } %>

    <section class="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <article class="rounded-xl border border-slate-200 bg-white p-4">
            <p class="text-xs font-semibold uppercase tracking-[0.16em] text-slate-500">Pending Locations</p>
            <p class="mt-2 text-3xl font-bold text-slate-900"><%= stats.getPendingLocations() %></p>
        </article>
        <article class="rounded-xl border border-slate-200 bg-white p-4">
            <p class="text-xs font-semibold uppercase tracking-[0.16em] text-slate-500">Pending Claims</p>
            <p class="mt-2 text-3xl font-bold text-slate-900"><%= stats.getPendingClaims() %></p>
        </article>
        <article class="rounded-xl border border-slate-200 bg-white p-4">
            <p class="text-xs font-semibold uppercase tracking-[0.16em] text-slate-500">Pending Reports</p>
            <p class="mt-2 text-3xl font-bold text-slate-900"><%= stats.getPendingReports() %></p>
        </article>
        <article class="rounded-xl border border-slate-200 bg-white p-4">
            <p class="text-xs font-semibold uppercase tracking-[0.16em] text-slate-500">Open Items</p>
            <p class="mt-2 text-3xl font-bold text-slate-900"><%= stats.getOpenItems() %></p>
        </article>
    </section>

    <section class="mt-4 grid gap-4 sm:grid-cols-3">
        <article class="rounded-xl border border-slate-200 bg-white p-4">
            <p class="text-xs font-semibold uppercase tracking-[0.16em] text-slate-500">Total Users</p>
            <p class="mt-2 text-2xl font-bold text-slate-900"><%= stats.getTotalUsers() %></p>
        </article>
        <article class="rounded-xl border border-slate-200 bg-white p-4">
            <p class="text-xs font-semibold uppercase tracking-[0.16em] text-slate-500">Suspended Users</p>
            <p class="mt-2 text-2xl font-bold text-slate-900"><%= stats.getSuspendedUsers() %></p>
        </article>
        <article class="rounded-xl border border-slate-200 bg-white p-4">
            <p class="text-xs font-semibold uppercase tracking-[0.16em] text-slate-500">Successful Recoveries</p>
            <p class="mt-2 text-2xl font-bold text-slate-900"><%= stats.getTotalRecoveries() %></p>
        </article>
    </section>

    <section class="mt-6 rounded-xl border border-slate-200 bg-white p-5">
        <h2 class="text-lg font-semibold">Admin Scope Implemented</h2>
        <p class="mt-2 text-sm text-slate-600">
            This panel supports location approval, claim verification, report moderation, item moderation,
            and user management with points/reputation updates for approved and rejected claim/report workflows.
        </p>
    </section>
</main>
</body>
</html>
