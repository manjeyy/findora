<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Privacy Policy | Findora</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Inter:wght@400;500;600&display=swap"
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
      <div class="max-w-4xl mx-auto">
        <!-- Header -->
        <div class="mb-12">
          <h1 class="text-5xl font-extrabold text-on-surface mb-4">
            Privacy Policy
          </h1>
          <p class="text-on-surface-variant text-lg">Last updated: May 2026</p>
        </div>

        <!-- Content -->
        <div class="space-y-8 text-on-surface-variant leading-relaxed">
          <!-- Introduction -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              1. Introduction
            </h2>
            <p>
              Findora ("we," "our," or "us") is committed to protecting your
              privacy. This Privacy Policy explains how we collect, use,
              disclose, and safeguard your information when you visit our
              website and use our services.
            </p>
          </section>

          <!-- Information We Collect -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              2. Information We Collect
            </h2>
            <div class="space-y-4">
              <div>
                <h3 class="font-semibold text-on-surface mb-2">
                  Personal Information
                </h3>
                <p>
                  We collect information you voluntarily provide, including
                  name, email address, phone number, and any information you
                  submit when reporting lost or found items.
                </p>
              </div>
              <div>
                <h3 class="font-semibold text-on-surface mb-2">Usage Data</h3>
                <p>
                  We automatically collect usage data such as IP address,
                  browser type, pages visited, and the time and duration of your
                  visits.
                </p>
              </div>
              <div>
                <h3 class="font-semibold text-on-surface mb-2">Cookies</h3>
                <p>
                  We use cookies to enhance your experience on our platform. You
                  can control cookie settings through your browser.
                </p>
              </div>
            </div>
          </section>

          <!-- How We Use Information -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              3. How We Use Your Information
            </h2>
            <ul class="list-disc list-inside space-y-2">
              <li>To provide and improve our services</li>
              <li>To send notifications and updates</li>
              <li>To respond to inquiries and support requests</li>
              <li>To maintain security and prevent fraud</li>
              <li>To comply with legal obligations</li>
            </ul>
          </section>

          <!-- Data Security -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              4. Data Security
            </h2>
            <p>
              We implement appropriate technical and organizational measures to
              protect your information against unauthorized access, alteration,
              disclosure, or destruction. However, no method of transmission
              over the internet is 100% secure.
            </p>
          </section>

          <!-- Third-Party Sharing -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              5. Third-Party Sharing
            </h2>
            <p>
              We do not sell, trade, or rent your personal information to third
              parties. We may share information with trusted service providers
              who assist us in operating our website and conducting our
              business, subject to confidentiality agreements.
            </p>
          </section>

          <!-- Your Rights -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              6. Your Rights
            </h2>
            <p class="mb-4">
              You have the right to access, correct, or delete your personal
              information. To exercise these rights, please contact us at
              privacy@findora.edu.
            </p>
          </section>

          <!-- Contact -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              7. Contact Us
            </h2>
            <p>
              If you have questions about this Privacy Policy, please contact us
              at:<br />
              Email: privacy@findora.edu<br />
              Address: Findora Administrative Office, 123 Campus Drive,
              University Town, ST 12345
            </p>
          </section>
        </div>

        <!-- Back Button -->
        <div class="mt-12 flex justify-center">
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
