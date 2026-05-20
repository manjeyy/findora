<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <jsp:include page="/components/head.jsp" />
    <title>Location Admin Dashboard | Findora</title>
  </head>
  <body class="flex min-h-screen flex-col text-on-surface">
    <% request.setAttribute("sectionLabel", "Location Overview"); %> <%
    request.setAttribute("pageTitle", "Location Overview"); %>
    <jsp:include page="/components/location-admin/layout_start.jsp" />
    <div class="p-6 lg:p-10 space-y-8">

    </div>
  </body>
</html>
