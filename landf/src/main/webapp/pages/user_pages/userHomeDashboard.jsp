<!DOCTYPE html>
<html class="light" lang="en">
  <head>
    <jsp:include page="/components/head.jsp" />
    <title>Findora | Home</title>
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
      .glass-effect {
        background: rgba(0, 101, 101, 0.05);
        backdrop-filter: blur(12px);
      }
    </style>
  </head>
  <body class="bg-surface font-body text-on-surface">
    <jsp:include page="/components/navbar.jsp" />
    <main class="max-w-7xl mx-auto px-6 py-10">
      <!-- Welcome Hero Section -->
      <section class="mb-12">
        <div
          class="relative overflow-hidden rounded-xl bg-gradient-to-br from-primary to-primary-container p-10 text-on-primary"
        >
          <div class="relative z-10 md:w-2/3">
            <span
              class="font-label text-xs uppercase tracking-[0.2em] opacity-80 mb-4 block"
              style=""
              >Institutional Ledger Access</span
            >
            <h1
              class="font-headline text-4xl md:text-5xl font-extrabold mb-4 tracking-tight"
              style=""
            >
              Welcome back, Sushant.
            </h1>
            <p
              class="font-body text-lg text-on-primary-container max-w-xl opacity-90 leading-relaxed"
              style=""
            >
              The Findora system has recorded
              <span class="font-bold text-white" style="">12 new items</span> in
              your vicinity today. Your helps maintain the integrity of our
              community.
            </p>
          </div>
          <!-- Abstract Texture Decor -->
          <div
            class="absolute -right-20 -top-20 w-80 h-80 bg-secondary/20 rounded-full blur-[80px]"
          ></div>
          <div class="absolute right-10 bottom-0 opacity-10">
            <span
              class="material-symbols-outlined text-[12rem]"
              style="font-variation-settings: &quot;wght&quot; 200"
              >account_balance</span
            >
          </div>
        </div>
      </section>
      <!-- Quick Actions Bento Grid -->
      <section class="mb-16">
        <div class="flex items-baseline justify-between mb-8">
          <h2 class="font-headline text-2xl font-bold text-primary" style="">
            Quick Actions
          </h2>
          <div class="h-px flex-grow mx-6 bg-outline-variant/15"></div>
          <span
            class="font-label text-[0.6875rem] uppercase tracking-widest text-outline"
            style=""
            >Select Action</span
          >
        </div>
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
          <!-- Action 1 -->
          <button
            class="group flex flex-col items-start p-6 rounded-xl bg-surface-container-lowest transition-all hover:bg-secondary-container hover:scale-[0.98] shadow-sm"
            style=""
          >
            <div
              class="p-3 rounded-lg bg-surface-container-high group-hover:bg-white/20 transition-colors mb-4"
            >
              <span
                class="material-symbols-outlined text-secondary group-hover:text-on-secondary"
                style=""
                >search_check</span
              >
            </div>
            <span
              class="font-headline font-bold text-lg text-primary group-hover:text-on-secondary"
              style=""
              >Report Lost Item</span
            >
            <p
              class="text-xs text-outline group-hover:text-on-secondary/80 mt-1 text-left"
              style=""
            >
              Initiate a recovery request
            </p>
          </button>
          <!-- Action 2 -->
          <button
            class="group flex flex-col items-start p-6 rounded-xl bg-surface-container-lowest transition-all hover:bg-primary-container hover:scale-[0.98] shadow-sm"
            style=""
          >
            <div
              class="p-3 rounded-lg bg-surface-container-high group-hover:bg-white/20 transition-colors mb-4"
            >
              <span
                class="material-symbols-outlined text-primary group-hover:text-on-primary-container"
                style=""
                >handshake</span
              >
            </div>
            <span
              class="font-headline font-bold text-lg text-primary group-hover:text-on-primary-container"
              style=""
              >Report Found Item</span
            >
            <p
              class="text-xs text-outline group-hover:text-on-primary-container/80 mt-1 text-left"
              style=""
            >
              Log an item found in public space
            </p>
          </button>
          <!-- Action 3 -->
          <button
            class="group flex flex-col items-start p-6 rounded-xl bg-surface-container-lowest transition-all hover:bg-surface-container-highest hover:scale-[0.98] shadow-sm"
            style=""
          >
            <div
              class="p-3 rounded-lg bg-surface-container-high group-hover:bg-white/10 transition-colors mb-4"
            >
              <span class="material-symbols-outlined text-teal-700" style=""
                >assignment_turned_in</span
              >
            </div>
            <span class="font-headline font-bold text-lg text-primary" style=""
              >Claim Item</span
            >
            <p class="text-xs text-outline mt-1 text-left" style="">
              Verify ownership of a found item
            </p>
          </button>
          <!-- Action 4 -->
          <button
            class="group flex flex-col items-start p-6 rounded-xl bg-surface-container-lowest transition-all hover:bg-surface-container-highest hover:scale-[0.98] shadow-sm"
            style=""
          >
            <div
              class="p-3 rounded-lg bg-surface-container-high group-hover:bg-white/10 transition-colors mb-4"
            >
              <span class="material-symbols-outlined text-teal-700" style=""
                >analytics</span
              >
            </div>
            <span class="font-headline font-bold text-lg text-primary" style=""
              >Report Activity</span
            >
            <p class="text-xs text-outline mt-1 text-left" style="">
              View institutional ledger metrics
            </p>
          </button>
        </div>
      </section>
      <!-- Main Ledger Grid -->
      <div class="grid grid-cols-1 lg:grid-cols-12 gap-12">
        <!-- Recent Lost Items (Column) -->
        <section class="lg:col-span-7">
          <div class="flex items-center justify-between mb-6">
            <div class="flex flex-col">
              <h3
                class="font-headline text-xl font-extrabold text-primary tracking-tight"
                style=""
              >
                Recent Lost Items
              </h3>
              <p class="font-body text-sm text-outline" style="">
                Items reported missing in the last 24 hours
              </p>
            </div>
            <button
              class="text-xs font-label uppercase tracking-widest text-secondary font-bold hover:underline"
              style=""
            >
              View All
            </button>
          </div>
          <div class="space-y-4">
            <!-- Item Card 1 -->
            <div
              class="group relative flex items-center gap-6 p-4 rounded-xl bg-surface-container-lowest transition-all hover:bg-surface-container-low shadow-[0_4px_20px_-10px_rgba(0,0,0,0.05)] border-l-4 border-error"
            >
              <img
                alt="Lost Item"
                class="w-24 h-24 rounded-lg object-cover shadow-sm"
                data-alt="high-quality studio shot of a pair of classic gold-rimmed reading glasses on a clean minimalist surface"
                src="https://lh3.googleusercontent.com/aida-public/AB6AXuA-4qj_zm_vRwPAL5b3GP2zHf2dFtXh5AhnHyF_u25_WgGfCQwXuxM-lZaoWpdyDXdMoqKKJ1C9EAwOgYHm1TlCi9XWLD2lSe4SUOh30IA4bbgDqoDTYdg6k4VPln6wOf5Q9e09c_6cTcCr5K_Z5slPUh3nQXqK5awzXzf50NlXPimRuIZ1Dd_UFSSeFw4I3SEcg7ajbhKPej0mGxmuWfpYYKfVJmrOKPuA6DOd8V82cLaLUQjY0jRzybWbjRoqJ7somHIyVrZ1QME"
                style=""
              />
              <div class="flex-grow">
                <div class="flex justify-between items-start mb-1">
                  <h4 class="font-headline font-bold text-primary" style="">
                    Gold Rimmed Spectacles
                  </h4>
                  <span
                    class="font-label text-[10px] bg-error-container text-on-error-container px-2 py-0.5 rounded-full font-bold uppercase tracking-wider"
                    style=""
                    >High Priority</span
                  >
                </div>
                <div class="flex items-center gap-4 text-xs text-outline mb-3">
                  <span class="flex items-center gap-1" style=""
                    ><span class="material-symbols-outlined text-sm" style=""
                      >location_on</span
                    >
                    Main Library, 3rd Floor</span
                  >
                  <span class="flex items-center gap-1" style=""
                    ><span class="material-symbols-outlined text-sm" style=""
                      >schedule</span
                    >
                    2h ago</span
                  >
                </div>
                <p
                  class="text-sm text-on-surface-variant line-clamp-1"
                  style=""
                >
                  Last seen near the rare books archive. Brown leather case
                  included.
                </p>
              </div>
            </div>
            <!-- Item Card 2 -->
            <div
              class="group relative flex items-center gap-6 p-4 rounded-xl bg-surface-container-lowest transition-all hover:bg-surface-container-low shadow-[0_4px_20px_-10px_rgba(0,0,0,0.05)] border-l-4 border-outline-variant"
            >
              <img
                alt="Lost Item"
                class="w-24 h-24 rounded-lg object-cover shadow-sm"
                data-alt="professional product photo of sleek black wireless noise-cancelling headphones on a neutral gray background"
                src="https://lh3.googleusercontent.com/aida-public/AB6AXuDvNOV-5Vg7MyLlKeegIngaMWR9gg4wkKQEYiKwfu0esi2TOH5oc-qdOAlVTUwTe1MMsQ_r3x1i48cE1TdxcmTY0PUYlNEXzStTgJZrFJkYlItILvDshet1RvW5cI3VFehFq1O94bT6F_O6yY9hKNNktuXpVh-qARA5o07nCWuPR3OjXjdvVegmmie5qPVEaz9ULupmcJmqOlrQhV-nexFlnvE8cPhu6ka9CcAe5cBycZ08UjdtgUipECx1oi0OdyYx7zRYO00Ahy0"
                style=""
              />
              <div class="flex-grow">
                <div class="flex justify-between items-start mb-1">
                  <h4 class="font-headline font-bold text-primary" style="">
                    Sony WH-1000XM4
                  </h4>
                  <span
                    class="font-label text-[10px] bg-surface-container-high text-outline px-2 py-0.5 rounded-full font-bold uppercase tracking-wider"
                    style=""
                    >Electronic</span
                  >
                </div>
                <div class="flex items-center gap-4 text-xs text-outline mb-3">
                  <span class="flex items-center gap-1" style=""
                    ><span class="material-symbols-outlined text-sm" style=""
                      >location_on</span
                    >
                    Student Union Cafe</span
                  >
                  <span class="flex items-center gap-1" style=""
                    ><span class="material-symbols-outlined text-sm" style=""
                      >schedule</span
                    >
                    5h ago</span
                  >
                </div>
                <p
                  class="text-sm text-on-surface-variant line-clamp-1"
                  style=""
                >
                  Midnight blue variant. Left on the window seat booth.
                </p>
              </div>
            </div>
          </div>
        </section>
        <!-- Recent Found Items (Column) -->
        <section class="lg:col-span-5">
          <div class="flex items-center justify-between mb-6">
            <div class="flex flex-col">
              <h3
                class="font-headline text-xl font-extrabold text-primary tracking-tight"
                style=""
              >
                Recent Found Items
              </h3>
              <p class="font-body text-sm text-outline" style="">
                Logged at regional intake centers
              </p>
            </div>
          </div>
          <div class="grid grid-cols-1 gap-4">
            <!-- Found Grid Item 1 -->
            <div
              class="bg-surface-container-low rounded-xl p-4 flex gap-4 items-start border-b-2 border-primary/5"
            >
              <div
                class="w-16 h-16 rounded bg-surface-container-highest flex items-center justify-center shrink-0"
              >
                <span
                  class="material-symbols-outlined text-primary text-3xl"
                  style=""
                  >key</span
                >
              </div>
              <div class="flex flex-col">
                <h5 class="font-bold text-primary" style="">
                  Silver Keyring (3 keys)
                </h5>
                <span class="text-xs text-outline mb-2" style=""
                  >Location: Science Lab B</span
                >
                <button
                  class="self-start text-[10px] font-bold text-secondary uppercase tracking-widest bg-secondary-fixed px-3 py-1 rounded hover:bg-secondary transition-colors hover:text-white"
                  style=""
                >
                  Is this yours?
                </button>
              </div>
            </div>
            <!-- Found Grid Item 2 -->
            <div
              class="bg-surface-container-low rounded-xl p-4 flex gap-4 items-start border-b-2 border-primary/5"
            >
              <div
                class="w-16 h-16 rounded bg-surface-container-highest flex items-center justify-center shrink-0"
              >
                <span
                  class="material-symbols-outlined text-primary text-3xl"
                  style=""
                  >wallet</span
                >
              </div>
              <div class="flex flex-col">
                <h5 class="font-bold text-primary" style="">
                  Leather Card Holder
                </h5>
                <span class="text-xs text-outline mb-2" style=""
                  >Location: Athletic Center</span
                >
                <button
                  class="self-start text-[10px] font-bold text-secondary uppercase tracking-widest bg-secondary-fixed px-3 py-1 rounded hover:bg-secondary transition-colors hover:text-white"
                  style=""
                >
                  Is this yours?
                </button>
              </div>
            </div>
            <!-- Found Grid Item 3 -->
            <div
              class="bg-surface-container-low rounded-xl p-4 flex gap-4 items-start border-b-2 border-primary/5"
            >
              <div
                class="w-16 h-16 rounded bg-surface-container-highest flex items-center justify-center shrink-0"
              >
                <span
                  class="material-symbols-outlined text-primary text-3xl"
                  style=""
                  >umbrella</span
                >
              </div>
              <div class="flex flex-col">
                <h5 class="font-bold text-primary" style="">
                  Blue Compact Umbrella
                </h5>
                <span class="text-xs text-outline mb-2" style=""
                  >Location: Humanities Wing</span
                >
                <button
                  class="self-start text-[10px] font-bold text-secondary uppercase tracking-widest bg-secondary-fixed px-3 py-1 rounded hover:bg-secondary transition-colors hover:text-white"
                  style=""
                >
                  Is this yours?
                </button>
              </div>
            </div>
          </div>
        </section>
      </div>
    </main>
    <jsp:include page="/components/footer.jsp" />
  </body>
</html>
