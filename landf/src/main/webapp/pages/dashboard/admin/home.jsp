<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.landf.features.admin.AdminDashboardStats" %>
<%
    AdminDashboardStats stats = (AdminDashboardStats) request.getAttribute("stats");
    String authUsername = (String) request.getAttribute("authUsername");

    if (stats == null) {
        stats = new AdminDashboardStats(0, 0, 0, 0, 0, 0, 0);
    }

    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Findora</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: linear-gradient(170deg, #eff6ff 0%, #f8fafc 48%, #e2e8f0 100%); }
        h1, h2, h3, .font-headline { font-family: 'Manrope', sans-serif; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
    </style>
</head>
<body class="min-h-screen text-slate-900">
<%@ include file="/components/admin/sidebar.jsp" %>
<main class="ml-64 min-h-screen flex flex-col">
    <div class="mx-auto max-w-7xl px-6 py-10">
    <%
        request.setAttribute("pageTitle", "Institutional Stewardship");
        String actions = "";
        actions += "<a href=\"" + contextPath + "/admin/locations/pending\" class=\"rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100\">Pending Locations</a>";
        actions += "<a href=\"" + contextPath + "/admin/locations/new\" class=\"rounded-xl border border-sky-700 bg-sky-700 px-4 py-2 text-sm font-semibold text-white ml-2\">Add Location</a>";
        actions += "<a href=\"" + contextPath + "/admin/items/ledger\" class=\"rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100 ml-2\">Item Ledger</a>";
        request.setAttribute("pageActionsHtml", actions);
    %>
    <%@ include file="/components/admin/header.jsp" %>

    <section class="mt-6 grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
        <article class="rounded-2xl border border-slate-200 bg-white p-5">
            <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Pending Locations</p>
            <p class="mt-3 text-4xl font-bold text-slate-900"><%= stats.getPendingLocations() %></p>
        </article>
        <article class="rounded-2xl border border-slate-200 bg-white p-5">
            <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Pending Claims</p>
            <p class="mt-3 text-4xl font-bold text-slate-900"><%= stats.getPendingClaims() %></p>
        </article>
        <article class="rounded-2xl border border-slate-200 bg-white p-5">
            <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Pending Reports</p>
            <p class="mt-3 text-4xl font-bold text-slate-900"><%= stats.getPendingReports() %></p>
        </article>
        <article class="rounded-2xl border border-slate-200 bg-white p-5">
            <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Open Items</p>
            <p class="mt-3 text-4xl font-bold text-slate-900"><%= stats.getOpenItems() %></p>
        </article>
    </section>

    <section class="mt-6 grid gap-6 lg:grid-cols-12">
        <div class="lg:col-span-7 rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
            <div class="flex items-end justify-between gap-4">
                <div>
                    <h2 class="text-2xl font-bold tracking-tight">Admin shortcuts</h2>
                    <p class="mt-1 text-sm text-slate-600">Jump to the highest-value moderation surfaces.</p>
                </div>
                <span class="rounded-full bg-sky-50 px-3 py-1 text-xs font-semibold text-sky-700">Overview</span>
            </div>
            <div class="mt-5 grid gap-4 md:grid-cols-2">
                <a href="<%= contextPath %>/admin/claims" class="rounded-2xl border border-slate-200 bg-slate-50 p-4 hover:border-sky-300 hover:bg-sky-50">
                    <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Claims Review</p>
                    <p class="mt-2 text-lg font-bold text-slate-900">Approve or reject claims</p>
                    <p class="mt-1 text-sm text-slate-600">Review proof, identifiers, and item ownership.</p>
                </a>
                <a href="<%= contextPath %>/admin/reports" class="rounded-2xl border border-slate-200 bg-slate-50 p-4 hover:border-sky-300 hover:bg-sky-50">
                    <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Reports</p>
                    <p class="mt-2 text-lg font-bold text-slate-900">Triage suspicious activity</p>
                    <p class="mt-1 text-sm text-slate-600">Handle moderation tickets and user-submitted reports.</p>
                </a>
                <a href="<%= contextPath %>/admin/items" class="rounded-2xl border border-slate-200 bg-slate-50 p-4 hover:border-sky-300 hover:bg-sky-50">
                    <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Items</p>
                    <p class="mt-2 text-lg font-bold text-slate-900">Manage inventory queue</p>
                    <p class="mt-1 text-sm text-slate-600">Close, flag, or reopen item records.</p>
                </a>
                <a href="<%= contextPath %>/admin/users" class="rounded-2xl border border-slate-200 bg-slate-50 p-4 hover:border-sky-300 hover:bg-sky-50">
                    <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Users</p>
                    <p class="mt-2 text-lg font-bold text-slate-900">Control roles and status</p>
                    <p class="mt-1 text-sm text-slate-600">Adjust permissions and suspension state safely.</p>
                </a>
            </div>
        </div>

        <div class="lg:col-span-5 rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
            <h2 class="text-2xl font-bold tracking-tight">Operational snapshot</h2>
            <div class="mt-5 space-y-4">
                <div class="rounded-2xl bg-slate-50 p-4">
                    <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Users</p>
                    <p class="mt-2 text-3xl font-bold text-slate-900"><%= stats.getTotalUsers() %></p>
                    <p class="mt-1 text-sm text-slate-600"><%= stats.getSuspendedUsers() %> suspended accounts</p>
                </div>
                <div class="rounded-2xl bg-slate-50 p-4">
                    <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Recoveries</p>
                    <p class="mt-2 text-3xl font-bold text-slate-900"><%= stats.getTotalRecoveries() %></p>
                    <p class="mt-1 text-sm text-slate-600">Approved claims converted into completed returns</p>
                </div>
                <div class="rounded-2xl bg-sky-50 p-4">
                    <p class="text-xs font-semibold uppercase tracking-[0.18em] text-sky-700">Action path</p>
                    <p class="mt-2 text-sm font-semibold text-slate-900">Start with pending locations, then route into item or claim moderation.</p>
                </div>
            </div>
        </div>
    </section>
    </div>
    <%@ include file="/components/footer.jsp" %>
</main>
</body>
</html>
