<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Findora Admin | Manage Items</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;family=Inter:wght@300;400;500;600&amp;family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
      rel="stylesheet"
    />
    <script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
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
            borderRadius: {
              DEFAULT: "0.25rem",
              lg: "0.5rem",
              xl: "0.75rem",
              full: "9999px",
            },
            fontFamily: {
              headline: ["Manrope"],
              body: ["Inter"],
              label: ["Inter"],
            },
          },
        },
      };
    </script>
    <style>
      .material-symbols-outlined {
        font-variation-settings:
          "FILL" 0,
          "wght" 400,
          "GRAD" 0,
          "opsz" 24;
        vertical-align: middle;
      }

      body {
        font-family: "Inter", sans-serif;
      }

      h1,
      h2,
      h3,
      .brand-font {
        font-family: "Manrope", sans-serif;
      }
    </style>
  </head>
  <body class="bg-surface text-on-surface flex min-h-screen">
    <% request.setAttribute("sectionLabel", "Admin Console"); %>
    <% request.setAttribute("pageTitle", "Manage Ledger"); %>
    <jsp:include page="/components/admin/layout_start.jsp" />
      <!-- Content Body -->
      <div class="p-8 space-y-8">
        <!-- Page Header Area -->
        <div class="flex flex-col md:flex-row justify-between items-end gap-4">
          <div class="space-y-1">
            <h2 class="text-3xl font-extrabold text-primary tracking-tight">
              Manage Ledger
            </h2>
            <p class="text-on-surface-variant font-body">
              Institutional inventory control and item lifecycle management.
            </p>
          </div>
          <div class="flex gap-3">
            <button
              class="bg-surface-container-lowest border border-outline-variant/30 text-primary px-4 py-2 rounded-lg font-semibold flex items-center gap-2 hover:bg-surface-container-low transition-colors"
            >
              <span
                class="material-symbols-outlined text-sm"
                data-icon="file_download"
                >file_download</span
              >
              Export CSV
            </button>
            <button
              class="bg-primary text-on-primary px-6 py-2 rounded-lg font-semibold shadow-sm hover:brightness-110 active:scale-95 transition-all"
            >
              Bulk Change Status
            </button>
          </div>
        </div>
        <!-- Advanced Filter Bar -->
        <div
          class="bg-surface-container-low p-6 rounded-xl flex flex-wrap gap-4 items-center"
        >
          <div
            class="flex items-center gap-2 px-3 py-2 bg-surface-container-lowest rounded-lg border border-outline-variant/20 flex-1 min-w-[180px]"
          >
            <span
              class="text-[10px] uppercase tracking-wider text-outline font-bold"
              >Category</span
            >
            <select
              class="bg-transparent border-none focus:ring-0 text-sm font-medium w-full p-0"
            >
              <option>All Categories</option>
              <option>Electronics</option>
              <option>Wallets &amp; Keys</option>
              <option>Apparel</option>
              <option>Books</option>
            </select>
          </div>
          <div
            class="flex items-center gap-2 px-3 py-2 bg-surface-container-lowest rounded-lg border border-outline-variant/20 flex-1 min-w-[180px]"
          >
            <span
              class="text-[10px] uppercase tracking-wider text-outline font-bold"
              >Status</span
            >
            <select
              class="bg-transparent border-none focus:ring-0 text-sm font-medium w-full p-0"
            >
              <option>All Statuses</option>
              <option>Found</option>
              <option>Claimed</option>
              <option>Auctioned</option>
              <option>Disposed</option>
            </select>
          </div>
          <div
            class="flex items-center gap-2 px-3 py-2 bg-surface-container-lowest rounded-lg border border-outline-variant/20 flex-1 min-w-[180px]"
          >
            <span
              class="text-[10px] uppercase tracking-wider text-outline font-bold"
              >Location</span
            >
            <select
              class="bg-transparent border-none focus:ring-0 text-sm font-medium w-full p-0"
            >
              <option>All Sites</option>
              <option>Main Library</option>
              <option>Student Union</option>
              <option>Science Block</option>
            </select>
          </div>
          <div
            class="flex items-center gap-2 px-3 py-2 bg-surface-container-lowest rounded-lg border border-outline-variant/20 flex-1 min-w-[180px]"
          >
            <span
              class="text-[10px] uppercase tracking-wider text-outline font-bold"
              >Role</span
            >
            <select
              class="bg-transparent border-none focus:ring-0 text-sm font-medium w-full p-0"
            >
              <option>Student</option>
              <option>Faculty</option>
              <option>Staff</option>
              <option>Guest</option>
            </select>
          </div>
          <button
            class="bg-surface-container-highest text-on-surface-variant p-2 rounded-lg hover:bg-outline-variant/30 transition-colors"
          >
            <span class="material-symbols-outlined" data-icon="filter_list"
              >filter_list</span
            >
          </button>
        </div>
        <!-- The Ledger Table -->
        <div
          class="bg-surface-container-lowest rounded-xl overflow-hidden shadow-[0_4px_24px_-4px_rgba(0,75,75,0.04)]"
        >
          <table class="w-full text-left border-collapse">
            <thead>
              <tr class="bg-surface-container-low border-none">
                <th class="py-4 px-6">
                  <input
                    class="rounded border-outline-variant text-secondary focus:ring-secondary"
                    type="checkbox"
                  />
                </th>
                <th
                  class="py-4 px-4 text-[11px] font-extrabold uppercase tracking-widest text-outline"
                >
                  Item ID
                </th>
                <th
                  class="py-4 px-4 text-[11px] font-extrabold uppercase tracking-widest text-outline"
                >
                  Preview
                </th>
                <th
                  class="py-4 px-4 text-[11px] font-extrabold uppercase tracking-widest text-outline"
                >
                  Name &amp; Type
                </th>
                <th
                  class="py-4 px-4 text-[11px] font-extrabold uppercase tracking-widest text-outline"
                >
                  Owner / Finder
                </th>
                <th
                  class="py-4 px-4 text-[11px] font-extrabold uppercase tracking-widest text-outline"
                >
                  Status
                </th>
                <th
                  class="py-4 px-4 text-[11px] font-extrabold uppercase tracking-widest text-outline"
                >
                  Created Date
                </th>
                <th class="py-4 px-6 text-right"></th>
              </tr>
            </thead>
            <tbody class="divide-y divide-surface-container-low font-body">
              <!-- Row 1 -->
              <tr
                class="hover:bg-surface-container-low/30 transition-colors group"
              >
                <td class="py-4 px-6">
                  <input
                    class="rounded border-outline-variant text-secondary focus:ring-secondary"
                    type="checkbox"
                  />
                </td>
                <td
                  class="py-4 px-4 font-mono text-xs font-semibold text-primary"
                >
                  #FIN-9021
                </td>
                <td class="py-4 px-4">
                  <img
                    class="w-12 h-12 rounded-lg object-cover ring-2 ring-surface-container-high"
                    data-alt="Premium silver luxury watch with black leather strap sitting on a glass surface with reflections"
                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuCJLOeqL8KJYoEJxEPdOr4sX82K_Y2iCQFmMu1cvAmwMqfxO1RsSXpoBQZZhAPlfzzoLzNC8Z9pHxRSaU35-lczuxjVhPwEgsC3_Mu5FgBbgOnXE_KhpqrSPi5WQwF44_EcDmjK41mtSdAhYF8aZDSGYieqaF4djoUxSaXqY2YvfGnP5-6MUY2BCApq9cGutoB8Xt-zQAn_gE3yRkpTcyRlMyjMHNJ9VUoRpq8xsqg831DzOYLX731J6TVt76UEhNM6Kgg1AMdk4Tk"
                  />
                </td>
                <td class="py-4 px-4">
                  <p class="text-sm font-bold text-teal-900">
                    Silver Chronograph
                  </p>
                  <p
                    class="text-[11px] text-slate-500 uppercase tracking-tighter"
                  >
                    Electronics • Jewelry
                  </p>
                </td>
                <td class="py-4 px-4">
                  <div class="flex items-center gap-2">
                    <div
                      class="w-7 h-7 rounded-full bg-tertiary/10 flex items-center justify-center text-[10px] font-bold text-tertiary"
                    >
                      JD
                    </div>
                    <span class="text-sm font-medium">John Doe (Student)</span>
                  </div>
                </td>
                <td class="py-4 px-4">
                  <span
                    class="px-2.5 py-1 rounded-full bg-primary-container/20 text-primary text-[10px] font-extrabold uppercase tracking-wide"
                    >Processing</span
                  >
                </td>
                <td class="py-4 px-4 text-sm text-slate-500">Oct 24, 2024</td>
                <td class="py-4 px-6 text-right">
                  <button
                    class="opacity-0 group-hover:opacity-100 p-1 hover:bg-surface-container-highest rounded transition-all"
                  >
                    <span
                      class="material-symbols-outlined text-outline"
                      data-icon="more_vert"
                      >more_vert</span
                    >
                  </button>
                </td>
              </tr>
              <!-- Row 2 -->
              <tr
                class="hover:bg-surface-container-low/30 transition-colors group"
              >
                <td class="py-4 px-6">
                  <input
                    class="rounded border-outline-variant text-secondary focus:ring-secondary"
                    type="checkbox"
                  />
                </td>
                <td
                  class="py-4 px-4 font-mono text-xs font-semibold text-primary"
                >
                  #FIN-8842
                </td>
                <td class="py-4 px-4">
                  <img
                    class="w-12 h-12 rounded-lg object-cover ring-2 ring-surface-container-high"
                    data-alt="A bundle of metal keys with a distinctive blue leather keychain fob on a white surface"
                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuBdKSctOjv83PrdzanNm6o4wHkwmhUOpKeV4DPYEDqvUmtALLOxm2jZAlzZVQnWOQ3wlOexYv3lXBWgHoxV-wJULtKSQTP4UpK03DtNeE9ensY-G5szQ5dPB87WrVqGOZDgUXIBhW4w4ajG65dr9h3P6XM1wCQGoo66itx5U714mAZsTfJ53QCV7_xzyySQFUNZDRMdd-hSbGxf7vmKQ0F65_S3mxe5I71NyI1uiNv2dzMMVDR98aN59FFfNHfbAgifeHqnE1A_HaM"
                  />
                </td>
                <td class="py-4 px-4">
                  <p class="text-sm font-bold text-teal-900">
                    Apartment Key Ring
                  </p>
                  <p
                    class="text-[11px] text-slate-500 uppercase tracking-tighter"
                  >
                    Personal Effects • Metal
                  </p>
                </td>
                <td class="py-4 px-4">
                  <div class="flex items-center gap-2">
                    <div
                      class="w-7 h-7 rounded-full bg-secondary-container/20 flex items-center justify-center text-[10px] font-bold text-secondary"
                    >
                      AM
                    </div>
                    <span class="text-sm font-medium"
                      >Alice Miller (Staff)</span
                    >
                  </div>
                </td>
                <td class="py-4 px-4">
                  <span
                    class="px-2.5 py-1 rounded-full bg-orange-100 text-secondary text-[10px] font-extrabold uppercase tracking-wide"
                    >Lost Reported</span
                  >
                </td>
                <td class="py-4 px-4 text-sm text-slate-500">Oct 23, 2024</td>
                <td class="py-4 px-6 text-right">
                  <button
                    class="opacity-0 group-hover:opacity-100 p-1 hover:bg-surface-container-highest rounded transition-all"
                  >
                    <span
                      class="material-symbols-outlined text-outline"
                      data-icon="more_vert"
                      >more_vert</span
                    >
                  </button>
                </td>
              </tr>
              <!-- Row 3 -->
              <tr
                class="hover:bg-surface-container-low/30 transition-colors group"
              >
                <td class="py-4 px-6">
                  <input
                    class="rounded border-outline-variant text-secondary focus:ring-secondary"
                    type="checkbox"
                  />
                </td>
                <td
                  class="py-4 px-4 font-mono text-xs font-semibold text-primary"
                >
                  #FIN-7102
                </td>
                <td class="py-4 px-4">
                  <img
                    class="w-12 h-12 rounded-lg object-cover ring-2 ring-surface-container-high"
                    data-alt="Hardcover textbook with blue cover lying open on a wooden library desk"
                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuD6DvBVkCEkAzNDJylLPPVVj2v0Nu4Yw1NUQWnAB0XXE1GsbtVZ9EIqDHpu0AbJMpNHjrWaLwy-8vsBfd3650Ys2w7aRUnj8V9AAZSNR8CsfUy3gVaT_5QwhVcQzvru08puvCLcQG_MkXp-CnDTHUzw68ssxMsPATlzlwSVzZdDucQfeaH6sCBjcyo_cGSNfnCeRykvjVAh2N4DjfE0BvymxbY3jhsd1EIFbSECVryaOushDJs-YkXo3-Jo80NdSJgVAda1aQQTFuw"
                  />
                </td>
                <td class="py-4 px-4">
                  <p class="text-sm font-bold text-teal-900">
                    Advanced Calculus Vol. 1
                  </p>
                  <p
                    class="text-[11px] text-slate-500 uppercase tracking-tighter"
                  >
                    Books • Academic
                  </p>
                </td>
                <td class="py-4 px-4">
                  <div class="flex items-center gap-2">
                    <div
                      class="w-7 h-7 rounded-full bg-teal-100 flex items-center justify-center text-[10px] font-bold text-teal-700"
                    >
                      SR
                    </div>
                    <span class="text-sm font-medium"
                      >Sam Rivera (Faculty)</span
                    >
                  </div>
                </td>
                <td class="py-4 px-4">
                  <span
                    class="px-2.5 py-1 rounded-full bg-green-100 text-teal-800 text-[10px] font-extrabold uppercase tracking-wide"
                    >Returned</span
                  >
                </td>
                <td class="py-4 px-4 text-sm text-slate-500">Oct 20, 2024</td>
                <td class="py-4 px-6 text-right">
                  <button
                    class="opacity-0 group-hover:opacity-100 p-1 hover:bg-surface-container-highest rounded transition-all"
                  >
                    <span
                      class="material-symbols-outlined text-outline"
                      data-icon="more_vert"
                      >more_vert</span
                    >
                  </button>
                </td>
              </tr>
              <!-- Row 4 -->
              <tr
                class="hover:bg-surface-container-low/30 transition-colors group"
              >
                <td class="py-4 px-6">
                  <input
                    class="rounded border-outline-variant text-secondary focus:ring-secondary"
                    type="checkbox"
                  />
                </td>
                <td
                  class="py-4 px-4 font-mono text-xs font-semibold text-primary"
                >
                  #FIN-6651
                </td>
                <td class="py-4 px-4">
                  <img
                    class="w-12 h-12 rounded-lg object-cover ring-2 ring-surface-container-high"
                    data-alt="Modern smartphone with screen turned off showing sleek glass finish on a grey backdrop"
                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuANrfC-hq_LK5sh8VZGboway3J8EPjZWP41HIycJJKnj_lE_8yVbNdR9XjeeITbjB_FQOkJa3Mn4jwhF-vNbSk8Vg_gBxl2YicenjEE9rBYWQTJaAiuhmjzy6qJlZoX_OgEFnu1rmR5vDtPvbJ53QCWV_-hU5w8SILL60ZSvdfYIHj5AoJFCnYB_CiMwDmGneAW7DQbSviLsVSpmz17wIgO2rkwDqbVtVfZZksdGl-ar-Ue0GatTCQlzP6fSpjVuI2TsblqTyhpSpQ"
                  />
                </td>
                <td class="py-4 px-4">
                  <p class="text-sm font-bold text-teal-900">
                    iPhone 14 Pro Max
                  </p>
                  <p
                    class="text-[11px] text-slate-500 uppercase tracking-tighter"
                  >
                    Electronics • Mobile
                  </p>
                </td>
                <td class="py-4 px-4">
                  <div class="flex items-center gap-2">
                    <div
                      class="w-7 h-7 rounded-full bg-slate-200 flex items-center justify-center text-[10px] font-bold text-slate-600"
                    >
                      G
                    </div>
                    <span class="text-sm font-medium">Guest (Visitor)</span>
                  </div>
                </td>
                <td class="py-4 px-4">
                  <span
                    class="px-2.5 py-1 rounded-full bg-red-100 text-error text-[10px] font-extrabold uppercase tracking-wide"
                    >Disposed</span
                  >
                </td>
                <td class="py-4 px-4 text-sm text-slate-500">Oct 18, 2024</td>
                <td class="py-4 px-6 text-right">
                  <button
                    class="opacity-0 group-hover:opacity-100 p-1 hover:bg-surface-container-highest rounded transition-all"
                  >
                    <span
                      class="material-symbols-outlined text-outline"
                      data-icon="more_vert"
                      >more_vert</span
                    >
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
          <!-- Pagination / Ledger Footer -->
          <div
            class="p-6 bg-surface-container-low/50 flex flex-col md:flex-row justify-between items-center gap-4"
          >
            <p class="text-xs text-outline font-medium tracking-wide">
              SHOWING 1-4 OF 1,248 REGISTERED ENTRIES
            </p>
            <div class="flex items-center gap-2">
              <button
                class="p-2 rounded-lg hover:bg-white transition-colors disabled:opacity-30"
                disabled=""
              >
                <span class="material-symbols-outlined" data-icon="chevron_left"
                  >chevron_left</span
                >
              </button>
              <button
                class="w-8 h-8 rounded-lg bg-primary text-on-primary text-xs font-bold shadow-sm"
              >
                1
              </button>
              <button
                class="w-8 h-8 rounded-lg hover:bg-white text-xs font-bold transition-colors"
              >
                2
              </button>
              <button
                class="w-8 h-8 rounded-lg hover:bg-white text-xs font-bold transition-colors"
              >
                3
              </button>
              <span class="px-2 text-outline">...</span>
              <button
                class="w-8 h-8 rounded-lg hover:bg-white text-xs font-bold transition-colors"
              >
                124
              </button>
              <button class="p-2 rounded-lg hover:bg-white transition-colors">
                <span
                  class="material-symbols-outlined"
                  data-icon="chevron_right"
                  >chevron_right</span
                >
              </button>
            </div>
          </div>
        </div>
        <!-- Contextual Insight Bento (Mini) -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div
            class="bg-surface-container-lowest p-5 rounded-xl flex items-center gap-4 border border-outline-variant/10"
          >
            <div
              class="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center"
            >
              <span
                class="material-symbols-outlined text-primary"
                data-icon="inventory"
                style="font-variation-settings: &quot;FILL&quot; 1"
                >inventory</span
              >
            </div>
            <div>
              <h4
                class="text-xs font-bold text-outline uppercase tracking-wider"
              >
                Storage Load
              </h4>
              <p class="text-xl font-extrabold text-teal-900">84% Capacity</p>
            </div>
          </div>
          <div
            class="bg-surface-container-lowest p-5 rounded-xl flex items-center gap-4 border border-outline-variant/10"
          >
            <div
              class="w-12 h-12 rounded-full bg-secondary/10 flex items-center justify-center"
            >
              <span
                class="material-symbols-outlined text-secondary"
                data-icon="speed"
                style="font-variation-settings: &quot;FILL&quot; 1"
                >speed</span
              >
            </div>
            <div>
              <h4
                class="text-xs font-bold text-outline uppercase tracking-wider"
              >
                Avg. Return Time
              </h4>
              <p class="text-xl font-extrabold text-teal-900">2.4 Days</p>
            </div>
          </div>
          <div
            class="bg-surface-container-lowest p-5 rounded-xl flex items-center gap-4 border border-outline-variant/10"
          >
            <div
              class="w-12 h-12 rounded-full bg-tertiary/10 flex items-center justify-center"
            >
              <span
                class="material-symbols-outlined text-tertiary"
                data-icon="verified_user"
                style="font-variation-settings: &quot;FILL&quot; 1"
                >verified_user</span
              >
            </div>
            <div>
              <h4
                class="text-xs font-bold text-outline uppercase tracking-wider"
              >
                Resolution Rate
              </h4>
              <p class="text-xl font-extrabold text-teal-900">92.8%</p>
            </div>
          </div>
        </div>
      </div>
      <!-- Footer Component -->
      <footer
        class="bg-slate-50 text-teal-900 font-inter text-xs tracking-wide uppercase w-full py-6 mt-auto border-t border-slate-200/10 px-12 flex flex-col md:flex-row justify-between items-center"
      >
        <div class="font-manrope font-black text-teal-900 mb-4 md:mb-0">
          Findora
        </div>
        <div class="text-slate-400 text-center md:text-left mb-4 md:mb-0">
          © 2024 Findora Lost &amp; Found. Managed Institutional Stewardship.
        </div>
        <div class="flex gap-6">
          <a
            class="text-slate-400 hover:text-orange-500 transition-colors"
            href="#"
            >Privacy Policy</a
          >
          <a
            class="text-slate-400 hover:text-orange-500 transition-colors"
            href="#"
            >Terms of Service</a
          >
          <a
            class="text-slate-400 hover:text-orange-500 transition-colors"
            href="#"
            >Support</a
          >
        </div>
      </footer>
    </main>
  </body>
</html>
