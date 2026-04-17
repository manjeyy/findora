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
    <title>User Directory | Findora Admin</title>
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
                            <h1 class="text-3xl font-extrabold tracking-tight text-slate-900 leading-none">User Directory</h1>
                            <p class="mt-2 text-slate-500 font-medium italic">Empowering Findora network with controlled access.</p>
                        </div>
                        
                        <div class="flex flex-wrap items-center gap-4">
                            <div class="relative">
                                <input type="text" placeholder="Search by name or email..." class="rounded-2xl border border-slate-200 bg-white px-5 py-3 pl-10 text-sm italic transition focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-50 shadow-sm">
                                <svg class="absolute left-3.5 top-3.5 h-4 w-4 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                            </div>
                            <button class="rounded-2xl bg-slate-900 px-6 py-3 text-sm font-bold text-white shadow-lg shadow-slate-200 transition hover:bg-slate-800">Add New User</button>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 lg:grid-cols-4 gap-8">
                        <!-- Table Area -->
                        <div class="lg:col-span-3">
                            <div class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-premium">
                                <table class="w-full text-left">
                                    <thead>
                                        <tr class="border-b border-slate-100 bg-slate-50/50">
                                            <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">Profile & Name</th>
                                            <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">Role</th>
                                            <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">Status</th>
                                            <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">Joined Date</th>
                                            <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500 text-right">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-slate-50">
                                        <tr class="group transition hover:bg-slate-50/50">
                                            <td class="px-6 py-5">
                                                <div class="flex items-center gap-3">
                                                    <div class="h-10 w-10 overflow-hidden rounded-full bg-primary-100">
                                                        <img src="https://ui-avatars.com/api/?name=Sam+Admin&background=0d9488&color=fff" class="h-full w-full object-cover">
                                                    </div>
                                                    <div>
                                                        <p class="font-bold text-slate-900 leading-tight">Sam Admin</p>
                                                        <p class="text-xs text-slate-400 font-medium">sam@findora.com</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="px-6 py-5">
                                                <span class="inline-flex items-center rounded-full bg-slate-100 px-2.5 py-1 text-[10px] font-bold text-slate-600 uppercase">Super Admin</span>
                                            </td>
                                            <td class="px-6 py-5">
                                                <span class="flex items-center gap-1 text-xs font-bold text-emerald-600">
                                                    <span class="h-1 w-1 rounded-full bg-emerald-600"></span>
                                                    Active
                                                </span>
                                            </td>
                                            <td class="px-6 py-5 text-sm font-medium text-slate-500">Jan 12, 2026</td>
                                            <td class="px-6 py-5 text-right">
                                                <button class="text-xs font-bold text-primary-600 hover:underline">Edit</button>
                                            </td>
                                        </tr>
                                        <tr class="group transition hover:bg-slate-50/50">
                                            <td class="px-6 py-5">
                                                <div class="flex items-center gap-3">
                                                    <div class="h-10 w-10 overflow-hidden rounded-full bg-amber-100">
                                                        <img src="https://ui-avatars.com/api/?name=Mike+L&background=d97706&color=fff" class="h-full w-full object-cover">
                                                    </div>
                                                    <div>
                                                        <p class="font-bold text-slate-900 leading-tight">Mike Location</p>
                                                        <p class="text-xs text-slate-400 font-medium">mike@findora.com</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="px-6 py-5">
                                                <span class="inline-flex items-center rounded-full bg-amber-50 px-2.5 py-1 text-[10px] font-bold text-amber-700 uppercase">Loc Admin</span>
                                            </td>
                                            <td class="px-6 py-5">
                                                <span class="flex items-center gap-1 text-xs font-bold text-slate-400 italic">
                                                    <span class="h-1 w-1 rounded-full bg-slate-300"></span>
                                                    Away
                                                </span>
                                            </td>
                                            <td class="px-6 py-5 text-sm font-medium text-slate-500">Feb 04, 2026</td>
                                            <td class="px-6 py-5 text-right">
                                                <button class="text-xs font-bold text-primary-600 hover:underline">Edit</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Sidebar Filters -->
                        <div class="space-y-6">
                            <div class="rounded-3xl border border-slate-200 bg-white p-6 shadow-premium">
                                <h3 class="font-bold text-slate-900 mb-6 italic">Quick Filter</h3>
                                <div class="space-y-3">
                                    <label class="flex items-center gap-3 cursor-pointer group">
                                        <input type="checkbox" checked class="h-4 w-4 rounded border-slate-300 text-primary-600 focus:ring-0">
                                        <span class="text-sm font-medium text-slate-600 group-hover:text-slate-900">Show Active only</span>
                                    </label>
                                    <label class="flex items-center gap-3 cursor-pointer group">
                                        <input type="checkbox" class="h-4 w-4 rounded border-slate-300 text-primary-600 focus:ring-0">
                                        <span class="text-sm font-medium text-slate-600 group-hover:text-slate-900">Location Admins</span>
                                    </label>
                                    <label class="flex items-center gap-3 cursor-pointer group">
                                        <input type="checkbox" class="h-4 w-4 rounded border-slate-300 text-primary-600 focus:ring-0">
                                        <span class="text-sm font-medium text-slate-600 group-hover:text-slate-900">Flagged Users</span>
                                    </label>
                                </div>
                            </div>

                            <div class="rounded-3xl bg-rose-50 p-6 border border-rose-100">
                                <h3 class="font-bold text-rose-900 text-sm mb-2 italic">Access Warning</h3>
                                <p class="text-xs text-rose-700 leading-relaxed font-bold">
                                    Disabling a user account will immediately revoke all their active sessions and tokens. Proceed with caution.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
