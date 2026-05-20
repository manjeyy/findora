<%@ page import="java.util.List" %>
<%@ page import="com.landf.features.admin.AdminClaimView" %>
<%
    request.setAttribute("activeSection", "claims");
    request.setAttribute("sectionLabel", "Claims Console");
    request.setAttribute("pageTitle", "Claims   ");
    request.setAttribute("searchPlaceholder", "Search claims, users, or items...");
    request.setAttribute("pageActionsHtml", "<div class=\"flex gap-2 bg-surface-container-low p-1 rounded-lg\">" + "<button class=\"px-4 py-2 bg-surface-container-lowest text-primary font-semibold rounded-md shadow-sm text-sm\">All Requests</button>" + "<button class=\"px-4 py-2 text-on-surface-variant font-medium rounded-md text-sm hover:bg-white/50 transition-colors\">Pending Review</button>" + "<button class=\"px-4 py-2 text-on-surface-variant font-medium rounded-md text-sm hover:bg-white/50 transition-colors\">Resolved</button>" + "</div>");
    List<AdminClaimView> claims = (List<AdminClaimView>) request.getAttribute("claims");
    if (claims == null) {
        claims = List.of();
    }
%>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <jsp:include page="/components/head.jsp" />
    <title>Claims Management | Findora</title>
</head>
<body class="text-slate-900">
    <jsp:include page="/components/location-admin/layout_start.jsp" />
        <section class="p-8 space-y-6">
            <div class="flex items-end justify-between gap-4">
                <div><h1 class="text-3xl font-black tracking-tight">Claims   </h1> <p
                    class="mt-1 text-sm text-slate-500">Verification requests for items in this location only.</p></div>
                <div
                    class="rounded-full bg-slate-100 px-4 py-2 text-sm font-semibold text-slate-700"><%= claims.size() %> claims
                </div>
            </div>
            <div class="rounded-3xl bg-white border border-slate-200 overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-left">
                        <thead class="bg-slate-50 text-[10px] uppercase tracking-[0.2em] text-slate-500">
                        <tr>
                            <th class="px-6 py-4">Item</th>
                            <th class="px-6 py-4">Claimant</th>
                            <th class="px-6 py-4">Status</th>
                            <th class="px-6 py-4">Proof</th>
                            <th class="px-6 py-4 text-right">Decision</th>
                        </tr>
                        </thead>
                        <tbody> <% for (AdminClaimView claim : claims) { %>
                        <tr class="border-t border-slate-100 hover:bg-slate-50/70">
                            <td class="px-6 py-5"><p
                                class="font-semibold text-slate-900"><%= claim.getItemTitle() %></p> <p
                                class="text-xs text-slate-500">#<%= claim.getClaimId() %> · <%= claim.getItemType() %> ·
                                Item #<%= claim.getItemId() %></p></td>
                            <td class="px-6 py-5 text-sm text-slate-600"><%= claim.getClaimantUsername() %></td>
                            <td class="px-6 py-5 text-sm text-slate-600"><%= claim.getStatus() %></td>
                            <td class="px-6 py-5 text-sm text-slate-600"><%= claim.getProof() %></td>
                            <td class="px-6 py-5">
                                <form class="flex justify-end gap-2" method="post"
                                      action="<%= request.getContextPath() %>/location-admin/claims/review"><input
                                    name="claimId" type="hidden" value="<%= claim.getClaimId() %>"/> <input name="notes"
                                                                                                            type="hidden"
                                                                                                            value="Location admin review"/>
                                    <button
                                        class="rounded-lg border border-emerald-200 px-3 py-2 text-xs font-semibold text-emerald-700"
                                        name="decision" value="approved" type="submit">Approve
                                    </button>
                                    <button
                                        class="rounded-lg border border-red-200 px-3 py-2 text-xs font-semibold text-red-700"
                                        name="decision" value="rejected" type="submit">Reject
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <% } %> </tbody>
                    </table>
                </div>
            </div>
        </section>
    <jsp:include page="/components/location-admin/layout_end.jsp" />
    </body>
    </html>