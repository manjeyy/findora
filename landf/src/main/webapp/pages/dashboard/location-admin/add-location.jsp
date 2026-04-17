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
    <title>Add Location | Findora</title>
    <%@ include file="/WEB-INF/fragments/header.jspf" %>
</head>
<body class="bg-slate-50">
    <div class="flex h-screen flex-col">
        <%@ include file="/WEB-INF/fragments/navbar.jspf" %>
        
        <div class="flex flex-1 overflow-hidden">
            <%@ include file="/WEB-INF/fragments/sidebar.jspf" %>
            
            <main class="flex-1 overflow-y-auto p-8">
                <div class="mx-auto max-w-4xl">
                    <div class="mb-8">
                        <a href="<%= request.getContextPath() %>/pages/dashboard/location-admin/stats.jsp" class="text-sm font-bold text-primary-600 flex items-center gap-2 mb-4 hover:text-primary-700 transition">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/></svg>
                            Back to Analytics
                        </a>
                        <h1 class="text-3xl font-extrabold tracking-tight text-slate-900 leading-none">Initialize New Location</h1>
                        <p class="mt-2 text-slate-500 font-medium">Define a new physical zone for item management.</p>
                    </div>

                    <div class="grid grid-cols-1 gap-8 lg:grid-cols-5">
                        <div class="lg:col-span-3">
                            <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                                <form action="#" method="POST" enctype="multipart/form-data" class="space-y-6">
                                    <div>
                                        <label class="mb-2 block text-sm font-bold text-slate-700">Location Name</label>
                                        <input type="text" placeholder="e.g. Block A - Ground Floor" 
                                               class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100 italic">
                                    </div>

                                    <div>
                                        <label class="mb-2 block text-sm font-bold text-slate-700">Zone Description</label>
                                        <textarea rows="4" placeholder="Mention key landmarks or specific boundary details..." 
                                                  class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100 resize-none italic"></textarea>
                                    </div>

                                    <div>
                                        <label class="mb-2 block text-sm font-bold text-slate-700">Location Photo</label>
                                        <div class="flex items-center justify-center rounded-2xl border-2 border-dashed border-slate-200 bg-slate-50 p-10 transition hover:bg-slate-100 cursor-pointer group">
                                            <div class="text-center">
                                                <svg class="mx-auto h-10 w-10 text-slate-400 group-hover:text-primary-500 transition" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                                                <p class="mt-2 text-xs font-bold text-slate-500">Upload Room/area Photo</p>
                                                <input type="file" class="sr-only" id="loc-photo">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="pt-4 border-t border-slate-50 flex justify-end gap-3">
                                        <button type="submit" class="rounded-2xl bg-primary-600 px-8 py-4 text-sm font-bold text-white shadow-lg shadow-primary-200 transition hover:bg-primary-700 active:scale-95">Establish Location</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="lg:col-span-2 space-y-6">
                            <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                                <h3 class="text-lg font-bold text-slate-900 mb-4 italic">Available Locations</h3>
                                <div class="space-y-4">
                                    <div class="flex items-center gap-4 rounded-2xl border border-slate-100 p-3">
                                        <div class="h-12 w-12 rounded-xl bg-slate-100 p-1">
                                            <img src="https://images.unsplash.com/photo-1497366216548-37526070297c?w=100&h=100&fit=crop" class="h-full w-full rounded-lg object-cover" alt="">
                                        </div>
                                        <div>
                                            <p class="text-sm font-bold text-slate-900 leading-none">Main Lobby</p>
                                            <p class="mt-1 text-xs text-slate-400 font-medium">12 Items stored</p>
                                        </div>
                                    </div>
                                    <div class="flex items-center gap-4 rounded-2xl border border-slate-100 p-3">
                                        <div class="h-12 w-12 rounded-xl bg-slate-100 p-1">
                                            <img src="https://images.unsplash.com/photo-1541339907198-e08756ebafe3?w=100&h=100&fit=crop" class="h-full w-full rounded-lg object-cover" alt="">
                                        </div>
                                        <div>
                                            <p class="text-sm font-bold text-slate-900 leading-none">Cafeteria Hub</p>
                                            <p class="mt-1 text-xs text-slate-400 font-medium">32 Items stored</p>
                                        </div>
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
