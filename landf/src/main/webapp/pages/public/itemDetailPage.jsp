<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <jsp:include page="/components/head.jsp"/>
    <title>Item Detail | Findora</title>
    <style>
        body {
            font-family: "Plus Jakarta Sans", sans-serif;
            background-color: #f7fafa;
        }

        h1, h2, h3, .headline-font {
            font-family: "Manrope", sans-serif;
        }

        .signature-gradient {
            background: linear-gradient(135deg, #006565 0%, #008080 100%);
        }
    </style>
</head>
<body class="bg-surface text-on-surface antialiased">
<jsp:include page="/components/navbar.jsp"/>

<main class="pt-28 pb-32 px-8 max-w-6xl mx-auto">
    <!-- Back Button -->
    <div class="mb-8">
        <a href="javascript:history.back()" class="flex items-center gap-2 text-primary font-bold hover:underline">
            <span class="material-symbols-outlined">arrow_back</span> Back to Items
        </a>
    </div>

    <c:if test="${not empty item}">
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <!-- Image Section -->
            <div class="lg:col-span-2">
                <div class="relative rounded-xl overflow-hidden bg-surface-container-high h-96 lg:h-full min-h-[500px]">
                    <c:if test="${not empty item.imageUrl}">
                        <img src="${item.imageUrl}" alt="${item.title}" class="w-full h-full object-cover"/>
                    </c:if>
                    <c:if test="${empty item.imageUrl}">
                        <div class="w-full h-full flex items-center justify-center">
                            <span class="material-symbols-outlined text-7xl text-on-surface-variant">image</span>
                        </div>
                    </c:if>
                    <!-- Status Badge -->
                    <div class="absolute top-4 left-4">
                        <c:choose>
                            <c:when test="${item.type == 'lost'}">
                                <span class="bg-error text-on-error text-[10px] font-bold px-4 py-2 rounded-full uppercase tracking-widest">Lost Item</span>
                            </c:when>
                            <c:otherwise>
                                <span class="bg-primary-container text-on-primary text-[10px] font-bold px-4 py-2 rounded-full uppercase tracking-widest">Found Item</span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Date Badge -->
                    <div class="absolute bottom-4 right-4 bg-surface-container-lowest/90 backdrop-blur px-4 py-2 rounded-lg">
                        <span class="text-sm font-bold">
                            <c:out value="${item.createdAt.toString().substring(0, 10)}" />
                        </span>
                    </div>
                </div>
            </div>

            <!-- Details Section -->
            <div class="lg:col-span-1">
                <!-- Title and Category -->
                <div class="mb-8">
                    <h1 class="text-4xl font-extrabold headline-font mb-4">${item.title}</h1>
                    <div class="flex flex-wrap gap-2">
                        <span class="text-xs uppercase font-bold tracking-widest text-primary-fixed-dim bg-on-primary-fixed-variant px-3 py-1.5 rounded">${item.category}</span>
                        <span class="text-xs uppercase font-bold tracking-widest text-on-surface-variant bg-surface-container-low px-3 py-1.5 rounded">
                            <c:out value="${item.createdAt.toString().substring(0, 10)}" />
                        </span>
                    </div>
                </div>

                <!-- Location Info -->
                <div class="mb-8 p-6 bg-surface-container-lowest rounded-xl border border-outline-variant/15">
                    <h3 class="font-bold text-sm text-on-surface-variant mb-3 uppercase tracking-wider">Location</h3>
                    <div class="flex items-start gap-3">
                        <span class="material-symbols-outlined text-primary mt-1">location_on</span>
                        <div>
                            <p class="font-bold text-lg">${item.locationName}</p>
                            <p class="text-sm text-on-surface-variant">Reported on <c:out value="${item.createdAt.toString().substring(0, 10)}" /></p>
                        </div>
                    </div>
                </div>

                <!-- Description -->
                <div class="mb-8">
                    <h3 class="font-bold text-on-surface-variant text-sm mb-3 uppercase tracking-wider">Description</h3>
                    <p class="text-on-surface leading-relaxed">${item.description}</p>
                </div>

                <!-- Image Preview -->
                <div class="mb-8 p-6 bg-surface-container-lowest rounded-xl border border-outline-variant/15">
                    <h3 class="font-bold text-on-surface-variant text-sm mb-4 uppercase tracking-wider">Image Preview</h3>
                    <c:choose>
                        <c:when test="${not empty item.imageUrl}">
                            <div class="rounded-xl overflow-hidden border border-outline-variant bg-surface-container-highest">
                                <img src="${item.imageUrl}" alt="Uploaded image for ${item.title}" class="w-full h-56 object-cover" />
                            </div>
                            <p class="mt-3 text-sm text-on-surface-variant">This is the image uploaded with this report.</p>
                        </c:when>
                        <c:otherwise>
                            <div class="w-full h-56 flex items-center justify-center rounded-xl border border-dashed border-outline-variant bg-surface-container-highest">
                                <span class="material-symbols-outlined text-5xl text-on-surface-variant">image_not_supported</span>
                            </div>
                            <p class="mt-3 text-sm text-on-surface-variant">No image was uploaded for this item.</p>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Reporter Info -->
                <div class="p-6 bg-surface-container-lowest rounded-xl border border-outline-variant/15 mb-8">
                    <h3 class="font-bold text-sm text-on-surface-variant mb-3 uppercase tracking-wider">Reported By</h3>
                    <p class="font-bold">${item.userName}</p>
                    <p class="text-sm text-on-surface-variant">Community Member</p>
                </div>

                <!-- Action Buttons -->
                <c:choose>
                    <c:when test="${param.status == 'success'}">
                        <div class="p-4 bg-tertiary-fixed/20 border border-tertiary/50 rounded-lg mb-6">
                            <p class="text-tertiary font-bold">✓ Item successfully submitted!</p>
                        </div>
                    </c:when>
                    <c:when test="${param.status == 'claim_success'}">
                        <div class="p-4 bg-emerald-500/20 border border-emerald-500/50 rounded-lg mb-6">
                            <p class="text-emerald-700 font-bold">✓ Claim submitted successfully!</p>
                        </div>
                    </c:when>
                    <c:when test="${param.status == 'report_success'}">
                        <div class="p-4 bg-amber-500/20 border border-amber-500/50 rounded-lg mb-6">
                            <p class="text-amber-700 font-bold">✓ Report submitted successfully!</p>
                        </div>
                    </c:when>
                </c:choose>

                <!-- Claim Button for Found Items -->
                <c:if test="${item.type == 'found' && item.status == 'open'}">
                    <a href="${pageContext.request.contextPath}/items/claim?itemId=${item.itemId}" class="w-full inline-flex items-center justify-center bg-secondary text-on-secondary py-4 rounded-xl font-bold hover:scale-[0.98] transition-transform mb-3">
                        <span class="material-symbols-outlined mr-2">verified</span> Claim Item
                    </a>
                </c:if>

                <!-- Contact CTA -->
                <c:choose>
                    <c:when test="${not empty item.ownerEmail}">
                        <a href="mailto:${item.ownerEmail}?subject=Question about ${item.title}" class="w-full inline-flex items-center justify-center bg-primary text-on-primary py-4 rounded-xl font-bold signature-gradient hover:scale-[0.98] transition-transform mb-3">
                            <span class="material-symbols-outlined mr-2">mail</span> Contact Reporter
                        </a>
                    </c:when>
                    <c:otherwise>
                        <button class="w-full bg-surface-container-high text-on-surface py-4 rounded-xl font-bold mb-3 cursor-not-allowed" disabled>
                            <span class="material-symbols-outlined mr-2">mail</span> Contact Reporter Unavailable
                        </button>
                    </c:otherwise>
                </c:choose>

                <!-- Share Button -->
                <button class="w-full bg-surface-container-high text-on-surface py-4 rounded-xl font-bold hover:bg-surface-container-low transition-colors">
                    <span class="material-symbols-outlined mr-2">share</span> Share Item
                </button>

                <!-- Report Button -->
                <a href="${pageContext.request.contextPath}/reports?targetType=item&targetId=${item.itemId}" class="w-full mt-4 inline-flex items-center justify-center text-error py-3 rounded-xl font-bold hover:bg-error-container/20 transition-colors text-sm">
                    <span class="material-symbols-outlined mr-2">flag</span> Report Item
                </a>
            </div>
        </div>

        <!-- Additional Info Section -->
        <div class="mt-16 grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="p-6 bg-surface-container-lowest rounded-xl border border-outline-variant/15">
                <h4 class="font-bold mb-2">Status</h4>
                <p class="text-sm text-on-surface-variant capitalize">${item.status}</p>
            </div>

            <div class="p-6 bg-surface-container-lowest rounded-xl border border-outline-variant/15">
                <h4 class="font-bold mb-2">Category</h4>
                <p class="text-sm text-on-surface-variant capitalize">${item.category}</p>
            </div>

            <div class="p-6 bg-surface-container-lowest rounded-xl border border-outline-variant/15">
                <h4 class="font-bold mb-2">Item ID</h4>
                <p class="text-sm text-on-surface-variant font-mono">#${item.itemId}</p>
            </div>
        </div>

    </c:if>

    <c:if test="${empty item}">
        <div class="text-center py-20">
            <span class="material-symbols-outlined text-6xl text-on-surface-variant mb-4 inline-block">info</span>
            <h2 class="text-2xl font-bold headline-font mb-2">Item Not Found</h2>
            <p class="text-on-surface-variant mb-6">The item you're looking for doesn't exist or has been removed.</p>
            <a href="${pageContext.request.contextPath}/items" class="text-primary font-bold hover:underline">Back to Items</a>
        </div>
    </c:if>
</main>

<jsp:include page="/components/footer.jsp"/>
</body>
</html>
