<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Lost and Found</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&display=swap"
          rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Space Grotesk', sans-serif;
            background-image: radial-gradient(circle at 20% 20%, #dbeafe 0%, #f8fafc 40%, #f1f5f9 100%);
        }
    </style>
</head>
<body class="min-h-screen text-slate-900">
<main class="mx-auto flex min-h-screen w-full max-w-md items-center px-6 py-12">
    <section class="w-full rounded-2xl border border-slate-200 bg-white p-8">
        <div class="mb-8">
            <h1 class="mt-2 text-3xl font-bold tracking-tight text-slate-900">Sign in</h1>
            <p class="mt-2 text-sm text-slate-600">Use your account to continue to your dashboard.</p>
        </div>

        <div class="mb-4 rounded-xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm font-medium text-rose-700">
        </div>
        <div class="mb-4 rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm font-medium text-emerald-700">
        </div>

        <form class="space-y-5" method="post" action="/auth/login">
            <div>
                <label for="username" class="mb-1 block text-sm font-semibold text-slate-700">Username</label>
                <input
                        id="username"
                        name="username"
                        type="text"
                        value=""
                        autocomplete="username"
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
                        autocomplete="current-password"
                        required
                        class="w-full rounded-xl border border-slate-300 bg-white px-4 py-2.5 text-sm outline-none ring-sky-500 transition focus:ring-2"
                >
            </div>

            <button
                    type="submit"
                    class="w-full rounded-xl bg-sky-700 px-4 py-3 text-sm font-semibold text-white transition hover:bg-sky-800"
            >
                Sign in
            </button>
        </form>

        <p class="mt-6 text-center text-sm text-slate-600">
            Need an account?
            <a class="font-semibold text-sky-700 underline-offset-2 hover:underline">Create one</a>
        </p>
    </section>
</main>
</body>
</html>
