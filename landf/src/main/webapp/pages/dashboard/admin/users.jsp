<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.landf.features.admin.AdminUserView" %>
<%@ page import="com.landf.features.location.LocationModel" %>
<%!
    private String escapeHtml(String value) {
        if (value == null) {
            return "";
        }
        return value.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
%>
<% List<AdminUserView> users = (List<AdminUserView>) request.getAttribute("users");
    List<LocationModel> locations = (List<LocationModel>) request.getAttribute("locations");
    String authUsername = (String) request.getAttribute("authUsername");
    String flashSuccess = (String) request.getAttribute("flashSuccess");
    String flashError = (String) request.getAttribute("flashError");
    String contextPath = request.getContextPath();
    if (users == null) {
        users = List.of();
    }
    if (locations == null) {
        locations = List.of();
    }
    int suspendedUsers = 0;
    int adminUsers = 0;
    for (AdminUserView user : users) {
        if ("suspended".equalsIgnoreCase(user.getStatus())) {
            suspendedUsers++;
        }
        if ("admin".equalsIgnoreCase(user.getRole())) {
            adminUsers++;
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users | Admin</title>
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
    <div class="mx-auto max-w-7xl px-6 py-10"><% request.setAttribute("pageTitle", "User Stewardship");
        String actions = "<a href=\"" + contextPath + "/admin/dashboard\" class=\"rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100\">Back to Dashboard</a>";
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
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Users</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= users.size() %>
                </p></article>
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Administrators</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= adminUsers %>
                </p></article>
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Suspended</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= suspendedUsers %>
                </p></article>
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Focus</p>
                <p class="mt-3 text-4xl font-bold text-slate-900">Access</p></article>
        </section>
        <section class="mt-6 rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
            <div class="flex flex-wrap items-end justify-between gap-4">
                <div><h2 class="text-2xl font-bold tracking-tight">Account controls</h2>
                    <p class="mt-1 text-sm text-slate-600">Update the role and status inline, then commit the change
                        with one action.</p></div>
            </div>
            <div class="mt-6 overflow-x-auto rounded-2xl border border-slate-200">
                <table class="min-w-full divide-y divide-slate-200 text-sm">
                    <thead class="bg-slate-50">
                    <tr class="text-left text-xs font-semibold uppercase tracking-[0.15em] text-slate-500">
                        <th class="px-4 py-3">User</th>
                        <th class="px-4 py-3">Role &amp; Status</th>
                        <th class="px-4 py-3">Metrics</th>
                        <th class="px-4 py-3">Update</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 bg-white"><% for (AdminUserView user : users) { %>
                    <tr class="align-top hover:bg-slate-50">
                        <td class="px-4 py-4"><p
                                class="font-semibold text-slate-900"><%= escapeHtml(user.getUsername()) %>
                        </p>
                            <p class="mt-1 text-xs text-slate-500">ID: <%= user.getUserId() %>
                            </p>
                            <p class="text-xs text-slate-500"><%= escapeHtml(user.getEmail()) %>
                            </p>
                            <p class="text-xs text-slate-500">Created: <%= escapeHtml(user.getCreatedAt()) %>
                            </p></td>
                        <td class="px-4 py-4"><p class="text-xs text-slate-600">Role: <span
                                class="font-semibold text-slate-900"><%= escapeHtml(user.getRole()) %></span></p>
                            <p class="mt-1 text-xs text-slate-600">Location ID: <span
                                    class="font-semibold text-slate-900"><%= user.getLocationId() == null ? "-" : user.getLocationId() %></span>
                            </p>
                            <p class="mt-1 text-xs text-slate-600">Status: <span
                                    class="font-semibold text-slate-900"><%= escapeHtml(user.getStatus()) %></span></p>
                            <p class="mt-1 text-xs text-slate-600">Trust: <span
                                    class="font-semibold text-slate-900"><%= escapeHtml(user.getTrustLevel()) %></span>
                            </p></td>
                        <td class="px-4 py-4"><p class="text-xs text-slate-600">Points: <span
                                class="font-semibold text-slate-900"><%= user.getPoints() %></span></p>
                            <p class="mt-1 text-xs text-slate-600">Reputation: <span
                                    class="font-semibold text-slate-900"><%= user.getReputationScore() %></span></p>
                        </td>
                        <td class="px-4 py-4">
                            <form method="post" action="<%= contextPath %>/admin/users/update"
                                  class="flex flex-wrap items-center gap-2"><input type="hidden" name="userId"
                                                                                   value="<%= user.getUserId() %>">
                                <select name="role"
                                        class="rounded-xl border border-slate-300 px-3 py-2 text-xs outline-none ring-sky-500 focus:ring-2">
                                    <option value="user" <%= "user".equalsIgnoreCase(user.getRole()) ? "selected" : "" %>>
                                        user
                                    </option>
                                    <option value="location_admin" <%= "location_admin".equalsIgnoreCase(user.getRole()) ? "selected" : "" %>>
                                        location_admin
                                    </option>
                                    <option value="admin" <%= "admin".equalsIgnoreCase(user.getRole()) ? "selected" : "" %>>
                                        admin
                                    </option>
                                </select> <select name="locationId"
                                                  class="rounded-xl border border-slate-300 px-3 py-2 text-xs outline-none ring-sky-500 focus:ring-2">
                                    <option value="">No location</option>
                                    <% for (LocationModel location : locations) { %>
                                    <option value="<%= location.getLocationId() %>" <%= user.getLocationId() != null && user.getLocationId() == location.getLocationId() ? "selected" : "" %>><%= escapeHtml(location.getName()) %>
                                        (#<%= location.getLocationId() %>)
                                    </option>
                                    <% } %></select> <select name="status"
                                                             class="rounded-xl border border-slate-300 px-3 py-2 text-xs outline-none ring-sky-500 focus:ring-2">
                                    <option value="active" <%= "active".equalsIgnoreCase(user.getStatus()) ? "selected" : "" %>>
                                        active
                                    </option>
                                    <option value="suspended" <%= "suspended".equalsIgnoreCase(user.getStatus()) ? "selected" : "" %>>
                                        suspended
                                    </option>
                                </select>
                                <button type="submit"
                                        class="rounded-xl border border-sky-700 bg-sky-700 px-4 py-2 text-xs font-semibold text-white">
                                    Save
                                </button>
                            </form>
                        </td>
                    </tr>
                    <% } %> <% if (users.isEmpty()) { %>
                    <tr>
                        <td colspan="4" class="px-4 py-10 text-center text-sm text-slate-500">No user records
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
