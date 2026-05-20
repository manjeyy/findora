<%
    String sectionLabel = (String) request.getAttribute("sectionLabel");
    if (sectionLabel == null) {
        sectionLabel = "Location Admin";
    }

    String pageTitle = (String) request.getAttribute("pageTitle");
    if (pageTitle == null) {
        pageTitle = "Assigned Location";
    }

    String pageActionsHtml = (String) request.getAttribute("pageActionsHtml");

    String searchPlaceholder = (String) request.getAttribute("searchPlaceholder");
    if (searchPlaceholder == null) {
        searchPlaceholder = "Search the location ledger...";
    }
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="fixed top-0 left-64 right-0 h-20 bg-white border-b border-slate-200 z-50 flex items-center justify-between px-6">

    <!-- Left: Section + Title -->
    <div class="flex flex-col justify-center">
        <p class="text-xs font-semibold uppercase tracking-wider text-slate-400"><%= sectionLabel %></p>
        <h2 class="text-lg font-semibold text-slate-800"><%= pageTitle %></h2>
    </div>

    <!-- Center: Search -->
    <div class="flex-1 flex justify-center px-6">
        <div class="relative w-full max-w-md">
            <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400">search</span>
            <input type="text" placeholder="<%= searchPlaceholder %>"
                   class="w-full bg-slate-100 border border-slate-200 rounded-lg py-2 pl-10 pr-4 text-sm focus:outline-none focus:ring-2 focus:ring-teal-500/20 focus:bg-white transition"/>
        </div>
    </div>

    <!-- Right: Actions -->
    <div class="flex items-center gap-4">
        <% if (pageActionsHtml != null) { %>
        <div class="hidden md:block"><%= pageActionsHtml %></div>
        <% } %>

        <c:choose>
            <c:when test="${not empty authUser}">
                <a href="${pageContext.request.contextPath}/profile" class="h-9 w-9 rounded-full overflow-hidden border border-slate-200 block">
                    <c:choose>
                        <c:when test="${not empty sessionScope.profilePhoto}">
                            <img alt="Location admin profile" class="h-full w-full object-cover" src="${sessionScope.profilePhoto}"/>
                        </c:when>
                        <c:otherwise>
                            <img alt="Location admin profile" class="h-full w-full object-cover" src="https://img.freepik.com/free-photo/closeup-shot-beautiful-butterfly-with-interesting-textures-orange-petaled-flower_181624-7640.jpg?semt=ais_hybrid&w=740&q=80"/>
                        </c:otherwise>
                    </c:choose>
                </a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/auth/login" class="px-3 py-1 rounded text-sm font-medium bg-primary text-on-primary">Sign in</a>
            </c:otherwise>
        </c:choose>
    </div>
</header>
<div class="w-full h-20"></div>