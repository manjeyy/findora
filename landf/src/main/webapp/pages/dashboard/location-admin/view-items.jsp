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
    <title>Surveillance | Findora</title>
    <%@ include file="/WEB-INF/fragments/header.jspf" %>
</head>
<body class="bg-slate-50">
    <div class="flex h-screen flex-col">
        <%@ include file="/WEB-INF/fragments/navbar.jspf" %>
        
        <div class="flex flex-1 overflow-hidden">
            <%@ include file="/WEB-INF/fragments/sidebar.jspf" %>
            
            <main class="flex-1 overflow-y-auto p-8">
                <div class="mx-auto max-w-7xl">
                    <!-- Header Actions -->
                    <div class="mb-10 flex flex-col items-start justify-between gap-6 md:flex-row md:items-center">
                        <div>
                            <h1 class="text-3xl font-extrabold tracking-tight text-slate-900 leading-none italic">Item Surveillance</h1>
                            <p class="mt-2 text-slate-500 font-medium">Monitoring all lost and found activity in your zones.</p>
                        </div>
                        
                        <div class="flex flex-wrap items-center gap-4">
                            <div class="relative">
                                <input type="text" placeholder="Filter items..." class="rounded-2xl border border-slate-200 bg-white px-5 py-3 pl-10 text-sm italic transition focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-50">
                                <svg class="absolute left-3.5 top-3.5 h-4 w-4 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                            </div>
                            <select class="rounded-2xl border border-slate-200 bg-white px-5 py-3 text-sm font-bold text-slate-600 focus:outline-none transition hover:bg-slate-100 italic appearance-none bg-[url('data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20fill%3D%22none%22%20viewBox%3D%220%200%2024%2024%20stroke%3D%22currentColor%22%3E%3Cpath%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%20stroke-width%3D%222%22%20d%3D%22M19%209l-7%207-7-7%22%2F%3E%3C%2Fsvg%3E')] bg-[length:1.1em_1.1em] bg-[right_1rem_center] bg-no-repeat pr-10">
                                <option>All Status</option>
                                <option>Lost</option>
                                <option>Found</option>
                                <option>Claimed</option>
                            </select>
                        </div>
                    </div>

                    <!-- Items Table -->
                    <div class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-premium">
                        <table class="w-full text-left">
                            <thead>
                                <tr class="border-b border-slate-100 bg-slate-50/50">
                                    <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">Preview</th>
                                    <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">Item Info</th>
                                    <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">Location</th>
                                    <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">Type</th>
                                    <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">Date Posted</th>
                                    <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500 text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-slate-50">
                                <tr class="group transition hover:bg-slate-50/50">
                                    <td class="px-6 py-5">
                                        <div class="h-12 w-12 overflow-hidden rounded-xl bg-slate-100 p-1 ring-2 ring-slate-100 group-hover:ring-primary-100 transition">
                                            <img src="https://images.unsplash.com/photo-1546868831-71cd00a16991?w=80&h=80&fit=crop" class="h-full w-full rounded-lg object-cover" alt="">
                                        </div>
                                    </td>
                                    <td class="px-6 py-5">
                                        <p class="font-bold text-slate-900 leading-none">iPhone 14 Pro</p>
                                        <p class="mt-1 text-xs text-slate-400 font-medium">Electronics • #ITM-8821</p>
                                    </td>
                                    <td class="px-6 py-5 text-sm font-bold text-slate-700 italic underline decoration-primary-200 underline-offset-4">Lab 3rd Floor</td>
                                    <td class="px-6 py-5">
                                        <span class="inline-flex items-center rounded-full bg-amber-50 px-2.5 py-1 text-[10px] font-bold text-amber-700 uppercase tracking-wider">Lost</span>
                                    </td>
                                    <td class="px-6 py-5 text-sm font-medium text-slate-500 italic">Apr 12, 2026</td>
                                    <td class="px-6 py-5 text-right">
                                        <div class="flex justify-end gap-2">
                                            <button class="rounded-xl border border-slate-200 bg-white p-2 text-slate-400 transition hover:bg-slate-50 hover:text-primary-600">
                                                <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"/></svg>
                                            </button>
                                            <button class="rounded-xl bg-primary-600 px-4 py-2 text-[10px] font-bold text-white transition hover:bg-primary-700 active:scale-95">Verify</button>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="group transition hover:bg-slate-50/50">
                                    <td class="px-6 py-5">
                                        <div class="h-12 w-12 overflow-hidden rounded-xl bg-slate-100 p-1 ring-2 ring-slate-100 group-hover:ring-primary-100 transition">
                                            <img src="https://images.unsplash.com/photo-1584931423298-c576fda54bd2?w=80&h=80&fit=crop" class="h-full w-full rounded-lg object-cover" alt="">
                                        </div>
                                    </td>
                                    <td class="px-6 py-5">
                                        <p class="font-bold text-slate-900 leading-none">Black Leather Wallet</p>
                                        <p class="mt-1 text-xs text-slate-400 font-medium">Personal • #ITM-8822</p>
                                    </td>
                                    <td class="px-6 py-5 text-sm font-bold text-slate-700 italic underline decoration-primary-200 underline-offset-4">Library Cafe</td>
                                    <td class="px-6 py-5">
                                        <span class="inline-flex items-center rounded-full bg-emerald-50 px-2.5 py-1 text-[10px] font-bold text-emerald-700 uppercase tracking-wider">Found</span>
                                    </td>
                                    <td class="px-6 py-5 text-sm font-medium text-slate-500 italic">Apr 14, 2026</td>
                                    <td class="px-6 py-5 text-right">
                                        <div class="flex justify-end gap-2">
                                            <button class="rounded-xl border border-slate-200 bg-white p-2 text-slate-400 transition hover:bg-slate-50 hover:text-primary-600">
                                                <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"/></svg>
                                            </button>
                                            <button class="rounded-xl bg-primary-600 px-4 py-2 text-[10px] font-bold text-white transition hover:bg-primary-700 active:scale-95">Verify</button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
