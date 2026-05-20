<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Terms of Service | Findora</title>
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
            Terms of Service
          </h1>
          <p class="text-on-surface-variant text-lg">Last updated: May 2026</p>
        </div>

        <!-- Content -->
        <div class="space-y-8 text-on-surface-variant leading-relaxed">
          <!-- Agreement -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              1. Agreement to Terms
            </h2>
            <p>
              By accessing and using Findora, you accept and agree to be bound
              by and comply with these Terms of Service. If you do not agree to
              abide by the above, please do not use this service.
            </p>
          </section>

          <!-- Use License -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              2. Use License
            </h2>
            <p class="mb-4">
              Permission is granted to temporarily download one copy of the
              materials (information or software) on Findora for personal,
              non-commercial transitory viewing only. This is the grant of a
              license, not a transfer of title, and under this license you may
              not:
            </p>
            <ul class="list-disc list-inside space-y-2">
              <li>Modifying or copying the materials</li>
              <li>
                Using the materials for any commercial purpose or for any public
                display
              </li>
              <li>Attempting to decompile or reverse engineer any software</li>
              <li>Removing any copyright or other proprietary notations</li>
              <li>
                Transferring the materials to another person or "mirroring" the
                materials on any other server
              </li>
            </ul>
          </section>

          <!-- Disclaimer -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              3. Disclaimer
            </h2>
            <p>
              The materials on Findora are provided on an 'as is' basis. Findora
              makes no warranties, expressed or implied, and hereby disclaims
              and negates all other warranties including, without limitation,
              implied warranties or conditions of merchantability, fitness for a
              particular purpose, or non-infringement of intellectual property
              or other violation of rights.
            </p>
          </section>

          <!-- Limitations -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              4. Limitations
            </h2>
            <p>
              In no event shall Findora or its suppliers be liable for any
              damages (including, without limitation, damages for loss of data
              or profit, or due to business interruption) arising out of the use
              or inability to use the materials on Findora, even if Findora or
              an authorized representative has been notified orally or in
              writing of the possibility of such damage.
            </p>
          </section>

          <!-- Accuracy of Materials -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              5. Accuracy of Materials
            </h2>
            <p>
              The materials appearing on Findora could include technical,
              typographical, or photographic errors. Findora does not warrant
              that any of the materials on its website are accurate, complete,
              or current. Findora may make changes to the materials contained on
              its website at any time without notice.
            </p>
          </section>

          <!-- User Conduct -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              6. User Conduct
            </h2>
            <p>
              You agree not to post content that is abusive, threatening,
              obscene, defamatory, libelous, or otherwise objectionable
              material. You also agree not to engage in any conduct that
              restricts or inhibits anyone's use or enjoyment of the website.
            </p>
          </section>

          <!-- Modifications -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              7. Modifications
            </h2>
            <p>
              Findora may revise these Terms of Service for its website at any
              time without notice. By using this website, you are agreeing to be
              bound by the then current version of these Terms of Service.
            </p>
          </section>

          <!-- Governing Law -->
          <section
            class="bg-surface-container-lowest p-8 rounded-lg border border-outline-variant/15"
          >
            <h2 class="text-2xl font-bold text-on-surface mb-4">
              8. Governing Law
            </h2>
            <p>
              These Terms and Conditions of use are governed by and construed in
              accordance with the laws of the jurisdiction in which Findora is
              located, and you irrevocably submit to the exclusive jurisdiction
              of the courts in that location.
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
