<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.landf.features.admin.AdminReportView" %>
<%! private String escapeHtml(String value) {
    if (value == null) {
        return "";
    }
    return value.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
}
%>
<% List<AdminReportView> reports = (List<AdminReportView>) request.getAttribute("reports");
    String authUsername = (String) request.getAttribute("authUsername");
    String flashSuccess = (String) request.getAttribute("flashSuccess");
    String flashError = (String) request.getAttribute("flashError");
    String contextPath = request.getContextPath();
    if (reports == null) {
        reports = List.of();
    }
    int pendingReports = 0;
    for (AdminReportView report : reports) {
        if ("pending".equalsIgnoreCase(report.getStatus())) {
            pendingReports++;
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports | Admin</title>
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
    <div class="mx-auto max-w-7xl px-6 py-10"><% request.setAttribute("pageTitle", "Reports & Moderation");
        String actions = "<a href=\"" + contextPath + "/admin/reports\" class=\"rounded-xl border border-sky-700 bg-sky-700 px-4 py-2 text-sm font-semibold text-white\">All Reports</a>";
        actions += "<a href=\"" + contextPath + "/admin/items/ledger\" class=\"rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100 ml-2\">Item Ledger</a>";
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
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Reports</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= reports.size() %>
                </p></article>
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Pending Review</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= pendingReports %>
                </p></article>
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Resolved</p>
                <p class="mt-3 text-4xl font-bold text-slate-900"><%= reports.size() - pendingReports %>
                </p></article>
            <article class="rounded-2xl border border-slate-200 bg-white p-5"><p
                    class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Focus</p>
                <p class="mt-3 text-4xl font-bold text-slate-900">Resolve</p></article>
        </section>
        <section class="mt-6 rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
            <div class="flex flex-wrap items-end justify-between gap-4">
                <div><h2 class="text-2xl font-bold tracking-tight">Report moderation queue</h2>
                    <p class="mt-1 text-sm text-slate-600">Inspect each report target and then resolve or reject it from
                        the same row.</p></div>
            </div>
            <div class="mt-6 overflow-x-auto rounded-2xl border border-slate-200">
                <table class="min-w-full divide-y divide-slate-200 text-sm">
                    <thead class="bg-slate-50">
                    <tr class="text-left text-xs font-semibold uppercase tracking-[0.15em] text-slate-500">
                        <th class="px-4 py-3">Report</th>
                        <th class="px-4 py-3">Target</th>
                        <th class="px-4 py-3">Status</th>
                        <th class="px-4 py-3">Review</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 bg-white"><% for (AdminReportView report : reports) { %>
                    <tr class="align-top hover:bg-slate-50">
                        <td class="px-4 py-4"><p
                                class="font-semibold text-slate-900"><%= escapeHtml(report.getReason()) %>
                        </p>
                            <p class="mt-1 text-xs text-slate-500">Report ID: <%= report.getReportId() %>
                            </p>
                            <p class="text-xs text-slate-500">Reporter: <%= escapeHtml(report.getReporterUsername()) %>
                            </p>
                            <p class="text-xs text-slate-500">Created: <%= escapeHtml(report.getCreatedAt()) %>
                            </p></td>
                        <td class="px-4 py-4"><p class="text-xs text-slate-600">Type: <span
                                class="font-semibold text-slate-900"><%= escapeHtml(report.getTargetType()) %></span>
                        </p>
                            <p class="mt-1 text-xs text-slate-600">Target ID: <span
                                    class="font-semibold text-slate-900"><%= report.getTargetId() %></span></p></td>
                        <td class="px-4 py-4"><span
                                class="rounded-full border border-slate-300 bg-slate-50 px-3 py-1 text-xs font-semibold text-slate-700"><%= escapeHtml(report.getStatus()) %></span> <% if (report.getReviewedBy() != null && !report.getReviewedBy().isBlank()) { %>
                            <p class="mt-2 text-xs text-slate-500">Reviewed by <%= escapeHtml(report.getReviewedBy()) %>
                            </p> <% } %> <% if (report.getReviewNotes() != null && !report.getReviewNotes().isBlank()) { %>
                            <p class="mt-1 text-xs text-slate-600"><%= escapeHtml(report.getReviewNotes()) %>
                            </p> <% } %></td>
                        <td class="px-4 py-4"><% if ("pending".equalsIgnoreCase(report.getStatus())) { %>
                            <form method="post" action="<%= contextPath %>/admin/reports/review" class="space-y-2">
                                <input type="hidden" name="reportId" value="<%= report.getReportId() %>"> <input
                                    type="text" name="notes" maxlength="255" placeholder="Review note"
                                    class="w-full rounded-xl border border-slate-300 px-4 py-3 text-xs outline-none ring-sky-500 focus:ring-2">
                                <div class="flex flex-wrap gap-2">
                                    <button type="submit" name="decision" value="resolved"
                                            class="rounded-xl border border-emerald-600 bg-emerald-600 px-4 py-2 text-xs font-semibold text-white">
                                        Resolve
                                    </button>
                                    <button type="submit" name="decision" value="rejected"
                                            class="rounded-xl border border-rose-600 bg-rose-600 px-4 py-2 text-xs font-semibold text-white">
                                        Reject
                                    </button>
                                </div>
                            </form>
                            <% } else { %> <span class="text-xs text-slate-500">Already reviewed</span> <% } %></td>
                    </tr>
                    <% } %> <% if (reports.isEmpty()) { %>
                    <tr>
                        <td colspan="4" class="px-4 py-10 text-center text-sm text-slate-500">No report records
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
