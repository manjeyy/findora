<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <% com.landf.features.admin.AdminDashboardStats stats =
(com.landf.features.admin.AdminDashboardStats) request.getAttribute("stats");
request.setAttribute("sectionLabel", "System Overview");
request.setAttribute("pageTitle", "Dashboard"); %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <jsp:include page="/components/head.jsp" />
    <title>Admin Dashboard | Findora</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <style>
      body {
        font-family: "Inter", sans-serif;
        background: #f7fafa;
      }

      h1,
      h2,
      h3 {
        font-family: "Manrope", sans-serif;
      }
    </style>
  </head>
  <body class="text-slate-900 min-h-screen">
    <jsp:include page="/components/admin/sidebar.jsp" />
    <main class="ml-64 min-h-screen flex flex-col">
      <jsp:include page="/components/admin/header.jsp" />

      <section class="flex-1 pt-24 pb-12 px-6">
        <div class="max-w-7xl mx-auto">
          <!-- Welcome Section -->
          <div class="mb-8">
            <h1 class="text-3xl font-bold text-slate-900 mb-2">
              Welcome to Admin Dashboard
            </h1>
            <p class="text-slate-600">
              Monitor system health and manage institutional data
            </p>
          </div>

          <!-- Key Metrics Grid -->
          <div
            class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8"
          >
            <!-- Pending Locations -->
            <div
              class="bg-white rounded-lg border border-slate-200 p-6 hover:shadow-lg transition-shadow"
            >
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-sm text-slate-600 mb-2">Pending Locations</p>
                  <p class="text-3xl font-bold text-teal-600">
                    <%= stats != null ? stats.getPendingLocations() : 0 %>
                  </p>
                </div>
                <div
                  class="w-12 h-12 rounded-lg bg-orange-100 flex items-center justify-center"
                >
                  <span
                    class="material-symbols-outlined text-orange-600 text-2xl"
                    >location_on</span
                  >
                </div>
              </div>
              <a
                href="<%= request.getContextPath() %>/admin/locations/pending"
                class="text-xs text-teal-600 font-semibold mt-4 hover:text-teal-800"
                >Review Pending →</a
              >
            </div>

            <!-- Pending Claims -->
            <div
              class="bg-white rounded-lg border border-slate-200 p-6 hover:shadow-lg transition-shadow"
            >
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-sm text-slate-600 mb-2">Pending Claims</p>
                  <p class="text-3xl font-bold text-teal-600">
                    <%= stats != null ? stats.getPendingClaims() : 0 %>
                  </p>
                </div>
                <div
                  class="w-12 h-12 rounded-lg bg-blue-100 flex items-center justify-center"
                >
                  <span class="material-symbols-outlined text-blue-600 text-2xl"
                    >assignment_turned_in</span
                  >
                </div>
              </div>
              <a
                href="<%= request.getContextPath() %>/admin/claims"
                class="text-xs text-teal-600 font-semibold mt-4 hover:text-teal-800"
                >Review Claims →</a
              >
            </div>

            <!-- Pending Reports -->
            <div
              class="bg-white rounded-lg border border-slate-200 p-6 hover:shadow-lg transition-shadow"
            >
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-sm text-slate-600 mb-2">Pending Reports</p>
                  <p class="text-3xl font-bold text-teal-600">
                    <%= stats != null ? stats.getPendingReports() : 0 %>
                  </p>
                </div>
                <div
                  class="w-12 h-12 rounded-lg bg-purple-100 flex items-center justify-center"
                >
                  <span
                    class="material-symbols-outlined text-purple-600 text-2xl"
                    >flag</span
                  >
                </div>
              </div>
              <a
                href="<%= request.getContextPath() %>/admin/reports"
                class="text-xs text-teal-600 font-semibold mt-4 hover:text-teal-800"
                >Review Reports →</a
              >
            </div>

            <!-- Open Items -->
            <div
              class="bg-white rounded-lg border border-slate-200 p-6 hover:shadow-lg transition-shadow"
            >
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-sm text-slate-600 mb-2">Open Items</p>
                  <p class="text-3xl font-bold text-teal-600">
                    <%= stats != null ? stats.getOpenItems() : 0 %>
                  </p>
                </div>
                <div
                  class="w-12 h-12 rounded-lg bg-green-100 flex items-center justify-center"
                >
                  <span
                    class="material-symbols-outlined text-green-600 text-2xl"
                    >inventory_2</span
                  >
                </div>
              </div>
              <a
                href="<%= request.getContextPath() %>/admin/items"
                class="text-xs text-teal-600 font-semibold mt-4 hover:text-teal-800"
                >View Items →</a
              >
            </div>
          </div>

          <!-- Secondary Metrics Row -->
          <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <!-- Total Users -->
            <div
              class="bg-white rounded-lg border border-slate-200 p-6 hover:shadow-lg transition-shadow"
            >
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-sm text-slate-600 mb-2">Total Users</p>
                  <p class="text-3xl font-bold text-slate-900">
                    <%= stats != null ? stats.getTotalUsers() : 0 %>
                  </p>
                </div>
                <div
                  class="w-12 h-12 rounded-lg bg-slate-100 flex items-center justify-center"
                >
                  <span
                    class="material-symbols-outlined text-slate-600 text-2xl"
                    >group</span
                  >
                </div>
              </div>
              <a
                href="<%= request.getContextPath() %>/admin/users"
                class="text-xs text-teal-600 font-semibold mt-4 hover:text-teal-800"
                >Manage Users →</a
              >
            </div>

            <!-- Suspended Users -->
            <div
              class="bg-white rounded-lg border border-slate-200 p-6 hover:shadow-lg transition-shadow"
            >
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-sm text-slate-600 mb-2">Suspended Users</p>
                  <p class="text-3xl font-bold text-red-600">
                    <%= stats != null ? stats.getSuspendedUsers() : 0 %>
                  </p>
                </div>
                <div
                  class="w-12 h-12 rounded-lg bg-red-100 flex items-center justify-center"
                >
                  <span class="material-symbols-outlined text-red-600 text-2xl"
                    >block</span
                  >
                </div>
              </div>
              <a
                href="<%= request.getContextPath() %>/admin/users"
                class="text-xs text-teal-600 font-semibold mt-4 hover:text-teal-800"
                >Review Suspensions →</a
              >
            </div>

            <!-- Total Recoveries -->
            <div
              class="bg-white rounded-lg border border-slate-200 p-6 hover:shadow-lg transition-shadow"
            >
              <div class="flex items-center justify-between">
                <div>
                  <p class="text-sm text-slate-600 mb-2">Total Recoveries</p>
                  <p class="text-3xl font-bold text-emerald-600">
                    <%= stats != null ? stats.getTotalRecoveries() : 0 %>
                  </p>
                </div>
                <div
                  class="w-12 h-12 rounded-lg bg-emerald-100 flex items-center justify-center"
                >
                  <span
                    class="material-symbols-outlined text-emerald-600 text-2xl"
                    >check_circle</span
                  >
                </div>
              </div>
              <a
                href="<%= request.getContextPath() %>/admin/items/ledger"
                class="text-xs text-teal-600 font-semibold mt-4 hover:text-teal-800"
                >View Ledger →</a
              >
            </div>
          </div>

          <!-- Quick Actions Section -->
          <div class="bg-white rounded-lg border border-slate-200 p-6">
            <h2 class="text-lg font-bold text-slate-900 mb-4">Quick Actions</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-3">
              <a
                href="<%= request.getContextPath() %>/admin/locations/new"
                class="flex items-center gap-3 p-4 bg-teal-50 hover:bg-teal-100 rounded-lg transition-colors border border-teal-200"
              >
                <span class="material-symbols-outlined text-teal-600 text-2xl"
                  >add_location</span
                >
                <div>
                  <p class="font-semibold text-teal-900">Add Location</p>
                  <p class="text-xs text-teal-700">Create a new location</p>
                </div>
              </a>
              <a
                href="<%= request.getContextPath() %>/admin/items/moderate"
                class="flex items-center gap-3 p-4 bg-blue-50 hover:bg-blue-100 rounded-lg transition-colors border border-blue-200"
              >
                <span class="material-symbols-outlined text-blue-600 text-2xl"
                  >verified_user</span
                >
                <div>
                  <p class="font-semibold text-blue-900">Moderate Items</p>
                  <p class="text-xs text-blue-700">Review flagged content</p>
                </div>
              </a>
              <a
                href="<%= request.getContextPath() %>/admin/reports"
                class="flex items-center gap-3 p-4 bg-purple-50 hover:bg-purple-100 rounded-lg transition-colors border border-purple-200"
              >
                <span class="material-symbols-outlined text-purple-600 text-2xl"
                  >assessment</span
                >
                <div>
                  <p class="font-semibold text-purple-900">Generate Report</p>
                  <p class="text-xs text-purple-700">View system analytics</p>
                </div>
              </a>
            </div>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
