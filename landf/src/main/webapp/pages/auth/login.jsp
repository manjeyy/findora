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
    if (username == null) username = "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login | Findora</title>
    <%@ include file="/WEB-INF/fragments/header.jspf" %>
</head>
<body class="bg-slate-50">
    <div class="flex min-h-screen flex-col md:flex-row">
        <!-- Left Side: Interactive Branding -->
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
                <h1 class="text-5xl font-extrabold leading-tight">Reconnecting lost treasures with their owners.</h1>
                <p class="mt-6 text-xl text-primary-100/80">The most trusted and beautiful lost & found management system for modern workspaces.</p>
                
                <div class="mt-12 flex flex-col gap-6">
                    <div class="flex items-start gap-4 rounded-3xl bg-white/5 p-6 backdrop-blur-sm transition-all hover:bg-white/10">
                        <div class="rounded-xl bg-primary-400/20 p-2">
                            <svg class="h-6 w-6 text-primary-300" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04M12 21.48V11.5" /></svg>
                        </div>
                        <div>
                            <h3 class="font-semibold text-white">Secure & Private</h3>
                            <p class="text-sm text-primary-100/60">Verified ownership proof for every claim requested.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <p class="text-sm text-primary-200/50">&copy; 2026 Findora Technology</p>
            </div>
        </div>

        <!-- Right Side: Login Form -->
        <div class="flex flex-1 items-center justify-center p-8 md:p-16">
            <div class="w-full max-w-md">
                <div class="md:hidden mb-8 flex items-center gap-2">
                    <div class="h-10 w-10 bg-primary-600 rounded-xl flex items-center justify-center text-white">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                    </div>
                    <span class="text-2xl font-bold text-slate-900">FINDORA</span>
                </div>

                <div class="mb-10">
                    <h2 class="text-4xl font-extrabold tracking-tight text-slate-900">Welcome back</h2>
                    <p class="mt-3 text-slate-500">Please enter your credentials to access your dashboard.</p>
                </div>

                <% if (error != null && !error.isBlank()) { %>
                <div class="mb-6 flex items-center gap-3 rounded-2xl border border-rose-100 bg-rose-50 p-4 text-sm font-medium text-rose-700 shadow-sm animate-shake">
                    <svg class="h-5 w-5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" /></svg>
                    <%= error %>
                </div>
                <% } %>

                <form class="space-y-6" method="post" action="<%= request.getContextPath() %>/auth/login">
                    <div>
                        <label for="username" class="mb-2 block text-sm font-semibold text-slate-700">Username</label>
                        <input id="username" name="username" type="text" value="<%= escapeHtml(username) %>" required
                               class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100"
                               placeholder="john_doe">
                    </div>

                    <div>
                        <div class="flex items-center justify-between mb-2">
                            <label for="password" class="block text-sm font-semibold text-slate-700">Password</label>
                            <a href="#" class="text-xs font-semibold text-primary-600 hover:text-primary-700 transition">Forgot password?</a>
                        </div>
                        <input id="password" name="password" type="password" required
                               class="w-full rounded-2xl border border-slate-200 bg-white px-5 py-4 text-sm transition-all focus:border-primary-500 focus:outline-none focus:ring-4 focus:ring-primary-100"
                               placeholder="••••••••">
                    </div>

                    <div class="flex items-center gap-2">
                        <input type="checkbox" id="remember" class="h-4 w-4 rounded border-slate-300 text-primary-600 focus:ring-primary-500">
                        <label for="remember" class="text-sm text-slate-600 font-medium">Keep me signed in</label>
                    </div>

                    <button type="submit"
                            class="flex w-full items-center justify-center gap-2 rounded-2xl bg-primary-600 px-5 py-4 text-sm font-bold text-white shadow-lg shadow-primary-200 transition-all hover:bg-primary-700 hover:shadow-primary-300 active:scale-[0.98]">
                        Sign in to Account
                        <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"/></svg>
                    </button>
                </form>

                <p class="mt-10 text-center text-sm font-medium text-slate-600">
                    New to Findora? 
                    <a href="<%= request.getContextPath() %>/auth/register" class="font-bold text-primary-600 hover:text-primary-700 underline-offset-4 hover:underline transition">Create free account</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
