<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.landf.features.auth.AuthConstants" %>
<%!
    private String escapeHtml(String value) {
        if (value == null) {
            return "";
        }

        return value
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
%>
<%
    String username = (String) request.getAttribute(AuthConstants.AUTH_USER_KEY);
    if (username == null || username.isBlank()) {
        response.sendRedirect(request.getContextPath() + "/auth/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Lost and Found</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Space Grotesk', sans-serif;
            background-image: linear-gradient(160deg, #f8fafc 0%, #dbeafe 45%, #e2e8f0 100%);
        }
    </style>
</head>
<body class="min-h-screen text-slate-900">
<main class="mx-auto max-w-4xl px-6 py-12">
    <header class="mb-8 flex flex-wrap items-center justify-between gap-4 rounded-2xl border border-slate-200 bg-white px-6 py-4">
        <div>
            <p class="text-xs font-semibold uppercase tracking-[0.18em] text-sky-700">LandF Dashboard</p>
            <h1 class="mt-1 text-2xl font-bold">Welcome, <%= escapeHtml(username) %></h1>
        </div>
        <a href="<%= request.getContextPath() %>/auth/logout"
           class="rounded-xl border border-slate-300 bg-white px-4 py-2 text-sm font-semibold text-slate-700 transition hover:bg-slate-100">
            Logout
        </a>
    </header>

    <section class="rounded-2xl border border-slate-200 bg-white p-6">
        <h2 class="text-lg font-semibold">You are signed in</h2>
        <p class="mt-2 text-sm text-slate-600">
            Login and logout are now handled through JWT tokens backed by MariaDB user accounts.
        </p>
    </section>
</main>
</body>
</html>
