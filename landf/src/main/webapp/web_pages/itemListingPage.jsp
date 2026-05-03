<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&amp;family=Plus+Jakarta+Sans:wght@400;500;600&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
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
            "borderRadius": {
                    "DEFAULT": "0.25rem",
                    "lg": "1rem",
                    "xl": "1.5rem",
                    "full": "9999px"
            },
            "fontFamily": {
                    "headline": ["Manrope"],
                    "body": ["Plus Jakarta Sans"],
                    "label": ["Plus Jakarta Sans"]
            }
          },
        },
      }
    </script>
<style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; background-color: #f7fafa; color: #181c1d; }
        h1, h2, h3, .font-headline { font-family: 'Manrope', sans-serif; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
        .glass-effect { backdrop-filter: blur(20px); -webkit-backdrop-filter: blur(20px); }
        .signature-gradient { background: linear-gradient(135deg, #006565 0%, #008080 100%); }
    </style>
</head>
<body class="bg-surface text-on-surface min-h-screen">
<!-- Top Navigation Bar -->
<nav class="fixed top-0 w-full z-50 bg-[#f7fafa]/80 backdrop-blur-md flex justify-between items-center px-8 h-20 max-w-full">
<div class="text-xl font-bold tracking-tighter text-teal-900 font-headline">Findora</div>
<div class="hidden md:flex items-center space-x-12">
<a class="text-slate-500 font-medium hover:text-teal-600 transition-colors duration-200 font-label" href="#">Dashboard</a>
<a class="text-slate-500 font-medium hover:text-teal-600 transition-colors duration-200 font-label" href="#">Analytics</a>
<a class="text-teal-800 font-bold border-b-2 border-teal-600 font-label" href="#">Directory</a>
</div>
<div class="flex items-center gap-6">
<div class="relative hidden lg:block">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline-variant">search</span>
<input class="pl-10 pr-4 py-2 bg-surface-container-highest rounded-full text-sm outline-none focus:ring-2 focus:ring-primary/40 w-64 border-none" placeholder="Search directory..." type="text"/>
</div>
<button class="signature-gradient text-on-primary px-6 py-2.5 rounded-xl font-bold text-sm hover:opacity-90 transition-opacity flex items-center gap-2">
<span class="material-symbols-outlined text-sm">add_circle</span>
                Report Found Item
            </button>
<div class="w-10 h-10 rounded-full overflow-hidden bg-surface-container-high">
<img alt="User profile concierge" data-alt="professional portrait of a friendly concierge or customer success manager in a modern office setting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBqMgtqN9p8_QZijORWf4LjJNpzsDy36GpFQReICddQfOPHFMGlfMNaAwPl4C6EVBuJZe-sfGT2IGVxfksjjaHzYPG3dNvEMYOGvnngB_zGRZPbKYBW2O0TpZuljnyLaa7qP1bOL4dg7cnT6rPD7DBHLQ7VyBPnjDqkB1WmgXtskHN-N1CL0Bez0wOaD64JFv-UIIfSfqDEkp_2ZepdXpCNBZ1O5Hasw78g93hlg-i_3QKb42GypYesrctkWMI9-n0eVMUrY9T6trw"/>
</div>
</div>
</nav>
<!-- Main Content Canvas -->
<main class="pt-32 pb-24 px-8 max-w-[1440px] mx-auto">
<!-- Hero Header -->
<header class="mb-16">
<div class="flex flex-col md:flex-row md:items-end justify-between gap-6">
<div>
<h1 class="text-5xl font-extrabold tracking-tight text-on-surface mb-4">Discovery Vault</h1>
<p class="text-on-surface-variant max-w-xl text-lg leading-relaxed">
                        The definitive archive of missing essentials and restored treasures. Meticulously cataloged for seamless reunification.
                    </p>
</div>
<div class="flex items-center gap-4 bg-surface-container-low p-1.5 rounded-xl">
<button class="bg-surface-container-lowest text-primary px-6 py-2 rounded-lg font-bold shadow-sm">All Items</button>
<button class="text-on-surface-variant px-6 py-2 rounded-lg font-medium hover:bg-surface-container-high transition-colors">Lost</button>
<button class="text-on-surface-variant px-6 py-2 rounded-lg font-medium hover:bg-surface-container-high transition-colors">Found</button>
</div>
</div>
</header>
<!-- Dynamic Filter Bar -->
<section class="flex flex-wrap items-center gap-4 mb-12">
<div class="group relative">
<button class="bg-surface-container-lowest px-5 py-3 rounded-xl flex items-center gap-3 hover:bg-surface-container-low transition-all">
<span class="material-symbols-outlined text-primary">category</span>
<span class="font-medium text-sm">Category: All</span>
<span class="material-symbols-outlined text-sm text-outline-variant">expand_more</span>
</button>
</div>
<div class="group relative">
<button class="bg-surface-container-lowest px-5 py-3 rounded-xl flex items-center gap-3 hover:bg-surface-container-low transition-all">
<span class="material-symbols-outlined text-primary">location_on</span>
<span class="font-medium text-sm">Location: Metropolitan Area</span>
<span class="material-symbols-outlined text-sm text-outline-variant">expand_more</span>
</button>
</div>
<div class="group relative">
<button class="bg-surface-container-lowest px-5 py-3 rounded-xl flex items-center gap-3 hover:bg-surface-container-low transition-all">
<span class="material-symbols-outlined text-primary">calendar_month</span>
<span class="font-medium text-sm">Date: Last 30 Days</span>
<span class="material-symbols-outlined text-sm text-outline-variant">expand_more</span>
</button>
</div>
<div class="ml-auto flex items-center gap-2 text-on-surface-variant text-sm font-medium">
<span>Showing 248 curated entries</span>
<div class="w-px h-4 bg-outline-variant mx-2"></div>
<button class="text-primary hover:underline">Clear all</button>
</div>
</section>
<!-- Results Grid: Bento-ish Asymmetric Flow -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
<!-- Item Card 1: Open State -->
<div class="group bg-surface-container-lowest rounded-lg overflow-hidden transition-all duration-300 hover:shadow-[0_8px_24px_rgba(24,28,29,0.06)] hover:-translate-y-1">
<div class="h-64 relative overflow-hidden">
<img class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="close-up of a high-end designer leather wallet resting on a clean concrete surface with soft daylight" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAQ_I3Pjwtqnj7jnODKxeKRUHlUjUoYs4CeOiJdIT2LyRPustIDZ1f4WvrSLJJBqaVy3b4FSr4-7SEJm5LkRcs8tI_-c7AFh6sucJFObXUZ5-68jOWKT8stPkHbeNYpePXPVazNhye4WCudsRLubCOhxyJwriRsTGHoawFx93jEodMvqtrx0VRX26s91L3_8xcbC2YEDJpvaNLuQWHspdUM1dj-OCXVvwTsm0It9D-FkS67q4fRQv6tM-1aj4iRWlmwKf0gxasMnfY"/>
<div class="absolute top-4 right-4">
<span class="bg-primary-container text-on-primary px-4 py-1.5 rounded-full text-xs font-bold tracking-wide uppercase">Open</span>
</div>
</div>
<div class="p-6">
<div class="flex items-center gap-2 mb-3">
<span class="text-[10px] uppercase font-bold tracking-widest text-primary-fixed-dim bg-on-primary-fixed-variant px-2 py-0.5 rounded">Electronics</span>
<span class="text-on-surface-variant text-xs font-medium">Reported 2h ago</span>
</div>
<h3 class="text-xl font-bold mb-4 group-hover:text-primary transition-colors">AirPods Pro Gen 2</h3>
<div class="space-y-3">
<div class="flex items-center gap-3 text-on-surface-variant text-sm">
<span class="material-symbols-outlined text-lg">location_on</span>
<span>Terminal 3, Gate B12</span>
</div>
</div>
</div>
</div>
<!-- Item Card 2: Matched State -->
<div class="group bg-surface-container-lowest rounded-lg overflow-hidden transition-all duration-300 hover:shadow-[0_8px_24px_rgba(24,28,29,0.06)] hover:-translate-y-1">
<div class="h-64 relative overflow-hidden">
<img class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="a cute small golden retriever puppy with a blue collar sitting on a porch with warm evening light" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAxAGq9eaKhY2cE_FSwCnnsgfOguetHBj6qvOHOd3yPhB91Mc0pOEhfxTUsdFYa24nGhde3yBDl0kPpqBbev867gXKXxbqs-lQ4k2-ZhWUzhdIuVN7li82kNPX0oswSRFwRmwzaGgnhPCedM4fL2aONkwaEJ3-ZT9isVlNcXG1mcgDSy2AIkdujPJN_Onlsa9d1ytGoyZW_SigPVuY53ogcuEXyiPvj5_cJIN2195ABe2pKnpfm7Yy3otVYDSX1ZuBpM3WssSX5rFY"/>
<div class="absolute top-4 right-4">
<span class="bg-secondary-container text-on-secondary-container px-4 py-1.5 rounded-full text-xs font-bold tracking-wide uppercase">Matched</span>
</div>
</div>
<div class="p-6">
<div class="flex items-center gap-2 mb-3">
<span class="text-[10px] uppercase font-bold tracking-widest text-on-secondary-fixed bg-secondary-fixed px-2 py-0.5 rounded">Pets</span>
<span class="text-on-surface-variant text-xs font-medium">Reported yesterday</span>
</div>
<h3 class="text-xl font-bold mb-4 group-hover:text-primary transition-colors">Golden Retriever Puppy</h3>
<div class="space-y-3 text-on-surface-variant text-sm">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined text-lg">location_on</span>
<span>Central Park North Entrance</span>
</div>
</div>
</div>
</div>
<!-- Item Card 3: Claimed State -->
<div class="group bg-surface-container-lowest rounded-lg overflow-hidden transition-all duration-300 hover:shadow-[0_8px_24px_rgba(24,28,29,0.06)] hover:-translate-y-1 opacity-75 grayscale-[0.3]">
<div class="h-64 relative overflow-hidden">
<img class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="minimalist studio shot of a classic white wristwatch on a neutral background with clean shadows" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAPL2r7ykhfIyn9R8n_kc9FkmrsLyqBLgvqE-rUbQVEEnTVw9EDkyHMGEoCHePZpqG4raFdLNOUhGSL8H92LIxnPM8GnYLV28_1iFVJj50F17LoEMAoHC3Al8Cp6aaz1zFbgdwSQDyTC1_GXgoFJi3QEUhlvD9lgd_AjdCyDiwlX8BfXleCb6_bU0C1R02V_DeXKxJfXFEC8dUa_El8582k1kYzvhWhZwPbFnSck2-Kf8JxbE5e6UEqncryHLgz89Vx5kt_1zhZbpw"/>
<div class="absolute top-4 right-4">
<span class="bg-tertiary-container text-on-tertiary-container px-4 py-1.5 rounded-full text-xs font-bold tracking-wide uppercase">Claimed</span>
</div>
</div>
<div class="p-6">
<div class="flex items-center gap-2 mb-3">
<span class="text-[10px] uppercase font-bold tracking-widest text-on-tertiary-fixed-variant bg-tertiary-fixed px-2 py-0.5 rounded">Personal</span>
<span class="text-on-surface-variant text-xs font-medium">3 days ago</span>
</div>
<h3 class="text-xl font-bold mb-4 group-hover:text-primary transition-colors">Seiko Automatic Watch</h3>
<div class="space-y-3 text-on-surface-variant text-sm">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined text-lg">location_on</span>
<span>Gym Locker Rooms, Zone A</span>
</div>
</div>
</div>
</div>
<!-- Item Card 4: Detailed Layout -->
<div class="group bg-surface-container-lowest rounded-lg overflow-hidden transition-all duration-300 hover:shadow-[0_8px_24px_rgba(24,28,29,0.06)] hover:-translate-y-1">
<div class="h-64 relative overflow-hidden">
<img class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="luxury car key fob resting on a mahogany wooden table with focused lighting on the brand logo" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBuA87UcXlpWNKVsq1YD_A8l-WKzFPYxWd_JtvCaKH5KscUy9rK70iKqYqSpRJK35rgFH98nQZeDZrFF6EMig74D_fM98lcIvMpBPLwI9aYEKMdP6UaEPKhRusdWBZLoYD0L81VLXmwtHEDpYPejN7yYcFfWjxS4gR5mpHQQxJ_BVWs5DDx-aUPWiDjQmV90Q_hAj5XkVV_eprrdCYkr_K2uPc_ZyEMtHLCJeUmncZIYJ0FOxd-MBTNA67oj_-ax415FdM7tSOGDLE"/>
<div class="absolute top-4 right-4">
<span class="bg-primary-container text-on-primary px-4 py-1.5 rounded-full text-xs font-bold tracking-wide uppercase">Open</span>
</div>
</div>
<div class="p-6">
<div class="flex items-center gap-2 mb-3">
<span class="text-[10px] uppercase font-bold tracking-widest text-primary-fixed-dim bg-on-primary-fixed-variant px-2 py-0.5 rounded">Personal</span>
<span class="text-on-surface-variant text-xs font-medium">Today, 10:45 AM</span>
</div>
<h3 class="text-xl font-bold mb-4 group-hover:text-primary transition-colors">Mercedes Key Fob</h3>
<div class="space-y-3 text-on-surface-variant text-sm">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined text-lg text-primary">location_on</span>
<span>Valet Stand, West Wing</span>
</div>
</div>
</div>
</div>
<!-- Add more cards to fill grid -->
<div class="group bg-surface-container-lowest rounded-lg overflow-hidden transition-all duration-300 hover:shadow-[0_8px_24px_rgba(24,28,29,0.06)] hover:-translate-y-1">
<div class="h-64 relative overflow-hidden">
<img class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="close-up of a premium fountain pen on an antique wooden desk with warm indoor lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuChDLW59tgI-yK7ZtCuB9WodF6ruKuO704aA81_sh_TsFuosfvpiIVbsRH1EUDq_fJYIxnv4npPDptlIgqyvRVWnzuIE8NsHG2qmaMZrexrCCG7gZnbEQLXPk9BBTJrCZbF-R6v0HiZ-yg0cGMEp4_SMu70NRsS7I2limc2p1MXEzAkgltf__NlBkYUwhU9j-6FIJ8zExWgOkJ4133VgTWVaoHgCElK8GS0BT8iGLJ-Sdf4MQX_ZX6-7bc1n5M_zOXTkhLx_WdQvHE"/>
<div class="absolute top-4 right-4">
<span class="bg-primary-container text-on-primary px-4 py-1.5 rounded-full text-xs font-bold tracking-wide uppercase">Open</span>
</div>
</div>
<div class="p-6">
<div class="flex items-center gap-2 mb-3">
<span class="text-[10px] uppercase font-bold tracking-widest text-on-secondary-fixed bg-secondary-fixed px-2 py-0.5 rounded">Office</span>
<span class="text-on-surface-variant text-xs font-medium">Yesterday</span>
</div>
<h3 class="text-xl font-bold mb-4 group-hover:text-primary transition-colors">Montblanc Fountain Pen</h3>
<div class="flex items-center gap-3 text-on-surface-variant text-sm">
<span class="material-symbols-outlined text-lg">location_on</span>
<span>Conference Room C</span>
</div>
</div>
</div>
<div class="group bg-surface-container-lowest rounded-lg overflow-hidden transition-all duration-300 hover:shadow-[0_8px_24px_rgba(24,28,29,0.06)] hover:-translate-y-1">
<div class="h-64 relative overflow-hidden">
<img class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="a professional grade camera lens with complex reflections on the glass sitting on a velvet surface" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCqaBiuDALMe-CLkS0_Nc6E5sibDLyqTBeKq4o2dHjyoN4DISrkOEceYK-W1ANGLzGFRqST_gRVtxMZgNoIEwhTsEyuycN4jeGu4o2rHfFhTsAQ5KRzWaC11bhwdDERxe_lwURuJ8-6anibyWZfUKcznxfJrzoFybpl0P7UvA8eEmTMyDSRShoKsefncPw3f_CNFSSsB9_uN5pMyA3kR6Zsbob1dh9gzh8wiAtcsiZF_XisnJSDMuqDpLOUsMoEZW2gps2o2vze0Ok"/>
<div class="absolute top-4 right-4">
<span class="bg-primary-container text-on-primary px-4 py-1.5 rounded-full text-xs font-bold tracking-wide uppercase">Open</span>
</div>
</div>
<div class="p-6">
<div class="flex items-center gap-2 mb-3">
<span class="text-[10px] uppercase font-bold tracking-widest text-primary-fixed-dim bg-on-primary-fixed-variant px-2 py-0.5 rounded">Electronics</span>
<span class="text-on-surface-variant text-xs font-medium">5h ago</span>
</div>
<h3 class="text-xl font-bold mb-4 group-hover:text-primary transition-colors">Canon 24-70mm Lens</h3>
<div class="flex items-center gap-3 text-on-surface-variant text-sm">
<span class="material-symbols-outlined text-lg">location_on</span>
<span>Outdoor Amphitheater</span>
</div>
</div>
</div>
<!-- Map Preview Bento Card -->
<div class="lg:col-span-2 bg-surface-container-low rounded-lg overflow-hidden flex flex-col md:flex-row shadow-sm">
<div class="w-full md:w-1/2 p-8 flex flex-col justify-between">
<div>
<h3 class="text-2xl font-bold mb-2">Spatial Context</h3>
<p class="text-on-surface-variant text-sm leading-relaxed mb-6">
                            Visualize reported items on the custodial grid. Find clusters and high-density discovery zones.
                        </p>
</div>
<div class="space-y-4">
<div class="flex items-center gap-4">
<div class="w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center text-primary">
<span class="material-symbols-outlined">map</span>
</div>
<div>
<div class="text-sm font-bold">Metropolitan Core</div>
<div class="text-xs text-on-surface-variant">Active Search Area</div>
</div>
</div>
<button class="w-full py-3 bg-surface-container-lowest border border-outline-variant/15 rounded-xl text-sm font-bold hover:bg-surface-container-high transition-colors">
                            Open Interactive Map
                        </button>
</div>
</div>
<div class="w-full md:w-1/2 h-48 md:h-full bg-surface-variant grayscale">
<img class="w-full h-full object-cover" data-alt="minimalist grayscale map illustration of a city grid with clean lines and geometric layout" data-location="San Francisco" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBTFaa3NNAqnwOxXWL3mthFaYDXf5b5IfeAUMA4nPQV847nJdswKdAIygYggt0tsc_6iZp4YqJOohDZ7PZFaD1zEuKg-lRbL4K331aiQhYE8X7JJVgyWUrOfaY6BYOThujG1R4lJ87EuHkH5W1aKPxCMFmgjT3Y0Bf11xe2nQrs2rbkif-w_Q9djG2M9kceaT4r2Jf2Rm0P9LD_FmLDD8e8LEofJLzXLWR74H5IEqufXL1JhO31MldBIk1KxFgLJwsIXktoIdcOJbU"/>
</div>
</div>
</div>
<!-- Pagination / Load More -->
<div class="mt-20 flex justify-center">
<button class="bg-surface-container-lowest text-on-surface px-10 py-4 rounded-xl font-bold flex items-center gap-3 border border-outline-variant/15 hover:border-primary/40 transition-all shadow-sm">
                Examine Further Archive
                <span class="material-symbols-outlined text-lg">keyboard_arrow_down</span>
</button>
</div>
</main>
<!-- Bottom Navigation for Mobile Pivoting -->
<nav class="md:hidden fixed bottom-0 left-0 w-full flex justify-around items-center px-4 pb-6 pt-3 bg-white/80 backdrop-blur-xl z-50 rounded-t-3xl shadow-[0_-8px_24px_rgba(24,28,29,0.06)]">
<div class="flex flex-col items-center justify-center text-slate-400 px-5 py-2 tap-highlight-none active:scale-90 transition-transform">
<span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 0;">home</span>
<span class="text-[11px] font-medium font-label">Home</span>
</div>
<div class="flex flex-col items-center justify-center bg-teal-50 text-teal-700 rounded-2xl px-5 py-2 tap-highlight-none active:scale-90 transition-transform">
<span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">search</span>
<span class="text-[11px] font-medium font-label">Search</span>
</div>
<div class="flex flex-col items-center justify-center text-slate-400 px-5 py-2 tap-highlight-none active:scale-90 transition-transform">
<span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 0;">add_circle</span>
<span class="text-[11px] font-medium font-label">Report</span>
</div>
<div class="flex flex-col items-center justify-center text-slate-400 px-5 py-2 tap-highlight-none active:scale-90 transition-transform">
<span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 0;">person</span>
<span class="text-[11px] font-medium font-label">Profile</span>
</div>
</nav>
</body></html>