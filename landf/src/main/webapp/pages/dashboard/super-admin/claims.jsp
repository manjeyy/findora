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
    <title>Global Claims | Findora Admin</title>
    <%@ include file="/WEB-INF/fragments/header.jspf" %>
</head>
<body class="bg-slate-50">
    <div class="flex h-screen flex-col">
        <%@ include file="/WEB-INF/fragments/navbar.jspf" %>
        
        <div class="flex flex-1 overflow-hidden">
            <%@ include file="/WEB-INF/fragments/sidebar.jspf" %>
            
            <main class="flex-1 overflow-y-auto p-8">
                <div class="mx-auto max-w-7xl">
                    <div class="mb-10 text-left">
                        <h1 class="text-3xl font-extrabold tracking-tight text-slate-900 leading-none italic">Global Claims Management</h1>
                        <p class="mt-2 text-slate-500 font-medium italic">Audit and verify ownership claims before final item release.</p>
                    </div>

                    <div class="space-y-6">
                        <!-- Claim Request Card -->
                        <div class="group rounded-[2.5rem] border border-slate-200 bg-white p-1 shadow-premium transition-all hover:shadow-premium-hover">
                            <div class="flex flex-col lg:flex-row lg:items-center">
                                <!-- Claim Summary Left -->
                                <div class="flex-1 p-8">
                                    <div class="flex items-center gap-4 mb-6">
                                        <div class="h-16 w-16 overflow-hidden rounded-2xl bg-slate-100">
                                            <img src="https://images.unsplash.com/photo-1546868831-71cd00a16991?w=100&h=100&fit=crop" class="h-full w-full object-cover">
                                        </div>
                                        <div>
                                            <p class="text-xs font-bold text-slate-400 uppercase tracking-widest leading-none">Item for Claim</p>
                                            <h3 class="mt-2 text-xl font-extrabold text-slate-900 tracking-tight">iPhone 14 Pro (Silver)</h3>
                                            <p class="mt-1 text-xs text-primary-600 font-bold italic">Found at: Science Bldg Lab 3</p>
                                        </div>
                                    </div>
                                    
                                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-8 pt-6 border-t border-slate-50">
                                        <div>
                                            <p class="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">Claimant Info</p>
                                            <div class="flex items-center gap-3">
                                                <div class="h-8 w-8 rounded-full bg-primary-100 p-0.5">
                                                    <img src="https://ui-avatars.com/api/?name=Alex+Johnson&background=0d9488&color=fff" class="h-full w-full rounded-full">
                                                </div>
                                                <div>
                                                    <p class="text-sm font-bold text-slate-900 leading-none">Alex Johnson</p>
                                                    <p class="text-[10px] text-slate-400 font-medium italic">alex@example.com</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <p class="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">Ownership Proof Snippet</p>
                                            <p class="text-xs text-slate-600 italic font-medium">"I have a clear case with a sticker of a pine tree on the back. Passcode is 129..."</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Actions Right -->
                                <div class="lg:w-64 bg-slate-50 rounded-r-[2.5rem] p-8 flex flex-col justify-center gap-4 border-l border-slate-100">
                                    <div class="text-center mb-4">
                                        <p class="text-[10px] font-bold text-slate-400 uppercase tracking-widest leading-none">Security Match</p>
                                        <p class="mt-2 text-xl font-extrabold text-emerald-600 italic">High Confidence</p>
                                    </div>
                                    <button class="rounded-2xl bg-primary-600 py-4 text-xs font-bold text-white shadow-lg shadow-primary-200 transition hover:bg-primary-700 active:scale-95">Approve & Release</button>
                                    <button class="rounded-2xl border border-rose-100 bg-white py-4 text-xs font-bold text-rose-600 transition hover:bg-rose-50">Reject Claim</button>
                                </div>
                            </div>
                        </div>

                         <!-- Another Claim Request Card -->
                         <div class="group rounded-[2.5rem] border border-slate-200 bg-white p-1 shadow-premium transition-all hover:shadow-premium-hover">
                            <div class="flex flex-col lg:flex-row lg:items-center">
                                <div class="flex-1 p-8">
                                    <div class="flex items-center gap-4 mb-6">
                                        <div class="h-16 w-16 overflow-hidden rounded-2xl bg-slate-100">
                                            <img src="https://images.unsplash.com/photo-1584931423298-c576fda54bd2?w=100&h=100&fit=crop" class="h-full w-full object-cover">
                                        </div>
                                        <div>
                                            <p class="text-xs font-bold text-slate-400 uppercase tracking-widest leading-none">Item for Claim</p>
                                            <h3 class="mt-2 text-xl font-extrabold text-slate-900 tracking-tight">Black Leather Wallet</h3>
                                            <p class="mt-1 text-xs text-primary-600 font-bold italic">Found at: Library Cafe 2nd Floor</p>
                                        </div>
                                    </div>
                                    
                                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-8 pt-6 border-t border-slate-50">
                                        <div>
                                            <p class="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">Claimant Info</p>
                                            <div class="flex items-center gap-3">
                                                <div class="h-8 w-8 rounded-full bg-amber-100 p-0.5">
                                                    <img src="https://ui-avatars.com/api/?name=Sam+Smith&background=d97706&color=fff" class="h-full w-full rounded-full">
                                                </div>
                                                <div>
                                                    <p class="text-sm font-bold text-slate-900 leading-none">Sam Smith</p>
                                                    <p class="text-[10px] text-slate-400 font-medium italic">sam@example.com</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <p class="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">Ownership Proof Snippet</p>
                                            <p class="text-xs text-slate-600 italic font-medium">"Contains my university ID card and a Starbucks card with about $5 on it."</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="lg:w-64 bg-slate-50 rounded-r-[2.5rem] p-8 flex flex-col justify-center gap-4 border-l border-slate-100">
                                    <div class="text-center mb-4">
                                        <p class="text-[10px] font-bold text-slate-400 uppercase tracking-widest leading-none">Security Match</p>
                                        <p class="mt-2 text-xl font-extrabold text-amber-600 italic">Partial Verify Needed</p>
                                    </div>
                                    <button class="rounded-2xl bg-primary-600 py-4 text-xs font-bold text-white shadow-lg shadow-primary-200 transition hover:bg-primary-700 active:scale-95">Approve & Release</button>
                                    <button class="rounded-2xl border border-rose-100 bg-white py-4 text-xs font-bold text-rose-600 transition hover:bg-rose-50">Reject Claim</button>
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
