<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    private String escapeHtml(String value) {
        if (value == null) return "";
        return value.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
    }
%>
<%
    String error = (String) request.getAttribute("error");
    String username = (String) request.getAttribute("username");
    String email = (String) request.getAttribute("email");
    if (username == null) username = "";
    if (email == null) email = "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create Account | Findora</title>
    <%@ include file="/WEB-INF/fragments/header.jspf" %>
</head>
<body class="bg-slate-50">
    <div class="flex min-h-screen flex-col md:flex-row-reverse">
        <!-- Right Side: Interactive Branding -->
        <div class="hidden flex-1 flex-col justify-between bg-primary-700 p-12 text-white md:flex">
            <div>
                <div class="flex items-center gap-3">
                    <div class="flex h-12 w-12 items-center justify-center rounded-2xl bg-white/10 backdrop-blur-md">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="h-8 w-8 text-primary-200">
                            <path stroke-linecap="round" stroke-linejoin="round" d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z" />
                        </svg>
                    </div>
                    <span class="text-3xl font-bold tracking-tight">FINDORA</span>
                </div>
            </div>
            
            <div class="max-w-md">
                <h1 class="text-5xl font-extrabold leading-tight">Join the community of finders.</h1>
                <p class="mt-6 text-xl text-primary-100/80">Start reporting lost items and help others find what they've missing.</p>
                
                <div class="mt-12 flex flex-col gap-4">
                    <div class="flex items-center gap-4 py-2">
                        <div class="h-2 w-2 rounded-full bg-primary-300"></div>
                        <p class="font-medium text-primary-50">Real-time notifications for matches</p>
                    </div>
                    <div class="flex items-center gap-4 py-2">
                        <div class="h-2 w-2 rounded-full bg-primary-300"></div>
                        <p class="font-medium text-primary-50">Secure location management</p>
                    </div>
                    <div class="flex items-center gap-4 py-2">
                        <div class="h-2 w-2 rounded-full bg-primary-300"></div>
                        <p class="font-medium text-primary-50">Global tracking for Super Admins</p>
                    </div>
                </div>
            </div>

            <div>
                <p class="text-sm text-primary-200/50">&copy; 2026 Findora Technology</p>
            </div>
        </div>

        <!-- Left Side: Register Form -->
        <div class="flex flex-1 items-center justify-center p-8 md:p-16">
            <div class="w-full max-w-md">
                <div class="md:hidden mb-8 flex items-center gap-2">
                    <div class="h-10 w-10 bg-primary-600 rounded-xl flex items-center justify-center text-white">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                    </div>
                    <span class="text-2xl font-bold text-slate-900">FINDORA</span>
                </div>

                <div class="mb-8">
                    <h2 class="text-4xl font-extrabold tracking-tight text-slate-900">Create account</h2>
                    <p class="mt-3 text-slate-500">Join our network and help restore lost belongings.</p>
                </div>

                <% if (error != null && !error.isBlank()) { %>
                <div class="mb-6 flex items-center gap-3 rounded-2xl border border-rose-100 bg-rose-50 p-4 text-sm font-medium text-rose-700 shadow-sm animate-shake">
                    <svg class="h-5 w-5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" /></svg>
                    <%= escapeHtml(error) %>
                </div>
                <% } %>

                <form class="space-y-5" method="post" action="<%= request.getContextPath() %>/auth/register">
                    <div class="grid grid-cols-2 gap-4">
                        <div class="col-span-2 sm:col-span-1">
                            <label for="username" class="mb-2 block text-sm font-semibold text-slate-700">Username</label>
                            <input id="username" name="username" type="text" value="<%= escapeHtml(username) %>" required
                                   class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100"
                                   placeholder="johndoe">
                        </div>
                        <div class="col-span-2 sm:col-span-1">
                            <label for="role" class="mb-2 block text-sm font-semibold text-slate-700">Account Type</label>
                            <select id="role" name="role" required
                                    class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100 appearance-none bg-[url('data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20fill%3D%22none%22%20viewBox%3D%220%200%2024%2024%20stroke%3D%22currentColor%22%3E%3Cpath%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%20stroke-width%3D%222%22%20d%3D%22M19%209l-7%207-7-7%22%2F%3E%3C%2Fsvg%3E')] bg-[length:1.25em_1.25em] bg-[right_1.25rem_center] bg-no-repeat">
                                <option value="USER">Regular User</option>
                                <option value="LOCATION_ADMIN">Location Admin</option>
                            </select>
                        </div>
                    </div>

                    <div>
                        <label for="email" class="mb-2 block text-sm font-semibold text-slate-700">Email Address</label>
                        <input id="email" name="email" type="email" value="<%= escapeHtml(email) %>" required
                               class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100"
                               placeholder="john@example.com">
                    </div>

                    <div>
                        <label for="password" class="mb-2 block text-sm font-semibold text-slate-700">Password</label>
                        <input id="password" name="password" type="password" required
                               class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100"
                               placeholder="••••••••">
                    </div>

                    <div class="flex items-start gap-2 pt-2">
                        <input type="checkbox" id="terms" required class="mt-1 h-4 w-4 rounded border-slate-300 text-primary-600 focus:ring-primary-500">
                        <label for="terms" class="text-xs text-slate-500 leading-relaxed">
                            By creating an account, you agree to Findora's <a href="#" class="text-primary-600 font-semibold">Terms of Service</a> and <a href="#" class="text-primary-600 font-semibold">Privacy Policy</a>.
                        </label>
                    </div>

                    <button type="submit"
                            class="flex w-full items-center justify-center gap-2 rounded-2xl bg-primary-600 px-5 py-4 text-sm font-bold text-white shadow-lg shadow-primary-200 transition-all hover:bg-primary-700 hover:shadow-primary-300 active:scale-[0.98]">
                        Create Account
                        <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/></svg>
                    </button>
                </form>

                <p class="mt-10 text-center text-sm font-medium text-slate-600">
                    Already have an account? 
                    <a href="<%= request.getContextPath() %>/auth/login" class="font-bold text-primary-600 hover:text-primary-700 underline-offset-4 hover:underline transition">Sign in instead</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
