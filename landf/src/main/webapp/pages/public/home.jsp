<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <jsp:include page="/components/head.jsp"/>
    <title>Dashboard</title>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class", theme: {
                extend: {
                    colors: {
                        "on-secondary-fixed": "#2f1500",
                        secondary: "#904d00",
                        background: "#f7fafa",
                        surface: "#f7fafa",
                        outline: "#6e7979",
                        "on-primary": "#ffffff",
                        "secondary-fixed": "#ffdcc3",
                        "on-tertiary-container": "#ebffe3",
                        "surface-dim": "#d7dbdb",
                        "secondary-container": "#fd8b00",
                        "tertiary-fixed": "#a3f69c",
                        "primary-fixed": "#93f2f2",
                        "on-error-container": "#93000a",
                        "on-primary-fixed": "#002020",
                        "on-tertiary-fixed-variant": "#005312",
                        "surface-variant": "#e0e3e3",
                        "surface-container-low": "#f1f4f4",
                        error: "#ba1a1a",
                        "on-secondary": "#ffffff",
                        "error-container": "#ffdad6",
                        "on-surface": "#181c1d",
                        "surface-bright": "#f7fafa",
                        primary: "#006565",
                        "surface-tint": "#006a6a",
                        "primary-fixed-dim": "#76d6d5",
                        "secondary-fixed-dim": "#ffb77d",
                        "surface-container-high": "#e6e9e9",
                        "outline-variant": "#bdc9c8",
                        "surface-container-lowest": "#ffffff",
                        "on-primary-fixed-variant": "#004f4f",
                        "inverse-on-surface": "#eef1f1",
                        "inverse-surface": "#2d3131",
                        "surface-container": "#ebeeee",
                        "surface-container-highest": "#e0e3e3",
                        "on-error": "#ffffff",
                        "inverse-primary": "#76d6d5",
                        "on-primary-container": "#e3fffe",
                        "on-secondary-container": "#603100",
                        "on-background": "#181c1d",
                        "on-secondary-fixed-variant": "#6e3900",
                        "tertiary-fixed-dim": "#88d982",
                        "primary-container": "#008080",
                        "on-tertiary": "#ffffff",
                        "tertiary-container": "#338236",
                        tertiary: "#156820",
                        "on-surface-variant": "#3e4949",
                        "on-tertiary-fixed": "#002204",
                    },
                    borderRadius: {DEFAULT: "0.25rem", lg: "1rem", xl: "1.5rem", full: "9999px",},
                    fontFamily: {headline: ["Manrope"], body: ["Plus Jakarta Sans"], label: ["Plus Jakarta Sans"],},
                },
            },
        };
    </script>
    <style>
        body {
            font-family: "Plus Jakarta Sans", sans-serif;
            background-color: #f7fafa;
        }

        .headline-font {
            font-family: "Manrope", sans-serif;
            letter-spacing: -0.02em;
        }

        .glass-nav {
            backdrop-filter: blur(20px);
        }

        .signature-gradient {
            background: linear-gradient(135deg, #006565 0%, #008080 100%);
        }
    </style>
</head>
<body class="bg-surface text-on-surface antialiased">
<jsp:include page="/components/navbar.jsp"/>
<main class="pt-28 pb-32 px-8 max-w-7xl mx-auto">
    <!-- Hero Header -->
    <section class="mb-12 grid grid-cols-1 lg:grid-cols-12 gap-8 items-end">
        <div class="lg:col-span-8">
            <h1 class="text-5xl font-extrabold headline-font text-on-surface mb-4">Welcome back!</h1>
        </div>
        <div class="lg:col-span-4">
            <!-- Gamification Widget -->
            <div class="bg-surface-container-lowest rounded-xl p-6 border-outline-variant/15 border flex items-center justify-between shadow-[0_8px_24px_rgba(24,28,29,0.04)]">
                <div>
                    <span class="text-xs font-bold text-on-surface-variant tracking-wider block mb-1">COMMUNITY STATS</span>
                    <div class="flex items-center gap-2">
                        <span class="text-3xl font-extrabold headline-font text-primary">${totalOpenItems}</span>
                        <span class="text-xs font-semibold text-tertiary px-2 py-0.5 bg-tertiary-fixed rounded-full">OPEN</span>
                    </div>
                </div>
                <div class="w-12 h-12 rounded-full bg-tertiary-fixed flex items-center justify-center">
                    <span class="material-symbols-outlined text-on-tertiary-fixed" style="font-variation-settings: 'FILL' 1">workspace_premium</span>
                </div>
            </div>
        </div>
    </section>

    <!-- Quick Actions -->
    <div class="flex flex-wrap gap-4 mb-16">
        <a href="${pageContext.request.contextPath}/report-found-item" class="flex items-center gap-2 bg-primary text-on-primary px-8 py-4 rounded-xl font-bold signature-gradient hover:scale-[0.98] transition-transform">
            <span class="material-symbols-outlined">add_circle</span> Report Found Item
        </a>
        <a href="${pageContext.request.contextPath}/report-lost-item" class="flex items-center gap-2 bg-surface-container-lowest text-primary border border-primary/20 px-8 py-4 rounded-xl font-bold hover:bg-surface-container-low transition-colors">
            <span class="material-symbols-outlined">search_off</span> I Lost Something
        </a>
    </div>

    <!-- Bento Grid Layout -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
        <!-- Recent Items (Main Grid) -->
        <div class="lg:col-span-12">
            <div class="flex justify-between items-end mb-8">
                <div>
                    <h2 class="text-2xl font-bold headline-font">Recently Added Items</h2>
                </div>
                <a href="${pageContext.request.contextPath}/browse-items" class="text-primary text-sm font-semibold hover:underline">View All</a>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <c:forEach var="item" items="${recentItems}">
                    <div class="bg-surface-container-lowest rounded-xl overflow-hidden shadow-[0_8px_24px_rgba(24,28,29,0.03)] border-outline-variant/10 border hover:shadow-[0_12px_32px_rgba(24,28,29,0.08)] transition-all duration-300">
                        <div class="h-48 relative overflow-hidden bg-surface-container-high">
                            <c:if test="${not empty item.imageUrl}">
                                <img alt="${item.title}" class="w-full h-full object-cover" src="${item.imageUrl}"/>
                            </c:if>
                            <c:if test="${empty item.imageUrl}">
                                <div class="w-full h-full flex items-center justify-center">
                                    <span class="material-symbols-outlined text-5xl text-on-surface-variant">image</span>
                                </div>
                            </c:if>
                            <div class="absolute top-4 left-4">
                                <c:choose>
                                    <c:when test="${item.type == 'lost'}">
                                        <span class="bg-error text-on-error text-[10px] font-bold px-3 py-1 rounded-full uppercase tracking-widest">Lost</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="bg-primary-container text-on-primary text-[10px] font-bold px-3 py-1 rounded-full uppercase tracking-widest">Found</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="p-6">
                            <a href="${pageContext.request.contextPath}/item-detail?id=${item.itemId}" class="hover:text-primary transition-colors">
                                <h3 class="font-bold text-lg headline-font mb-2">${item.title}</h3>
                            </a>
                            <p class="text-sm text-on-surface-variant mb-6 line-clamp-2 leading-relaxed">${item.description}</p>
                            <div class="flex items-center gap-3">
                                <div class="flex items-center gap-1 text-xs font-semibold text-on-surface-variant bg-surface-container-low px-3 py-1.5 rounded-lg">
                                    <span class="material-symbols-outlined text-sm">location_on</span>
                                    ${item.locationName}
                                </div>
                                <div class="flex items-center gap-1 text-xs font-semibold text-on-surface-variant bg-surface-container-low px-3 py-1.5 rounded-lg">
                                    <span class="material-symbols-outlined text-sm">schedule</span>
                                    <c:out value="${item.createdAt.toString().substring(0, 10)}" />
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- Recently Resolved Items Section -->
    <div class="mt-16">
        <div class="flex justify-between items-end mb-8">
            <div>
                <h2 class="text-2xl font-bold headline-font">Recently Resolved</h2>
                <p class="text-sm text-on-surface-variant">  </p>
            </div>
            <a href="${pageContext.request.contextPath}/browse-items" class="text-primary text-sm font-semibold hover:underline">View All</a>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-4">
            <c:forEach var="item" items="${recentlyResolvedItems}">
                <a href="${pageContext.request.contextPath}/item-detail?id=${item.itemId}" class="bg-surface-container-lowest rounded-lg overflow-hidden border border-outline-variant/10 hover:shadow-lg transition-all group">
                    <div class="h-32 relative overflow-hidden bg-surface-container-high">
                        <c:if test="${not empty item.imageUrl}">
                            <img alt="${item.title}" class="w-full h-full object-cover group-hover:scale-105 transition-transform" src="${item.imageUrl}"/>
                        </c:if>
                        <c:if test="${empty item.imageUrl}">
                            <div class="w-full h-full flex items-center justify-center">
                                <span class="material-symbols-outlined text-4xl text-on-surface-variant">check_circle</span>
                            </div>
                        </c:if>
                        <div class="absolute top-2 left-2">
                            <span class="bg-tertiary text-on-tertiary text-[9px] font-bold px-2 py-1 rounded-full uppercase">
                                <c:choose>
                                    <c:when test="${item.status == 'matched'}">Matched</c:when>
                                    <c:when test="${item.status == 'claimed'}">Claimed</c:when>
                                    <c:when test="${item.status == 'returned'}">Returned</c:when>
                                    <c:otherwise>${item.status}</c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                    </div>
                    <div class="p-3">
                        <h4 class="font-bold text-sm line-clamp-1 group-hover:text-primary transition-colors">${item.title}</h4>
                        <p class="text-xs text-on-surface-variant line-clamp-1">${item.locationName}</p>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>

    <!-- Top Contributors Section -->
    <div class="mt-16">
        <div class="flex justify-between items-end mb-8">
            <div>
                <h2 class="text-2xl font-bold headline-font">Top Contributors</h2>
                <p class="text-sm text-on-surface-variant">  </p>
            </div>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-4">
            <c:forEach var="user" items="${topUsers}" begin="0" end="4">
                <div class="bg-surface-container-lowest rounded-xl border border-outline-variant/10 p-6 flex flex-col items-center text-center hover:shadow-lg transition-all">
                    <c:choose>
                        <c:when test="${not empty user.profilePhoto}">
                            <img src="${user.profilePhoto}" alt="${user.username}" class="w-14 h-14 rounded-full object-cover mb-4 border border-outline-variant/20 shadow-sm" />
                        </c:when>
                        <c:otherwise>
                            <div class="w-14 h-14 rounded-full bg-primary/15 flex items-center justify-center mb-4">
                                <span class="material-symbols-outlined text-2xl text-primary">person</span>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <h3 class="font-bold text-on-surface mb-2 line-clamp-1">${user.username}</h3>
                    <div class="flex items-center gap-1 text-sm font-bold text-primary">
                        <span class="material-symbols-outlined text-lg">star</span>
                        ${user.points}
                    </div>
                    <p class="text-xs text-on-surface-variant mt-2">Community Points</p>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Browse by Type Section -->
    <section class="mt-20">
        <h2 class="text-2xl font-bold headline-font mb-8">Browse by Type</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <!-- Lost Items -->
            <div class="space-y-4">
                <h3 class="text-xl font-bold text-on-surface mb-4">Lost Items</h3>
                <c:forEach var="item" items="${lostItems}" begin="0" end="2">
                    <a href="${pageContext.request.contextPath}/item-detail?id=${item.itemId}" class="bg-surface-container-low rounded-lg p-4 flex gap-4 items-center border border-outline-variant/15 hover:border-error/50 transition-colors">
                        <div class="w-16 h-16 rounded-lg overflow-hidden bg-surface-container-high flex-shrink-0">
                            <c:if test="${not empty item.imageUrl}">
                                <img alt="${item.title}" class="w-full h-full object-cover" src="${item.imageUrl}"/>
                            </c:if>
                            <c:if test="${empty item.imageUrl}">
                                <div class="w-full h-full flex items-center justify-center">
                                    <span class="material-symbols-outlined text-on-surface-variant">image</span>
                                </div>
                            </c:if>
                        </div>
                        <div>
                            <h4 class="font-bold text-sm">${item.title}</h4>
                            <p class="text-xs text-on-surface-variant">${item.locationName}</p>
                            <span class="text-[10px] text-error font-bold mt-1 inline-block uppercase tracking-tighter">LOST</span>
                        </div>
                    </a>
                </c:forEach>
            </div>

            <!-- Found Items -->
            <div class="space-y-4">
                <h3 class="text-xl font-bold text-on-surface mb-4">Found Items</h3>
                <c:forEach var="item" items="${foundItems}" begin="0" end="2">
                    <a href="${pageContext.request.contextPath}/item-detail?id=${item.itemId}" class="bg-surface-container-low rounded-lg p-4 flex gap-4 items-center border border-outline-variant/15 hover:border-primary/50 transition-colors">
                        <div class="w-16 h-16 rounded-lg overflow-hidden bg-surface-container-high flex-shrink-0">
                            <c:if test="${not empty item.imageUrl}">
                                <img alt="${item.title}" class="w-full h-full object-cover" src="${item.imageUrl}"/>
                            </c:if>
                            <c:if test="${empty item.imageUrl}">
                                <div class="w-full h-full flex items-center justify-center">
                                    <span class="material-symbols-outlined text-on-surface-variant">image</span>
                                </div>
                            </c:if>
                        </div>
                        <div>
                            <h4 class="font-bold text-sm">${item.title}</h4>
                            <p class="text-xs text-on-surface-variant">${item.locationName}</p>
                            <span class="text-[10px] text-tertiary font-bold mt-1 inline-block uppercase tracking-tighter">FOUND</span>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
        <div class="mt-8 text-center">
            <a href="${pageContext.request.contextPath}/browse-items" class="inline-flex items-center gap-2 bg-surface-container-high text-on-surface px-6 py-3 rounded-lg font-bold hover:bg-surface-container-low transition-colors">
                Browse All Items
                <span class="material-symbols-outlined">arrow_forward</span>
            </a>
        </div>
    </section>
</main>

<!-- FAB for Desktop -->
<div class="hidden md:block fixed bottom-10 right-10 z-40">
    <a href="${pageContext.request.contextPath}/report-found-item" class="w-16 h-16 bg-primary text-on-primary rounded-full flex items-center justify-center shadow-xl signature-gradient hover:scale-110 transition-transform">
        <span class="material-symbols-outlined text-3xl">add</span>
    </a>
</div>

<jsp:include page="/components/footer.jsp"/>
</body>
</html>
