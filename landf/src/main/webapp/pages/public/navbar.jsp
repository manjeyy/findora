<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header
  class="bg-slate-50 font-manrope text-sm font-medium full-width top-0 z-50 sticky flex justify-between items-center px-6 py-3 w-full shadow-sm"
>
  <div class="flex items-center gap-8">
    <span class="text-xl font-bold text-teal-900 tracking-tight">Findora</span>
    <div
      class="hidden md:flex items-center bg-slate-100 rounded-full px-4 py-1.5 gap-3"
    >
      <span class="material-symbols-outlined text-slate-500 text-lg"
        >search</span
      >
      <input
        class="bg-transparent border-none focus:ring-0 text-sm w-64 placeholder:text-slate-400"
        placeholder="Search for items..."
        type="text"
      />
    </div>
  </div>
  <nav class="hidden md:flex items-center gap-6">
    <a class="text-teal-700 font-semibold transition-colors" href="#"
      >Dashboard</a
    >
    <a
      class="text-slate-500 hover:bg-slate-200/50 transition-colors px-2 py-1 rounded"
      href="#"
      >Explore</a
    >
    <a
      class="text-slate-500 hover:bg-slate-200/50 transition-colors px-2 py-1 rounded"
      href="#"
      >Claims</a
    >
  </nav>
  <div class="flex items-center gap-4">
    <c:choose>
      <c:when test="${not empty authUser}">
        <a
          href="${pageContext.request.contextPath}/profile"
          class="w-8 h-8 rounded-full overflow-hidden"
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
              <div
                class="w-8 h-8 rounded-full bg-primary/10 flex items-center justify-center"
              >
                <span class="material-symbols-outlined text-primary"
                  >person</span
                >
              </div>
            </c:otherwise>
          </c:choose>
        </a>
      </c:when>
      <c:otherwise>
        <a
          href="${pageContext.request.contextPath}/auth/login"
          class="px-3 py-1 rounded text-sm font-medium bg-primary text-on-primary"
          >Sign in</a
        >
      </c:otherwise>
    </c:choose>
  </div>
</header>
