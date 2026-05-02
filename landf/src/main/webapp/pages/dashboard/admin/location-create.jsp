<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    String authUsername = (String) request.getAttribute("authUsername");
    String flashSuccess = (String) request.getAttribute("flashSuccess");
    String flashError = (String) request.getAttribute("flashError");
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Location | Admin</title>
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
        request.setAttribute("pageTitle", "Add New Location");
        String actions = "<a href=\"" + contextPath + "/admin/locations/pending\" class=\"rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100\">Back to Queue</a>";
        request.setAttribute("pageActionsHtml", actions);
    %>
    <%@ include file="/components/admin/header.jsp" %>

    <% if (flashSuccess != null && !flashSuccess.isBlank()) { %>
    <div class="mt-6 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm font-medium text-emerald-700"><%= escapeHtml(flashSuccess) %></div>
    <% } %>

    <% if (flashError != null && !flashError.isBlank()) { %>
    <div class="mt-6 rounded-2xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm font-medium text-rose-700"><%= escapeHtml(flashError) %></div>
    <% } %>

    <section class="mt-6 grid gap-6 lg:grid-cols-12">
        <div class="lg:col-span-7 rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
            <div class="mb-5">
                <h2 class="text-2xl font-bold tracking-tight">Location details</h2>
                <p class="mt-1 text-sm text-slate-600">Enter the new address marker and coordinates for moderation.</p>
            </div>
            <form method="post" action="<%= contextPath %>/admin/locations/create" class="space-y-4">
                <div>
                    <label class="mb-1 block text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Location name</label>
                    <input name="name" type="text" required maxlength="120"
                           class="w-full rounded-2xl border border-slate-300 px-4 py-3 text-sm outline-none ring-sky-500 focus:ring-2"
                           placeholder="e.g. Main Campus Library">
                </div>
                <div class="grid gap-4 sm:grid-cols-2">
                    <div>
                        <label class="mb-1 block text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Latitude</label>
                        <input name="latitude" type="number" step="any" required
                               class="w-full rounded-2xl border border-slate-300 px-4 py-3 text-sm outline-none ring-sky-500 focus:ring-2"
                               placeholder="41.3083">
                    </div>
                    <div>
                        <label class="mb-1 block text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Longitude</label>
                        <input name="longitude" type="number" step="any" required
                               class="w-full rounded-2xl border border-slate-300 px-4 py-3 text-sm outline-none ring-sky-500 focus:ring-2"
                               placeholder="72.9279">
                    </div>
                </div>
                <div class="flex flex-wrap gap-2 pt-2">
                    <button type="submit" class="rounded-xl border border-sky-700 bg-sky-700 px-5 py-3 text-sm font-semibold text-white">Submit for Review</button>
                    <a href="<%= contextPath %>/admin/locations" class="rounded-xl border border-slate-300 bg-white px-5 py-3 text-sm font-semibold text-slate-700 hover:bg-slate-100">Cancel</a>
                </div>
            </form>
        </div>

        <aside class="lg:col-span-5 rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
            <h2 class="text-2xl font-bold tracking-tight">Review flow</h2>
            <div class="mt-4 space-y-3 text-sm text-slate-600">
                <p>1. Provide the location name and accurate coordinates.</p>
                <p>2. The system stores the record as pending.</p>
                <p>3. Reviewers approve or reject it from the pending queue.</p>
            </div>
            <div class="mt-6 rounded-2xl bg-slate-50 p-4 text-sm text-slate-700">
                <p class="font-semibold">Operational note</p>
                <p class="mt-1">Keep names concise and coordinates precise so moderation stays consistent.</p>
            </div>
        </aside>
</section>
    <%@ include file="/components/footer.jsp" %>
    </div>
</main>
</body>
</html>
