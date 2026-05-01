<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Findora | Admin Ledger</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;family=Inter:wght@400;500;600&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            "colors": {
                    "surface-container-low": "#f1f4f4",
                    "outline-variant": "#bec9c8",
                    "on-background": "#181c1d",
                    "on-tertiary-fixed-variant": "#004883",
                    "tertiary-fixed-dim": "#a4c9ff",
                    "surface-container-high": "#e6e9e9",
                    "on-primary-fixed": "#002020",
                    "surface-container": "#ebeeee",
                    "background": "#f7fafa",
                    "surface-container-highest": "#e0e3e3",
                    "primary-fixed-dim": "#87d4d3",
                    "error-container": "#ffdad6",
                    "on-error-container": "#93000a",
                    "error": "#ba1a1a",
                    "on-secondary": "#ffffff",
                    "on-primary-fixed-variant": "#004f4f",
                    "inverse-primary": "#87d4d3",
                    "secondary": "#944a00",
                    "on-secondary-fixed": "#301400",
                    "secondary-fixed-dim": "#ffb783",
                    "surface-bright": "#f7fafa",
                    "surface-variant": "#e0e3e3",
                    "primary-container": "#006565",
                    "surface-tint": "#0b6969",
                    "on-tertiary-fixed": "#001c39",
                    "on-surface-variant": "#3f4948",
                    "surface-dim": "#d7dbdb",
                    "surface": "#f7fafa",
                    "primary-fixed": "#a3f0ef",
                    "on-surface": "#181c1d",
                    "inverse-on-surface": "#eef1f1",
                    "on-tertiary": "#ffffff",
                    "secondary-container": "#fc8f34",
                    "primary": "#004b4b",
                    "secondary-fixed": "#ffdcc5",
                    "surface-container-lowest": "#ffffff",
                    "tertiary-fixed": "#d4e3ff",
                    "on-primary-container": "#92dfdf",
                    "on-error": "#ffffff",
                    "inverse-surface": "#2d3131",
                    "on-secondary-container": "#663100",
                    "outline": "#6f7979",
                    "tertiary": "#00437c",
                    "on-tertiary-container": "#b7d3ff",
                    "on-primary": "#ffffff",
                    "tertiary-container": "#005ba4",
                    "on-secondary-fixed-variant": "#713700"
            },
            "borderRadius": {
                    "DEFAULT": "0.25rem",
                    "lg": "0.5rem",
                    "xl": "0.75rem",
                    "full": "9999px"
            },
            "fontFamily": {
                    "headline": ["Manrope"],
                    "body": ["Inter"],
                    "label": ["Inter"]
            }
          },
        },
      }
    </script>
<style>
        body { font-family: 'Inter', sans-serif; }
        h1, h2, h3, .font-headline { font-family: 'Manrope', sans-serif; }
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .tonal-shift { background-color: #f1f4f4; }
    </style>
</head>
<body class="bg-background text-on-background min-h-screen flex">
<!-- SideNavBar -->
<aside class="hidden md:flex flex-col h-screen w-64 fixed left-0 top-0 bg-slate-100 dark:bg-slate-950 py-8 px-4 z-50">
<div class="mb-10 px-2">
<h1 class="text-lg font-bold text-teal-900 dark:text-teal-100 font-headline">Findora Admin</h1>
<p class="text-xs text-slate-500 font-medium">Institutional Ledger</p>
</div>
<nav class="flex-1 space-y-1">
<a class="flex items-center gap-3 px-3 py-2.5 text-slate-500 dark:text-slate-400 font-manrope text-sm hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined">dashboard</span>
                Dashboard
            </a>
<a class="flex items-center gap-3 px-3 py-2.5 text-teal-900 dark:text-teal-200 font-bold border-r-4 border-orange-500 font-manrope text-sm bg-white/50 dark:bg-slate-900 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined">inventory_2</span>
                Items
            </a>
<a class="flex items-center gap-3 px-3 py-2.5 text-slate-500 dark:text-slate-400 font-manrope text-sm hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined">location_on</span>
                Locations
            </a>
<a class="flex items-center gap-3 px-3 py-2.5 text-slate-500 dark:text-slate-400 font-manrope text-sm hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined">group</span>
                Users
            </a>
<a class="flex items-center gap-3 px-3 py-2.5 text-slate-500 dark:text-slate-400 font-manrope text-sm hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined">assignment_turned_in</span>
                Claims
            </a>
<a class="flex items-center gap-3 px-3 py-2.5 text-slate-500 dark:text-slate-400 font-manrope text-sm hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined">analytics</span>
                Reports
            </a>
</nav>
<div class="mt-auto px-2">
<button class="w-full bg-secondary-container text-on-secondary-container py-3 rounded-lg font-semibold text-sm hover:brightness-110 transition-all">
                Report Found Item
            </button>
</div>
</aside>
<!-- Main Content Canvas -->
<main class="flex-1 md:ml-64 flex flex-col min-h-screen">
<!-- TopNavBar -->
<header class="bg-slate-50 dark:bg-slate-900 sticky top-0 z-40 flex justify-between items-center px-6 py-3 w-full">
<div class="flex items-center gap-6 flex-1">
<div class="relative w-full max-w-md">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline text-lg">search</span>
<input class="w-full pl-10 pr-4 py-2 bg-surface-container-highest border-none rounded-lg text-sm focus:ring-2 focus:ring-primary/30 transition-all" placeholder="Search the ledger..." type="text"/>
</div>
</div>
<div class="flex items-center gap-4 ml-4">
<button class="p-2 text-teal-900 dark:text-teal-400 hover:bg-slate-200/50 rounded-full transition-colors">
<span class="material-symbols-outlined">notifications</span>
</button>
<div class="h-8 w-8 rounded-full bg-primary-container overflow-hidden">
<img alt="User profile" class="w-full h-full object-cover" data-alt="close-up portrait of a professional man with a friendly expression in a modern office setting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDH6AGsfkHMEsKTr0297iz2vtmr1NVsy_uM1NJzM7FpnmojO3Pbm2pZVIAYXEyQh62pKJ7y6WMf6mmLKqcaZCDwAeLfxBogLra2VjcZbpZFL9mye8NHk7vqeKDFVfv-XjOTa-umovCgBFrG793UmIV_Sq6h2u6tIT5DV1LzZRnnnz4JodyulPOmZC7_1ztvKT_Z0-sCg7Wf9uIjz1HNrkwisl4FZNKLhzMSOPKQyo3nvvDPmTqub2NeFcpeZal2NSGDjgxBLxB9ABQ"/>
</div>
</div>
</header>
<div class="p-8 max-w-7xl w-full mx-auto">
<!-- Header Section -->
<div class="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-10">
<div>
<span class="text-[10px] uppercase tracking-[0.2em] font-bold text-secondary mb-2 block">Central Administration</span>
<h2 class="text-4xl font-extrabold text-primary font-headline tracking-tight">Vault Ledger</h2>
<p class="text-outline mt-1 font-medium">Monitoring 1,248 items across Library District</p>
</div>
<div class="flex gap-3">
<button class="flex items-center gap-2 bg-surface-container-low px-4 py-2.5 rounded-lg text-sm font-semibold text-primary hover:bg-surface-container-high transition-colors">
<span class="material-symbols-outlined text-lg">filter_list</span>
                        Filter
                    </button>
<button class="flex items-center gap-2 bg-surface-container-low px-4 py-2.5 rounded-lg text-sm font-semibold text-primary hover:bg-surface-container-high transition-colors">
<span class="material-symbols-outlined text-lg">file_download</span>
                        Export PDF
                    </button>
</div>
</div>
<!-- The Ledger Table -->
<div class="bg-surface-container-lowest rounded-xl overflow-hidden shadow-sm">
<div class="overflow-x-auto">
<table class="w-full text-left border-collapse">
<thead>
<tr class="bg-surface-container-low border-none">
<th class="px-6 py-4 text-[11px] font-bold uppercase tracking-widest text-outline-variant">Item</th>
<th class="px-6 py-4 text-[11px] font-bold uppercase tracking-widest text-outline-variant">Identity</th>
<th class="px-6 py-4 text-[11px] font-bold uppercase tracking-widest text-outline-variant">Classification</th>
<th class="px-6 py-4 text-[11px] font-bold uppercase tracking-widest text-outline-variant">Logged Date</th>
<th class="px-6 py-4 text-[11px] font-bold uppercase tracking-widest text-outline-variant">Status</th>
<th class="px-6 py-4 text-[11px] font-bold uppercase tracking-widest text-outline-variant text-right">Action</th>
</tr>
</thead>
<tbody class="divide-y divide-slate-50">
<!-- Item 1 -->
<tr class="hover:bg-surface-container-low/50 transition-colors group">
<td class="px-6 py-5">
<div class="w-16 h-12 rounded-lg overflow-hidden bg-surface-container-highest relative">
<img class="w-full h-full object-cover" data-alt="professional silver laptop resting on a clean minimalist desk surface with soft lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA8YrDTD-_McBTPDDZ35TPfND9aucGS7GyAQqA-6uMdgc3iukezRA6vCKLzyUosga5yH2VRPkpzVffUWgeX0oN-23sBnPLc4oHMMDmr3qbJ8zPkHCwEx0Ar4eV_ozBJL_fM6GSpxZNipdmlnrgptncFZ61uJIgcNYqCSZ3fjka-sSIQUTY-FfHmA7JczPewsvqFnRPwJStukSYmJLHnRA61gGRAhfTbQaqz2VSWXVKToi5JT_5dgcxnuph9llYU6M_DA6jYJjBpdiw"/>
</div>
</td>
<td class="px-6 py-5">
<div class="font-semibold text-primary">MacBook Pro 14"</div>
<div class="text-xs text-outline">Serial: MXL-992-001</div>
</td>
<td class="px-6 py-5">
<span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-tertiary-fixed text-on-tertiary-fixed-variant">
                                        Found
                                    </span>
</td>
<td class="px-6 py-5 text-sm text-on-surface-variant font-medium">Oct 24, 2023</td>
<td class="px-6 py-5">
<div class="flex items-center gap-2">
<span class="w-2 h-2 rounded-full bg-secondary-container"></span>
<span class="text-sm font-semibold text-on-secondary-container">Open Case</span>
</div>
</td>
<td class="px-6 py-5 text-right">
<button class="text-primary hover:text-secondary p-1 transition-colors">
<span class="material-symbols-outlined">edit_square</span>
</button>
</td>
</tr>
<!-- Item 2 -->
<tr class="hover:bg-surface-container-low/50 transition-colors group">
<td class="px-6 py-5">
<div class="w-16 h-12 rounded-lg overflow-hidden bg-surface-container-highest">
<img class="w-full h-full object-cover" data-alt="high quality leather wallet with cards showing on a textured wooden background" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBMKvRRPeq3RaBPNO29ms5_y-IzuYZ2-yzIWcgxCG2B3AEC6oRFSdUulZ57_e2RR2Z-mNLUf4ZiDU-Qskm5YNlC72_a58i_eUlvsANWuozcH7MPpP8e5eWsOkpsOXaa0DCrptrpVcsSumzxQV9dPH8Vo9dt__d6tD765IOwKW4_5F8R6g2H55lXif-NDzx_GOSla6kzKobTj4Pw0Z-XfolzQPkKsVAegVapM5Yl7QAjNB_QcObySO1clFnPRDT4dJDBXuZc-0HZxaI"/>
</div>
</td>
<td class="px-6 py-5">
<div class="font-semibold text-primary">Leather Wallet</div>
<div class="text-xs text-outline">Tan leather, Multiple IDs</div>
</td>
<td class="px-6 py-5">
<span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-primary-fixed text-on-primary-fixed-variant">
                                        Lost
                                    </span>
</td>
<td class="px-6 py-5 text-sm text-on-surface-variant font-medium">Oct 22, 2023</td>
<td class="px-6 py-5">
<div class="flex items-center gap-2">
<span class="w-2 h-2 rounded-full bg-teal-500"></span>
<span class="text-sm font-semibold text-teal-700">Claimed</span>
</div>
</td>
<td class="px-6 py-5 text-right">
<button class="text-primary hover:text-secondary p-1 transition-colors">
<span class="material-symbols-outlined">visibility</span>
</button>
</td>
</tr>
<!-- Item 3 -->
<tr class="hover:bg-surface-container-low/50 transition-colors group">
<td class="px-6 py-5">
<div class="w-16 h-12 rounded-lg overflow-hidden bg-surface-container-highest">
<img class="w-full h-full object-cover" data-alt="modern wireless noise-canceling headphones on a neutral gray background" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA9TBkldMfnVOzcI7KGXkVs5mYPb21sIwmfhySSZzwEag38Vw4M4x5gp2i4QmxcHa1-3gMNJeZJj9FuwIKcY-irCUn1IgDmJcufAOuvhJgnBDKWumQTpDxHXVCf1VT133fgCz38XwcrtOaQaTQ21h-UASZeIWdmKNVu5pnllaXJmGSA7R3EPe8vQKWvVi2hr0fxJUodgLPqJnA2R3zHjOg27spx2u1IdRimpDsFCFXqMiMyYgDd8E9lEYry2L4DvxKwJrn36vKghXs"/>
</div>
</td>
<td class="px-6 py-5">
<div class="font-semibold text-primary">Sony WH-1000XM4</div>
<div class="text-xs text-outline">Black case included</div>
</td>
<td class="px-6 py-5">
<span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-tertiary-fixed text-on-tertiary-fixed-variant">
                                        Found
                                    </span>
</td>
<td class="px-6 py-5 text-sm text-on-surface-variant font-medium">Oct 21, 2023</td>
<td class="px-6 py-5">
<div class="flex items-center gap-2">
<span class="w-2 h-2 rounded-full bg-secondary-container animate-pulse"></span>
<span class="text-sm font-semibold text-on-secondary-container">Processing</span>
</div>
</td>
<td class="px-6 py-5 text-right">
<button class="text-primary hover:text-secondary p-1 transition-colors">
<span class="material-symbols-outlined">edit_square</span>
</button>
</td>
</tr>
<!-- Item 4 -->
<tr class="hover:bg-surface-container-low/50 transition-colors group">
<td class="px-6 py-5">
<div class="w-16 h-12 rounded-lg overflow-hidden bg-surface-container-highest">
<img class="w-full h-full object-cover" data-alt="a pair of elegant prescription glasses with tortoise shell frames on a white marble surface" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCuv5HjSBjipW4h6YFrrMf3xQ95SjNRlpnwvo9LGNp3UJUYnpUK5uYZaBijUMYpqXPJqc83f51v-4dU5hiygxWhbWxeYdNVpqLvsE37PcwHb5HYrQaBxPA1AQxuaYDtDLQtLDHAuT_tcrstPwxaSt8ADUT2TE4ksB6ghSGzmsxnzmvYHyR3am_3tKOYwds444xbEolOo62hdcY_fayl4D18p1A-o8e9CW9F_WhvGfaNKBCeH6IGaT-p5qFPK0djPfDJ8Nvk9gTH8n8"/>
</div>
</td>
<td class="px-6 py-5">
<div class="font-semibold text-primary">Prescription Glasses</div>
<div class="text-xs text-outline">Ray-Ban Frames</div>
</td>
<td class="px-6 py-5">
<span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-tertiary-fixed text-on-tertiary-fixed-variant">
                                        Found
                                    </span>
</td>
<td class="px-6 py-5 text-sm text-on-surface-variant font-medium">Oct 20, 2023</td>
<td class="px-6 py-5">
<div class="flex items-center gap-2">
<span class="w-2 h-2 rounded-full bg-secondary-container"></span>
<span class="text-sm font-semibold text-on-secondary-container">Open Case</span>
</div>
</td>
<td class="px-6 py-5 text-right">
<button class="text-primary hover:text-secondary p-1 transition-colors">
<span class="material-symbols-outlined">edit_square</span>
</button>
</td>
</tr>
</tbody>
</table>
</div>
<!-- Pagination -->
<div class="px-6 py-4 bg-surface-container-low flex items-center justify-between">
<span class="text-xs text-outline font-medium uppercase tracking-wider">Page 1 of 42</span>
<div class="flex gap-2">
<button class="p-2 rounded-lg hover:bg-surface-container-highest transition-colors disabled:opacity-30">
<span class="material-symbols-outlined">chevron_left</span>
</button>
<button class="p-2 rounded-lg hover:bg-surface-container-highest transition-colors">
<span class="material-symbols-outlined">chevron_right</span>
</button>
</div>
</div>
</div>
</div>
<!-- Footer -->
<footer class="bg-slate-50 dark:bg-slate-900 border-t border-slate-200/10 w-full py-6 mt-auto flex flex-col md:flex-row justify-between items-center px-12">
<div class="font-manrope font-black text-teal-900 dark:text-teal-100 uppercase tracking-widest text-xs">FINDORA</div>
<p class="font-inter text-[10px] tracking-wide uppercase text-slate-400 my-4 md:my-0">© 2024 Findora Lost &amp; Found. Managed Institutional Stewardship.</p>
<div class="flex gap-6">
<a class="font-inter text-xs tracking-wide uppercase text-slate-400 hover:text-orange-500 transition-colors" href="#">Privacy Policy</a>
<a class="font-inter text-xs tracking-wide uppercase text-slate-400 hover:text-orange-500 transition-colors" href="#">Terms of Service</a>
<a class="font-inter text-xs tracking-wide uppercase text-slate-400 hover:text-orange-500 transition-colors" href="#">Support</a>
</div>
</footer>
</main>
<!-- FAB Suppression Logic (Suppressing as per mandate for Details/Admin Ledger) -->
</body></html>