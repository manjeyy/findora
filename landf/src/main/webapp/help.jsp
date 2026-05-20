<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Help & Support | Findora</title>
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
        <div class="mb-12 text-center">
          <h1 class="text-5xl font-extrabold text-on-surface mb-4">
            Help & Support
          </h1>
          <p class="text-on-surface-variant text-lg">
            Find answers and get assistance with Findora
          </p>
        </div>

        <!-- Contact Options -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-16">
          <!-- Email Support -->
          <div
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15 text-center"
          >
            <span
              class="material-symbols-outlined text-5xl text-primary mb-4 block"
              >mail</span
            >
            <h3 class="text-xl font-bold text-on-surface mb-2">
              Email Support
            </h3>
            <p class="text-on-surface-variant mb-4">
              Get in touch with our support team
            </p>
            <a
              href="mailto:support@findora.edu"
              class="text-primary font-semibold hover:underline"
            >
              support@findora.edu
            </a>
          </div>

          <!-- Phone Support -->
          <div
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15 text-center"
          >
            <span
              class="material-symbols-outlined text-5xl text-primary mb-4 block"
              >phone</span
            >
            <h3 class="text-xl font-bold text-on-surface mb-2">
              Phone Support
            </h3>
            <p class="text-on-surface-variant mb-4">
              Call us during business hours
            </p>
            <p class="text-primary font-semibold">+1 (555) 123-4567</p>
          </div>

          <!-- Live Chat -->
          <div
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15 text-center"
          >
            <span
              class="material-symbols-outlined text-5xl text-primary mb-4 block"
              >chat</span
            >
            <h3 class="text-xl font-bold text-on-surface mb-2">Live Chat</h3>
            <p class="text-on-surface-variant mb-4">
              Chat with us in real-time
            </p>
            <button class="text-primary font-semibold hover:underline">
              Start Chat
            </button>
          </div>
        </div>

        <!-- FAQ Section -->
        <div class="mb-16">
          <h2 class="text-3xl font-bold text-on-surface mb-8">
            Frequently Asked Questions
          </h2>
          <div class="space-y-4">
            <!-- FAQ Item 1 -->
            <details
              class="bg-surface-container-lowest p-6 rounded-lg border border-outline-variant/15 cursor-pointer group"
            >
              <summary
                class="flex items-center justify-between font-semibold text-on-surface hover:text-primary transition-colors"
              >
                <span>How do I report a found item?</span>
                <span
                  class="material-symbols-outlined group-open:rotate-180 transition-transform"
                  >expand_more</span
                >
              </summary>
              <p class="text-on-surface-variant mt-4 leading-relaxed">
                You can report a found item by navigating to "Report Found" in
                the navigation menu, filling in the item details, uploading a
                photo, and submitting the form. The item will be reviewed and
                added to our database.
              </p>
            </details>

            <!-- FAQ Item 2 -->
            <details
              class="bg-surface-container-lowest p-6 rounded-lg border border-outline-variant/15 cursor-pointer group"
            >
              <summary
                class="flex items-center justify-between font-semibold text-on-surface hover:text-primary transition-colors"
              >
                <span>How do I claim a found item?</span>
                <span
                  class="material-symbols-outlined group-open:rotate-180 transition-transform"
                  >expand_more</span
                >
              </summary>
              <p class="text-on-surface-variant mt-4 leading-relaxed">
                To claim a found item, browse the available items, select the
                one you believe is yours, and click "Claim Item". You'll need to
                provide proof of ownership, and our team will verify your claim.
              </p>
            </details>

            <!-- FAQ Item 3 -->
            <details
              class="bg-surface-container-lowest p-6 rounded-lg border border-outline-variant/15 cursor-pointer group"
            >
              <summary
                class="flex items-center justify-between font-semibold text-on-surface hover:text-primary transition-colors"
              >
                <span>How long are items kept before disposal?</span>
                <span
                  class="material-symbols-outlined group-open:rotate-180 transition-transform"
                  >expand_more</span
                >
              </summary>
              <p class="text-on-surface-variant mt-4 leading-relaxed">
                Found items are kept for 90 days from the date they were
                reported. If no claim is made during this period, items may be
                donated or disposed of according to institutional policy.
              </p>
            </details>

            <!-- FAQ Item 4 -->
            <details
              class="bg-surface-container-lowest p-6 rounded-lg border border-outline-variant/15 cursor-pointer group"
            >
              <summary
                class="flex items-center justify-between font-semibold text-on-surface hover:text-primary transition-colors"
              >
                <span>How do I contact someone about a specific item?</span>
                <span
                  class="material-symbols-outlined group-open:rotate-180 transition-transform"
                  >expand_more</span
                >
              </summary>
              <p class="text-on-surface-variant mt-4 leading-relaxed">
                You can contact the person who reported an item by clicking the
                "Contact Reporter" button on the item detail page. This sends an
                email through our secure system.
              </p>
            </details>
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
