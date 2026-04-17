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
    <title>Global Inventory | Findora Admin</title>
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
                            <h1 class="text-3xl font-extrabold tracking-tight text-slate-900 leading-none">Global Item Inventory</h1>
                            <p class="mt-2 text-slate-500 font-medium italic">Master control for every item reported across the network.</p>
                        </div>
                        
                        <div class="flex flex-wrap items-center gap-4">
                            <div class="relative">
                                <input type="text" placeholder="Search global inventory..." class="rounded-2xl border border-slate-200 bg-white px-5 py-3 pl-10 text-sm italic transition focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-50 shadow-sm w-64">
                                <svg class="absolute left-3.5 top-3.5 h-4 w-4 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                            </div>
                            <button class="rounded-2xl border border-slate-200 bg-white px-6 py-3 text-sm font-bold text-slate-600 shadow-sm transition hover:bg-slate-50">Export CSV</button>
                        </div>
                    </div>

                    <!-- Filters Row -->
                    <div class="mb-8 flex flex-wrap gap-4">
                        <select class="rounded-xl border border-slate-200 bg-white px-4 py-2 text-xs font-bold text-slate-600 appearance-none pr-8 bg-[url('data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20fill%3D%22none%22%20viewBox%3D%220%200%2024%2024%20stroke%3D%22currentColor%22%3E%3Cpath%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%20stroke-width%3D%222%22%20d%3D%22M19%209l-7%207-7-7%22%2F%3E%3C%2Fsvg%3E')] bg-[length:1em_1em] bg-[right_0.75rem_center] bg-no-repeat">
                            <option>All Categories</option>
                            <option>Electronics</option>
                            <option>Personal Items</option>
                            <option>Documents</option>
                        </select>
                        <select class="rounded-xl border border-slate-200 bg-white px-4 py-2 text-xs font-bold text-slate-600 appearance-none pr-8 bg-[url('data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20fill%3D%22none%22%20viewBox%3D%220%200%2024%2024%20stroke%3D%22currentColor%22%3E%3Cpath%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%20stroke-width%3D%222%22%20d%3D%22M19%209l-7%207-7-7%22%2F%3E%3C%2Fsvg%3E')] bg-[length:1em_1em] bg-[right_0.75rem_center] bg-no-repeat">
                            <option>All Locations</option>
                            <option>Main Lobby</option>
                            <option>Cafeteria</option>
                        </select>
                        <select class="rounded-xl border border-slate-200 bg-white px-4 py-2 text-xs font-bold text-slate-600 appearance-none pr-8 bg-[url('data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20fill%3D%22none%22%20viewBox%3D%220%200%2024%2024%20stroke%3D%22currentColor%22%3E%3Cpath%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%20stroke-width%3D%222%22%20d%3D%22M19%209l-7%207-7-7%22%2F%3E%3C%2Fsvg%3E')] bg-[length:1em_1em] bg-[right_0.75rem_center] bg-no-repeat">
                            <option>All Time</option>
                            <option>Last 7 Days</option>
                            <option>Last 30 Days</option>
                        </select>
                    </div>

                    <div class="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-premium">
                        <table class="w-full text-left">
                            <thead>
                                <tr class="border-b border-slate-100 bg-slate-50/50">
                                    <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">ID</th>
                                    <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">Item Details</th>
                                    <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">Status</th>
                                    <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">Managed By</th>
                                    <th class="px-6 py-5 text-xs font-bold uppercase tracking-wider text-slate-500">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-slate-50">
                                <tr class="group transition hover:bg-slate-50/50">
                                    <td class="px-6 py-5 text-xs font-bold text-slate-400">#FND-1024</td>
                                    <td class="px-6 py-5">
                                        <div class="flex items-center gap-3">
                                            <div class="h-10 w-10 flex-shrink-0 rounded-xl bg-slate-100 p-1">
                                                <img src="https://images.unsplash.com/photo-1546868831-71cd00a16991?w=40&h=40&fit=crop" class="h-full w-full rounded-lg object-cover">
                                            </div>
                                            <div>
                                                <p class="font-bold text-slate-900 leading-tight">Silver MacBook Air</p>
                                                <p class="text-[10px] text-slate-400 font-medium uppercase mt-1">Electronics • Science Bldg</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-5">
                                        <span class="inline-flex items-center rounded-full bg-amber-50 px-2.5 py-1 text-[10px] font-bold text-amber-700 uppercase">Lost</span>
                                    </td>
                                    <td class="px-6 py-5">
                                        <div class="flex items-center gap-2">
                                            <div class="h-6 w-6 rounded-full bg-slate-200 overflow-hidden">
                                                <img src="https://ui-avatars.com/api/?name=Admin+A&background=cbd5e1&color=475569" class="h-full w-full">
                                            </div>
                                            <span class="text-xs font-bold text-slate-700 italic">John (Loc Admin)</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-5">
                                        <div class="flex gap-2">
                                            <button class="text-xs font-bold text-primary-600 hover:underline">View</button>
                                            <button class="text-xs font-bold text-rose-600 hover:underline">Flag</button>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="group transition hover:bg-slate-50/50">
                                    <td class="px-6 py-5 text-xs font-bold text-slate-400">#FND-1025</td>
                                    <td class="px-6 py-5">
                                        <div class="flex items-center gap-3">
                                            <div class="h-10 w-10 flex-shrink-0 rounded-xl bg-slate-100 p-1">
                                                <img src="https://images.unsplash.com/photo-1584931423298-c576fda54bd2?w=40&h=40&fit=crop" class="h-full w-full rounded-lg object-cover">
                                            </div>
                                            <div>
                                                <p class="font-bold text-slate-900 leading-tight">Brown Leather Wallet</p>
                                                <p class="text-[10px] text-slate-400 font-medium uppercase mt-1">Personal • Library</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-5">
                                        <span class="inline-flex items-center rounded-full bg-emerald-50 px-2.5 py-1 text-[10px] font-bold text-emerald-700 uppercase">Found</span>
                                    </td>
                                    <td class="px-6 py-5">
                                        <div class="flex items-center gap-2">
                                            <div class="h-6 w-6 rounded-full bg-slate-200 overflow-hidden">
                                                <img src="https://ui-avatars.com/api/?name=Admin+B&background=cbd5e1&color=475569" class="h-full w-full">
                                            </div>
                                            <span class="text-xs font-bold text-slate-700 italic">Sara (Loc Admin)</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-5">
                                        <div class="flex gap-2">
                                            <button class="text-xs font-bold text-primary-600 hover:underline">View</button>
                                            <button class="text-xs font-bold text-rose-600 hover:underline">Flag</button>
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
