<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.landf.features.admin.AdminClaimView" %>
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
    List<AdminClaimView> claims = (List<AdminClaimView>) request.getAttribute("claims");
    String authUsername = (String) request.getAttribute("authUsername");
    String flashSuccess = (String) request.getAttribute("flashSuccess");
    String flashError = (String) request.getAttribute("flashError");
    String contextPath = request.getContextPath();

    if (claims == null) {
        claims = List.of();
    }

    int pendingClaims = 0;
    for (AdminClaimView claim : claims) {
        if ("pending".equalsIgnoreCase(claim.getStatus())) {
            pendingClaims++;
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Claims | Admin</title>
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
        request.setAttribute("pageTitle", "Claim Verification Ledger");
        String actions = "<a href=\"" + contextPath + "/admin/claims\" class=\"rounded-xl border border-sky-700 bg-sky-700 px-4 py-2 text-sm font-semibold text-white\">All Claims</a>";
        actions += "<a href=\"" + contextPath + "/admin/items/ledger\" class=\"rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100 ml-2\">Item Ledger</a>";
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
            <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Claims</p>
            <p class="mt-3 text-4xl font-bold text-slate-900"><%= claims.size() %></p>
        </article>
        <article class="rounded-2xl border border-slate-200 bg-white p-5">
            <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Pending Review</p>
            <p class="mt-3 text-4xl font-bold text-slate-900"><%= pendingClaims %></p>
        </article>
        <article class="rounded-2xl border border-slate-200 bg-white p-5">
            <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Resolved</p>
            <p class="mt-3 text-4xl font-bold text-slate-900"><%= claims.size() - pendingClaims %></p>
        </article>
        <article class="rounded-2xl border border-slate-200 bg-white p-5">
            <p class="text-xs font-semibold uppercase tracking-[0.18em] text-slate-500">Workflow</p>
            <p class="mt-3 text-4xl font-bold text-slate-900">Approve</p>
        </article>
    </section>

    <section class="mt-6 rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
        <div class="flex flex-wrap items-end justify-between gap-4">
            <div>
                <h2 class="text-2xl font-bold tracking-tight">Claims under review</h2>
                <p class="mt-1 text-sm text-slate-600">Open a proof block, then approve or reject the claim from the same row.</p>
            </div>
        </div>

        <div class="mt-6 overflow-x-auto rounded-2xl border border-slate-200">
            <table class="min-w-full divide-y divide-slate-200 text-sm">
                <thead class="bg-slate-50">
                <tr class="text-left text-xs font-semibold uppercase tracking-[0.15em] text-slate-500">
                    <th class="px-4 py-3">Claim</th>
                    <th class="px-4 py-3">Proof</th>
                    <th class="px-4 py-3">Status</th>
                    <th class="px-4 py-3">Review</th>
                </tr>
                </thead>
                <tbody class="divide-y divide-slate-100 bg-white">
                <% for (AdminClaimView claim : claims) { %>
                <tr class="align-top hover:bg-slate-50">
                    <td class="px-4 py-4">
                        <p class="font-semibold text-slate-900"><%= escapeHtml(claim.getItemTitle()) %></p>
                        <p class="mt-1 text-xs text-slate-500">Claim ID: <%= claim.getClaimId() %></p>
                        <p class="text-xs text-slate-500">Item ID: <%= claim.getItemId() %> | <%= escapeHtml(claim.getItemType()) %></p>
                        <p class="text-xs text-slate-500">Item Status: <%= escapeHtml(claim.getItemStatus()) %></p>
                        <p class="text-xs text-slate-500">Claimant: <%= escapeHtml(claim.getClaimantUsername()) %></p>
                        <p class="text-xs text-slate-500">Submitted: <%= escapeHtml(claim.getCreatedAt()) %></p>
                    </td>
                    <td class="px-4 py-4">
                        <details class="rounded-2xl border border-slate-200 bg-slate-50 p-3">
                            <summary class="cursor-pointer text-xs font-semibold uppercase tracking-[0.15em] text-slate-700">Ownership proof</summary>
                            <p class="mt-3 whitespace-pre-line text-xs leading-6 text-slate-600"><%= escapeHtml(claim.getProof()) %></p>
                        </details>
                        <% if (claim.getIdentifiers() != null && !claim.getIdentifiers().isBlank()) { %>
                        <p class="mt-3 text-xs text-slate-600"><span class="font-semibold">Identifiers:</span> <%= escapeHtml(claim.getIdentifiers()) %></p>
                        <% } %>
                    </td>
                    <td class="px-4 py-4">
                        <span class="rounded-full border border-slate-300 bg-slate-50 px-3 py-1 text-xs font-semibold text-slate-700"><%= escapeHtml(claim.getStatus()) %></span>
                        <% if (claim.getReviewedBy() != null && !claim.getReviewedBy().isBlank()) { %>
                        <p class="mt-2 text-xs text-slate-500">Reviewed by <%= escapeHtml(claim.getReviewedBy()) %></p>
                        <% } %>
                        <% if (claim.getReviewNotes() != null && !claim.getReviewNotes().isBlank()) { %>
                        <p class="mt-1 text-xs text-slate-600"><%= escapeHtml(claim.getReviewNotes()) %></p>
                        <% } %>
                    </td>
                    <td class="px-4 py-4">
                        <% if ("pending".equalsIgnoreCase(claim.getStatus())) { %>
                        <form method="post" action="<%= contextPath %>/admin/claims/review" class="space-y-2">
                            <input type="hidden" name="claimId" value="<%= claim.getClaimId() %>">
                            <input type="text" name="notes" maxlength="255" placeholder="Review note"
                                   class="w-full rounded-xl border border-slate-300 px-4 py-3 text-xs outline-none ring-sky-500 focus:ring-2">
                            <div class="flex flex-wrap gap-2">
                                <button type="submit" name="decision" value="approved" class="rounded-xl border border-emerald-600 bg-emerald-600 px-4 py-2 text-xs font-semibold text-white">Approve</button>
                                <button type="submit" name="decision" value="rejected" class="rounded-xl border border-rose-600 bg-rose-600 px-4 py-2 text-xs font-semibold text-white">Reject</button>
                            </div>
                        </form>
                        <% } else { %>
                        <span class="text-xs text-slate-500">Already reviewed</span>
                        <% } %>
                    </td>
                </tr>
                <% } %>
                <% if (claims.isEmpty()) { %>
                <tr>
                    <td colspan="4" class="px-4 py-10 text-center text-sm text-slate-500">No claim records available.</td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
</section>
    <%@ include file="/components/footer.jsp" %>
    </div>
</main>
</body>
</html>
