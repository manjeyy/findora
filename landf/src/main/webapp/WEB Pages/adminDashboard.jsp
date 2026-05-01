<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Admin Console | Findora</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&amp;family=Plus+Jakarta+Sans:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
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
                }
            }
        }
    </script>
<style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        h1, h2, h3, h4 { font-family: 'Manrope', sans-serif; letter-spacing: -0.02em; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
        .glass-card { backdrop-filter: blur(20px); -webkit-backdrop-filter: blur(20px); }
    </style>
</head>
<body class="bg-surface text-on-surface min-h-screen flex overflow-hidden">
<!-- SideNavBar Component -->
<aside class="hidden md:flex flex-col h-full py-8 w-72 bg-surface-container-low border-r-0 fixed left-0 top-0">
<div class="text-lg font-black text-teal-900 px-6 py-8">Findora</div>
<div class="px-6 mb-8 flex items-center gap-4">
<div class="relative">
<img alt="Admin Avatar" class="w-12 h-12 rounded-full object-cover" data-alt="Close-up portrait of a professional man in a tailored suit with a confident, calm expression against a soft studio background" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBD02clhz_vvPavApLFKDkGUJWngihPS7mWvdHKysI1LFqjFVhr1N7muE6C2wcF9wX13yrhQR8TSafjmEkax8uEQE6nIt0wjpNJ5wx5lhofaFmpxLVsGD21Sg1CazrNuK7GvJmnedw-lJvohBM0z2hDjwQknpY2Gx1NVDKbgxJUSso4XulQm515sx1fSIyLQMrdxul4twMZE-Od7uSa5J_swYP_qGIkFCUHbd3OLpuSHVSkXlpPBSMJAW6RMP9rvnq6QBTOzq5sRHc"/>
<div class="absolute bottom-0 right-0 w-3 h-3 bg-tertiary-container rounded-full border-2 border-surface-container-low"></div>
</div>
<div>
<h3 class="text-sm font-bold text-on-surface">Admin Console</h3>
<p class="text-xs text-on-surface-variant">System Admin</p>
</div>
</div>
<nav class="flex-1 space-y-1">
<!-- Overview (Active) -->
<a class="flex items-center gap-4 bg-surface-container-lowest text-primary rounded-l-full ml-4 pl-6 py-3 font-semibold transition-all" href="#">
<span class="material-symbols-outlined" data-icon="dashboard">dashboard</span>
<span>Overview</span>
</a>
<!-- Claims -->
<a class="flex items-center gap-4 text-outline pl-10 py-3 hover:bg-white/50 transition-all translate-x-1 duration-200" href="#">
<span class="material-symbols-outlined" data-icon="verified">verified</span>
<span>Claims</span>
</a>
<!-- Users -->
<a class="flex items-center gap-4 text-outline pl-10 py-3 hover:bg-white/50 transition-all translate-x-1 duration-200" href="#">
<span class="material-symbols-outlined" data-icon="group">group</span>
<span>Users</span>
</a>
<!-- Items (Custom added for context) -->
<a class="flex items-center gap-4 text-outline pl-10 py-3 hover:bg-white/50 transition-all translate-x-1 duration-200" href="#">
<span class="material-symbols-outlined" data-icon="inventory_2">inventory_2</span>
<span>All Items</span>
</a>
<!-- Settings -->
<a class="flex items-center gap-4 text-outline pl-10 py-3 hover:bg-white/50 transition-all translate-x-1 duration-200" href="#">
<span class="material-symbols-outlined" data-icon="settings">settings</span>
<span>Settings</span>
</a>
</nav>
<div class="px-6 mt-auto">
<button class="w-full py-4 bg-primary text-on-primary rounded-xl font-bold flex items-center justify-center gap-2 shadow-sm hover:opacity-90 transition-opacity">
<span class="material-symbols-outlined" data-icon="file_download">file_download</span>
                Export Report
            </button>
</div>
</aside>
<!-- Main Content Canvas -->
<main class="flex-1 md:ml-72 min-h-screen overflow-y-auto px-6 md:px-12 py-10 pb-32">
<!-- Header / Top Bar Area -->
<header class="flex justify-between items-end mb-12">
<div>
<span class="text-sm font-bold uppercase tracking-widest text-primary mb-2 block">Executive Overview</span>
<h1 class="text-4xl font-extrabold text-on-surface">Findora Dashboard</h1>
</div>
<div class="flex gap-4">
<div class="h-12 w-12 rounded-full bg-surface-container-highest flex items-center justify-center text-on-surface-variant hover:bg-surface-container-high cursor-pointer transition-colors">
<span class="material-symbols-outlined" data-icon="search">search</span>
</div>
<div class="h-12 w-12 rounded-full bg-surface-container-highest flex items-center justify-center text-on-surface-variant hover:bg-surface-container-high cursor-pointer transition-colors">
<span class="material-symbols-outlined" data-icon="notifications">notifications</span>
</div>
</div>
</header>
<!-- Bento Grid Metrics Section -->
<section class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-12">
<!-- Total Users -->
<div class="md:col-span-1 bg-surface-container-lowest p-8 rounded-xl flex flex-col justify-between group hover:shadow-lg transition-all duration-300">
<div>
<div class="w-12 h-12 bg-primary-container/10 text-primary rounded-lg flex items-center justify-center mb-6">
<span class="material-symbols-outlined" data-icon="person">person</span>
</div>
<p class="text-sm font-medium text-on-surface-variant mb-1">Total Users</p>
<h2 class="text-4xl font-bold text-on-surface">12,482</h2>
</div>
<div class="mt-6 flex items-center gap-2 text-tertiary font-bold text-sm">
<span class="material-symbols-outlined text-sm" data-icon="trending_up">trending_up</span>
                    +12% from last month
                </div>
</div>
<!-- Active Items -->
<div class="md:col-span-2 bg-primary text-on-primary p-8 rounded-xl relative overflow-hidden group">
<div class="relative z-10">
<div class="w-12 h-12 bg-white/20 text-white rounded-lg flex items-center justify-center mb-6">
<span class="material-symbols-outlined" data-icon="inventory">inventory</span>
</div>
<div class="flex justify-between items-end">
<div>
<p class="text-sm font-medium opacity-80 mb-1">Active Found Items</p>
<h2 class="text-5xl font-extrabold">2,841</h2>
</div>
<div class="text-right">
<p class="text-xs opacity-70 mb-2 uppercase tracking-tighter">Inventory Health</p>
<div class="h-1 w-32 bg-white/20 rounded-full overflow-hidden">
<div class="h-full bg-white w-[75%]"></div>
</div>
</div>
</div>
</div>
<!-- Abstract signature gradient background element -->
<div class="absolute -right-10 -bottom-10 w-48 h-48 bg-gradient-to-br from-primary-container to-teal-500 rounded-full opacity-50 group-hover:scale-110 transition-transform duration-500"></div>
</div>
<!-- Pending Claims -->
<div class="md:col-span-1 bg-secondary-container p-8 rounded-xl flex flex-col justify-between text-on-secondary-container">
<div>
<div class="w-12 h-12 bg-white/30 rounded-lg flex items-center justify-center mb-6">
<span class="material-symbols-outlined" data-icon="pending_actions">pending_actions</span>
</div>
<p class="text-sm font-medium opacity-80 mb-1">Pending Claims</p>
<h2 class="text-4xl font-bold">142</h2>
</div>
<div class="mt-6">
<button class="text-sm font-bold flex items-center gap-1 hover:gap-2 transition-all">
                        Review Now <span class="material-symbols-outlined text-sm" data-icon="arrow_forward">arrow_forward</span>
</button>
</div>
</div>
</section>
<!-- Main Dashboard Content Area -->
<div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
<!-- Activity Feed -->
<section class="lg:col-span-2 space-y-6">
<div class="flex items-center justify-between">
<h3 class="text-xl font-bold text-on-surface">Recent System Activity</h3>
<button class="text-sm font-bold text-primary flex items-center gap-1">
                        View Log <span class="material-symbols-outlined text-sm" data-icon="list">list</span>
</button>
</div>
<div class="bg-surface-container-lowest rounded-xl p-2">
<!-- Activity Item 1 -->
<div class="flex items-center gap-6 p-6 hover:bg-surface-container-low rounded-lg transition-colors">
<div class="w-10 h-10 rounded-full bg-primary-fixed-dim/20 flex items-center justify-center flex-shrink-0">
<span class="material-symbols-outlined text-primary" data-icon="check_circle">check_circle</span>
</div>
<div class="flex-1">
<p class="text-on-surface font-semibold">New Claim Verified</p>
<p class="text-sm text-on-surface-variant">MacBook Pro M2 - Found at Central Terminal</p>
</div>
<div class="text-right text-xs text-outline shrink-0">
                            2 mins ago
                        </div>
</div>
<!-- Activity Item 2 -->
<div class="flex items-center gap-6 p-6 hover:bg-surface-container-low rounded-lg transition-colors">
<div class="w-10 h-10 rounded-full bg-secondary-fixed/30 flex items-center justify-center flex-shrink-0">
<span class="material-symbols-outlined text-secondary" data-icon="report">report</span>
</div>
<div class="flex-1">
<p class="text-on-surface font-semibold">New High-Value Item Reported</p>
<p class="text-sm text-on-surface-variant">Diamond Rolex - Found at North Wing Plaza</p>
</div>
<div class="text-right text-xs text-outline shrink-0">
                            14 mins ago
                        </div>
</div>
<!-- Activity Item 3 -->
<div class="flex items-center gap-6 p-6 hover:bg-surface-container-low rounded-lg transition-colors">
<div class="w-10 h-10 rounded-full bg-tertiary-fixed-dim/30 flex items-center justify-center flex-shrink-0">
<span class="material-symbols-outlined text-tertiary" data-icon="person_add">person_add</span>
</div>
<div class="flex-1">
<p class="text-on-surface font-semibold">New User Registration</p>
<p class="text-sm text-on-surface-variant">Elena Vance (Silver Status Custodian)</p>
</div>
<div class="text-right text-xs text-outline shrink-0">
                            45 mins ago
                        </div>
</div>
</div>
</section>
<!-- Side Cards (System Health / Stats) -->
<section class="space-y-6">
<h3 class="text-xl font-bold text-on-surface">Custodian Performance</h3>
<div class="bg-surface-container-lowest p-8 rounded-xl border border-outline-variant/15">
<h4 class="text-sm font-bold text-outline uppercase tracking-widest mb-6">Efficiency Rating</h4>
<div class="flex flex-col items-center text-center">
<div class="w-32 h-32 rounded-full border-[6px] border-primary-fixed flex items-center justify-center mb-4">
<span class="text-4xl font-extrabold text-primary">94%</span>
</div>
<p class="font-bold text-on-surface mb-1">Excellent Recovery Rate</p>
<p class="text-sm text-on-surface-variant">You are in the top 3% of global custodians this week.</p>
</div>
</div>
<div class="bg-surface-container-low p-6 rounded-xl">
<div class="flex items-center gap-4 mb-4">
<span class="material-symbols-outlined text-secondary" data-icon="bolt">bolt</span>
<h4 class="font-bold text-on-surface">System Status</h4>
</div>
<div class="space-y-3">
<div class="flex justify-between items-center text-sm">
<span class="text-on-surface-variant">Database Latency</span>
<span class="text-tertiary font-bold">12ms</span>
</div>
<div class="flex justify-between items-center text-sm">
<span class="text-on-surface-variant">AI Image Matcher</span>
<span class="text-tertiary font-bold">Online</span>
</div>
</div>
</div>
</section>
</div>
</main>
<!-- Bottom Navigation Bar (Mobile Only) -->
<nav class="md:hidden fixed bottom-0 left-0 w-full flex justify-around items-center px-4 pb-6 pt-3 bg-white/80 dark:bg-slate-900/80 backdrop-blur-xl z-50 rounded-t-3xl shadow-[0_-8px_24px_rgba(24,28,29,0.06)]">
<a class="flex flex-col items-center justify-center bg-teal-50 dark:bg-teal-900/30 text-teal-700 dark:text-teal-300 rounded-2xl px-5 py-2 tap-highlight-none active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined" data-icon="home">home</span>
<span class="text-[11px] font-medium mt-1">Home</span>
</a>
<a class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 px-5 py-2 tap-highlight-none active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined" data-icon="search">search</span>
<span class="text-[11px] font-medium mt-1">Search</span>
</a>
<a class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 px-5 py-2 tap-highlight-none active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined" data-icon="add_circle">add_circle</span>
<span class="text-[11px] font-medium mt-1">Report</span>
</a>
<a class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 px-5 py-2 tap-highlight-none active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined" data-icon="person">person</span>
<span class="text-[11px] font-medium mt-1">Profile</span>
</a>
</nav>
<!-- Contextual FAB - Restricted to Dashboard Context -->
<div class="fixed bottom-10 right-10 hidden md:block">
<button class="bg-secondary text-on-primary w-16 h-16 rounded-full flex items-center justify-center shadow-2xl hover:scale-105 active:scale-95 transition-all group">
<span class="material-symbols-outlined text-3xl" data-icon="add" style="font-variation-settings: 'FILL' 0, 'wght' 700;">add</span>
<span class="absolute right-full mr-4 bg-on-surface text-surface text-xs px-4 py-2 rounded-lg opacity-0 group-hover:opacity-100 transition-opacity whitespace-nowrap pointer-events-none">Report Found Item</span>
</button>
</div>
</body></html>