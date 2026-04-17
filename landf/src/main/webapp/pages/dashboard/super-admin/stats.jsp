<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.landf.features.auth.AuthConstants" %>
<%
    String role = (String) session.getAttribute(AuthConstants.AUTH_ROLE_KEY);
    if (!"SUPER_ADMIN".equals(role)) {
        response.sendRedirect(request.getContextPath() + "/pages/dashboard/user/home.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Enterprise Overview | Findora</title>
    <%@ include file="/WEB-INF/fragments/header.jspf" %>
</head>
<body class="bg-slate-50">
    <div class="flex h-screen flex-col">
        <%@ include file="/WEB-INF/fragments/navbar.jspf" %>
        
        <div class="flex flex-1 overflow-hidden">
            <%@ include file="/WEB-INF/fragments/sidebar.jspf" %>
            
            <main class="flex-1 overflow-y-auto p-8">
                <div class="mx-auto max-w-7xl">
                    <!-- Global Header -->
                    <div class="mb-12 flex flex-col items-start justify-between gap-6 md:flex-row md:items-end">
                        <div class="space-y-2">
                            <div class="inline-flex items-center gap-2 rounded-full bg-slate-100 px-3 py-1 text-[10px] font-bold uppercase tracking-widest text-slate-500">
                                <span class="h-2 w-2 rounded-full bg-primary-500"></span>
                                Enterprise Master Panel
                            </div>
                            <h1 class="text-4xl font-extrabold tracking-tight text-slate-900 leading-none italic">System Console</h1>
                            <p class="text-slate-500 font-medium">Global analytics and administrative control for the entire Findora network.</p>
                        </div>
                        
                        <div class="flex gap-4">
                            <div class="flex flex-col items-end">
                                <p class="text-[10px] font-bold text-slate-400 uppercase tracking-widest leading-none">Global Status</p>
                                <p class="mt-2 text-sm font-extrabold text-emerald-600">FULLY OPERATIONAL</p>
                            </div>
                            <div class="h-10 w-px bg-slate-200"></div>
                            <div class="flex flex-col items-end">
                                <p class="text-[10px] font-bold text-slate-400 uppercase tracking-widest leading-none">Server Health</p>
                                <p class="mt-2 text-sm font-extrabold text-slate-900 leading-none">99.9% Uptime</p>
                            </div>
                        </div>
                    </div>

                    <!-- Enterprise Stats -->
                    <div class="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-4">
                        <div class="group relative rounded-3xl border border-slate-200 bg-white p-8 shadow-premium transition hover:shadow-premium-hover overflow-hidden">
                            <div class="absolute -right-4 -top-4 h-16 w-16 bg-primary-50 rounded-full group-hover:scale-150 transition-transform duration-500"></div>
                            <div class="relative z-10">
                                <p class="text-xs font-bold uppercase tracking-widest text-slate-400">Total Users</p>
                                <p class="mt-4 text-5xl font-extrabold text-slate-900">1.2k</p>
                                <div class="mt-4 flex items-center gap-2">
                                    <span class="text-xs font-bold text-emerald-600">+14%</span>
                                    <span class="text-[10px] font-medium text-slate-400 italic">vs last month</span>
                                </div>
                            </div>
                        </div>

                        <div class="group relative rounded-3xl border border-slate-200 bg-white p-8 shadow-premium transition hover:shadow-premium-hover overflow-hidden">
                            <div class="absolute -right-4 -top-4 h-16 w-16 bg-amber-50 rounded-full group-hover:scale-150 transition-transform duration-500"></div>
                            <div class="relative z-10">
                                <p class="text-xs font-bold uppercase tracking-widest text-slate-400">Items Cataloged</p>
                                <p class="mt-4 text-5xl font-extrabold text-slate-900">4.8k</p>
                                <div class="mt-4 flex items-center gap-2">
                                    <span class="text-xs font-bold text-amber-600">82 Pending</span>
                                    <span class="text-[10px] font-medium text-slate-400 italic">verification</span>
                                </div>
                            </div>
                        </div>

                        <div class="group relative rounded-3xl border border-slate-200 bg-white p-8 shadow-premium transition hover:shadow-premium-hover overflow-hidden">
                            <div class="absolute -right-4 -top-4 h-16 w-16 bg-rose-50 rounded-full group-hover:scale-150 transition-transform duration-500"></div>
                            <div class="relative z-10">
                                <p class="text-xs font-bold uppercase tracking-widest text-slate-400">Active Claims</p>
                                <p class="mt-4 text-5xl font-extrabold text-slate-900 leading-none">312</p>
                                <div class="mt-4 flex items-center gap-2">
                                    <span class="text-xs font-bold text-primary-600 italic">Processing...</span>
                                </div>
                            </div>
                        </div>

                        <div class="group relative rounded-3xl border border-slate-200 bg-white p-8 shadow-premium transition hover:shadow-premium-hover overflow-hidden">
                            <div class="absolute -right-4 -top-4 h-16 w-16 bg-slate-100 rounded-full group-hover:scale-150 transition-transform duration-500"></div>
                            <div class="relative z-10">
                                <p class="text-xs font-bold uppercase tracking-widest text-slate-400">Total Locations</p>
                                <p class="mt-4 text-5xl font-extrabold text-slate-900 leading-none">24</p>
                                <div class="mt-4 flex items-center gap-2 text-xs font-bold text-slate-500 italic underline">Manage zones &rarr;</div>
                            </div>
                        </div>
                    </div>

                    <!-- System Logs & Items -->
                    <div class="mt-12 grid grid-cols-1 gap-8 lg:grid-cols-3">
                        <div class="lg:col-span-2 rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                            <h2 class="text-2xl font-bold text-slate-900 italic mb-8">System Activity Logs</h2>
                            <div class="space-y-6">
                                <div class="flex items-center gap-4 rounded-2xl bg-slate-50 p-4 transition hover:bg-slate-100">
                                    <div class="h-10 w-10 flex-shrink-0 rounded-xl bg-primary-100 flex items-center justify-center text-primary-600">
                                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/></svg>
                                    </div>
                                    <div class="flex-1">
                                        <p class="text-sm font-bold text-slate-900 leading-tight">New Admin User Registered: <strong>alice_manager</strong></p>
                                        <p class="mt-1 text-xs text-slate-400 font-medium italic">5 mins ago • LocAdmin Role</p>
                                    </div>
                                    <button class="text-[10px] font-bold text-primary-600 italic hover:underline">Review</button>
                                </div>

                                <div class="flex items-center gap-4 rounded-2xl bg-slate-50 p-4 transition hover:bg-slate-100">
                                    <div class="h-10 w-10 flex-shrink-0 rounded-xl bg-orange-100 flex items-center justify-center text-orange-600">
                                        <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"/></svg>
                                    </div>
                                    <div class="flex-1">
                                        <p class="text-sm font-bold text-slate-900 leading-tight">Database Backup Completed Successfully</p>
                                        <p class="mt-1 text-xs text-slate-400 font-medium italic">1 hour ago • Auto-routine</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="rounded-3xl bg-primary-900 p-8 text-white shadow-xl flex flex-col justify-between">
                            <div>
                                <h2 class="text-2xl font-bold italic tracking-tight">Access Control</h2>
                                <p class="mt-4 text-sm opacity-60 font-medium italic">Monitor and regulate all system access tokens and role privileges.</p>
                                
                                <div class="mt-10 space-y-6">
                                    <div class="flex items-end justify-between">
                                        <p class="text-xs font-bold text-primary-300 uppercase leading-none">Admin Count</p>
                                        <p class="text-2xl font-extrabold leading-none">12</p>
                                    </div>
                                    <div class="h-px bg-primary-800"></div>
                                    <div class="flex items-end justify-between">
                                        <p class="text-xs font-bold text-primary-300 uppercase leading-none">Security Reports</p>
                                        <p class="text-2xl font-extrabold text-rose-400 leading-none">05</p>
                                    </div>
                                </div>
                            </div>
                            
                            <button class="mt-12 w-full rounded-2xl bg-primary-500 py-4 text-xs font-bold transition hover:bg-primary-400">Open Security Center</button>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
