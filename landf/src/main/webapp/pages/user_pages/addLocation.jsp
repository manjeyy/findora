<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Add Location | Findora Admin</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;family=Inter:wght@300;400;500;600&amp;display=swap"
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
  <body class="bg-surface text-on-surface">
    <% request.setAttribute("sectionLabel", "Location Admin Console"); %>
    <% request.setAttribute("pageTitle", "Add New Location"); %>
    <% request.setAttribute("searchPlaceholder", "Search locations..."); %>
    <jsp:include page="/components/location-admin/layout_start.jsp" />
      <!-- Content Area -->
      <section class="flex-1 px-12 py-8">
        <div class="grid grid-cols-12 gap-8">
          <!-- Form Section (Bento Inspired) -->
          <div class="col-span-12 lg:col-span-7 space-y-6">
            <!-- Primary Form Card -->
            <div
              class="bg-surface-container-lowest rounded-xl p-8 border border-outline-variant/15 shadow-sm"
            >
              <div class="space-y-8">
                <!-- Location Name -->
                <div class="relative group">
                  <label
                    class="absolute -top-2 left-4 px-1 bg-surface-container-lowest text-[10px] font-bold text-primary tracking-widest uppercase"
                    >Location Name</label
                  >
                  <input
                    class="w-full bg-surface-container-low border-0 rounded-lg p-4 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all font-medium placeholder:text-outline/40"
                    placeholder="e.g. Sterling Memorial Library, Room 204"
                    type="text"
                  />
                </div>
                <!-- Description -->
                <div class="relative group">
                  <label
                    class="absolute -top-2 left-4 px-1 bg-surface-container-lowest text-[10px] font-bold text-primary tracking-widest uppercase"
                    >Short Description</label
                  >
                  <textarea
                    class="w-full bg-surface-container-low border-0 rounded-lg p-4 text-on-surface focus:ring-2 focus:ring-primary/20 transition-all font-medium placeholder:text-outline/40"
                    placeholder="Briefly describe the location's physical cues or access instructions..."
                    rows="4"
                  ></textarea>
                </div>
                <!-- Large Upload Placeholder -->
                <div
                  class="relative group h-72 w-full rounded-xl border-2 border-dashed border-outline-variant/30 bg-surface-container-low flex flex-col items-center justify-center cursor-pointer hover:border-primary/40 transition-colors"
                >
                  <div
                    class="bg-surface-container-lowest p-4 rounded-full shadow-md mb-4 text-primary"
                  >
                    <span
                      class="material-symbols-outlined text-3xl"
                      data-icon="add_a_photo"
                      >add_a_photo</span
                    >
                  </div>
                  <h3 class="font-headline font-bold text-on-surface">
                    Upload Location Photo
                  </h3>
                  <p class="text-outline text-xs mt-1 font-medium">
                    Recommended: 1200x800px, JPEG or PNG
                  </p>
                </div>
              </div>
            </div>
            <!-- Action Bar -->
            <div class="flex items-center justify-end gap-4">
              <button
                class="px-8 py-4 text-sm font-bold text-outline hover:text-on-surface transition-colors"
              >
                Discard Changes
              </button>
              <button
                class="bg-secondary-container text-on-secondary-container px-10 py-4 rounded-lg font-headline font-extrabold shadow-lg hover:shadow-secondary/20 transition-all active:scale-95 flex items-center gap-2"
              >
                <span
                  class="material-symbols-outlined text-lg"
                  data-icon="save"
                  style="font-variation-settings: &quot;FILL&quot; 1"
                  >save</span
                >
                Save Location
              </button>
            </div>
          </div>
          <!-- Preview/Context Column -->
          <div class="col-span-12 lg:col-span-5 space-y-6">
            <div class="bg-surface-container-low rounded-xl p-8 sticky top-28">
              <h2
                class="text-xl font-headline font-bold text-primary mb-6 flex items-center gap-2"
              >
                <span class="material-symbols-outlined" data-icon="visibility"
                  >visibility</span
                >
                Items currently at this location
              </h2>
              <!-- List of items (Empty state/Sample state) -->
              <div class="space-y-4">
                <!-- Sample Item 1 -->
                <div
                  class="bg-surface-container-lowest rounded-lg p-4 flex items-center gap-4 group hover:bg-white transition-colors border border-transparent hover:border-outline-variant/10"
                >
                  <div
                    class="w-16 h-16 rounded-lg bg-surface-container-highest overflow-hidden shrink-0"
                  >
                    <img
                      alt="Item image"
                      class="w-full h-full object-cover"
                      data-alt="close-up of a premium leather journal resting on a wooden desk, atmospheric light"
                      src="https://lh3.googleusercontent.com/aida-public/AB6AXuBVRMVpbbpdW3QxGqmpxhSilkSM9eHYJP1_7wK61z4sahA0VyCaxa1hTNjcDaDfW3UlUe7wwfIwjroZN-SluTF-jmJ6bNdLewdKATi92YafNtGD-wXRRgZGBNelqh8U3CEfrrdPur74PwvT7kPukEaBTSKAe6y5t1w380JdWoWhVrUsjL_wzYh-hud9N1s_SMd0KtK6R1pr6zOW4mYWnLjm6bsdyadR3RbokozPFP7p2iojmhWlzPfd-fI73JBj7ltETLveP_I8FpU"
                    />
                  </div>
                  <div class="flex-1 min-w-0">
                    <h4 class="font-bold text-on-surface truncate">
                      Blue Leather Notebook
                    </h4>
                    <p class="text-xs text-outline font-medium">
                      Reported 2 days ago
                    </p>
                  </div>
                  <span
                    class="material-symbols-outlined text-outline-variant group-hover:text-primary transition-colors"
                    data-icon="chevron_right"
                    >chevron_right</span
                  >
                </div>
                <!-- Sample Item 2 -->
                <div
                  class="bg-surface-container-lowest rounded-lg p-4 flex items-center gap-4 group hover:bg-white transition-colors border border-transparent hover:border-outline-variant/10"
                >
                  <div
                    class="w-16 h-16 rounded-lg bg-surface-container-highest overflow-hidden shrink-0"
                  >
                    <img
                      alt="Item image"
                      class="w-full h-full object-cover"
                      data-alt="silver modern laptop on a minimalist white table surface, bright high-key lighting"
                      src="https://lh3.googleusercontent.com/aida-public/AB6AXuDVsH60pRnJFhONrlwoDTfMz-SYv9nVZKxsEL7SjhltwTuyyoBygkl4lbC6KyAsW2dW2i0sHsJ8Ckg5kQwqCPx9Ec_NzKd0mSf4CpBSq3Li05yxrj6KRYk4LlYdBanoIkDMTB6MXO4ltMWVmtdDqsrcXwEdINUBr6fhTEmCyR4Of-22sSUqSpBHAS0VjKf4EPWsyZrynCycNuN4tbrIXLXOu2wbLEeCA5uS0ry2SVfc1iMm7GMnIzFzKoeuZBOWgELcABbpWkYjtsg"
                    />
                  </div>
                  <div class="flex-1 min-w-0">
                    <h4 class="font-bold text-on-surface truncate">
                      MacBook Pro 14"
                    </h4>
                    <p class="text-xs text-outline font-medium">
                      Reported 5 hours ago
                    </p>
                  </div>
                  <span
                    class="material-symbols-outlined text-outline-variant group-hover:text-primary transition-colors"
                    data-icon="chevron_right"
                    >chevron_right</span
                  >
                </div>
                <!-- Empty Placeholder -->
                <div
                  class="py-12 flex flex-col items-center justify-center opacity-30"
                >
                  <span
                    class="material-symbols-outlined text-4xl mb-2"
                    data-icon="inventory"
                    >inventory</span
                  >
                  <p class="text-xs font-bold uppercase tracking-widest">
                    End of ledger
                  </p>
                </div>
              </div>
              <!-- Helper Tooltip Card -->
              <div
                class="mt-8 bg-primary/5 rounded-lg p-4 border-l-4 border-primary"
              >
                <h5
                  class="text-xs font-black text-primary uppercase tracking-widest mb-1"
                >
                     Tip
                </h5>
                <p class="text-[13px] text-on-surface-variant leading-relaxed">
                  High-quality photos of the storage area help claimants verify
                  the location and build trust in the institutional handling
                  process.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- Footer (Authority: JSON & Design System) -->
      <footer
        class="bg-slate-50 w-full py-6 mt-auto border-t border-slate-200/10 flex flex-col md:flex-row justify-between items-center px-12"
      >
        <div
          class="font-manrope font-black text-teal-900 uppercase text-xs tracking-tighter"
        >
          Findora Admin
        </div>
        <p
          class="font-inter text-xs tracking-wide uppercase text-slate-400 my-4 md:my-0"
        >
          © 2024 Findora Lost &amp; Found. Managed  .
        </p>
        <div class="flex gap-6">
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
        </div>
      </footer>
    </main>
  </body>
</html>
