<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <jsp:include page="/components/head.jsp"/>
    <title>Admin Dashboard | Findora</title>
    <style> body {
        font-family: "Inter", sans-serif;
        background: #f7fafa;
    }

    h1, h2, h3 {
        font-family: "Manrope", sans-serif;
    } </style>
</head>
<body class="text-slate-900 min-h-screen">
<jsp:include page="/components/admin/sidebar.jsp"/>
<main class="ml-64 min-h-screen flex flex-col">
    <jsp:include page="/components/admin/header.jsp"/>
    <section class="flex-1"></section>
</main>
</body>
</html>
