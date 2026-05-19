<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Findora Admin | Manage Users</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;family=Inter:wght@400;500;600&amp;display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
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
        display: inline-block;
        vertical-align: middle;
      }

      body {
        font-family: "Inter", sans-serif;
      }

      h1,
      h2,
      h3 {
        font-family: "Manrope", sans-serif;
      }
    </style>
  </head>
  <body class="bg-surface text-on-surface flex min-h-screen">
    <% request.setAttribute("sectionLabel", "User Management"); %>
    <% request.setAttribute("pageTitle", "User Directory"); %>
    <jsp:include page="/components/admin/layout_start.jsp" />
      <!-- Content Canvas -->
      <section class="p-8 space-y-8 max-w-7xl mx-auto w-full">
        <!-- Page Header -->
        <div
          class="flex flex-col md:flex-row md:items-end justify-between gap-6"
        >
          <div>
            <h2
              class="text-4xl font-extrabold text-primary tracking-tight mb-2"
            >
              User Directory
            </h2>
            <p class="text-on-surface-variant max-w-md font-body">
              Manage institutional access, modify roles, and oversee system
              stewardship across all campus locations.
            </p>
          </div>
          <div class="flex items-center gap-3">
            <button
              class="bg-primary text-on-primary px-6 py-2.5 rounded-lg font-bold flex items-center gap-2 hover:bg-primary-container hover:text-on-primary-container transition-all shadow-sm active:scale-95"
            >
              <span
                class="material-symbols-outlined text-sm"
                data-icon="person_add"
                >person_add</span
              >
              <span class="text-sm font-manrope">Create New User</span>
            </button>
          </div>
        </div>
        <!-- Filters Bar -->
        <div
          class="bg-surface-container-low p-2 rounded-xl flex flex-wrap items-center gap-2"
        >
          <div class="flex-1 min-w-[280px] p-2">
            <div class="relative">
              <span
                class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline"
                data-icon="filter_list"
                >filter_list</span
              >
              <input
                class="w-full bg-surface-container-lowest border-none py-2.5 pl-11 pr-4 rounded-lg text-sm focus:ring-2 focus:ring-primary/20"
                placeholder="Filter by name, email or department..."
                type="text"
              />
            </div>
          </div>
          <div class="flex items-center gap-2 p-2">
            <select
              class="bg-surface-container-lowest border-none text-sm py-2.5 px-4 rounded-lg font-medium text-on-surface-variant focus:ring-2 focus:ring-primary/20"
            >
              <option>All Roles</option>
              <option>Super Admin</option>
              <option>Loc Admin</option>
              <option>Standard User</option>
            </select>
            <select
              class="bg-surface-container-lowest border-none text-sm py-2.5 px-4 rounded-lg font-medium text-on-surface-variant focus:ring-2 focus:ring-primary/20"
            >
              <option>All Statuses</option>
              <option>Active</option>
              <option>Disabled</option>
              <option>Pending</option>
            </select>
            <button
              class="bg-surface-container-highest text-on-surface-variant p-2.5 rounded-lg hover:bg-outline-variant transition-colors"
            >
              <span class="material-symbols-outlined" data-icon="download"
                >download</span
              >
            </button>
          </div>
        </div>
        <!-- The Ledger (Data Table) -->
        <div
          class="bg-surface-container-lowest rounded-xl overflow-hidden shadow-sm"
        >
          <table class="w-full text-left border-collapse">
            <thead>
              <tr class="bg-surface-container-low border-none">
                <th
                  class="px-6 py-4 text-xs font-bold uppercase tracking-widest text-outline"
                >
                  User Entity
                </th>
                <th
                  class="px-6 py-4 text-xs font-bold uppercase tracking-widest text-outline"
                >
                  Institutional Email
                </th>
                <th
                  class="px-6 py-4 text-xs font-bold uppercase tracking-widest text-outline"
                >
                  Role Authority
                </th>
                <th
                  class="px-6 py-4 text-xs font-bold uppercase tracking-widest text-outline"
                >
                  System Status
                </th>
                <th
                  class="px-6 py-4 text-xs font-bold uppercase tracking-widest text-outline text-right"
                >
                  Actions
                </th>
              </tr>
            </thead>
            <tbody class="divide-y divide-surface-container-low">
              <!-- Row 1 -->
              <tr
                class="hover:bg-surface-container-low/30 transition-colors group"
              >
                <td class="px-6 py-5">
                  <div class="flex items-center gap-4">
                    <img
                      alt="Avatar"
                      class="w-10 h-10 rounded-full bg-slate-200"
                      data-alt="close-up portrait of a young man with a slight smile, natural lighting, soft outdoor background"
                      src="https://lh3.googleusercontent.com/aida-public/AB6AXuBLG4pFKFgkCH1x5nVottaMNIFBfvbvwYQ4R_Iib-bW51rosN1phO0INY9rPtogzmWoXePJgzfMELHY6TtNSbPe3UXFbW6Pkqap-ruT7EbIQ7T9f8QSwH30J3NKglo4qmd9iKc-baSQJchEttv5T-Bp1VJMnbDD0E8GJ1vIKPHXvMSOp17gfMu3kIEiudJMD2uv7kACinLU-iUn-kSvgfpQRa7KzuX8Ry5tPnchr-KrYShpNTQM5lTudnNmsIky7mEY0rGnKCeqIr0"
                    />
                    <div>
                      <p class="font-bold text-primary font-manrope">
                        Marcus Chen
                      </p>
                      <p class="text-xs text-on-surface-variant">
                        Dept. of Student Affairs
                      </p>
                    </div>
                  </div>
                </td>
                <td class="px-6 py-5 text-sm text-on-surface-variant">
                  m.chen@findora.edu
                </td>
                <td class="px-6 py-5">
                  <span
                    class="px-3 py-1 bg-tertiary-fixed text-on-tertiary-fixed-variant rounded-full text-[10px] font-extrabold uppercase tracking-tight"
                    >Super Admin</span
                  >
                </td>
                <td class="px-6 py-5">
                  <div class="flex items-center gap-1.5 text-teal-700">
                    <span class="h-1.5 w-1.5 rounded-full bg-teal-600"></span>
                    <span class="text-xs font-semibold">Active</span>
                  </div>
                </td>
                <td class="px-6 py-5 text-right space-x-2">
                  <button
                    class="p-2 text-outline hover:text-primary transition-colors"
                  >
                    <span
                      class="material-symbols-outlined text-lg"
                      data-icon="edit"
                      >edit</span
                    >
                  </button>
                  <button
                    class="p-2 text-outline hover:text-error transition-colors"
                  >
                    <span
                      class="material-symbols-outlined text-lg"
                      data-icon="block"
                      >block</span
                    >
                  </button>
                </td>
              </tr>
              <!-- Row 2 -->
              <tr
                class="hover:bg-surface-container-low/30 transition-colors group"
              >
                <td class="px-6 py-5">
                  <div class="flex items-center gap-4">
                    <img
                      alt="Avatar"
                      class="w-10 h-10 rounded-full bg-slate-200"
                      data-alt="smiling young woman with braided hair, bright indoor office lighting, vibrant professional headshot"
                      src="https://lh3.googleusercontent.com/aida-public/AB6AXuD_erKQ52aFDQkPYirLbsNTxJpFBKt7c2EuJuqfU6aRHvbGJyy3RYYNFx24vzGlYd6jeTTH939fZErKIKhew1JFWBKlaKLVXAfeTd88FsqCnaYy0RxWG8BoONlsN5XyIwxiliXCimbbCsWF750wrcVf29EULhQV0gNM_RQGLy1BydIqkXsXDi44lO1zUHV1aAGff7vHgB4RkVyvGhEHUyUNBiOkF5pAGeEVYM1uqEWMveMK7OWxWvRXNKQCiGlw-vtS_59dbluaHow"
                    />
                    <div>
                      <p class="font-bold text-primary font-manrope">
                        Sarah Jenkins
                      </p>
                      <p class="text-xs text-on-surface-variant">
                        Library Services
                      </p>
                    </div>
                  </div>
                </td>
                <td class="px-6 py-5 text-sm text-on-surface-variant">
                  s.jenkins@findora.edu
                </td>
                <td class="px-6 py-5">
                  <span
                    class="px-3 py-1 bg-primary-fixed text-on-primary-fixed-variant rounded-full text-[10px] font-extrabold uppercase tracking-tight"
                    >Loc Admin</span
                  >
                </td>
                <td class="px-6 py-5">
                  <div class="flex items-center gap-1.5 text-teal-700">
                    <span class="h-1.5 w-1.5 rounded-full bg-teal-600"></span>
                    <span class="text-xs font-semibold">Active</span>
                  </div>
                </td>
                <td class="px-6 py-5 text-right space-x-2">
                  <button
                    class="p-2 text-outline hover:text-primary transition-colors"
                  >
                    <span
                      class="material-symbols-outlined text-lg"
                      data-icon="edit"
                      >edit</span
                    >
                  </button>
                  <button
                    class="p-2 text-outline hover:text-error transition-colors"
                  >
                    <span
                      class="material-symbols-outlined text-lg"
                      data-icon="block"
                      >block</span
                    >
                  </button>
                </td>
              </tr>
              <!-- Row 3 (Disabled State) -->
              <tr
                class="hover:bg-surface-container-low/30 transition-colors group opacity-60"
              >
                <td class="px-6 py-5">
                  <div class="flex items-center gap-4">
                    <img
                      alt="Avatar"
                      class="w-10 h-10 rounded-full bg-slate-200"
                      data-alt="man with glasses and casual shirt, warm afternoon sunlight, city park background"
                      src="https://lh3.googleusercontent.com/aida-public/AB6AXuAorbEoY5O-9sxa18EeWSRunvQFJkYW0LD17oMXszS7jYQRmPr0EWVZMpk9A0Xs4q-au9hHlIbp1s4KCVM1TtaioDShLqxrR9hum0kCyGcfZ5p27Z_5soBAfLX_Qh2CCI5Z77nesrVSw7XJIctVSlJTSbf-r_KtTAs5WY5Y1QLxG7S3DGmn4xcNttOR-fcOeC2HjhRkNckUUqlOoDkELirAuTAlEfhqluxWV53pErdn6i3td50hvcERDVyyDaI04PjLykVkMmLtr-c"
                    />
                    <div>
                      <p
                        class="font-bold text-primary font-manrope font-manrope"
                      >
                        David Miller
                      </p>
                      <p class="text-xs text-on-surface-variant">
                        Campus Security
                      </p>
                    </div>
                  </div>
                </td>
                <td class="px-6 py-5 text-sm text-on-surface-variant">
                  d.miller@findora.edu
                </td>
                <td class="px-6 py-5">
                  <span
                    class="px-3 py-1 bg-surface-container-high text-on-surface-variant rounded-full text-[10px] font-extrabold uppercase tracking-tight"
                    >User</span
                  >
                </td>
                <td class="px-6 py-5">
                  <div class="flex items-center gap-1.5 text-outline">
                    <span class="h-1.5 w-1.5 rounded-full bg-outline"></span>
                    <span class="text-xs font-semibold">Disabled</span>
                  </div>
                </td>
                <td class="px-6 py-5 text-right space-x-2">
                  <button
                    class="p-2 text-outline hover:text-primary transition-colors"
                  >
                    <span
                      class="material-symbols-outlined text-lg"
                      data-icon="edit"
                      >edit</span
                    >
                  </button>
                  <button
                    class="p-2 text-outline hover:text-primary transition-colors"
                  >
                    <span
                      class="material-symbols-outlined text-lg"
                      data-icon="check_circle"
                      >check_circle</span
                    >
                  </button>
                </td>
              </tr>
              <!-- Row 4 -->
              <tr
                class="hover:bg-surface-container-low/30 transition-colors group"
              >
                <td class="px-6 py-5">
                  <div class="flex items-center gap-4">
                    <img
                      alt="Avatar"
                      class="w-10 h-10 rounded-full bg-slate-200"
                      data-alt="professional woman in glasses looking at camera, neutral office setting, bright and clean composition"
                      src="https://lh3.googleusercontent.com/aida-public/AB6AXuByw4Pib9RVHXg6FnPuVR_xKSFJV0xLCdIHDz3MKCgpcLXk3E4A6p2IshzrkSmqnwDXxIIeEdpm61lIUvUnu0fGnAprGGdx_C7seQI-tpyUytGfo9nxgfFJ0m4heUDfjEb1DdgjAbhoSm7HBI9NEFxER6cUO6U5bkZtosSUeuWkKrDc0RTzsNJXdGYjYYFaTmY5BSoMrICiK_L41wivKjnx95kbYgV0AOV-Q7SoYF7c08ZVe64ou5vbCIzevbOOP7XXfrX6YFlfSgI"
                    />
                    <div>
                      <p class="font-bold text-primary font-manrope">
                        Elena Rodriguez
                      </p>
                      <p class="text-xs text-on-surface-variant">
                        Facilities Management
                      </p>
                    </div>
                  </div>
                </td>
                <td class="px-6 py-5 text-sm text-on-surface-variant">
                  e.rod@findora.edu
                </td>
                <td class="px-6 py-5">
                  <span
                    class="px-3 py-1 bg-primary-fixed text-on-primary-fixed-variant rounded-full text-[10px] font-extrabold uppercase tracking-tight"
                    >Loc Admin</span
                  >
                </td>
                <td class="px-6 py-5">
                  <div class="flex items-center gap-1.5 text-teal-700">
                    <span class="h-1.5 w-1.5 rounded-full bg-teal-600"></span>
                    <span class="text-xs font-semibold">Active</span>
                  </div>
                </td>
                <td class="px-6 py-5 text-right space-x-2">
                  <button
                    class="p-2 text-outline hover:text-primary transition-colors"
                  >
                    <span
                      class="material-symbols-outlined text-lg"
                      data-icon="edit"
                      >edit</span
                    >
                  </button>
                  <button
                    class="p-2 text-outline hover:text-error transition-colors"
                  >
                    <span
                      class="material-symbols-outlined text-lg"
                      data-icon="block"
                      >block</span
                    >
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
          <!-- Pagination -->
          <div
            class="px-6 py-4 bg-surface-container-low/50 flex items-center justify-between border-t border-surface-container"
          >
            <p class="text-xs text-on-surface-variant font-medium">
              Showing 4 of 128 registered stewards
            </p>
            <div class="flex items-center gap-1">
              <button
                class="p-2 rounded hover:bg-surface-container text-outline"
              >
                <span class="material-symbols-outlined" data-icon="chevron_left"
                  >chevron_left</span
                >
              </button>
              <button
                class="px-3 py-1 rounded bg-primary text-on-primary text-xs font-bold"
              >
                1
              </button>
              <button
                class="px-3 py-1 rounded hover:bg-surface-container text-on-surface text-xs font-bold"
              >
                2
              </button>
              <button
                class="px-3 py-1 rounded hover:bg-surface-container text-on-surface text-xs font-bold"
              >
                3
              </button>
              <button
                class="p-2 rounded hover:bg-surface-container text-outline"
              >
                <span
                  class="material-symbols-outlined"
                  data-icon="chevron_right"
                  >chevron_right</span
                >
              </button>
            </div>
          </div>
        </div>
        <!-- Stats Overview (Asymmetric Bento Grid Element) -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div
            class="bg-primary p-6 rounded-xl text-on-primary flex justify-between items-center relative overflow-hidden group"
          >
            <div class="relative z-10">
              <p
                class="text-xs opacity-70 font-bold uppercase tracking-widest mb-1"
              >
                Total Users
              </p>
              <h3 class="text-3xl font-black">128</h3>
            </div>
            <span
              class="material-symbols-outlined text-6xl opacity-10 absolute -right-2 -bottom-2 transform group-hover:scale-110 transition-transform"
              data-icon="groups"
              >groups</span
            >
          </div>
          <div
            class="bg-surface-container-lowest p-6 rounded-xl flex justify-between items-center shadow-sm hover:shadow-md transition-shadow"
          >
            <div>
              <p
                class="text-xs text-outline font-bold uppercase tracking-widest mb-1"
              >
                Active Now
              </p>
              <h3 class="text-3xl font-black text-teal-900">42</h3>
            </div>
            <div class="bg-teal-50 p-3 rounded-full">
              <span
                class="material-symbols-outlined text-teal-600"
                data-icon="online_prediction"
                >online_prediction</span
              >
            </div>
          </div>
          <div
            class="bg-surface-container-lowest p-6 rounded-xl flex justify-between items-center shadow-sm hover:shadow-md transition-shadow border-l-4 border-orange-500"
          >
            <div>
              <p
                class="text-xs text-outline font-bold uppercase tracking-widest mb-1"
              >
                Loc Admins
              </p>
              <h3 class="text-3xl font-black text-primary">18</h3>
            </div>
            <div class="bg-orange-50 p-3 rounded-full">
              <span
                class="material-symbols-outlined text-orange-600"
                data-icon="admin_panel_settings"
                >admin_panel_settings</span
              >
            </div>
          </div>
        </div>
      </section>
      <!-- Footer -->
      <footer
        class="bg-slate-50 w-full py-6 mt-auto border-t border-slate-200/10 flex flex-col md:flex-row justify-between items-center px-12 transition-colors"
      >
        <div class="mb-4 md:mb-0">
          <span
            class="font-manrope font-black text-teal-900 uppercase tracking-tighter text-sm"
            >Findora</span
          >
          <span class="text-xs text-slate-400 font-inter tracking-wide ml-4"
            >© 2024 Findora Lost &amp; Found. Managed Institutional
            Stewardship.</span
          >
        </div>
        <nav class="flex gap-8">
          <a
            class="font-inter text-xs tracking-wide uppercase text-slate-400 hover:text-orange-500 transition-colors opacity-80 hover:opacity-100"
            href="#"
            >Privacy Policy</a
          >
          <a
            class="font-inter text-xs tracking-wide uppercase text-slate-400 hover:text-orange-500 transition-colors opacity-80 hover:opacity-100"
            href="#"
            >Terms of Service</a
          >
          <a
            class="font-inter text-xs tracking-wide uppercase text-slate-400 hover:text-orange-500 transition-colors opacity-80 hover:opacity-100"
            href="#"
            >Support</a
          >
        </nav>
      </footer>
    </main>
  </body>
</html>
