<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>The Curated Custodian | Dashboard</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;700;800&amp;family=Plus_Jakarta_Sans:wght@400;500;600;700&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <script id="tailwind-config"> tailwind.config = {
        darkMode: "class", theme: {
            extend: {
                "colors": {
                    "on-secondary-fixed": "#2f1500",
                    "secondary": "#904d00",
                    "background": "#f7fafa",
                    "surface": "#f7fafa",
                    "outline": "#6e7979",
                    "on-primary": "#ffffff",
                    "secondary-fixed": "#ffdcc3",
                    "on-tertiary-container": "#ebffe3",
                    "surface-dim": "#d7dbdb",
                    "secondary-container": "#fd8b00",
                    "tertiary-fixed": "#a3f69c",
                    "primary-fixed": "#93f2f2",
                    "on-error-container": "#93000a",
                    "on-primary-fixed": "#002020",
                    "on-tertiary-fixed-variant": "#005312",
                    "surface-variant": "#e0e3e3",
                    "surface-container-low": "#f1f4f4",
                    "error": "#ba1a1a",
                    "on-secondary": "#ffffff",
                    "error-container": "#ffdad6",
                    "on-surface": "#181c1d",
                    "surface-bright": "#f7fafa",
                    "primary": "#006565",
                    "surface-tint": "#006a6a",
                    "primary-fixed-dim": "#76d6d5",
                    "secondary-fixed-dim": "#ffb77d",
                    "surface-container-high": "#e6e9e9",
                    "outline-variant": "#bdc9c8",
                    "surface-container-lowest": "#ffffff",
                    "on-primary-fixed-variant": "#004f4f",
                    "inverse-on-surface": "#eef1f1",
                    "inverse-surface": "#2d3131",
                    "surface-container": "#ebeeee",
                    "surface-container-highest": "#e0e3e3",
                    "on-error": "#ffffff",
                    "inverse-primary": "#76d6d5",
                    "on-primary-container": "#e3fffe",
                    "on-secondary-container": "#603100",
                    "on-background": "#181c1d",
                    "on-secondary-fixed-variant": "#6e3900",
                    "tertiary-fixed-dim": "#88d982",
                    "primary-container": "#008080",
                    "on-tertiary": "#ffffff",
                    "tertiary-container": "#338236",
                    "tertiary": "#156820",
                    "on-surface-variant": "#3e4949",
                    "on-tertiary-fixed": "#002204"
                },
                "borderRadius": {"DEFAULT": "0.25rem", "lg": "1rem", "xl": "1.5rem", "full": "9999px"},
                "fontFamily": {"headline": ["Manrope"], "body": ["Plus Jakarta Sans"], "label": ["Plus Jakarta Sans"]}
            },
        },
    } </script>
    <style> body {
        font-family: 'Plus Jakarta Sans', sans-serif;
        background-color: #f7fafa;
    }

    .headline-font {
        font-family: 'Manrope', sans-serif;
        letter-spacing: -0.02em;
    }

    .material-symbols-outlined {
        font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
    }

    .glass-nav {
        backdrop-filter: blur(20px);
    }

    .signature-gradient {
        background: linear-gradient(135deg, #006565 0%, #008080 100%);
    } </style>
</head>
<body class="bg-surface text-on-surface antialiased">
<!-- TopAppBar -->
<header class="fixed top-0 w-full z-50 bg-[#f7fafa]/80 backdrop-blur-md flex justify-between items-center px-8 h-20 max-w-full">
    <div class="flex items-center gap-8">
        <span class="text-xl font-bold tracking-tighter text-teal-900 headline-font" style="">Findora</span>
        <nav class="hidden md:flex gap-6 items-center">
            <a class="text-teal-800 font-bold border-b-2 border-teal-600 headline-font text-sm px-1 py-1" href="#"
               style="">Dashboard</a>
            <a class="text-slate-500 hover:text-teal-600 transition-colors duration-200 text-sm font-medium" href="#"
               style="">Analytics</a>
            <a class="text-slate-500 hover:text-teal-600 transition-colors duration-200 text-sm font-medium" href="#"
               style="">Directory</a>
        </nav>
    </div>
    <div class="flex items-center gap-6">
        <div class="relative hidden lg:block">
            <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline text-xl"
                  style="">search</span>
            <input class="bg-surface-container-highest border-none rounded-xl pl-10 pr-4 py-2 w-64 text-sm focus:ring-2 focus:ring-primary/40 outline-none"
                   placeholder="Search for items..." type="text"/>
        </div>
        <button class="bg-secondary text-on-secondary px-6 py-2.5 rounded-xl font-semibold text-sm signature-gradient hover:opacity-90 transition-opacity"
                style=""> Report Found Item
        </button>
        <div class="w-10 h-10 rounded-full overflow-hidden bg-surface-container-high">
            <img alt="User profile concierge" class=""
                 data-alt="professional portrait of a friendly concierge in a modern suit, soft studio lighting, clean background"
                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuD2QorH2VbS-wYEjbFBSei5fQzlrZNyfWijULZkjfXMllaL0ndeKCRDhDV4TSLKzr-OE8SrIR93rTf8pcY9Z5KFpf_rWC4NcDdxYp-hbJVjX73JTJPbbtiuoJzShNiOc7_AA8XhjFIOpRE4zCoyn8GgIiPltz5lgGSIyIXj8PEuOFcJKtBC6nuxp4tk5XPOXYTp18Xxix5XLJgXK570KBvFtiKIyY7YCrW1DpC-EzgWbO_U-HWBOjaODK0utIsjaa7kqDlgg8gLa0Q"
                 style=""/>
        </div>
    </div>
</header>
<main class="pt-28 pb-32 px-8 max-w-7xl mx-auto">
    <!-- Hero Asymmetric Header -->
    <section class="mb-12 grid grid-cols-1 lg:grid-cols-12 gap-8 items-end">
        <div class="lg:col-span-8">
            <h1 class="text-5xl font-extrabold headline-font text-on-surface mb-4" style="">Welcome back, Sushant.</h1>
            <p class="text-on-surface-variant text-lg max-w-2xl" style="">Your morning overview of the community's lost
                treasures. 12 new matches found since your last check-in.</p>
        </div>
        <div class="lg:col-span-4">
            <!-- Gamification Widget -->
            <div class="bg-surface-container-lowest rounded-xl p-6 border-outline-variant/15 border flex items-center justify-between shadow-[0_8px_24px_rgba(24,28,29,0.04)]">
                <div>
                    <span class="text-xs font-bold text-on-surface-variant tracking-wider block mb-1" style="">CUSTODIAN RANK</span>
                    <div class="flex items-center gap-2">
                        <span class="text-3xl font-extrabold headline-font text-primary" style="">2,450</span>
                        <span class="text-xs font-semibold text-tertiary px-2 py-0.5 bg-tertiary-fixed rounded-full"
                              style="">LEVEL 12</span>
                    </div>
                </div>
                <div class="w-12 h-12 rounded-full bg-tertiary-fixed flex items-center justify-center">
                    <span class="material-symbols-outlined text-on-tertiary-fixed"
                          style='font-variation-settings: "FILL" 1;'>workspace_premium</span>
                </div>
            </div>
        </div>
    </section>
    <!-- Quick Actions -->
    <div class="flex flex-wrap gap-4 mb-16">
        <button class="flex items-center gap-2 bg-primary text-on-primary px-8 py-4 rounded-xl font-bold signature-gradient hover:scale-[0.98] transition-transform"
                style="">
            <span class="material-symbols-outlined" style="">add_circle</span> Report Found Item
        </button>
        <button class="flex items-center gap-2 bg-surface-container-lowest text-primary border border-primary/20 px-8 py-4 rounded-xl font-bold hover:bg-surface-container-low transition-colors"
                style="">
            <span class="material-symbols-outlined" style="">search_off</span> I Lost Something
        </button>
    </div>
    <!-- Bento Grid Layout -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
        <!-- Suggested Matches (Priority Column) -->
        <div class="lg:col-span-4 space-y-6">
            <div class="flex justify-between items-end mb-2">
                <h2 class="text-xl font-bold headline-font" style="">Suggested Matches</h2>
                <a class="text-primary text-sm font-semibold hover:underline" href="#" style="">View All</a>
            </div>
            <!-- Match Card -->
            <div class="bg-surface-container-lowest rounded-xl p-5 group cursor-pointer hover:shadow-[0_8px_24px_rgba(24,28,29,0.06)] transition-all">
                <div class="flex gap-4 items-center">
                    <div class="w-20 h-20 rounded-lg overflow-hidden bg-surface-container-high flex-shrink-0">
                        <img alt="White AirPods" class=""
                             data-alt="close up shot of modern white wireless earbuds in their charging case on a light stone surface, minimal aesthetic"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuBIMDBkeU1wYK9cctUKBfFnALBsJ6QJNarNocdonvAwKFHIETf-hX-h8zfWRJ259m7nIXfLQJ1xY6L-Z5j1umJRl4IR7NwcEn1mk3BFM0iwMt3V0_gTfmIjGS0TMmevdjFTY1p8YA9gY6bVuW56i1hcPLu2-VOwFVkfx9VxiXN1_afNEoyAJt4Qw6IVrrR3gTxAXiG2uBsO1LeHAbjL3sb8oxmT9wuW_8sCvjl6Y8qhPPBjSBUoBEgKPQtrC8FH83k-O6-rFtdqcpM"
                             style=""/>
                    </div>
                    <div>
                        <span class="text-[10px] font-bold text-secondary-container bg-secondary-fixed px-2 py-0.5 rounded-full mb-1 inline-block"
                              style="">92% MATCH</span>
                        <h3 class="font-bold text-on-surface" style="">AirPods Pro</h3>
                        <p class="text-xs text-on-surface-variant" style="">Found in Central Park South</p>
                    </div>
                </div>
                <div class="mt-4 pt-4 border-t border-outline-variant/10 flex justify-between items-center">
                    <span class="text-xs font-medium text-on-surface-variant" style="">2 hours ago</span>
                    <button class="text-primary font-bold text-sm" style="">Verify Claim</button>
                </div>
            </div>
            <!-- Match Card 2 -->
            <div class="bg-surface-container-lowest rounded-xl p-5 group cursor-pointer hover:shadow-[0_8px_24px_rgba(24,28,29,0.06)] transition-all">
                <div class="flex gap-4 items-center">
                    <div class="w-20 h-20 rounded-lg overflow-hidden bg-surface-container-high flex-shrink-0">
                        <img alt="Leather Wallet" class=""
                             data-alt="top down view of a weathered brown leather bi-fold wallet on a wooden cafe table with soft morning light"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuDEQWsXkmFTgKnU3Eyuwoeym4s5vqYk6z0FOLKgT9x23VG37hK5CROGLOFKu79ASkd24PpLE3odgC3zsle6jh-xfiP8XPvgmuhKPlI7xAV7EvTFNc2-U-bFO2eVO7GnH3e3DC0tRokc5aY-XXcrFd2XQng-LZEGyMwFyVW5NbNJFAmdqyOonWk3y5WucOHJ7gB4obd_7lE7j4mMh2barZrDWq5ViXorWkg9PAzKmMJ1XvRcFicRZRxOnCjTvQApjzaxvMbVVDySncM"
                             style=""/>
                    </div>
                    <div>
                        <span class="text-[10px] font-bold text-secondary-container bg-secondary-fixed px-2 py-0.5 rounded-full mb-1 inline-block"
                              style="">85% MATCH</span>
                        <h3 class="font-bold text-on-surface" style="">Leather Wallet</h3>
                        <p class="text-xs text-on-surface-variant" style="">Reported Lost at Subway L1</p>
                    </div>
                </div>
                <div class="mt-4 pt-4 border-t border-outline-variant/10 flex justify-between items-center">
                    <span class="text-xs font-medium text-on-surface-variant" style="">5 hours ago</span>
                    <button class="text-primary font-bold text-sm" style="">Verify Claim</button>
                </div>
            </div>
        </div>
        <!-- Recently Found Items (Main Grid) -->
        <div class="lg:col-span-8">
            <div class="flex justify-between items-end mb-8">
                <div>
                    <h2 class="text-2xl font-bold headline-font" style="">Recently Found</h2>
                    <p class="text-sm text-on-surface-variant" style="">New items cataloged in the last 24 hours</p>
                </div>
                <div class="flex gap-2">
                    <button class="p-2 rounded-full bg-surface-container-high text-on-surface-variant" style="">
                        <span class="material-symbols-outlined" style="">filter_list</span>
                    </button>
                    <button class="p-2 rounded-full bg-surface-container-high text-on-surface-variant" style="">
                        <span class="material-symbols-outlined" style="">grid_view</span>
                    </button>
                </div>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Found Card 1 -->
                <div class="bg-surface-container-lowest rounded-xl overflow-hidden shadow-[0_8px_24px_rgba(24,28,29,0.03)] border-outline-variant/10 border">
                    <div class="h-48 relative overflow-hidden">
                        <img alt="Black Umbrella" class="w-full h-full object-cover"
                             data-alt="a minimalist photo of a sleek black designer umbrella resting against a concrete wall with subtle rain droplets"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuCkDPk2H_LjtL0yUW9tIT2FTfAlal4SeS9T7vBfelKt0RI0WLIS-MBojYs0uSCw3Zwe0m5AN5dKRabEnOMpgkXPZLrmN6FTs__sM7hK73vcDn6Xcx0j0UjfBnUmOx_rc4WUO1Ct2O_iYAeuOWJvdut2ePR1XpgrKLPnq-1xFB_TdNeaXXBTjTNkRfu9Rd7mdvejMvIMXQBkMXH_J_SL32ul-gvr2PjmIar0D6FGbPiRxdCH9TNXegF-Bc3pKjRQtnO34nPiW8sz96s"
                             style=""/>
                        <div class="absolute top-4 left-4">
                            <span class="bg-primary-container text-on-primary text-[10px] font-bold px-3 py-1 rounded-full uppercase tracking-widest"
                                  style="">Open</span>
                        </div>
                    </div>
                    <div class="p-6">
                        <div class="flex justify-between items-start mb-2">
                            <h3 class="font-bold text-lg headline-font" style="">Designer Umbrella</h3>
                            <span class="material-symbols-outlined text-primary" style="">bookmark</span>
                        </div>
                        <p class="text-sm text-on-surface-variant mb-6 line-clamp-2 leading-relaxed" style="">
                            High-quality black folding umbrella found near the library entrance. Brand: Blunt.</p>
                        <div class="flex items-center gap-3">
                            <div class="flex items-center gap-1 text-xs font-semibold text-on-surface-variant bg-surface-container-low px-3 py-1.5 rounded-lg"
                                 style="">
                                <span class="material-symbols-outlined text-sm" style="">location_on</span> Downtown
                                Library
                            </div>
                            <div class="flex items-center gap-1 text-xs font-semibold text-on-surface-variant bg-surface-container-low px-3 py-1.5 rounded-lg"
                                 style="">
                                <span class="material-symbols-outlined text-sm" style="">schedule</span> Just Now
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Found Card 2 -->
                <div class="bg-surface-container-lowest rounded-xl overflow-hidden shadow-[0_8px_24px_rgba(24,28,29,0.03)] border-outline-variant/10 border">
                    <div class="h-48 relative overflow-hidden">
                        <img alt="Analog Watch" class="w-full h-full object-cover"
                             data-alt="close up of an elegant analog watch with a white face and tan leather strap lying on a grey linen fabric"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuAmUsZcLaZ0kfp8E5W3NSAjxFS7WBwAWhCnnvXs8hAUDeceJ4m9395851o2MF7V7lS_xPqMBHn5burweA5QHORk-s0QOnJB3ScdR8j1OeU0OQ66-ACH9VEHwA0Qk9_ecH1kiD4kx9l1J_HTRF4ShE4kW1X_q_ANAoZsiDN__9K07fADGdwpnKR3R_PGN4VW3NqDy0adOOVFXp_Bb4JBNpZ5Wh3LhSfdWzAhOAsgWoSZuZs7iqIjglKEjNN6SZQmCL5Hk8xg3rJZorU"
                             style=""/>
                        <div class="absolute top-4 left-4">
                            <span class="bg-primary-container text-on-primary text-[10px] font-bold px-3 py-1 rounded-full uppercase tracking-widest"
                                  style="">Open</span>
                        </div>
                    </div>
                    <div class="p-6">
                        <div class="flex justify-between items-start mb-2">
                            <h3 class="font-bold text-lg headline-font" style="">Fossil Watch</h3>
                            <span class="material-symbols-outlined text-primary" style="">bookmark</span>
                        </div>
                        <p class="text-sm text-on-surface-variant mb-6 line-clamp-2 leading-relaxed" style="">Tan
                            leather strap, silver dial. Found in the gym locker room area.</p>
                        <div class="flex items-center gap-3">
                            <div class="flex items-center gap-1 text-xs font-semibold text-on-surface-variant bg-surface-container-low px-3 py-1.5 rounded-lg"
                                 style="">
                                <span class="material-symbols-outlined text-sm" style="">location_on</span> City Gym
                            </div>
                            <div class="flex items-center gap-1 text-xs font-semibold text-on-surface-variant bg-surface-container-low px-3 py-1.5 rounded-lg"
                                 style="">
                                <span class="material-symbols-outlined text-sm" style="">schedule</span> 3h ago
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Secondary Section: Recently Lost -->
    <section class="mt-20">
        <div class="flex justify-between items-end mb-8">
            <div>
                <h2 class="text-2xl font-bold headline-font" style="">Searching For...</h2>
                <p class="text-sm text-on-surface-variant" style="">Keep an eye out for these items recently reported
                    missing</p>
            </div>
            <button class="bg-surface-container-high text-on-surface px-6 py-2 rounded-lg font-bold text-sm" style="">
                View Map View
            </button>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-6">
            <!-- Lost Item 1 -->
            <div class="bg-surface-container-low rounded-xl p-4 flex gap-4 items-center border border-outline-variant/15">
                <div class="w-16 h-16 rounded-lg overflow-hidden bg-surface-container-high">
                    <img alt="Robot Keychain" class="w-full h-full object-cover grayscale opacity-60"
                         data-alt="a small silver vintage robot keychain lying on a dark surface, macro focus"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuBWBZlbgGCz_XBqgzASOFohyvDmG3Z07v6cxfUjGQvH8mH05jNSTI3IWpWd0_qbHwAdMXUENzgPmnPHcoHLf5YKvpF8n68I_Enrwzu7eN3q92ya-fXyRbQ__1w1tNuR_DmBq7h8-67wR6zbwsnnEvYpkP6Lfs7etCC9YmdpS5bABKmrD3mgBkk2b0LILZCOYeBreLguvG5rpvolaUTQsu42MuHZ5NktT11IfpXdd_X06tBv-m_lZvZ63gN9CcIiykHDf4wQ9tIV2CM"
                         style=""/>
                </div>
                <div>
                    <h4 class="font-bold text-sm" style="">Blue Keychain</h4>
                    <p class="text-xs text-on-surface-variant" style="">North District</p>
                    <span class="text-[10px] text-error font-bold mt-1 inline-block uppercase tracking-tighter"
                          style="">LOST</span>
                </div>
            </div>
            <!-- Lost Item 2 -->
            <div class="bg-surface-container-low rounded-xl p-4 flex gap-4 items-center border border-outline-variant/15">
                <div class="w-16 h-16 rounded-lg overflow-hidden bg-surface-container-high">
                    <img alt="Dog Collar" class="w-full h-full object-cover grayscale opacity-60"
                         data-alt="a red leather dog collar with a silver tag, close up detail on soft background"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuDxWrt7-u5ib7q9HkKuPUOIWM9PXyCrcBq0Y0T9kuzZsM0vXj72HNRmkgMm_yudnjPObEVBOIW1C3YBua8cMaelcCh1FasAzT0KH4RaG9ShYlvnkL9UbgTEpA1rwrnkOWVqIjsykfI2wrrPakpsDSg785FBoKMnSV0dQi5daekhKbELXbu4dJsDBryp4MNC-CEhBuKlUOyIq92IYkhf1lvV4irti31QX_545nYcYiIoWu2BQf8BtPW1g3SWIjP4Ur1pUDjUC8BZzaM"
                         style=""/>
                </div>
                <div>
                    <h4 class="font-bold text-sm" style="">Red Collar</h4>
                    <p class="text-xs text-on-surface-variant" style="">Riverside Park</p>
                    <span class="text-[10px] text-error font-bold mt-1 inline-block uppercase tracking-tighter"
                          style="">LOST</span>
                </div>
            </div>
            <!-- Lost Item 3 -->
            <div class="bg-surface-container-low rounded-xl p-4 flex gap-4 items-center border border-outline-variant/15">
                <div class="w-16 h-16 rounded-lg overflow-hidden bg-surface-container-high">
                    <img alt="Polaroid Camera" class="w-full h-full object-cover grayscale opacity-60"
                         data-alt="vintage yellow instant film camera on a plain background, cinematic lighting"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuCEvIjc1yLic7jo4Q50ywa2QiPFWvH7cf8VcyOuNLlk3UqgVMzz70juVthpHwDNZNKJgTdSIHUK3dyvDMR1LW65xCSIgXvfhxEft9V8z4jxDp466b2q3TO7IWP5t8dPHx9ks1o3MVjLOS8ZXmcvhG65mjqAWJpnJWY47SQMoLK1SoKFlFvGq1b9QgKXBzseo9W5IU8DCCfA-XTCmvAU07gvSw_-ddebZ3gZBe6Aj-uHIV8fLX-kA5yeK0Htzt2uk19fTcpabvui7eI"
                         style=""/>
                </div>
                <div>
                    <h4 class="font-bold text-sm" style="">Instax Camera</h4>
                    <p class="text-xs text-on-surface-variant" style="">Arts Plaza</p>
                    <span class="text-[10px] text-error font-bold mt-1 inline-block uppercase tracking-tighter"
                          style="">LOST</span>
                </div>
            </div>
            <!-- Lost Item 4 -->
            <div class="bg-surface-container-low rounded-xl p-4 flex gap-4 items-center border border-outline-variant/15">
                <div class="w-16 h-16 rounded-lg overflow-hidden bg-surface-container-high">
                    <img alt="Silver Ring" class="w-full h-full object-cover grayscale opacity-60"
                         data-alt="macro photo of a thin silver ring with a small blue gemstone on a neutral background"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuDirBchNCh3xY3avU0llaM84wrIWxtW0QkDAzhHVzZ8wHzHub8pnk7aOrh9kbWOTvbZYTunt-omQPb8Y0tQJx_sGMMeY5u5OEvj-sPLXwJ83ruqqtwYhRVk4UBwSWXnzYtrGPDdQF6nGmVIUOnAQCielevTfh1ZXCEYMpYvK3G7Q2CTOMGBWrt8bL2ILs3SZkrQyjx1yQ1vlKCqWHwubfMdTCCgQM-31SNzkj64zAfVJpZkN3ozMBnnp8czfo5Z7_ZvtBbrHZAjTtg"
                         style=""/>
                </div>
                <div>
                    <h4 class="font-bold text-sm" style="">Silver Band</h4>
                    <p class="text-xs text-on-surface-variant" style="">Main Street</p>
                    <span class="text-[10px] text-error font-bold mt-1 inline-block uppercase tracking-tighter"
                          style="">LOST</span>
                </div>
            </div>
        </div>
    </section>
</main>
<!-- BottomNavBar (Mobile Only) -->
<nav class="md:hidden fixed bottom-0 left-0 w-full flex justify-around items-center px-4 pb-6 pt-3 bg-white/80 backdrop-blur-xl z-50 rounded-t-3xl shadow-[0_-8px_24px_rgba(24,28,29,0.06)]">
    <a class="flex flex-col items-center justify-center bg-teal-50 text-teal-700 rounded-2xl px-5 py-2 tap-highlight-none active:scale-90 transition-transform"
       href="#" style="">
        <span class="material-symbols-outlined" style='font-variation-settings: "FILL" 1;'>home</span>
        <span class="text-[11px] font-medium headline-font mt-1" style="">Home</span>
    </a>
    <a class="flex flex-col items-center justify-center text-slate-400 px-5 py-2 tap-highlight-none active:scale-90 transition-transform"
       href="#" style="">
        <span class="material-symbols-outlined" style="">search</span>
        <span class="text-[11px] font-medium headline-font mt-1" style="">Search</span>
    </a>
    <a class="flex flex-col items-center justify-center text-slate-400 px-5 py-2 tap-highlight-none active:scale-90 transition-transform"
       href="#" style="">
        <span class="material-symbols-outlined" style="">add_circle</span>
        <span class="text-[11px] font-medium headline-font mt-1" style="">Report</span>
    </a>
    <a class="flex flex-col items-center justify-center text-slate-400 px-5 py-2 tap-highlight-none active:scale-90 transition-transform"
       href="#" style="">
        <span class="material-symbols-outlined" style="">person</span>
        <span class="text-[11px] font-medium headline-font mt-1" style="">Profile</span>
    </a>
</nav>
<!-- FAB for Desktop (Only on Home/Dashboard) -->
<div class="hidden md:block fixed bottom-10 right-10 z-40">
    <button class="w-16 h-16 bg-primary text-on-primary rounded-full flex items-center justify-center shadow-xl signature-gradient hover:scale-110 transition-transform"
            style="">
        <span class="material-symbols-outlined text-3xl" style="">add</span>
    </button>
</div>
</body>
</html>