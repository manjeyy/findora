<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Submit Lost Item - Findora</title>
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Manrope:wght@700;800&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
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
                }
            }
        }
    </script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .editorial-gradient {
            background: linear-gradient(135deg, #004b4b 0%, #006565 100%);
        }
        .glass-panel {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(12px);
        }
    </style>
</head>
<body class="bg-background text-on-background font-body min-h-screen flex flex-col">
<!-- Top Navigation Bar -->
<nav class="bg-slate-50 dark:bg-slate-900 font-manrope text-sm font-medium sticky top-0 z-50 bg-slate-100 dark:bg-slate-800/50 flex justify-between items-center px-6 py-3 w-full">
<div class="flex items-center gap-8">
<span class="text-xl font-bold text-teal-900 dark:text-teal-100 tracking-tight">Findora</span>
<div class="hidden md:flex gap-6">
<a class="text-teal-700 dark:text-teal-300 font-semibold transition-all" href="#">Dashboard</a>
<a class="text-slate-500 dark:text-slate-400 hover:bg-slate-200/50 dark:hover:bg-slate-800 transition-colors px-2 py-1 rounded" href="#">My Items</a>
<a class="text-slate-500 dark:text-slate-400 hover:bg-slate-200/50 dark:hover:bg-slate-800 transition-colors px-2 py-1 rounded" href="#">Explore</a>
</div>
</div>
<div class="flex items-center gap-4">
<button class="material-symbols-outlined text-slate-500 hover:bg-slate-200/50 p-2 rounded-full transition-all">notifications</button>
<div class="w-8 h-8 rounded-full overflow-hidden bg-surface-container-highest">
<img alt="User profile" data-alt="professional headshot of a person with a clean background and soft studio lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCh3eDQTOdplMpbnS8APXG4BXBvATdqwKh2avWqX-eQ6xCBZ-e-h57BVRDHVkt-go9F8vSFkGEnc2yfXlb3rMTOcb5y_dXPPZ-m4EbetOh9-n8vB7YLPCUEMumTrV04b4-LSdatMFRJvCSgwl6MExDLCpVpkdVN-XXko1ZDf3aMK2cygHX7inLFccPnQpc9s6VfNdZ7IZb0etbmB8vJ8dYAdyNL2RzmxGknOhUjURiGYY67wRwzuHm5qU9YOYAwML51sT0vEWxCD9g"/>
</div>
</div>
</nav>
<!-- Main Content Canvas -->
<main class="flex-grow flex flex-col md:flex-row w-full max-w-[1440px] mx-auto overflow-hidden">
<!-- Side Navigation (Suppressed on focused submission journey, but keeping structure as guide) -->
<aside class="hidden lg:flex flex-col h-screen w-64 bg-slate-100 dark:bg-slate-950 py-8 px-4 font-manrope text-sm tonal-shift">
<div class="mb-10">
<h2 class="text-lg font-bold text-teal-900 dark:text-teal-100">Findora Admin</h2>
<p class="text-xs text-slate-500">Institutional Ledger</p>
</div>
<nav class="space-y-1">
<a class="flex items-center gap-3 py-3 px-4 rounded-lg text-slate-500 hover:bg-white transition-all" href="#">
<span class="material-symbols-outlined">dashboard</span> Dashboard
                </a>
<a class="flex items-center gap-3 py-3 px-4 rounded-lg text-teal-900 font-bold border-r-4 border-orange-500 bg-white" href="#">
<span class="material-symbols-outlined">inventory_2</span> Items
                </a>
<a class="flex items-center gap-3 py-3 px-4 rounded-lg text-slate-500 hover:bg-white transition-all" href="#">
<span class="material-symbols-outlined">location_on</span> Locations
                </a>
<a class="flex items-center gap-3 py-3 px-4 rounded-lg text-slate-500 hover:bg-white transition-all" href="#">
<span class="material-symbols-outlined">group</span> Users
                </a>
</nav>
</aside>
<!-- Focused Submission Form Area -->
<div class="flex-grow bg-surface p-6 md:p-12 lg:p-20 overflow-y-auto">
<div class="max-w-4xl mx-auto">
<header class="mb-12">
<span class="text-primary font-semibold tracking-widest text-[0.6875rem] uppercase mb-2 block">Institutional Stewardship</span>
<h1 class="text-4xl lg:text-5xl font-headline font-extrabold text-primary mb-4 tracking-tight">Report a Lost Item</h1>
<p class="text-on-surface-variant max-w-xl body-md">Complete the ledger below to initiate the recovery protocol. Detailed descriptions increase the probability of a successful match.</p>
</header>
<form class="grid grid-cols-1 md:grid-cols-12 gap-8">
<!-- Image Upload Section: Bento Style -->
<div class="md:col-span-12 lg:col-span-5 flex flex-col">
<label class="font-headline font-bold text-lg text-primary mb-4">Visual Evidence</label>
<div class="relative group cursor-pointer flex-grow bg-surface-container-highest rounded-xl min-h-[320px] flex flex-col items-center justify-center border-2 border-dashed border-outline-variant hover:border-primary transition-all overflow-hidden">
<div class="absolute inset-0 z-0">
<div class="w-full h-full editorial-gradient opacity-5"></div>
</div>
<div class="relative z-10 flex flex-col items-center p-8 text-center">
<div class="w-16 h-16 bg-surface-container-lowest rounded-full flex items-center justify-center mb-4 shadow-sm group-hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-primary text-3xl">cloud_upload</span>
</div>
<h3 class="text-on-surface font-semibold mb-2">Upload Reference Photo</h3>
<p class="text-xs text-on-surface-variant mb-4">Drag and drop or click to browse<br/>(PNG, JPG up to 10MB)</p>
<button class="bg-secondary-container text-on-secondary-container px-6 py-2 rounded-lg text-sm font-bold hover:shadow-lg transition-all active:scale-95" type="button">Select File</button>
</div>
</div>
<p class="mt-3 text-[0.6875rem] text-on-surface-variant italic leading-relaxed">
                            Note: If no photo is available, our matching algorithm will rely solely on textual descriptors.
                        </p>
</div>
<!-- Details Section -->
<div class="md:col-span-12 lg:col-span-7 space-y-8">
<div class="bg-surface-container-lowest p-8 rounded-xl shadow-sm border border-outline-variant/10">
<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
<!-- Item Name -->
<div class="md:col-span-2">
<label class="block text-[0.6875rem] font-bold text-primary uppercase tracking-wider mb-2 ml-1">Item Identity</label>
<input class="w-full bg-surface-container-highest border-none rounded-lg p-4 focus:ring-2 focus:ring-primary/30 transition-all placeholder:text-outline" placeholder="e.g. Vintage Leather Portfolio" type="text"/>
</div>
<!-- Category Dropdown -->
<div>
<label class="block text-[0.6875rem] font-bold text-primary uppercase tracking-wider mb-2 ml-1">Category</label>
<select class="w-full bg-surface-container-highest border-none rounded-lg p-4 focus:ring-2 focus:ring-primary/30 appearance-none transition-all text-on-surface">
<option>Select Classification</option>
<option>Electronics &amp; Gadgets</option>
<option>Personal Documents</option>
<option>Keys &amp; Access Cards</option>
<option>Apparel &amp; Accessories</option>
<option>Books &amp; Stationery</option>
</select>
</div>
<!-- Date Lost -->
<div>
<label class="block text-[0.6875rem] font-bold text-primary uppercase tracking-wider mb-2 ml-1">Date Lost</label>
<input class="w-full bg-surface-container-highest border-none rounded-lg p-4 focus:ring-2 focus:ring-primary/30 transition-all text-on-surface" type="date"/>
</div>
<!-- Location Lost -->
<div class="md:col-span-2">
<label class="block text-[0.6875rem] font-bold text-primary uppercase tracking-wider mb-2 ml-1">Last Known Location</label>
<div class="relative">
<input class="w-full bg-surface-container-highest border-none rounded-lg p-4 pl-12 focus:ring-2 focus:ring-primary/30 transition-all placeholder:text-outline" placeholder="e.g. West Campus Library, Level 3" type="text"/>
<span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-primary">location_on</span>
</div>
</div>
<!-- Description -->
<div class="md:col-span-2">
<label class="block text-[0.6875rem] font-bold text-primary uppercase tracking-wider mb-2 ml-1">Full Description</label>
<textarea class="w-full bg-surface-container-highest border-none rounded-lg p-4 focus:ring-2 focus:ring-primary/30 transition-all placeholder:text-outline resize-none" placeholder="Describe unique features, markings, or contents..." rows="4"></textarea>
</div>
<!-- Identifying Details -->
<div class="md:col-span-2">
<label class="block text-[0.6875rem] font-bold text-primary uppercase tracking-wider mb-2 ml-1">Identifying Serial/Marks</label>
<input class="w-full bg-surface-container-highest border-none rounded-lg p-4 focus:ring-2 focus:ring-primary/30 transition-all placeholder:text-outline" placeholder="Serial numbers, initials, or specific damage" type="text"/>
</div>
</div>
</div>
<!-- Submission Actions -->
<div class="flex flex-col md:flex-row items-center justify-between gap-4 pt-4">
<div class="flex items-center gap-2 text-on-surface-variant">
<span class="material-symbols-outlined text-primary" style="font-variation-settings: 'FILL' 1;">verified_user</span>
<span class="text-xs font-medium">Secured Institutional Submission</span>
</div>
<div class="flex gap-4 w-full md:w-auto">
<button class="flex-1 md:flex-none px-8 py-4 text-on-surface font-semibold hover:bg-surface-container-high rounded-lg transition-colors" type="button">Discard</button>
<button class="flex-1 md:flex-none px-12 py-4 bg-primary text-on-primary font-bold rounded-lg shadow-xl shadow-primary/20 hover:scale-[1.02] active:scale-95 transition-all" type="submit">Submit Report</button>
</div>
</div>
</div>
</form>
<!-- Helpful Context Bento Piece -->
<section class="mt-20 grid grid-cols-1 md:grid-cols-3 gap-6">
<div class="bg-primary-container/10 p-6 rounded-xl border border-primary/5">
<span class="material-symbols-outlined text-primary mb-3">quick_reference_all</span>
<h4 class="font-headline font-bold text-primary mb-2">Automated Matching</h4>
<p class="text-xs text-on-surface-variant leading-relaxed">Our ledger cross-references submissions every 15 minutes against newly found item entries.</p>
</div>
<div class="bg-surface-container-low p-6 rounded-xl">
<span class="material-symbols-outlined text-secondary mb-3">notifications_active</span>
<h4 class="font-headline font-bold text-on-surface mb-2">Instant Alerts</h4>
<p class="text-xs text-on-surface-variant leading-relaxed">You will receive a mobile and email notification as soon as a potential match is identified.</p>
</div>
<div class="bg-surface-container-low p-6 rounded-xl">
<span class="material-symbols-outlined text-tertiary mb-3">lock_person</span>
<h4 class="font-headline font-bold text-on-surface mb-2">Secure Handover</h4>
<p class="text-xs text-on-surface-variant leading-relaxed">Claims are verified by institutional staff before any physical property is released.</p>
</div>
</section>
</div>
</div>
</main>
<!-- Footer Component -->
<footer class="bg-slate-50 dark:bg-slate-900 border-t border-slate-200/10 w-full py-6 mt-auto flex flex-col md:flex-row justify-between items-center px-12 font-inter text-xs tracking-wide uppercase">
<div class="mb-4 md:mb-0">
<span class="font-manrope font-black text-teal-900 dark:text-teal-100 mr-4">Findora</span>
<span class="text-slate-400">© 2024 Findora Lost &amp; Found. Managed Institutional Stewardship.</span>
</div>
<div class="flex gap-8 text-slate-400">
<a class="hover:text-orange-500 transition-colors" href="#">Privacy Policy</a>
<a class="hover:text-orange-500 transition-colors" href="#">Terms of Service</a>
<a class="hover:text-orange-500 transition-colors" href="#">Support</a>
</div>
</footer>
</body></html>