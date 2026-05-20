<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>404 - Page Not Found | Findora</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Inter:wght@400;500;600&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
      rel="stylesheet"
    />
    <style>
      body {
        font-family: "Inter", sans-serif;
        background-color: #f7fafa;
      }
      h1,
      h2,
      h3 {
        font-family: "Manrope", sans-serif;
      }
    </style>
  </head>
  <body class="bg-background text-on-surface min-h-screen flex flex-col">
    <jsp:include page="/components/navbar.jsp" />

    <main
      class="flex-grow flex flex-col items-center justify-center px-6 py-12"
    >
      <div class="max-w-2xl text-center">
        <!-- Error Icon -->
        <div class="mb-8 flex justify-center">
          <div class="relative">
            <span
              class="material-symbols-outlined text-9xl text-error"
              style="font-variation-settings: &quot;FILL&quot; 1"
              >error</span
            >
          </div>
        </div>

        <!-- Error Code -->
        <h1 class="text-7xl font-extrabold text-error mb-4">404</h1>

        <!-- Error Title -->
        <h2 class="text-3xl font-bold text-on-surface mb-4">Page Not Found</h2>

        <!-- Error Description -->
        <p class="text-on-surface-variant text-lg mb-8 leading-relaxed">
          The page you are looking for doesn't exist or may have been moved.
          Please check the URL and try again, or return to the home page.
        </p>

        <!-- Action Buttons -->
        <div class="flex flex-col sm:flex-row gap-4 justify-center">
          <a
            href="${pageContext.request.contextPath}/home"
            class="px-8 py-4 bg-primary text-on-primary font-bold rounded-lg hover:bg-primary-container transition-colors"
          >
            <span class="material-symbols-outlined mr-2 align-middle"
              >home</span
            >
            Go to Home
          </a>
          <a
            href="${pageContext.request.contextPath}/browse-items"
            class="px-8 py-4 bg-surface-container-high text-on-surface font-bold rounded-lg hover:bg-surface-container-low transition-colors"
          >
            <span class="material-symbols-outlined mr-2 align-middle"
              >search</span
            >
            Browse Items
          </a>
        </div>

        <!-- Help Text -->
        <div
          class="mt-12 p-6 bg-surface-container-low rounded-lg border border-outline-variant/15"
        >
          <p class="text-sm text-on-surface-variant">
            <span class="material-symbols-outlined text-sm align-middle"
              >info</span
            >
            Need help?
            <a
              href="${pageContext.request.contextPath}/help"
              class="text-primary font-semibold hover:underline"
              >Contact Support</a
            >
          </p>
        </div>
      </div>
    </main>

    <jsp:include page="/components/footer.jsp" />
  </body>
</html>
