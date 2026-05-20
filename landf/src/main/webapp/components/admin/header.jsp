<%
    String sectionLabel = (String) request.getAttribute("sectionLabel");
    if (sectionLabel == null) {
        sectionLabel = "Admin Console";
    }

    String pageTitle = (String) request.getAttribute("pageTitle");
    if (pageTitle == null) {
        pageTitle = "Administrator";
    }

    String pageActionsHtml = (String) request.getAttribute("pageActionsHtml");

    String searchPlaceholder = (String) request.getAttribute("searchPlaceholder");
    if (searchPlaceholder == null) {
        searchPlaceholder = "Search institutional data...";
    }
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="fixed top-0 left-64 right-0 h-20 bg-white border-b border-slate-200 z-50 flex items-center justify-between px-6">

    <!-- Left: Section + Title -->
    <div class="flex flex-col justify-center">
        <p class="text-xs font-semibold uppercase tracking-wider text-slate-400">
            <%= sectionLabel %>
        </p>
        <h2 class="text-lg font-semibold text-slate-800">
            <%= pageTitle %>
        </h2>
    </div>

    <!-- Center: Search -->
    <div class="flex-1 flex justify-center px-6">
    </div>

    <!-- Right: Actions -->
    <div class="flex items-center gap-4">

        <% if (pageActionsHtml != null) { %>
        <div class="hidden md:block">
            <%= pageActionsHtml %>
        </div>
        <% } %>

        <c:choose>
            <c:when test="${not empty authUser}">
                <a href="${pageContext.request.contextPath}/profile" class="h-9 w-9 rounded-full overflow-hidden border border-slate-200 block">
                    <c:choose>
                        <c:when test="${not empty sessionScope.profilePhoto}">
                            <img alt="User profile" src="${sessionScope.profilePhoto}" class="h-full w-full object-cover" />
                        </c:when>
                        <c:otherwise>
                            <img alt="User profile" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbLn77P1T_bjhytVmUGu3TK6DS479gDxC9iQ&s" class="h-full w-full object-cover" />
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
