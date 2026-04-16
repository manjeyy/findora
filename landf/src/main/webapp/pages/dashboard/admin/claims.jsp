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

    private String navClass(String activeSection, String target) {
        if (target.equals(activeSection)) {
            return "rounded-lg border border-sky-700 bg-sky-700 px-3 py-2 text-xs font-semibold text-white";
        }

        return "rounded-lg border border-slate-300 bg-white px-3 py-2 text-xs font-semibold text-slate-700 hover:bg-slate-100";
    }
%>
<%
    List<AdminClaimView> claims = (List<AdminClaimView>) request.getAttribute("claims");
    String activeSection = (String) request.getAttribute("activeSection");
    String authUsername = (String) request.getAttribute("authUsername");
    String flashSuccess = (String) request.getAttribute("flashSuccess");
    String flashError = (String) request.getAttribute("flashError");

    if (claims == null) {
        claims = List.of();
    }

    if (activeSection == null) {
        activeSection = "claims";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Claims | Lost and Found</title>
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
                <h1 class="mt-1 text-2xl font-bold">Claim Verification</h1>
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

    <section class="mt-6 rounded-2xl border border-slate-200 bg-white p-5">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-slate-200 text-sm">
                <thead>
                <tr class="text-left text-xs font-semibold uppercase tracking-[0.15em] text-slate-500">
                    <th class="px-3 py-3">Claim</th>
                    <th class="px-3 py-3">Proof</th>
                    <th class="px-3 py-3">Status</th>
                    <th class="px-3 py-3">Review</th>
                </tr>
                </thead>
                <tbody class="divide-y divide-slate-100">
                <% for (AdminClaimView claim : claims) { %>
                <tr class="align-top">
                    <td class="px-3 py-3">
                        <p class="font-semibold text-slate-900"><%= escapeHtml(claim.getItemTitle()) %></p>
                        <p class="mt-1 text-xs text-slate-500">Claim ID: <%= claim.getClaimId() %></p>
                        <p class="text-xs text-slate-500">Item ID: <%= claim.getItemId() %> | Type: <%= escapeHtml(claim.getItemType()) %></p>
                        <p class="text-xs text-slate-500">Item Status: <%= escapeHtml(claim.getItemStatus()) %></p>
                        <p class="text-xs text-slate-500">Claimant: <%= escapeHtml(claim.getClaimantUsername()) %></p>
                        <p class="text-xs text-slate-500">Submitted: <%= escapeHtml(claim.getCreatedAt()) %></p>
                    </td>
                    <td class="px-3 py-3">
                        <details class="rounded-lg border border-slate-300 bg-slate-50 p-2">
                            <summary class="cursor-pointer text-xs font-semibold text-slate-700">Ownership Proof</summary>
                            <p class="mt-2 whitespace-pre-line text-xs text-slate-600"><%= escapeHtml(claim.getProof()) %></p>
                        </details>
                        <% if (claim.getIdentifiers() != null && !claim.getIdentifiers().isBlank()) { %>
                        <p class="mt-2 text-xs text-slate-600"><span class="font-semibold">Identifiers:</span> <%= escapeHtml(claim.getIdentifiers()) %></p>
                        <% } %>
                    </td>
                    <td class="px-3 py-3">
                        <span class="rounded-md border border-slate-300 bg-slate-50 px-2 py-1 text-xs font-semibold text-slate-700">
                            <%= escapeHtml(claim.getStatus()) %>
                        </span>
                        <% if (claim.getReviewedBy() != null && !claim.getReviewedBy().isBlank()) { %>
                        <p class="mt-2 text-xs text-slate-500">Reviewed by <%= escapeHtml(claim.getReviewedBy()) %></p>
                        <% } %>
                        <% if (claim.getReviewNotes() != null && !claim.getReviewNotes().isBlank()) { %>
                        <p class="mt-1 text-xs text-slate-600"><%= escapeHtml(claim.getReviewNotes()) %></p>
                        <% } %>
                    </td>
                    <td class="px-3 py-3">
                        <% if ("pending".equalsIgnoreCase(claim.getStatus())) { %>
                        <form method="post" action="<%= request.getContextPath() %>/admin/claims/review" class="space-y-2">
                            <input type="hidden" name="claimId" value="<%= claim.getClaimId() %>">
                            <input type="text" name="notes" maxlength="255" placeholder="Review note"
                                   class="w-full rounded-lg border border-slate-300 px-3 py-2 text-xs outline-none ring-sky-500 focus:ring-2">
                            <div class="flex gap-2">
                                <button type="submit" name="decision" value="approved"
                                        class="rounded-lg border border-emerald-600 bg-emerald-600 px-3 py-2 text-xs font-semibold text-white">
                                    Approve
                                </button>
                                <button type="submit" name="decision" value="rejected"
                                        class="rounded-lg border border-rose-600 bg-rose-600 px-3 py-2 text-xs font-semibold text-white">
                                    Reject
                                </button>
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
                    <td colspan="4" class="px-3 py-8 text-center text-sm text-slate-500">No claim records available.</td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </section>
</main>
</body>
</html>
