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
    <title>Report Problem | Findora</title>
    <%@ include file="/WEB-INF/fragments/header.jspf" %>
</head>
<body class="bg-slate-50">
    <div class="flex h-screen flex-col">
        <%@ include file="/WEB-INF/fragments/navbar.jspf" %>
        
        <div class="flex flex-1 overflow-hidden">
            <%@ include file="/WEB-INF/fragments/sidebar.jspf" %>
            
            <main class="flex-1 overflow-y-auto p-8">
                <div class="mx-auto max-w-4xl">
                    <!-- Header -->
                    <div class="mb-10 text-center">
                        <div class="inline-flex h-16 w-16 items-center justify-center rounded-3xl bg-rose-50 text-rose-600 mb-6 border border-rose-100 shadow-sm">
                            <svg class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" /></svg>
                        </div>
                        <h1 class="text-4xl font-extrabold tracking-tight text-slate-900 leading-none">Security & Report</h1>
                        <p class="mt-4 text-slate-500 max-w-xl mx-auto font-medium">Spotted a fake item? Someone being suspicious? Let our admins know immediately.</p>
                    </div>

                    <div class="rounded-3xl border border-slate-200 bg-white p-10 shadow-premium relative overflow-hidden">
                        <!-- Background Accents -->
                        <div class="absolute -right-4 -top-4 h-32 w-32 rounded-full bg-rose-50/50"></div>
                        
                        <form action="#" method="POST" class="relative z-10 space-y-8">
                            <div class="grid grid-cols-1 gap-8 sm:grid-cols-2">
                                <div class="col-span-2">
                                    <label class="mb-2 block text-sm font-bold text-slate-700">Report Title</label>
                                    <input type="text" placeholder="e.g. Suspicious 'Claim' activity on iPhone listing" 
                                           class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-rose-500 focus:outline-none focus:ring-4 focus:ring-rose-50">
                                </div>

                                <div>
                                    <label class="mb-2 block text-sm font-bold text-slate-700">Severity Level</label>
                                    <select class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-rose-500 focus:outline-none focus:ring-4 focus:ring-rose-50 appearance-none bg-[url('data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20fill%3D%22none%22%20viewBox%3D%220%200%2024%2024%20stroke%3D%22currentColor%22%3E%3Cpath%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%20stroke-width%3D%222%22%20d%3D%22M19%209l-7%207-7-7%22%2F%3E%3C%2Fsvg%3E')] bg-[length:1.25em_1.25em] bg-[right_1.25rem_center] bg-no-repeat">
                                        <option>Low (Minor concern)</option>
                                        <option>Medium (Suspicious behavior)</option>
                                        <option>High (Potential fraud/threat)</option>
                                        <option>Critical (System vulnerability)</option>
                                    </select>
                                </div>

                                <div>
                                    <label class="mb-2 block text-sm font-bold text-slate-700">Item Reference (ID)</label>
                                    <input type="text" placeholder="e.g. #ITM-9823 (Optional)" 
                                           class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-rose-500 focus:outline-none focus:ring-4 focus:ring-rose-50">
                                </div>

                                <div class="col-span-2">
                                    <label class="mb-2 block text-sm font-bold text-slate-700">Detailed Description</label>
                                    <textarea rows="6" placeholder="Describe the incident, username involved, or reasons for suspicion..." 
                                              class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-rose-500 focus:outline-none focus:ring-4 focus:ring-rose-50 resize-none"></textarea>
                                </div>
                            </div>

                            <div class="rounded-2xl border border-slate-100 bg-slate-50 p-6">
                                <label class="mb-4 block text-xs font-bold uppercase tracking-widest text-slate-500 italic">Evidence (Optional)</label>
                                <div class="flex items-center gap-4">
                                    <button type="button" class="flex items-center gap-2 rounded-xl border border-slate-200 bg-white px-4 py-2.5 text-xs font-bold text-slate-600 transition hover:bg-slate-100">
                                        <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z"/></svg>
                                        Attach Screenshot
                                    </button>
                                    <p class="text-[10px] text-slate-400 font-medium italic">Max file size: 5MB (JPG, PNG)</p>
                                </div>
                            </div>

                            <div class="flex items-center justify-between border-t border-slate-100 pt-8">
                                <p class="text-xs text-slate-500 italic max-w-xs">Reports are anonymous to the reported party but visible to Findora Super Admins.</p>
                                <button type="submit" class="rounded-2xl bg-rose-600 px-10 py-4 text-sm font-bold text-white shadow-lg shadow-rose-100 transition-all hover:bg-rose-700 active:scale-95">Send Report</button>
                            </div>
                        </form>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
