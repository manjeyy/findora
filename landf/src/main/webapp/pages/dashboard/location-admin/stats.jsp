<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.landf.features.auth.AuthConstants" %>
<%
    String role = (String) session.getAttribute(AuthConstants.AUTH_ROLE_KEY);
    if (!"LOCATION_ADMIN".equals(role) && !"SUPER_ADMIN".equals(role)) {
        response.sendRedirect(request.getContextPath() + "/pages/dashboard/user/home.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Dashboard | Findora</title>
    <%@ include file="/WEB-INF/fragments/header.jspf" %>
</head>
<body class="bg-slate-50">
    <div class="flex h-screen flex-col">
        <%@ include file="/WEB-INF/fragments/navbar.jspf" %>
        
        <div class="flex flex-1 overflow-hidden">
            <%@ include file="/WEB-INF/fragments/sidebar.jspf" %>
            
            <main class="flex-1 overflow-y-auto p-8">
                <div class="mx-auto max-w-6xl">
                    <!-- Header -->
                    <div class="mb-10 flex items-center justify-between">
                        <div>
                            <h1 class="text-3xl font-extrabold tracking-tight text-slate-900 leading-none">Location Analytics</h1>
                            <p class="mt-2 text-slate-500 font-medium">Monitoring activity for your assigned zones.</p>
                        </div>
                        <div class="flex gap-3">
                            <a href="<%= request.getContextPath() %>/pages/dashboard/location-admin/add-location.jsp" 
                               class="inline-flex items-center gap-2 rounded-2xl bg-primary-600 px-5 py-3 text-sm font-bold text-white shadow-lg shadow-primary-200 transition hover:bg-primary-700">
                                <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/></svg>
                                Add New zone
                            </a>
                        </div>
                    </div>

                    <!-- Analytics Cards -->
                    <div class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-4">
                        <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                            <p class="text-xs font-bold uppercase tracking-widest text-slate-400 leading-none">Total Lost</p>
                            <div class="mt-4 flex items-end justify-between">
                                <span class="text-5xl font-extrabold text-slate-900 leading-none">128</span>
                                <span class="flex items-center gap-1 text-xs font-bold text-rose-600">
                                    <svg class="h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"/></svg>
                                    12%
                                </span>
                            </div>
                        </div>
                        <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                            <p class="text-xs font-bold uppercase tracking-widest text-slate-400 leading-none">Total Found</p>
                            <div class="mt-4 flex items-end justify-between">
                                <span class="text-5xl font-extrabold text-slate-900 leading-none">42</span>
                                <span class="flex items-center gap-1 text-xs font-bold text-emerald-600">
                                    <svg class="h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"/></svg>
                                    8%
                                </span>
                            </div>
                        </div>
                        <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                            <p class="text-xs font-bold uppercase tracking-widest text-slate-400 leading-none">Claimed</p>
                            <div class="mt-4 flex items-end justify-between">
                                <span class="text-5xl font-extrabold text-slate-900 leading-none">19</span>
                                <span class="text-xs font-bold text-slate-400 leading-none">Active</span>
                            </div>
                        </div>
                        <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                            <p class="text-xs font-bold uppercase tracking-widest text-slate-400 leading-none">Reports</p>
                            <div class="mt-4 flex items-end justify-between">
                                <span class="text-5xl font-extrabold text-rose-600 leading-none">3</span>
                                <span class="inline-flex items-center rounded-full bg-rose-50 px-2.5 py-1 text-[10px] font-bold text-rose-700">Pending</span>
                            </div>
                        </div>
                    </div>

                    <!-- Bottom Section: Item Activity -->
                    <div class="mt-12 grid grid-cols-1 gap-8 lg:grid-cols-2">
                        <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                            <div class="flex items-center justify-between mb-8">
                                <h2 class="text-xl font-bold text-slate-900 italic">Recent Activity</h2>
                                <a href="<%= request.getContextPath() %>/pages/dashboard/location-admin/view-items.jsp" class="text-xs font-bold text-primary-600 underline underline-offset-4">Manage All Items</a>
                            </div>
                            
                            <div class="space-y-6">
                                <div class="flex gap-4 items-start">
                                    <div class="h-10 w-10 flex-shrink-0 rounded-xl bg-primary-50 flex items-center justify-center text-primary-600">
                                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/></svg>
                                    </div>
                                    <div class="flex-1">
                                        <p class="text-sm font-bold text-slate-900 leading-tight italic">Someone posted "Found Blue Wallet" in Zone A</p>
                                        <p class="mt-1 text-xs text-slate-400 font-medium leading-none">2 minutes ago</p>
                                    </div>
                                </div>
                                <div class="flex gap-4 items-start pt-6 border-t border-slate-50">
                                    <div class="h-10 w-10 flex-shrink-0 rounded-xl bg-emerald-50 flex items-center justify-center text-emerald-600">
                                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/></svg>
                                    </div>
                                    <div class="flex-1">
                                        <p class="text-sm font-bold text-slate-900 leading-tight italic">Claim request for "Sony Headphones" approved</p>
                                        <p class="mt-1 text-xs text-slate-400 font-medium leading-none">14 minutes ago</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Management Shortcut -->
                        <div class="rounded-3xl bg-slate-900 p-8 text-white shadow-xl">
                            <h2 class="text-2xl font-bold italic">Admin Tools</h2>
                            <p class="mt-4 text-sm opacity-70 font-medium">Quickly jump to specialized management panels.</p>
                            
                            <div class="mt-8 space-y-4">
                                <a href="<%= request.getContextPath() %>/pages/dashboard/location-admin/view-items.jsp" class="group flex items-center justify-between rounded-2xl bg-white/5 p-5 transition hover:bg-white/10">
                                    <div class="flex items-center gap-4">
                                        <div class="h-10 w-10 rounded-xl bg-primary-500/20 flex items-center justify-center text-primary-400">
                                            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 10h16M4 14h16M4 18h16"/></svg>
                                        </div>
                                        <span class="font-bold">Item Surveillance</span>
                                    </div>
                                    <svg class="h-5 w-5 opacity-0 group-hover:opacity-100 transition-opacity" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/></svg>
                                </a>

                                <a href="<%= request.getContextPath() %>/pages/dashboard/user/report.jsp" class="group flex items-center justify-between rounded-2xl bg-white/5 p-5 transition hover:bg-white/10 text-rose-400">
                                    <div class="flex items-center gap-4">
                                        <div class="h-10 w-10 rounded-xl bg-rose-500/20 flex items-center justify-center">
                                            <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/></svg>
                                        </div>
                                        <span class="font-bold">Security Alerts</span>
                                    </div>
                                    <svg class="h-5 w-5 opacity-0 group-hover:opacity-100 transition-opacity" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/></svg>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
