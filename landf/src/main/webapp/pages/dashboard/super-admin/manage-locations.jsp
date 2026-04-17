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
    <title>Manage Locations | Findora Master</title>
    <%@ include file="/WEB-INF/fragments/header.jspf" %>
</head>
<body class="bg-slate-50">
    <div class="flex h-screen flex-col">
        <%@ include file="/WEB-INF/fragments/navbar.jspf" %>
        
        <div class="flex flex-1 overflow-hidden">
            <%@ include file="/WEB-INF/fragments/sidebar.jspf" %>
            
            <main class="flex-1 overflow-y-auto p-8">
                <div class="mx-auto max-w-7xl">
                    <div class="mb-10 flex flex-col items-start justify-between gap-6 md:flex-row md:items-center">
                        <div>
                            <h1 class="text-3xl font-extrabold tracking-tight text-slate-900 leading-none italic">Global Location Management</h1>
                            <p class="mt-2 text-slate-500 font-medium italic">Configure and monitor the physical network of Findora zones.</p>
                        </div>
                        
                        <a href="<%= request.getContextPath() %>/pages/dashboard/location-admin/add-location.jsp" class="rounded-2xl bg-primary-600 px-6 py-3 text-sm font-bold text-white shadow-lg shadow-primary-200 transition hover:bg-primary-700 active:scale-95">Add Branch/Zone</a>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                        <!-- Location Cards -->
                        <div class="group overflow-hidden rounded-[2.5rem] border border-slate-200 bg-white shadow-premium transition-all hover:shadow-premium-hover">
                            <div class="h-48 w-full transition group-hover:scale-105 duration-500">
                                <img src="https://images.unsplash.com/photo-1497366216548-37526070297c?w=400&h=200&fit=crop" class="h-full w-full object-cover">
                            </div>
                            <div class="p-8">
                                <div class="flex items-center justify-between mb-4">
                                    <h3 class="text-xl font-bold text-slate-900 tracking-tight">Main Lobby Station</h3>
                                    <span class="inline-flex items-center rounded-full bg-emerald-50 px-2.5 py-1 text-[10px] font-bold text-emerald-700 uppercase">Active</span>
                                </div>
                                <div class="space-y-4">
                                    <div class="flex items-center justify-between">
                                        <p class="text-xs font-bold text-slate-400 uppercase tracking-widest">Total Items</p>
                                        <span class="text-lg font-extrabold text-slate-900">128</span>
                                    </div>
                                    <div class="flex items-center justify-between">
                                        <p class="text-xs font-bold text-slate-400 uppercase tracking-widest">Managed By</p>
                                        <div class="flex -space-x-2">
                                            <img src="https://ui-avatars.com/api/?name=Admin+1&background=0d9488&color=fff" class="h-6 w-6 rounded-full border-2 border-white">
                                            <img src="https://ui-avatars.com/api/?name=Admin+2&background=0284c7&color=fff" class="h-6 w-6 rounded-full border-2 border-white">
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-8 flex gap-3">
                                    <button class="flex-1 rounded-2xl bg-slate-100 py-3 text-xs font-bold text-slate-600 transition hover:bg-slate-200">Edit Settings</button>
                                    <button class="flex-1 rounded-2xl border border-rose-100 bg-rose-50/50 py-3 text-xs font-bold text-rose-600 transition hover:bg-rose-100">Deactivate</button>
                                </div>
                            </div>
                        </div>

                        <div class="group overflow-hidden rounded-[2.5rem] border border-slate-200 bg-white shadow-premium transition-all hover:shadow-premium-hover">
                            <div class="h-48 w-full transition group-hover:scale-105 duration-500">
                                <img src="https://images.unsplash.com/photo-1541339907198-e08756ebafe3?w=400&h=200&fit=crop" class="h-full w-full object-cover">
                            </div>
                            <div class="p-8">
                                <div class="flex items-center justify-between mb-4">
                                    <h3 class="text-xl font-bold text-slate-900 tracking-tight">Science Hub B</h3>
                                    <span class="inline-flex items-center rounded-full bg-emerald-50 px-2.5 py-1 text-[10px] font-bold text-emerald-700 uppercase">Active</span>
                                </div>
                                <div class="space-y-4">
                                    <div class="flex items-center justify-between">
                                        <p class="text-xs font-bold text-slate-400 uppercase tracking-widest">Total Items</p>
                                        <span class="text-lg font-extrabold text-slate-900">42</span>
                                    </div>
                                    <div class="flex items-center justify-between">
                                        <p class="text-xs font-bold text-slate-400 uppercase tracking-widest">Managed By</p>
                                        <img src="https://ui-avatars.com/api/?name=Admin+3&background=d97706&color=fff" class="h-6 w-6 rounded-full border-2 border-white">
                                    </div>
                                </div>
                                <div class="mt-8 flex gap-3">
                                    <button class="flex-1 rounded-2xl bg-slate-100 py-3 text-xs font-bold text-slate-600 transition hover:bg-slate-200">Edit Settings</button>
                                    <button class="flex-1 rounded-2xl border border-rose-100 bg-rose-50/50 py-3 text-xs font-bold text-rose-600 transition hover:bg-rose-100">Deactivate</button>
                                </div>
                            </div>
                        </div>

                        <div class="group overflow-hidden rounded-[2.5rem] border border-dashed border-slate-300 bg-slate-50/50 p-8 flex flex-col items-center justify-center text-center transition hover:bg-slate-50">
                            <div class="flex h-20 w-20 items-center justify-center rounded-3xl bg-white text-slate-400 shadow-sm mb-6">
                                <svg class="h-10 w-10" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/></svg>
                            </div>
                            <h3 class="text-xl font-bold text-slate-900 italic">Expand Network</h3>
                            <p class="mt-2 text-sm text-slate-500 font-medium">Click to register a new zone or branch in the system.</p>
                            <a href="<%= request.getContextPath() %>/pages/dashboard/location-admin/add-location.jsp" class="mt-8 rounded-2xl bg-primary-600 px-6 py-3 text-sm font-bold text-white shadow-lg shadow-primary-200 transition hover:bg-primary-700">Add Location</a>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
