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
    <title>Post Found Item | Findora</title>
    <%@ include file="/WEB-INF/fragments/header.jspf" %>
</head>
<body class="bg-slate-50">
    <div class="flex h-screen flex-col">
        <%@ include file="/WEB-INF/fragments/navbar.jspf" %>
        
        <div class="flex flex-1 overflow-hidden">
            <%@ include file="/WEB-INF/fragments/sidebar.jspf" %>
            
            <main class="flex-1 overflow-y-auto p-8">
                <div class="mx-auto max-w-5xl">
                    <!-- Header -->
                    <div class="mb-8">
                        <nav class="flex mb-4" aria-label="Breadcrumb">
                            <ol class="inline-flex items-center space-x-1 md:space-x-3">
                                <li class="inline-flex items-center">
                                    <a href="<%= request.getContextPath() %>/pages/dashboard/user/home.jsp" class="text-sm font-medium text-slate-500 hover:text-primary-600">Home</a>
                                </li>
                                <li>
                                    <div class="flex items-center">
                                        <svg class="w-6 h-6 text-slate-400" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                        <span class="ml-1 text-sm font-bold text-slate-900 md:ml-2">Post Found Item</span>
                                    </div>
                                </li>
                            </ol>
                        </nav>
                        <h1 class="text-3xl font-extrabold tracking-tight text-slate-900">Post Found Item</h1>
                        <p class="mt-2 text-slate-500">Help someone reunite with their missing item by providing clear details.</p>
                    </div>

                    <div class="grid grid-cols-1 gap-8 lg:grid-cols-3">
                        <!-- Left: Form -->
                        <div class="lg:col-span-2 space-y-6">
                            <form action="#" method="POST" enctype="multipart/form-data" class="space-y-6">
                                <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                                    <h2 class="mb-6 text-xl font-bold text-slate-900">Item Details</h2>
                                    
                                    <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
                                        <div class="col-span-2">
                                            <label class="mb-2 block text-sm font-semibold text-slate-700">Item Name</label>
                                            <input type="text" placeholder="e.g. Blue Umbrella, Honda Key Fob" 
                                                   class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100">
                                        </div>

                                        <div>
                                            <label class="mb-2 block text-sm font-semibold text-slate-700">Category</label>
                                            <select class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100 appearance-none bg-[url('data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20fill%3D%22none%22%20viewBox%3D%220%200%2024%2024%20stroke%3D%22currentColor%22%3E%3Cpath%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%20stroke-width%3D%222%22%20d%3D%22M19%209l-7%207-7-7%22%2F%3E%3C%2Fsvg%3E')] bg-[length:1.25em_1.25em] bg-[right_1.25rem_center] bg-no-repeat">
                                                <option>Personal Items</option>
                                                <option>Electronics</option>
                                                <option>Documents</option>
                                                <option>Keys</option>
                                                <option>Pets</option>
                                                <option>Other</option>
                                            </select>
                                        </div>

                                        <div>
                                            <label class="mb-2 block text-sm font-semibold text-slate-700">Date Found</label>
                                            <input type="date" 
                                                   class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100">
                                        </div>

                                        <div class="col-span-2">
                                            <label class="mb-2 block text-sm font-semibold text-slate-700">Found Location</label>
                                            <input type="text" placeholder="e.g. Near the main entrance fountain" 
                                                   class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100">
                                        </div>

                                        <div class="col-span-2">
                                            <label class="mb-2 block text-sm font-semibold text-slate-700">Appearance Description</label>
                                            <textarea rows="4" placeholder="Mention color, brand, condition, or any distinguishing marks..." 
                                                      class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100 resize-none"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                                    <h2 class="mb-6 text-xl font-bold text-slate-900">Item Image</h2>
                                    <div class="flex items-center justify-center rounded-2xl border-2 border-dashed border-slate-200 bg-slate-50 p-12 transition-all hover:border-primary-300 hover:bg-primary-50/30 group">
                                        <div class="text-center">
                                            <svg class="mx-auto h-12 w-12 text-slate-400 group-hover:text-primary-500 transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 13a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
                                            <div class="mt-4 flex text-sm leading-6 text-slate-600 font-medium italic">
                                                <label for="item-photo" class="relative cursor-pointer rounded-md bg-transparent font-bold text-primary-600 focus-within:outline-none hover:text-primary-500 underline underline-offset-2">
                                                    <span>Snap or upload a photo</span>
                                                    <input id="item-photo" name="item-photo" type="file" class="sr-only">
                                                </label>
                                            </div>
                                            <p class="text-xs text-slate-500">Provide a high-quality photo to help owners recognize it.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="flex items-center justify-end gap-4">
                                    <button type="button" class="rounded-2xl px-6 py-4 text-sm font-bold text-slate-500 transition hover:bg-slate-100">Cancel</button>
                                    <button type="submit" class="rounded-2xl bg-emerald-600 px-8 py-4 text-sm font-bold text-white shadow-lg shadow-emerald-100 transition hover:bg-emerald-700 active:scale-95">Post Item Found</button>
                                </div>
                            </form>
                        </div>

                        <!-- Right: Safety & Privacy -->
                        <div class="space-y-6">
                            <div class="rounded-3xl bg-emerald-50 p-8 border border-emerald-100 shadow-sm">
                                <div class="flex h-10 w-10 items-center justify-center rounded-xl bg-emerald-100 text-emerald-600 mb-6">
                                    <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04M12 21.48V11.5" /></svg>
                                </div>
                                <h3 class="text-lg font-bold text-slate-900">Finder's Security</h3>
                                <p class="mt-4 text-sm text-slate-600 leading-relaxed font-medium">
                                    Thank you for your honesty! Here's how we keep you safe:
                                </p>
                                <ul class="mt-4 space-y-4 text-sm text-slate-600 leading-relaxed font-medium">
                                    <li class="flex gap-3 items-start italic">
                                        <span class="text-emerald-500 font-bold">✓</span>
                                        Your personal contact info is never shown to claimants.
                                    </li>
                                    <li class="flex gap-3 items-start italic">
                                        <span class="text-emerald-500 font-bold">✓</span>
                                        Claims must be verified by Location Admins.
                                    </li>
                                    <li class="flex gap-3 items-start italic">
                                        <span class="text-emerald-500 font-bold">✓</span>
                                        Meeting points are established at secure Admin posts.
                                    </li>
                                </ul>
                            </div>

                            <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                                <h3 class="text-lg font-bold text-slate-900 mb-6 italic">Quick Question</h3>
                                <p class="text-sm text-slate-600 font-medium mb-4">Should I keep the item or turn it in?</p>
                                <p class="text-xs text-slate-500 leading-relaxed">
                                    We recommend turning items in to the nearest <strong>Location Admin</strong> station. They have secure storage and can verify identities more effectively.
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
