<%@ page import="java.util.List" %>
<%@ page import="com.landf.features.items.ItemModel" %>
<%
    request.setAttribute("activeSection", "items");
    request.setAttribute("sectionLabel", "Location Item Ledger");
    request.setAttribute("pageTitle", "Location Item Ledger");
    request.setAttribute("searchPlaceholder", "Search local items...");
    List<ItemModel> items = (List<ItemModel>) request.getAttribute("locationItems");
    if (items == null) {
        items = List.of();
    }
%>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <jsp:include page="/components/head.jsp" />
    <title>Location Item Ledger | Findora</title>
</head>
<body class="text-slate-900">
<jsp:include page="/components/location-admin/layout_start.jsp" />
    <section class="p-8 space-y-6">
        <div class="flex items-end justify-between gap-4">
            <div>
                <h1 class="text-3xl font-black tracking-tight">Location Item Ledger</h1>
                <p class="mt-1 text-sm text-slate-500">Approve, flag, or close items tied to this location only.</p>
            </div>
            <div class="rounded-full bg-slate-100 px-4 py-2 text-sm font-semibold text-slate-700"><%= items.size() %> items</div>
        </div>
        <div class="rounded-3xl bg-white border border-slate-200 overflow-hidden">
            <div class="overflow-x-auto">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 text-[10px] uppercase tracking-[0.2em] text-slate-500">
                    <tr>
                        <th class="px-6 py-4">Item</th>
                        <th class="px-6 py-4">Status</th>
                        <th class="px-6 py-4">Moderation</th>
                        <th class="px-6 py-4">Reporter</th>
                        <th class="px-6 py-4 text-right">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (ItemModel item : items) { %>
                    <tr class="border-t border-slate-100 hover:bg-slate-50/70">
                        <td class="px-6 py-5">
                            <p class="font-semibold text-slate-900"><%= item.getTitle() %></p>
                            <p class="text-xs text-slate-500">#<%= item.getItemId() %> · <%= item.getType() %> · <%= item.getLocationName() %></p>
                        </td>
                        <td class="px-6 py-5 text-sm text-slate-600"><%= item.getStatus() %></td>
                        <td class="px-6 py-5 text-sm text-slate-600"><%= item.getModerationStatus() %></td>
                        <td class="px-6 py-5 text-sm text-slate-600"><%= item.getUsername() %></td>
                        <td class="px-6 py-5">
                            <form class="flex justify-end gap-2" method="post" action="<%= request.getContextPath() %>/location-admin/items/moderate">
                                <input name="itemId" type="hidden" value="<%= item.getItemId() %>"/>
                                <button class="rounded-lg border border-emerald-200 px-3 py-2 text-xs font-semibold text-emerald-700" name="action" value="approve" type="submit">Approve</button>
                                <button class="rounded-lg border border-amber-200 px-3 py-2 text-xs font-semibold text-amber-700" name="action" value="flag" type="submit">Flag</button>
                                <button class="rounded-lg border border-red-200 px-3 py-2 text-xs font-semibold text-red-700" name="action" value="mark_spam" type="submit">Spam</button>
                                <button class="rounded-lg border border-slate-200 px-3 py-2 text-xs font-semibold text-slate-700" name="action" value="close" type="submit">Close</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</body>
