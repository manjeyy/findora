<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    String error = (String) request.getAttribute("error");
    String username = (String) request.getAttribute("username");
    String email = (String) request.getAttribute("email");

    if (username == null) {
        username = "";
    }

    if (email == null) {
        email = "";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Lost and Found</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&display=swap"
          rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Space Grotesk', sans-serif;
            background-image: radial-gradient(circle at 80% 10%, #bfdbfe 0%, #f8fafc 36%, #e2e8f0 100%);
        }
    </style>
</head>
<body class="min-h-screen text-slate-900">
<main class="mx-auto flex min-h-screen w-full max-w-md items-center px-6 py-12">
    <section class="w-full rounded-2xl border border-slate-200 bg-white p-8">
        <div class="mb-8">
            <h1 class="mt-2 text-3xl font-bold tracking-tight text-slate-900">Create account</h1>
            <p class="mt-2 text-sm text-slate-600">Set up your credentials for the Lost and Found system.</p>
        </div>

        <% if (error != null && !error.isBlank()) { %>
        <div class="mb-4 rounded-xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm font-medium text-rose-700">
            <%= escapeHtml(error) %>
        </div>
        <% } %>

        <form class="space-y-5" method="post" action="<%= request.getContextPath() %>/auth/register">
            <div>
                <label for="username" class="mb-1 block text-sm font-semibold text-slate-700">Username</label>
                <input
                        id="username"
                        name="username"
                        type="text"
                        value="<%= escapeHtml(username) %>"
                        autocomplete="username"
                        required
                        class="w-full rounded-xl border border-slate-300 bg-white px-4 py-2.5 text-sm outline-none ring-sky-500 transition focus:ring-2"
                >
            </div>

            <div>
                <label for="username" class="mb-1 block text-sm font-semibold text-slate-700">Email</label>
                <input
                        id="email"
                        name="email"
                        type="email"
                        value="<%= escapeHtml(email) %>"
                        autocomplete="email"
                        required
                        class="w-full rounded-xl border border-slate-300 bg-white px-4 py-2.5 text-sm outline-none ring-sky-500 transition focus:ring-2"
                >
            </div>

            <div>
                <label for="password" class="mb-1 block text-sm font-semibold text-slate-700">Password</label>
                <input
                        id="password"
                        name="password"
                        type="password"
                        autocomplete="new-password"
                        required
                        class="w-full rounded-xl border border-slate-300 bg-white px-4 py-2.5 text-sm outline-none ring-sky-500 transition focus:ring-2"
                >
            </div>

            <button
                    type="submit"
                    formmethod="post"
                    class="w-full rounded-xl bg-sky-700 px-4 py-3 text-sm font-semibold text-white transition hover:bg-sky-800"
            >
                Create account
            </button>
        </form>

        <p class="mt-6 text-center text-sm text-slate-600">
            Already have an account?
            <a href="<%= request.getContextPath() %>/auth/login"
               class="font-semibold text-sky-700 underline-offset-2 hover:underline">Sign in</a>
        </p>
    </section>
</main>
</body>
</html>
