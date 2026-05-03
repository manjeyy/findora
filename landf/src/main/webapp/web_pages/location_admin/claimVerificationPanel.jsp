<%@ page import="java.util.List" %>
<%@ page import="com.landf.features.admin.AdminReportView" %>
<%
    request.setAttribute("activeSection", "reports");
    request.setAttribute("sectionLabel", "Location Reports");
    request.setAttribute("pageTitle", "Report Review");
    request.setAttribute("searchPlaceholder", "Search reports and targets...");
    List<AdminReportView> reports = (List<AdminReportView>) request.getAttribute("reports");
    if (reports == null) {
        reports = List.of();
    }
%>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <jsp:include page="/components/head.jsp" />
    <title>Location Reports | Findora</title>
</head>
<body class="text-slate-900">
<jsp:include page="/components/location-admin/layout_start.jsp" />
    <section class="p-8 space-y-6">
        <div class="flex items-end justify-between gap-4">
            <div>
                <h1 class="text-3xl font-black tracking-tight">Report Review</h1>
                <p class="mt-1 text-sm text-slate-500">Reports tied to items or claims in this location.</p>
            </div>
            <div class="rounded-full bg-slate-100 px-4 py-2 text-sm font-semibold text-slate-700"><%= reports.size() %> reports</div>
        </div>
        <div class="rounded-3xl bg-white border border-slate-200 overflow-hidden">
            <div class="overflow-x-auto">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 text-[10px] uppercase tracking-[0.2em] text-slate-500">
                    <tr>
                        <th class="px-6 py-4">Target</th>
                        <th class="px-6 py-4">Reporter</th>
                        <th class="px-6 py-4">Reason</th>
                        <th class="px-6 py-4">Status</th>
                        <th class="px-6 py-4 text-right">Decision</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (AdminReportView report : reports) { %>
                    <tr class="border-t border-slate-100 hover:bg-slate-50/70">
                        <td class="px-6 py-5">
                            <p class="font-semibold text-slate-900"><%= report.getTargetType() %> #<%= report.getTargetId() %></p>
                            <p class="text-xs text-slate-500">Report #<%= report.getReportId() %></p>
                        </td>
                        <td class="px-6 py-5 text-sm text-slate-600"><%= report.getReporterUsername() %></td>
                        <td class="px-6 py-5 text-sm text-slate-600"><%= report.getReason() %></td>
                        <td class="px-6 py-5 text-sm text-slate-600"><%= report.getStatus() %></td>
                        <td class="px-6 py-5">
                            <form class="flex justify-end gap-2" method="post" action="<%= request.getContextPath() %>/location-admin/reports/review">
                                <input name="reportId" type="hidden" value="<%= report.getReportId() %>"/>
                                <input name="notes" type="hidden" value="Location admin review"/>
                                <button class="rounded-lg border border-emerald-200 px-3 py-2 text-xs font-semibold text-emerald-700" name="decision" value="resolved" type="submit">Resolve</button>
                                <button class="rounded-lg border border-red-200 px-3 py-2 text-xs font-semibold text-red-700" name="decision" value="rejected" type="submit">Reject</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
<jsp:include page="/components/location-admin/layout_end.jsp" />
</body>
</html>