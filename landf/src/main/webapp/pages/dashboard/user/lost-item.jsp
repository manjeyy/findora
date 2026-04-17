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
    <title>Report Lost Item | Findora</title>
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
                                        <span class="ml-1 text-sm font-bold text-slate-900 md:ml-2">Report Lost Item</span>
                                    </div>
                                </li>
                            </ol>
                        </nav>
                        <h1 class="text-3xl font-extrabold tracking-tight text-slate-900">Report Lost Item</h1>
                        <p class="mt-2 text-slate-500">Provide as much detail as possible to help us match your item.</p>
                    </div>

                    <div class="grid grid-cols-1 gap-8 lg:grid-cols-3">
                        <!-- Left: Form -->
                        <div class="lg:col-span-2 space-y-6">
                            <form action="#" method="POST" enctype="multipart/form-data" class="space-y-6">
                                <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                                    <h2 class="mb-6 text-xl font-bold text-slate-900">Item Information</h2>
                                    
                                    <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
                                        <div class="col-span-2">
                                            <label class="mb-2 block text-sm font-semibold text-slate-700">Item Name</label>
                                            <input type="text" placeholder="e.g. Silver Necklace, Black iPhone Case" 
                                                   class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100">
                                        </div>

                                        <div>
                                            <label class="mb-2 block text-sm font-semibold text-slate-700">Category</label>
                                            <select class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100 appearance-none bg-[url('data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20fill%3D%22none%22%20viewBox%3D%220%200%2024%2024%20stroke%3D%22currentColor%22%3E%3Cpath%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%20stroke-width%3D%222%22%20d%3D%22M19%209l-7%207-7-7%22%2F%3E%3C%2Fsvg%3E')] bg-[length:1.25em_1.25em] bg-[right_1.25rem_center] bg-no-repeat">
                                                <option>Electronics</option>
                                                <option>Personal Items</option>
                                                <option>Documents</option>
                                                <option>Accessories</option>
                                                <option>Other</option>
                                            </select>
                                        </div>

                                        <div>
                                            <label class="mb-2 block text-sm font-semibold text-slate-700">Date Lost</label>
                                            <input type="date" 
                                                   class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100">
                                        </div>

                                        <div class="col-span-2">
                                            <label class="mb-2 block text-sm font-semibold text-slate-700">Location Lost</label>
                                            <input type="text" placeholder="e.g. Main Library, Cafeteria 2nd Floor" 
                                                   class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100">
                                        </div>

                                        <div class="col-span-2">
                                            <label class="mb-2 block text-sm font-semibold text-slate-700">Detailed Description</label>
                                            <textarea rows="4" placeholder="Mention specific identifiers like scratches, stickers, or internal contents..." 
                                                      class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100 resize-none"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                                    <h2 class="mb-6 text-xl font-bold text-slate-900">Media & Identification</h2>
                                    <div class="flex items-center justify-center rounded-2xl border-2 border-dashed border-slate-200 bg-slate-50 p-12 transition-all hover:border-primary-300 hover:bg-primary-50/30 group">
                                        <div class="text-center">
                                            <svg class="mx-auto h-12 w-12 text-slate-400 group-hover:text-primary-500 transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                                            <div class="mt-4 flex text-sm leading-6 text-slate-600 font-medium">
                                                <label for="file-upload" class="relative cursor-pointer rounded-md bg-transparent font-bold text-primary-600 focus-within:outline-none hover:text-primary-500 underline underline-offset-2">
                                                    <span>Upload a photo</span>
                                                    <input id="file-upload" name="file-upload" type="file" class="sr-only">
                                                </label>
                                                <p class="pl-1">or drag and drop</p>
                                            </div>
                                            <p class="text-xs text-slate-500">PNG, JPG, GIF up to 10MB</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="flex items-center justify-end gap-4">
                                    <button type="button" class="rounded-2xl px-6 py-4 text-sm font-bold text-slate-500 transition hover:bg-slate-100">Discard Draft</button>
                                    <button type="submit" class="rounded-2xl bg-primary-600 px-8 py-4 text-sm font-bold text-white shadow-lg shadow-primary-200 transition hover:bg-primary-700 active:scale-95">Submit Report</button>
                                </div>
                            </form>
                        </div>

                        <!-- Right: Instructions -->
                        <div class="space-y-6">
                            <div class="rounded-3xl bg-amber-50 p-8 border border-amber-100 shadow-sm">
                                <div class="flex h-10 w-10 items-center justify-center rounded-xl bg-amber-100 text-amber-600 mb-6">
                                    <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
                                </div>
                                <h3 class="text-lg font-bold text-slate-900">Tips for better mapping</h3>
                                <ul class="mt-4 space-y-4 text-sm text-slate-600 leading-relaxed font-medium">
                                    <li class="flex gap-3 items-start italic">
                                        <span class="text-amber-500 font-bold">•</span>
                                        Be extremely specific about location (e.g. "Third table from the windows").
                                    </li>
                                    <li class="flex gap-3 items-start italic">
                                        <span class="text-amber-500 font-bold">•</span>
                                        Include serial numbers or brand names if applicable.
                                    </li>
                                    <li class="flex gap-3 items-start italic">
                                        <span class="text-amber-500 font-bold">•</span>
                                        Upload a clear photo if you have one from before you lost it.
                                    </li>
                                </ul>
                            </div>

                            <div class="rounded-3xl bg-white p-8 border border-slate-200 shadow-premium">
                                <h3 class="text-lg font-bold text-slate-900 mb-6">Frequently Asked</h3>
                                <div class="space-y-4">
                                    <details class="group cursor-pointer">
                                        <summary class="flex items-center justify-between font-bold text-sm text-slate-700 list-none transition group-open:text-primary-600">
                                            What happens next?
                                            <svg class="h-4 w-4 transition group-open:rotate-180" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/></svg>
                                        </summary>
                                        <p class="mt-3 text-sm text-slate-500 font-medium">We'll scan our found items database and notify you if there's a match.</p>
                                    </details>
                                    <div class="h-px bg-slate-100"></div>
                                    <details class="group cursor-pointer">
                                        <summary class="flex items-center justify-between font-bold text-sm text-slate-700 list-none transition group-open:text-primary-600">
                                            Can I edit my report?
                                            <svg class="h-4 w-4 transition group-open:rotate-180" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/></svg>
                                        </summary>
                                        <p class="mt-3 text-sm text-slate-500 font-medium">Yes, you can edit your reported items from your profile dashboard.</p>
                                    </details>
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
