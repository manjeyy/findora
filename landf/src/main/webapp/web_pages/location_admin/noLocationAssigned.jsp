<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <% request.setAttribute("sectionLabel", "Location Admin
Console"); request.setAttribute("pageTitle", "No Assigned Location"); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="/components/head.jsp" />
    <title>No Assigned Location</title>
    <style>
      body {
        font-family: "Inter", sans-serif;
        background: #f7fafa;
      }
    </style>
  </head>
  <body class="text-slate-900 min-h-screen">
    <jsp:include page="/components/location-admin/layout_start.jsp" />
    <section class="p-8">
      <div
        class="max-w-3xl mx-auto bg-white rounded-2xl p-8 border border-slate-200"
      >
        <h1 class="text-2xl font-bold">No location assigned</h1>
        <p class="mt-3 text-slate-600">
          Your account does not currently have a location assigned. Please
          contact a global administrator to be assigned to a location before
          using the location-admin dashboard.
        </p>
        <div class="mt-6">
          <a
            href="<%= request.getContextPath() %>/dashboard"
            class="inline-block bg-slate-100 px-4 py-2 rounded-lg"
            >Return to dashboard</a
          >
        </div>
      </div>
    </section>
    <jsp:include page="/components/location-admin/layout_end.jsp" />
  </body>
</html>
