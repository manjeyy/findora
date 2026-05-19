<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <jsp:include page="/components/head.jsp"/>
    <title>Discovery Vault | Items</title>
    <style>
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: #f7fafa;
            color: #181c1d;
        }

        h1, h2, h3, .font-headline {
            font-family: 'Manrope', sans-serif;
        }

        .glass-effect {
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
        }

        .signature-gradient {
            background: linear-gradient(135deg, #006565 0%, #008080 100%);
        }

        .pagination {
            display: flex;
            justify-content: center;
            gap: 0.5rem;
            margin-top: 2rem;
        }

        .pagination a, .pagination span {
            padding: 0.5rem 0.75rem;
            border: 1px solid #bdc9c8;
            border-radius: 0.5rem;
            text-decoration: none;
            color: #181c1d;
        }

        .pagination a:hover {
            background-color: #f1f4f4;
        }

        .pagination .active {
            background-color: #006565;
            color: #ffffff;
            border-color: #006565;
        }
    </style>
</head>
<body class="bg-surface text-on-surface min-h-screen">
<jsp:include page="/components/navbar.jsp"/>
<main class="pt-32 pb-24 px-8 max-w-[1440px] mx-auto">
    <!-- Hero Header -->
    <header class="mb-16">
        <div class="flex flex-col md:flex-row md:items-end justify-between gap-6">
            <div>
                <h1 class="text-5xl font-extrabold tracking-tight text-on-surface mb-4">Discovery Vault</h1>
            </div>
            <div class="flex items-center gap-4 bg-surface-container-low p-1.5 rounded-xl">
                <a href="${pageContext.request.contextPath}/browse-items" class="bg-surface-container-lowest text-primary px-6 py-2 rounded-lg font-bold shadow-sm">All Items</a>
                <a href="${pageContext.request.contextPath}/browse-items?type=lost" class="text-on-surface-variant px-6 py-2 rounded-lg font-medium hover:bg-surface-container-high transition-colors">Lost</a>
                <a href="${pageContext.request.contextPath}/browse-items?type=found" class="text-on-surface-variant px-6 py-2 rounded-lg font-medium hover:bg-surface-container-high transition-colors">Found</a>
            </div>
        </div>
    </header>

    <!-- Dynamic Filter Bar -->
    <section class="flex flex-wrap items-center gap-4 mb-12">
        <div class="group relative">
            <form method="GET" action="${pageContext.request.contextPath}/browse-items" class="flex gap-2 items-center">
                <select name="category" class="bg-surface-container-lowest px-5 py-3 rounded-xl flex items-center gap-3 hover:bg-surface-container-low transition-all border-none focus:ring-2 focus:ring-primary">
                    <option value="">All Categories</option>
                    <option value="personal" <c:if test="${selectedCategory == 'personal'}">selected</c:if>>Personal</option>
                    <option value="accessory" <c:if test="${selectedCategory == 'accessory'}">selected</c:if>>Accessory</option>
                    <option value="bag" <c:if test="${selectedCategory == 'bag'}">selected</c:if>>Bag</option>
                    <option value="electronics" <c:if test="${selectedCategory == 'electronics'}">selected</c:if>>Electronics</option>
                    <option value="clothing" <c:if test="${selectedCategory == 'clothing'}">selected</c:if>>Clothing</option>
                </select>

                <select name="location" class="bg-surface-container-lowest px-5 py-3 rounded-xl flex items-center gap-3 hover:bg-surface-container-low transition-all border-none focus:ring-2 focus:ring-primary">
                    <option value="" <c:if test="${selectedLocation == 0}">selected</c:if>>All Locations</option>
                    <c:forEach var="location" items="${locations}">
                        <option value="${location.locationId}" <c:if test="${selectedLocation == location.locationId}">selected</c:if>>${location.name}</option>
                    </c:forEach>
                </select>

                <button type="submit" class="bg-primary text-on-primary px-6 py-3 rounded-xl font-bold hover:scale-[0.98] transition-transform">Filter</button>
                <a href="${pageContext.request.contextPath}/browse-items" class="text-primary hover:underline font-medium">Clear all</a>
            </form>
        </div>

        <div class="ml-auto flex items-center gap-2 text-on-surface-variant text-sm font-medium">
            <span>Showing ${items.size()} of ${totalItems} items</span>
        </div>
    </section>

    <!-- Results Grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
        <c:forEach var="item" items="${items}">
            <div class="group bg-surface-container-lowest rounded-lg overflow-hidden transition-all duration-300 hover:shadow-[0_8px_24px_rgba(24,28,29,0.06)] hover:-translate-y-1">
                <div class="h-64 relative overflow-hidden">
                    <c:if test="${not empty item.imageUrl}">
                        <img class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" alt="${item.title}" src="${item.imageUrl}"/>
                    </c:if>
                    <c:if test="${empty item.imageUrl}">
                        <div class="w-full h-full bg-surface-container-high flex items-center justify-center">
                            <span class="material-symbols-outlined text-5xl text-on-surface-variant">image</span>
                        </div>
                    </c:if>
                    <div class="absolute top-4 right-4">
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
                    <div class="flex items-center gap-2 mb-3">
                        <span class="text-[10px] uppercase font-bold tracking-widest text-primary-fixed-dim bg-on-primary-fixed-variant px-2 py-0.5 rounded">${item.category}</span>
                        <span class="text-on-surface-variant text-xs font-medium">
                            <c:out value="${item.createdAt.toString().substring(0, 10)}" />
                        </span>
                    </div>
                    <a href="${pageContext.request.contextPath}/item-detail?id=${item.itemId}">
                        <h3 class="text-xl font-bold mb-4 group-hover:text-primary transition-colors">${item.title}</h3>
                    </a>
                    <div class="space-y-3">
                        <p class="text-sm text-on-surface-variant line-clamp-2">${item.description}</p>
                        <div class="flex items-center gap-3 text-on-surface-variant text-sm">
                            <span class="material-symbols-outlined text-lg">location_on</span>
                            <span>${item.locationName}</span>
                        </div>
                    </div>
                    <div class="mt-4 pt-4 border-t border-outline-variant/10">
                        <a href="${pageContext.request.contextPath}/item-detail?id=${item.itemId}" class="text-primary font-bold text-sm hover:underline">View Details →</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- No Results Message -->
    <c:if test="${empty items}">
        <div class="text-center py-12">
            <span class="material-symbols-outlined text-6xl text-on-surface-variant mb-4 inline-block">inbox</span>
            <h3 class="text-2xl font-bold mb-2">No items found</h3>
            <p class="text-on-surface-variant mb-6">Try adjusting your filters or search criteria</p>
            <a href="${pageContext.request.contextPath}/browse-items" class="text-primary font-bold hover:underline">Clear Filters</a>
        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="${pageContext.request.contextPath}/browse-items?page=1<c:if test='${not empty selectedCategory}'>&category=${selectedCategory}</c:if><c:if test='${not empty selectedLocation}'>&location=${selectedLocation}</c:if>">First</a>
                <a href="${pageContext.request.contextPath}/browse-items?page=${currentPage - 1}<c:if test='${not empty selectedCategory}'>&category=${selectedCategory}</c:if><c:if test='${not empty selectedLocation}'>&location=${selectedLocation}</c:if>">Previous</a>
            </c:if>

            <c:forEach begin="1" end="${totalPages}" var="page">
                <c:choose>
                    <c:when test="${page == currentPage}">
                        <span class="active">${page}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/browse-items?page=${page}<c:if test='${not empty selectedCategory}'>&category=${selectedCategory}</c:if><c:if test='${not empty selectedLocation}'>&location=${selectedLocation}</c:if>">${page}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${currentPage < totalPages}">
                <a href="${pageContext.request.contextPath}/browse-items?page=${currentPage + 1}<c:if test='${not empty selectedCategory}'>&category=${selectedCategory}</c:if><c:if test='${not empty selectedLocation}'>&location=${selectedLocation}</c:if>">Next</a>
                <a href="${pageContext.request.contextPath}/browse-items?page=${totalPages}<c:if test='${not empty selectedCategory}'>&category=${selectedCategory}</c:if><c:if test='${not empty selectedLocation}'>&location=${selectedLocation}</c:if>">Last</a>
            </c:if>
        </div>
    </c:if>
</main>

<jsp:include page="/components/footer.jsp"/>
</body>
</html>
