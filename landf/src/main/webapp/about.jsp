<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>About Findora | Lost & Found Management</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Inter:wght@400;500;600&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
      rel="stylesheet"
    />
    <style>
      body {
        font-family: "Inter", sans-serif;
        background-color: #f7fafa;
      }
      h1,
      h2,
      h3 {
        font-family: "Manrope", sans-serif;
      }
    </style>
  </head>
  <body class="bg-background text-on-surface min-h-screen flex flex-col">
    <jsp:include page="/components/navbar.jsp" />

    <main class="flex-grow pt-28 pb-16 px-6 md:px-12">
      <div class="max-w-6xl mx-auto">
        <!-- Header -->
        <div class="mb-16 text-center">
          <h1 class="text-5xl font-extrabold text-on-surface mb-4">
            About Findora
          </h1>
          <p class="text-on-surface-variant text-xl max-w-2xl mx-auto">
            Reconnecting people with their belongings through innovative .
          </p>
        </div>

        <!-- Mission Section -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-12 mb-16 items-center">
          <div>
            <h2 class="text-3xl font-bold text-on-surface mb-4">Our Mission</h2>
            <p class="text-on-surface-variant text-lg leading-relaxed mb-4">
              Findora is dedicated to reducing the distress and inconvenience
              caused by lost items through a comprehensive, digital-first lost
              and found management system. We streamline the process of
              reporting, tracking, and recovering lost or found items across
              institutional locations.
            </p>
            <p class="text-on-surface-variant text-lg leading-relaxed">
              Our platform combines cutting-edge technology with institutional
              principles to ensure that valuable items are efficiently
              catalogued, matched, and reunited with their owners.
            </p>
          </div>
          <div class="bg-primary-container p-8 rounded-lg">
            <span
              class="material-symbols-outlined text-7xl text-on-primary-container mb-4 block"
              >lightbulb</span
            >
            <h3 class="text-xl font-bold text-on-primary-container mb-2">
              Innovation
            </h3>
            <p class="text-on-primary-container/80">
              We leverage modern technology to solve age-old problems of lost
              property management.
            </p>
          </div>
        </div>

        <!-- Values Section -->
        <div class="mb-16">
          <h2 class="text-3xl font-bold text-on-surface mb-8 text-center">
            Our Core Values
          </h2>
          <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div
              class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
            >
              <span
                class="material-symbols-outlined text-5xl text-primary mb-4 block"
                >verified_user</span
              >
              <h3 class="text-xl font-bold text-on-surface mb-3">Integrity</h3>
              <p class="text-on-surface-variant">
                We maintain the highest standards of honesty and transparency in
                all our operations.
              </p>
            </div>
            <div
              class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
            >
              <span
                class="material-symbols-outlined text-5xl text-primary mb-4 block"
                >security</span
              >
              <h3 class="text-xl font-bold text-on-surface mb-3">Security</h3>
              <p class="text-on-surface-variant">
                Your personal information and item details are protected with
                industry-leading encryption.
              </p>
            </div>
            <div
              class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
            >
              <span
                class="material-symbols-outlined text-5xl text-primary mb-4 block"
                >volunteer_activism</span
              >
              <h3 class="text-xl font-bold text-on-surface mb-3">Community</h3>
              <p class="text-on-surface-variant">
                We foster a community of care where helping each other find lost
                items is rewarded.
              </p>
            </div>
          </div>
        </div>

        <!-- Team Section -->
        <div
          class="mb-16 bg-surface-container-lowest p-12 rounded-lg border border-outline-variant/15"
        >
          <h2 class="text-3xl font-bold text-on-surface mb-4">Our Team</h2>
          <p class="text-on-surface-variant text-lg leading-relaxed mb-6">
            Findora is supported by a dedicated team of developers,
            administrators, and institutional partners committed to making lost
            and found management seamless and efficient.
          </p>
          <div class="flex gap-4 flex-wrap">
            <button
              class="px-6 py-3 bg-primary text-on-primary font-semibold rounded-lg hover:bg-primary-container transition-colors"
            >
              Meet the Team
            </button>
            <button
              class="px-6 py-3 bg-surface-container-high text-on-surface font-semibold rounded-lg hover:bg-surface-container-low transition-colors"
            >
              Careers
            </button>
          </div>
        </div>

        <!-- Back Button -->
        <div class="flex justify-center">
          <a
            href="${pageContext.request.contextPath}/home"
            class="px-8 py-3 bg-primary text-on-primary font-bold rounded-lg hover:bg-primary-container transition-colors"
          >
            Back to Home
          </a>
        </div>
      </div>
    </main>

    <jsp:include page="/components/footer.jsp" />
  </body>
</html>
