<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <jsp:include page="/components/head.jsp"/>
    <title>My Profile | Findora</title>
    <script id="tailwind-config"> tailwind.config = {
        darkMode: "class", theme: {
            extend: {
                colors: {
                    "surface-container-low": "#f1f4f4",
                    "outline-variant": "#bec9c8",
                    "on-background": "#181c1d",
                    "on-tertiary-fixed-variant": "#004883",
                    "tertiary-fixed-dim": "#a4c9ff",
                    "surface-container-high": "#e6e9e9",
                    "on-primary-fixed": "#002020",
                    "surface-container": "#ebeeee",
                    background: "#f7fafa",
                    "surface-container-highest": "#e0e3e3",
                    "primary-fixed-dim": "#87d4d3",
                    "error-container": "#ffdad6",
                    "on-error-container": "#93000a",
                    error: "#ba1a1a",
                    "on-secondary": "#ffffff",
                    "on-primary-fixed-variant": "#004f4f",
                    "inverse-primary": "#87d4d3",
                    secondary: "#944a00",
                    "on-secondary-fixed": "#301400",
                    "secondary-fixed-dim": "#ffb783",
                    "surface-bright": "#f7fafa",
                    "surface-variant": "#e0e3e3",
                    "primary-container": "#006565",
                    "surface-tint": "#0b6969",
                    "on-tertiary-fixed": "#001c39",
                    "on-surface-variant": "#3f4948",
                    "surface-dim": "#d7dbdb",
                    surface: "#f7fafa",
                    "primary-fixed": "#a3f0ef",
                    "on-surface": "#181c1d",
                    "inverse-on-surface": "#eef1f1",
                    "on-tertiary": "#ffffff",
                    "secondary-container": "#fc8f34",
                    primary: "#004b4b",
                    "secondary-fixed": "#ffdcc5",
                    "surface-container-lowest": "#ffffff",
                    "tertiary-fixed": "#d4e3ff",
                    "on-primary-container": "#92dfdf",
                    "on-error": "#ffffff",
                    "inverse-surface": "#2d3131",
                    "on-secondary-container": "#663100",
                    outline: "#6f7979",
                    tertiary: "#00437c",
                    "on-tertiary-container": "#b7d3ff",
                    "on-primary": "#ffffff",
                    "tertiary-container": "#005ba4",
                    "on-secondary-fixed-variant": "#713700",
                },
                borderRadius: {DEFAULT: "0.25rem", lg: "0.75rem", xl: "1.25rem", full: "9999px",},
                fontFamily: {headline: ["Manrope"], body: ["Inter"], label: ["Inter"],},
            },
        },
    }; </script>
    <style>
        body {
            font-family: "Inter", sans-serif;
            background-color: #f7fafa;
        }
        .headline-font {
            font-family: "Manrope", sans-serif;
            letter-spacing: -0.02em;
        }
        .tab-btn-active {
            border-bottom: 3px solid #004b4b;
            color: #004b4b;
            font-weight: 700;
        }
    </style>
</head>
<body class="bg-surface text-on-surface antialiased">
<jsp:include page="/components/navbar.jsp"/>

<main class="max-w-7xl mx-auto px-6 py-10 pt-28">

    <!-- Alert Messages -->
    <c:if test="${param.status == 'upload_success'}">
        <div class="mb-6 p-4 bg-emerald-50 border-l-4 border-emerald-500 rounded-r-lg flex items-center gap-3 text-emerald-800 text-sm shadow-sm">
            <span class="material-symbols-outlined text-emerald-600">check_circle</span>
            <span>Profile photo updated successfully!</span>
        </div>
    </c:if>
    <c:if test="${param.status == 'upload_failed'}">
        <div class="mb-6 p-4 bg-rose-50 border-l-4 border-rose-500 rounded-r-lg flex items-center gap-3 text-rose-800 text-sm shadow-sm">
            <span class="material-symbols-outlined text-rose-600">error</span>
            <span>Failed to upload photo. Please verify the image file format and size (max 5MB).</span>
        </div>
    </c:if>
    <c:if test="${param.status == 'upload_error'}">
        <div class="mb-6 p-4 bg-rose-50 border-l-4 border-rose-500 rounded-r-lg flex items-center gap-3 text-rose-800 text-sm shadow-sm">
            <span class="material-symbols-outlined text-rose-600">report</span>
            <span>An unexpected error occurred during the upload process. Please try again.</span>
        </div>
    </c:if>
    <c:if test="${param.status == 'award_success'}">
        <div class="mb-6 p-4 bg-emerald-50 border-l-4 border-emerald-500 rounded-r-lg flex items-center gap-3 text-emerald-800 text-sm shadow-sm">
            <span class="material-symbols-outlined text-emerald-600">military_tech</span>
            <span>Badge awarded successfully — check your Badges tab.</span>
        </div>
    </c:if>
    <c:if test="${param.status == 'award_failed'}">
        <div class="mb-6 p-4 bg-amber-50 border-l-4 border-amber-500 rounded-r-lg flex items-center gap-3 text-amber-800 text-sm shadow-sm">
            <span class="material-symbols-outlined text-amber-600">error</span>
            <span>Unable to award badge (it may already be awarded or the badge does not exist).</span>
        </div>
    </c:if>

    <!-- Profile Header Card -->
    <section class="mb-8">
        <div class="relative overflow-hidden rounded-xl bg-gradient-to-br from-primary to-primary-container p-8 md:p-10 text-on-primary shadow-lg">
            <div class="relative z-10 flex flex-col md:flex-row items-center gap-6">
                <!-- Avatar with Upload Capability -->
                <div class="relative group cursor-pointer shrink-0" onclick="document.getElementById('profilePhotoInput').click();" title="Click to upload profile photo">
                    <c:choose>
                        <c:when test="${not empty profileUser.profilePhoto}">
                            <img src="${profileUser.profilePhoto}" alt="Profile Photo" class="w-24 h-24 rounded-full object-cover shadow-md border-2 border-white/30 hover:border-white/60 transition-colors" />
                        </c:when>
                        <c:otherwise>
                            <div class="w-24 h-24 rounded-full bg-white/20 flex items-center justify-center text-white text-5xl shadow-inner hover:bg-white/30 transition-colors">
                                <span class="material-symbols-outlined text-5xl">person</span>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <!-- Overlay hint -->
                    <div class="absolute inset-0 bg-black/40 rounded-full opacity-0 group-hover:opacity-100 flex flex-col items-center justify-center transition-opacity text-white text-[10px] font-bold">
                        <span class="material-symbols-outlined text-xl mb-0.5">photo_camera</span>
                        <span>UPDATE</span>
                    </div>
                </div>
                <!-- Hidden Upload Form -->
                <form id="profilePhotoForm" action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data" class="hidden">
                    <input type="file" id="profilePhotoInput" name="profilePhotoFile" accept="image/*" onchange="document.getElementById('profilePhotoForm').submit();" />
                </form>
                <!-- Details -->
                <div class="flex-grow text-center md:text-left">
                    <div class="flex flex-col md:flex-row md:items-center gap-3">
                        <h1 class="font-headline text-3xl font-extrabold tracking-tight">${profileUser.username}</h1>
                        <div class="flex items-center justify-center gap-2">
                            <span class="font-label text-xs bg-white/20 text-white font-bold uppercase px-3 py-1 rounded-full tracking-wider border border-white/10">
                                ${profileUser.role}
                            </span>
                            <c:choose>
                                <c:when test="${profileUser.status == 'active'}">
                                    <span class="font-label text-xs bg-emerald-500/80 text-white font-bold uppercase px-3 py-1 rounded-full tracking-wider">
                                        Active
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="font-label text-xs bg-rose-500/80 text-white font-bold uppercase px-3 py-1 rounded-full tracking-wider">
                                        ${profileUser.status}
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <p class="font-body text-white/80 mt-2">${profileUser.email}</p>
                    <p class="font-body text-xs text-white/60 mt-3 flex items-center justify-center md:justify-start gap-1">
                        <span class="material-symbols-outlined text-sm">calendar_month</span>
                        Member since: <c:out value="${fn:substring(profileUser.created_at, 0, 10)}" default="N/A" />
                    </p>
                </div>
            </div>
            <!-- Background Elements -->
            <div class="absolute -right-20 -top-20 w-80 h-80 bg-secondary/15 rounded-full blur-[70px]"></div>
            <div class="absolute right-10 bottom-0 opacity-5">
                <span class="material-symbols-outlined text-[12rem]">verified_user</span>
            </div>
        </div>
    </section>

    <!-- Bento Statistics Cards -->
    <section class="mb-12">
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
            <!-- Points Card -->
            <div class="bg-surface-container-lowest rounded-xl p-6 border border-outline-variant/15 flex items-center justify-between shadow-sm hover:shadow-md transition-shadow">
                <div>
                    <span class="text-xs font-bold text-on-surface-variant tracking-wider block mb-1">TOTAL POINTS</span>
                    <div class="flex items-baseline gap-1">
                        <span class="text-3xl font-extrabold headline-font text-primary">${not empty reputation ? reputation.points : 0}</span>
                        <span class="text-xs font-semibold text-outline">pts</span>
                    </div>
                </div>
                <div class="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center text-primary">
                    <span class="material-symbols-outlined text-2xl">star</span>
                </div>
            </div>

            <!-- Trust Score Card -->
            <div class="bg-surface-container-lowest rounded-xl p-6 border border-outline-variant/15 flex items-center justify-between shadow-sm hover:shadow-md transition-shadow">
                <div>
                    <span class="text-xs font-bold text-on-surface-variant tracking-wider block mb-1">TRUST SCORE</span>
                    <div class="flex items-baseline gap-1">
                        <span class="text-3xl font-extrabold headline-font text-primary">${not empty reputation ? reputation.score : 0.0}</span>
                    </div>
                </div>
                <div class="w-12 h-12 rounded-full bg-emerald-500/10 flex items-center justify-center text-emerald-600">
                    <span class="material-symbols-outlined text-2xl">shield</span>
                </div>
            </div>

            <!-- Trust Level Card -->
            <div class="bg-surface-container-lowest rounded-xl p-6 border border-outline-variant/15 flex items-center justify-between shadow-sm hover:shadow-md transition-shadow">
                <div>
                    <span class="text-xs font-bold text-on-surface-variant tracking-wider block mb-1">TRUST LEVEL</span>
                    <div class="flex items-baseline gap-1">
                        <span class="text-2xl font-extrabold headline-font text-primary capitalize">${not empty reputation ? reputation.trustLevel : 'Low'}</span>
                    </div>
                </div>
                <div class="w-12 h-12 rounded-full bg-secondary/10 flex items-center justify-center text-secondary">
                    <span class="material-symbols-outlined text-2xl">workspace_premium</span>
                </div>
            </div>

            <!-- Action Statistics Card -->
            <div class="bg-surface-container-lowest rounded-xl p-6 border border-outline-variant/15 flex items-center justify-between shadow-sm hover:shadow-md transition-shadow">
                <div>
                    <span class="text-xs font-bold text-on-surface-variant tracking-wider block mb-1">ACTIONS</span>
                    <div class="flex items-baseline gap-3 text-sm">
                        <span class="text-emerald-600 font-bold flex items-center gap-0.5"><span class="material-symbols-outlined text-sm">thumb_up</span> ${not empty reputation ? reputation.successfulActions : 0} Successful</span>
                        <span class="text-rose-600 font-bold flex items-center gap-0.5"><span class="material-symbols-outlined text-sm">thumb_down</span> ${not empty reputation ? reputation.penaltyEvents : 0} Penalties</span>
                    </div>
                </div>
                <div class="w-12 h-12 rounded-full bg-slate-100 flex items-center justify-center text-slate-600">
                    <span class="material-symbols-outlined text-2xl">thumbs_up_down</span>
                </div>
            </div>
        </div>
    </section>

    <!-- Tabbed Interface Section -->
    <section class="bg-surface-container-lowest rounded-xl border border-outline-variant/15 overflow-hidden shadow-sm">
        <!-- Tab Headers -->
        <div class="flex border-b border-outline-variant/15 bg-surface-container-low/30 overflow-x-auto">
            <button onclick="switchTab('tab-items')" id="btn-tab-items" class="tab-btn px-6 py-4 font-semibold text-on-surface-variant hover:text-primary transition-colors text-sm shrink-0 border-b-3 border-transparent tab-btn-active">
                Reported Items (${items.size()})
            </button>
            <button onclick="switchTab('tab-claims')" id="btn-tab-claims" class="tab-btn px-6 py-4 font-semibold text-on-surface-variant hover:text-primary transition-colors text-sm shrink-0 border-b-3 border-transparent">
                Claims Submitted (${claims.size()})
            </button>
            <button onclick="switchTab('tab-badges')" id="btn-tab-badges" class="tab-btn px-6 py-4 font-semibold text-on-surface-variant hover:text-primary transition-colors text-sm shrink-0 border-b-3 border-transparent">
                Earned Badges (${badges.size()})
            </button>
            <button onclick="switchTab('tab-missions')" id="btn-tab-missions" class="tab-btn px-6 py-4 font-semibold text-on-surface-variant hover:text-primary transition-colors text-sm shrink-0 border-b-3 border-transparent">
                Missions Progress (${missions.size()})
            </button>
        </div>

        <!-- Tab Contents -->
        <div class="p-6">
            <!-- 1. Reported Items Tab -->
            <div id="tab-items" class="tab-content block">
                <c:choose>
                    <c:when test="${empty items}">
                        <div class="text-center py-16">
                            <span class="material-symbols-outlined text-6xl text-outline/40 mb-4">search_off</span>
                            <h3 class="text-lg font-bold text-on-surface mb-2">No reported items</h3>
                            <p class="text-sm text-on-surface-variant max-w-sm mx-auto mb-6">You haven't reported any lost or found items yet. If you've lost or found something, file a report now.</p>
                            <div class="flex justify-center gap-4">
                                <a href="${pageContext.request.contextPath}/report-found-item" class="bg-primary text-on-primary px-4 py-2.5 rounded-lg text-sm font-bold hover:scale-[0.98] transition-transform">Report Found</a>
                                <a href="${pageContext.request.contextPath}/report-lost-item" class="bg-surface-container-high text-on-surface border border-outline-variant/30 px-4 py-2.5 rounded-lg text-sm font-bold hover:bg-surface-container-low transition-colors">Report Lost</a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <c:forEach var="item" items="${items}">
                                <div class="bg-surface-container-lowest rounded-lg border border-outline-variant/15 overflow-hidden hover:shadow-md transition-shadow flex flex-col justify-between">
                                    <div class="p-5 flex gap-4">
                                        <div class="w-16 h-16 rounded bg-slate-100 flex items-center justify-center shrink-0 overflow-hidden border border-outline-variant/10">
                                            <c:choose>
                                                <c:when test="${item.type == 'lost'}">
                                                    <span class="material-symbols-outlined text-3xl text-rose-500">search_off</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="material-symbols-outlined text-3xl text-teal-600">handshake</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div>
                                            <div class="flex items-center gap-2 flex-wrap mb-1">
                                                <h4 class="font-bold text-base text-on-surface">${item.title}</h4>
                                                <c:choose>
                                                    <c:when test="${item.type == 'lost'}">
                                                        <span class="bg-error-container text-error text-[10px] font-bold px-2 py-0.5 rounded-full uppercase tracking-wider">Lost</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="bg-primary-container text-on-primary text-[10px] font-bold px-2 py-0.5 rounded-full uppercase tracking-wider">Found</span>
                                                    </c:otherwise>
                                                </c:choose>
                                                <span class="bg-slate-100 text-outline text-[10px] font-bold px-2 py-0.5 rounded-full uppercase tracking-wider">
                                                    ${item.status}
                                                </span>
                                            </div>
                                            <p class="text-xs text-on-surface-variant line-clamp-2 leading-relaxed mb-3">${item.description}</p>
                                            <div class="flex flex-wrap items-center gap-x-4 gap-y-1 text-[11px] text-outline">
                                                <span class="flex items-center gap-1"><span class="material-symbols-outlined text-xs">location_on</span> ${item.locationName}</span>
                                                <span class="flex items-center gap-1"><span class="material-symbols-outlined text-xs">schedule</span> <c:out value="${fn:substring(item.createdAt, 0, 10)}" /></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="px-5 py-3 bg-slate-50/50 border-t border-outline-variant/10 flex justify-between items-center text-xs">
                                        <span class="text-outline font-semibold">Moderation: 
                                            <span class="capitalize font-bold ${item.moderationStatus == 'approved' ? 'text-emerald-600' : (item.moderationStatus == 'pending' ? 'text-amber-500' : 'text-rose-500')}">
                                                ${item.moderationStatus}
                                            </span>
                                        </span>
                                        <a href="${pageContext.request.contextPath}/item-detail?id=${item.itemId}" class="text-primary font-bold hover:underline flex items-center gap-0.5">
                                            View Details <span class="material-symbols-outlined text-xs">arrow_forward</span>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 2. Claims Submitted Tab -->
            <div id="tab-claims" class="tab-content hidden">
                <c:choose>
                    <c:when test="${empty claims}">
                        <div class="text-center py-16">
                            <span class="material-symbols-outlined text-6xl text-outline/40 mb-4">assignment_turned_in</span>
                            <h3 class="text-lg font-bold text-on-surface mb-2">No claims filed</h3>
                            <p class="text-sm text-on-surface-variant max-w-sm mx-auto mb-6">If you find your lost items listed under found items, you can submit a claim to verify ownership.</p>
                            <a href="${pageContext.request.contextPath}/browse-items?type=found" class="inline-block bg-primary text-on-primary px-5 py-2.5 rounded-lg text-sm font-bold hover:scale-[0.98] transition-transform">Browse Found Items</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="space-y-4">
                            <c:forEach var="claim" items="${claims}">
                                <div class="bg-surface-container-lowest rounded-lg border border-outline-variant/15 p-5 shadow-sm hover:shadow-md transition-shadow">
                                    <div class="flex justify-between items-start gap-4 flex-wrap mb-4">
                                        <div>
                                            <h4 class="font-bold text-base text-on-surface mb-1">Claim for: <span class="text-primary hover:underline"><a href="${pageContext.request.contextPath}/item-detail?id=${claim.itemId}">${claim.itemTitle}</a></span></h4>
                                            <p class="text-xs text-outline flex items-center gap-1">
                                                <span class="material-symbols-outlined text-xs">schedule</span> Filed on: <c:out value="${fn:substring(claim.createdAt, 0, 10)}" />
                                            </p>
                                        </div>
                                        <span class="capitalize font-bold text-xs px-3 py-1 rounded-full uppercase tracking-wider ${claim.status == 'approved' ? 'bg-emerald-100 text-emerald-700' : (claim.status == 'pending' ? 'bg-amber-100 text-amber-700' : 'bg-rose-100 text-rose-700')}">
                                            ${claim.status}
                                        </span>
                                    </div>
                                    <div class="space-y-2 text-xs text-on-surface-variant border-t border-outline-variant/10 pt-3">
                                        <p><strong>Ownership Proof:</strong> ${claim.proof}</p>
                                        <c:if test="${not empty claim.identifiers}">
                                            <p><strong>Item Identifiers:</strong> ${claim.identifiers}</p>
                                        </c:if>
                                        <c:if test="${not empty claim.reviewNotes}">
                                            <div class="mt-3 p-3 bg-amber-50 rounded border border-amber-200/50 text-amber-900">
                                                <strong>Review Notes:</strong> ${claim.reviewNotes}
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 3. Earned Badges Tab -->
            <div id="tab-badges" class="tab-content hidden">
                <c:choose>
                    <c:when test="${empty badges}">
                        <div class="text-center py-16">
                            <span class="material-symbols-outlined text-6xl text-outline/40 mb-4">workspace_premium</span>
                            <h3 class="text-lg font-bold text-on-surface mb-2">No badges earned</h3>
                            <p class="text-sm text-on-surface-variant max-w-sm mx-auto mb-6">Earn community badges by successfully reporting items, claiming items, and completing daily missions.</p>
                            <!-- Small demo button to award a seeded badge without DB/schema changes -->
                            <form method="post" action="${pageContext.request.contextPath}/profile">
                                <input type="hidden" name="awardBadgeName" value="First Recovery" />
                                <button type="submit" class="inline-flex items-center gap-2 bg-primary text-on-primary px-4 py-2 rounded-lg font-bold hover:opacity-95">Award "First Recovery"</button>
                            </form>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
                            <c:forEach var="badge" items="${badges}">
                                <div class="bg-gradient-to-b from-surface-container-lowest to-surface-container-low rounded-xl border border-outline-variant/15 p-6 flex flex-col items-center text-center shadow-sm hover:shadow-md transition-shadow relative">
                                    <div class="w-16 h-16 rounded-full bg-amber-400/10 border-2 border-amber-400 flex items-center justify-center text-amber-500 mb-4 animate-pulse">
                                        <span class="material-symbols-outlined text-3xl">military_tech</span>
                                    </div>
                                    <h4 class="font-headline font-bold text-primary mb-1">${badge.name}</h4>
                                    <p class="text-xs text-on-surface-variant mb-4 leading-relaxed">${badge.description}</p>
                                    <div class="text-[10px] text-outline bg-surface-container-high/40 px-3 py-1 rounded-full uppercase tracking-wider">
                                        Awarded on: <c:out value="${fn:substring(badge.awardedAt, 0, 10)}" />
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 4. Missions Progress Tab -->
            <div id="tab-missions" class="tab-content hidden">
                <c:choose>
                    <c:when test="${empty missions}">
                        <div class="text-center py-16">
                            <span class="material-symbols-outlined text-6xl text-outline/40 mb-4">task_alt</span>
                            <h3 class="text-lg font-bold text-on-surface mb-2">No active missions</h3>
                            <p class="text-sm text-on-surface-variant max-w-sm mx-auto">There are no missions currently assigned to your account. Keep doing good work in the community!</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="space-y-6">
                            <c:forEach var="mission" items="${missions}">
                                <div class="bg-surface-container-lowest rounded-xl border border-outline-variant/15 p-5 shadow-sm">
                                    <div class="flex justify-between items-start gap-4 flex-wrap mb-3">
                                        <div>
                                            <h4 class="font-headline font-bold text-primary text-base flex items-center gap-1.5">
                                                <span class="material-symbols-outlined text-xl">emoji_events</span>
                                                ${mission.title}
                                            </h4>
                                            <p class="text-xs text-on-surface-variant mt-1">${mission.description}</p>
                                        </div>
                                        <div class="flex items-center gap-2">
                                            <span class="bg-primary/10 text-primary text-xs font-extrabold px-3 py-1 rounded-full flex items-center gap-0.5">
                                                +${mission.rewardPoints} pts
                                            </span>
                                            <span class="text-xs font-bold uppercase tracking-wider px-2.5 py-0.5 rounded-full ${mission.status == 'completed' ? 'bg-emerald-100 text-emerald-700' : 'bg-blue-100 text-blue-700'}">
                                                ${mission.status}
                                            </span>
                                        </div>
                                    </div>
                                    <!-- Progress Bar -->
                                    <div class="mt-4">
                                        <div class="flex justify-between text-xs text-outline mb-1.5 font-bold">
                                            <span>Progress</span>
                                            <span>${mission.progressCount} / ${mission.targetCount}</span>
                                        </div>
                                        <div class="w-full bg-slate-100 h-2.5 rounded-full overflow-hidden border border-slate-200/30">
                                            <c:set var="pct" value="${(mission.progressCount * 100) / mission.targetCount}" />
                                            <c:if test="${pct > 100}">
                                                <c:set var="pct" value="100" />
                                            </c:if>
                                            <div class="bg-gradient-to-r from-primary to-primary-container h-full rounded-full transition-all duration-500" style="width: ${pct}%"></div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </section>
</main>

<script>
    function switchTab(tabId) {
        // Hide all tab contents
        document.querySelectorAll('.tab-content').forEach(function(el) {
            el.classList.replace('block', 'hidden');
        });
        // Show target tab content
        document.getElementById(tabId).classList.replace('hidden', 'block');

        // Deactivate all tab buttons
        document.querySelectorAll('.tab-btn').forEach(function(el) {
            el.classList.remove('tab-btn-active');
        });
        // Activate target tab button
        document.getElementById('btn-' + tabId).classList.add('tab-btn-active');
    }
</script>

<jsp:include page="/components/footer.jsp"/>
</body>
</html>
