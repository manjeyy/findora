<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.landf.features.auth.AuthConstants" %>
<%
    String username = (String) session.getAttribute(AuthConstants.AUTH_USER_KEY);
    if (username == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard | Findora</title>
    <%@ include file="/WEB-INF/fragments/header.jspf" %>
</head>
<body class="bg-slate-50">
    <div class="flex h-screen flex-col">
        <%@ include file="/WEB-INF/fragments/navbar.jspf" %>
        
        <div class="flex flex-1 overflow-hidden">
            <%@ include file="/WEB-INF/fragments/sidebar.jspf" %>
            
            <main class="flex-1 overflow-y-auto p-8">
                <div class="mx-auto max-w-6xl">
                    <!-- Welcome Header -->
                    <div class="mb-10 flex items-end justify-between">
                        <div>
                            <p class="text-xs font-bold uppercase tracking-[0.2em] text-primary-600">Quick Overview</p>
                            <h1 class="mt-2 text-4xl font-extrabold tracking-tight text-slate-900">Welcome, <%= username %>!</h1>
                            <p class="mt-2 text-slate-500 font-medium">Here's what's happening with Findora today.</p>
                        </div>
                        <div class="flex gap-3">
                            <span class="inline-flex items-center rounded-full bg-slate-100 px-3 py-1.5 text-xs font-semibold text-slate-600">
                                <span class="mr-1.5 h-1.5 w-1.5 rounded-full bg-emerald-500"></span>
                                System Online
                            </span>
                        </div>
                    </div>

                    <!-- Stats / Quick Actions -->
                    <div class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-4">
                        <div class="group relative rounded-3xl bg-white p-6 shadow-premium transition-all hover:shadow-premium-hover">
                            <div class="flex h-12 w-12 items-center justify-center rounded-2xl bg-amber-50 text-amber-600">
                                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" /></svg>
                            </div>
                            <h3 class="mt-4 text-sm font-bold text-slate-500">I Lost Something</h3>
                            <p class="mt-1 text-2xl font-extrabold text-slate-900 leading-none">Report Lost</p>
                            <a href="<%= request.getContextPath() %>/pages/dashboard/user/lost-item.jsp" class="absolute inset-0 rounded-3xl"></a>
                        </div>

                        <div class="group relative rounded-3xl bg-white p-6 shadow-premium transition-all hover:shadow-premium-hover">
                            <div class="flex h-12 w-12 items-center justify-center rounded-2xl bg-emerald-50 text-emerald-600">
                                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
                            </div>
                            <h3 class="mt-4 text-sm font-bold text-slate-500">I Found Something</h3>
                            <p class="mt-1 text-2xl font-extrabold text-slate-900 leading-none">Post Found</p>
                            <a href="<%= request.getContextPath() %>/pages/dashboard/user/found-item.jsp" class="absolute inset-0 rounded-3xl"></a>
                        </div>

                        <div class="group relative rounded-3xl bg-white p-6 shadow-premium transition-all hover:shadow-premium-hover">
                            <div class="flex h-12 w-12 items-center justify-center rounded-2xl bg-primary-50 text-primary-600">
                                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-3m-1 4l-3 3m0 0l-3-3m3 3V4" /></svg>
                            </div>
                            <h3 class="mt-4 text-sm font-bold text-slate-500">Claim My Item</h3>
                            <p class="mt-1 text-2xl font-extrabold text-slate-900 leading-none">Submit Claim</p>
                            <a href="<%= request.getContextPath() %>/pages/dashboard/user/claim-item.jsp" class="absolute inset-0 rounded-3xl"></a>
                        </div>

                        <div class="group relative rounded-3xl bg-white p-6 shadow-premium transition-all hover:shadow-premium-hover">
                            <div class="flex h-12 w-12 items-center justify-center rounded-2xl bg-rose-50 text-rose-600">
                                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" /></svg>
                            </div>
                            <h3 class="mt-4 text-sm font-bold text-slate-500">Suspicious Activity?</h3>
                            <p class="mt-1 text-2xl font-extrabold text-slate-900 leading-none">File Report</p>
                            <a href="<%= request.getContextPath() %>/pages/dashboard/user/report.jsp" class="absolute inset-0 rounded-3xl"></a>
                        </div>
                    </div>

                    <!-- Recent Activity Section -->
                    <div class="mt-12 grid grid-cols-1 gap-8 lg:grid-cols-3">
                        <div class="lg:col-span-2">
                            <div class="flex items-center justify-between mb-6">
                                <h2 class="text-2xl font-bold text-slate-900">Recent Items</h2>
                                <button class="text-sm font-bold text-primary-600 hover:text-primary-700 transition">View all items &rarr;</button>
                            </div>
                            
                            <!-- Premium Table Card -->
                            <div class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-premium">
                                <table class="w-full text-left">
                                    <thead>
                                        <tr class="border-b border-slate-100 bg-slate-50/50">
                                            <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500">Item Name</th>
                                            <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500">Category</th>
                                            <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500">Status</th>
                                            <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500 text-right">Date</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-slate-50">
                                        <tr class="transition hover:bg-slate-50/50">
                                            <td class="px-6 py-4">
                                                <div class="flex items-center gap-3">
                                                    <div class="h-10 w-10 flex-shrink-0 rounded-xl bg-slate-100 p-1">
                                                        <img src="https://images.unsplash.com/photo-1546868831-71cd00a16991?w=40&h=40&fit=crop" class="h-full w-full rounded-lg object-cover" alt="">
                                                    </div>
                                                    <span class="font-semibold text-slate-900">iPhone 14 Pro</span>
                                                </div>
                                            </td>
                                            <td class="px-6 py-4 text-sm text-slate-600 font-medium">Electronics</td>
                                            <td class="px-6 py-4">
                                                <span class="inline-flex items-center rounded-full bg-amber-50 px-2.5 py-1 text-xs font-bold text-amber-700">Lost</span>
                                            </td>
                                            <td class="px-6 py-4 text-right text-sm text-slate-500 font-medium">Apr 12, 2026</td>
                                        </tr>
                                        <tr class="transition hover:bg-slate-50/50">
                                            <td class="px-6 py-4">
                                                <div class="flex items-center gap-3">
                                                    <div class="h-10 w-10 flex-shrink-0 rounded-xl bg-slate-100 p-1">
                                                        <img src="https://images.unsplash.com/photo-1584931423298-c576fda54bd2?w=40&h=40&fit=crop" class="h-full w-full rounded-lg object-cover" alt="">
                                                    </div>
                                                    <span class="font-semibold text-slate-900">Black Wallet</span>
                                                </div>
                                            </td>
                                            <td class="px-6 py-4 text-sm text-slate-600 font-medium">Personal</td>
                                            <td class="px-6 py-4">
                                                <span class="inline-flex items-center rounded-full bg-emerald-50 px-2.5 py-1 text-xs font-bold text-emerald-700">Found</span>
                                            </td>
                                            <td class="px-6 py-4 text-right text-sm text-slate-500 font-medium">Apr 11, 2026</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Sidebar Info -->
                        <div class="space-y-6">
                            <h2 class="text-2xl font-bold text-slate-900">Quick Tips</h2>
                            <div class="rounded-3xl bg-primary-600 p-8 text-white shadow-lg shadow-primary-200">
                                <h3 class="text-lg font-bold italic">"Did you know?"</h3>
                                <p class="mt-4 text-sm leading-relaxed opacity-90">
                                    Adding a clear picture and precise location details increases the chance of recovery by up to 80%.
                                </p>
                                <button class="mt-6 rounded-2xl bg-white/20 px-4 py-2 text-xs font-bold transition hover:bg-white/30">Learn more</button>
                            </div>
                            
                            <div class="rounded-3xl border border-slate-200 bg-white p-6 shadow-premium">
                                <h3 class="font-bold text-slate-900">Your Stats</h3>
                                <div class="mt-4 space-y-4">
                                    <div class="flex justify-between items-center">
                                        <span class="text-sm font-medium text-slate-500">Items Lost</span>
                                        <span class="text-sm font-bold text-slate-900">2</span>
                                    </div>
                                    <div class="flex justify-between items-center">
                                        <span class="text-sm font-medium text-slate-500">Items Found</span>
                                        <span class="text-sm font-bold text-slate-900">5</span>
                                    </div>
                                    <div class="flex justify-between items-center">
                                        <span class="text-sm font-medium text-slate-500">Claims Pending</span>
                                        <span class="text-sm font-bold text-primary-600">1</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
