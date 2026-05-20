<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header
  class="fixed top-0 left-0 right-0 z-50 bg-white/95 backdrop-blur-lg border-b border-outline-variant/10 shadow-lg"
>
  <nav
    class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex justify-between items-center"
  >
    <!-- Logo -->
    <a
      href="${pageContext.request.contextPath}/home"
      class="flex items-center gap-2 group"
    >
      <div
        class="w-10 h-10 rounded-lg bg-gradient-to-br from-primary to-primary-container flex items-center justify-center group-hover:shadow-lg transition-shadow"
      >
        <span class="material-symbols-outlined text-white text-xl"
          >location_on</span
        >
      </div>
      <span
        class="text-2xl font-bold text-primary tracking-tight hidden sm:inline-block"
        >Findora</span
      >
    </a>

    <!-- Desktop Navigation -->
    <div class="hidden md:flex items-center gap-1">
      <a
        href="${pageContext.request.contextPath}/home"
        class="px-3 py-2 rounded-lg text-sm font-medium text-on-surface hover:bg-surface-container-lowest transition-colors"
        >Home</a
      >
      <c:if test="${authRole == 'admin' || authRole == 'location_admin'}">
        <a
          href="${pageContext.request.contextPath}/dashboard"
          class="px-3 py-2 rounded-lg text-sm font-medium text-on-surface hover:bg-surface-container-lowest transition-colors"
          >Dashboard</a
        >
      </c:if>
      <a
        href="${pageContext.request.contextPath}/browse-items"
        class="px-3 py-2 rounded-lg text-sm font-medium text-on-surface hover:bg-surface-container-lowest transition-colors"
        >Explore</a
      >
      <a
        href="${pageContext.request.contextPath}/report-found-item"
        class="px-3 py-2 rounded-lg text-sm font-medium text-primary font-semibold hover:bg-primary/10 transition-colors"
        >Found Items</a
      >
      <a
        href="${pageContext.request.contextPath}/report-lost-item"
        class="px-3 py-2 rounded-lg text-sm font-medium text-on-surface hover:bg-surface-container-lowest transition-colors"
        >Lost Items</a
      >
    </div>

    <!-- Right Section -->
    <div class="flex items-center gap-3 sm:gap-4">
      <!-- Search Icon (Mobile) -->
      <button
        class="md:hidden p-2 rounded-lg text-on-surface hover:bg-surface-container-lowest transition-colors"
      >
        <span class="material-symbols-outlined">search</span>
      </button>

      <!-- Notification -->
      <button
        class="p-2 rounded-lg text-on-surface hover:bg-surface-container-lowest transition-colors relative group"
        title="Notifications"
      >
        <span class="material-symbols-outlined">notifications</span>
        <span
          class="absolute top-1 right-1 w-2.5 h-2.5 bg-error rounded-full"
        ></span>
      </button>

      <!-- User Actions -->
      <c:choose>
        <c:when test="${not empty authUser}">
          <a
            href="${pageContext.request.contextPath}/profile"
            class="w-9 h-9 rounded-lg bg-primary/10 flex items-center justify-center hover:bg-primary/20 transition-colors overflow-hidden group"
            title="Profile"
          >
            <c:choose>
              <c:when test="${not empty sessionScope.profilePhoto}">
                <img
                  src="${sessionScope.profilePhoto}"
                  alt="Avatar"
                  class="w-full h-full object-cover"
                />
              </c:when>
              <c:otherwise>
                <span class="material-symbols-outlined text-primary"
                  >person</span
                >
              </c:otherwise>
            </c:choose>
          </a>
          <a
            href="${pageContext.request.contextPath}/auth/logout"
            class="hidden sm:inline-block px-4 py-2 rounded-lg text-sm font-semibold bg-surface-container-low text-on-surface hover:bg-surface-container-high transition-colors"
          >
            Sign out
          </a>
        </c:when>
        <c:otherwise>
          <a
            href="${pageContext.request.contextPath}/auth/login"
            class="px-4 py-2 rounded-lg text-sm font-semibold bg-primary text-on-primary hover:bg-primary-container transition-colors"
          >
            Sign in
          </a>
        </c:otherwise>
      </c:choose>

      <!-- Mobile Menu Button -->
      <button
        class="md:hidden p-2 rounded-lg text-on-surface hover:bg-surface-container-lowest transition-colors"
        onclick="
          document.getElementById('mobileMenu').classList.toggle('hidden')
        "
      >
        <span class="material-symbols-outlined">menu</span>
      </button>
    </div>
  </nav>

  <!-- Mobile Menu -->
  <div
    id="mobileMenu"
    class="hidden md:hidden border-t border-outline-variant/10 bg-surface-container-lowest"
  >
    <div class="px-4 py-3 space-y-2">
      <a
        href="${pageContext.request.contextPath}/home"
        class="block px-3 py-2 rounded-lg text-sm font-medium text-on-surface hover:bg-surface-container-low transition-colors"
        >Home</a
      >
      <c:if test="${authRole == 'admin' || authRole == 'location_admin'}">
        <a
          href="${pageContext.request.contextPath}/dashboard"
          class="block px-3 py-2 rounded-lg text-sm font-medium text-on-surface hover:bg-surface-container-low transition-colors"
          >Dashboard</a
        >
      </c:if>
      <a
        href="${pageContext.request.contextPath}/browse-items"
        class="block px-3 py-2 rounded-lg text-sm font-medium text-on-surface hover:bg-surface-container-low transition-colors"
        >Explore Items</a
      >
      <a
        href="${pageContext.request.contextPath}/report-found-item"
        class="block px-3 py-2 rounded-lg text-sm font-semibold text-primary hover:bg-primary/10 transition-colors"
        >Report Found Item</a
      >
      <a
        href="${pageContext.request.contextPath}/report-lost-item"
        class="block px-3 py-2 rounded-lg text-sm font-medium text-on-surface hover:bg-surface-container-low transition-colors"
        >Report Lost Item</a
      >
      <c:if test="${empty authUser}">
        <a
          href="${pageContext.request.contextPath}/auth/logout"
          class="block sm:hidden px-3 py-2 rounded-lg text-sm font-medium text-on-surface hover:bg-surface-container-low transition-colors mt-2 pt-2 border-t border-outline-variant/10"
        >
          Sign out
        </a>
      </c:if>
    </div>
  </div>
</header>
