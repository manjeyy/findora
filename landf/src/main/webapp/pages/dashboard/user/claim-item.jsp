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
    <title>Submit Claim | Findora</title>
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
                    <div class="mb-10">
                        <h1 class="text-3xl font-extrabold tracking-tight text-slate-900">Claim an Item</h1>
                        <p class="mt-2 text-slate-500">Found something that belongs to you? Submit a claim with proof to get it back.</p>
                    </div>

                    <div class="grid grid-cols-1 gap-12 lg:grid-cols-2">
                        <!-- Left: Item Search/Select -->
                        <div class="space-y-6">
                            <h2 class="text-xl font-bold text-primary-600">Step 1: Select Found Item</h2>
                            
                            <div class="relative">
                                <input type="text" placeholder="Search found items by name..." 
                                       class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 pl-12 text-sm shadow-sm transition-all focus:border-primary-500 focus:ring-4 focus:ring-primary-100">
                                <svg class="absolute left-4 top-4.5 h-5 w-5 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                            </div>

                            <!-- Mockup Selection Cards -->
                            <div class="space-y-4 max-h-[400px] overflow-y-auto pr-2 custom-scrollbar">
                                <div class="group relative flex items-center gap-4 rounded-3xl border-2 border-primary-500 bg-white p-4 shadow-md transition-all">
                                    <div class="h-16 w-16 flex-shrink-0 rounded-2xl bg-slate-100 p-1">
                                        <img src="https://images.unsplash.com/photo-1584931423298-c576fda54bd2?w=64&h=64&fit=crop" class="h-full w-full rounded-xl object-cover" alt="">
                                    </div>
                                    <div class="flex-1">
                                        <h3 class="font-bold text-slate-900 leading-tight">Black Leather Wallet</h3>
                                        <p class="text-xs text-slate-500 uppercase font-bold mt-1">Found in: West Wing Hall</p>
                                    </div>
                                    <div class="rounded-full bg-primary-100 p-1.5 text-primary-600">
                                        <svg class="h-4 w-4" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"/></svg>
                                    </div>
                                </div>

                                <div class="group relative flex items-center gap-4 rounded-3xl border-2 border-transparent bg-white p-4 shadow-premium transition-all hover:border-slate-200">
                                    <div class="h-16 w-16 flex-shrink-0 rounded-2xl bg-slate-100 p-1">
                                        <img src="https://images.unsplash.com/photo-1546868831-71cd00a16991?w=64&h=64&fit=crop" class="h-full w-full rounded-xl object-cover" alt="">
                                    </div>
                                    <div class="flex-1">
                                        <h3 class="font-bold text-slate-900 leading-tight">iPhone 14 Pro (Silver)</h3>
                                        <p class="text-xs text-slate-500 uppercase font-bold mt-1">Found in: Science Lab B</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Right: Proof Form -->
                        <div class="space-y-6">
                            <h2 class="text-xl font-bold text-primary-600">Step 2: Prove Ownership</h2>
                            
                            <div class="rounded-3xl border border-slate-200 bg-white p-8 shadow-premium">
                                <form action="#" method="POST" class="space-y-6">
                                    <div>
                                        <label class="mb-2 block text-sm font-semibold text-slate-700">Detailed Description of Contents/Marks</label>
                                        <textarea rows="4" placeholder="Mention things not visible in photos, e.g. ID card name inside, specific scratch on corner..." 
                                                  class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100 resize-none"></textarea>
                                    </div>

                                    <div>
                                        <label class="mb-2 block text-sm font-semibold text-slate-700">Unique Identifier (Optional)</label>
                                        <input type="text" placeholder="Passcode, Serial Number, or Custom Engraving" 
                                               class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100">
                                    </div>

                                    <div>
                                        <label class="mb-2 block text-sm font-semibold text-slate-700">Verification Document (PDF/Photo)</label>
                                        <div class="flex items-center gap-4 rounded-2xl border-2 border-dashed border-slate-100 bg-slate-50 p-4">
                                            <svg class="h-8 w-8 text-slate-300" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
                                            <div class="flex-1">
                                                <p class="text-xs font-bold text-slate-600 italic">Optional: Upload receipt or old photo</p>
                                                <input type="file" class="mt-1 text-xs text-slate-400">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="rounded-2xl bg-slate-900 p-6 text-white text-xs leading-relaxed">
                                        <div class="flex gap-3">
                                            <svg class="h-6 w-6 text-amber-500 flex-shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/></svg>
                                            <p class="font-medium opacity-90 italic">
                                                False claims are taken seriously. Our Location Admins will verify your proof manually before release. You may be asked to provide ID in person.
                                            </p>
                                        </div>
                                    </div>

                                    <button type="submit" class="w-full rounded-2xl bg-primary-600 py-4 text-sm font-bold text-white shadow-lg shadow-primary-200 transition-all hover:bg-primary-700 active:scale-[0.98]">
                                        Submit Verification Request
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
