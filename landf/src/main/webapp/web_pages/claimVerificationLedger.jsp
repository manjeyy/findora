<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Claims Management | Findora Admin</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;family=Inter:wght@300;400;500;600&amp;display=swap" rel="stylesheet"/>
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
                }
            }
        }
    </script>
<style>
        body { font-family: 'Inter', sans-serif; background-color: #f7fafa; }
        h1, h2, h3, .font-headline { font-family: 'Manrope', sans-serif; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
        .custom-scrollbar::-webkit-scrollbar { width: 4px; }
        .custom-scrollbar::-webkit-scrollbar-track { background: transparent; }
        .custom-scrollbar::-webkit-scrollbar-thumb { background: #bec9c8; border-radius: 10px; }
    </style>
</head>
<body class="text-on-background">
<!-- SideNavBar (Authority Source: JSON) -->
<aside class="h-screen w-64 fixed left-0 top-0 bg-slate-100 dark:bg-slate-950 flex flex-col py-8 px-4 font-manrope text-sm z-40">
<div class="mb-10 px-2">
<h1 class="text-lg font-bold text-teal-900 dark:text-teal-100">Findora Admin</h1>
<p class="text-[10px] text-slate-500 uppercase tracking-widest font-semibold">Institutional Ledger</p>
</div>
<nav class="flex-1 space-y-1">
<a class="flex items-center gap-3 px-3 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined" data-icon="dashboard">dashboard</span>
<span>Dashboard</span>
</a>
<a class="flex items-center gap-3 px-3 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined" data-icon="inventory_2">inventory_2</span>
<span>Items</span>
</a>
<a class="flex items-center gap-3 px-3 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined" data-icon="location_on">location_on</span>
<span>Locations</span>
</a>
<a class="flex items-center gap-3 px-3 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined" data-icon="group">group</span>
<span>Users</span>
</a>
<!-- Active State Applied Here per JSON & Protocol -->
<a class="flex items-center gap-3 px-3 py-3 rounded-lg text-teal-900 dark:text-teal-200 font-bold border-r-4 border-orange-500 bg-white/50 dark:bg-slate-900 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined" data-icon="assignment_turned_in">assignment_turned_in</span>
<span>Claims</span>
</a>
<a class="flex items-center gap-3 px-3 py-3 rounded-lg text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined" data-icon="analytics">analytics</span>
<span>Reports</span>
</a>
</nav>
<div class="mt-auto pt-6 border-t border-outline-variant/10">
<button class="w-full flex items-center justify-center gap-2 bg-secondary-container text-on-secondary-container py-3 rounded-lg font-bold hover:shadow-lg transition-all active:scale-95">
<span class="material-symbols-outlined text-sm" data-icon="add">add</span>
                Report Found Item
            </button>
</div>
</aside>
<!-- Main Canvas -->
<main class="ml-64 min-h-screen flex flex-col">
<!-- TopAppBar (Authority Source: JSON) -->
<header class="bg-slate-50 dark:bg-slate-900 sticky top-0 z-30 flex justify-between items-center px-8 py-4 w-full">
<div class="flex items-center gap-6">
<div class="relative flex items-center">
<span class="material-symbols-outlined absolute left-3 text-slate-400" data-icon="search">search</span>
<input class="bg-surface-container-highest border-none rounded-full py-2 pl-10 pr-4 text-sm w-80 focus:ring-2 focus:ring-primary/20" placeholder="Search claims, users, or items..." type="text"/>
</div>
</div>
<div class="flex items-center gap-4">
<button class="p-2 rounded-full hover:bg-slate-200/50 dark:hover:bg-slate-800 transition-colors relative">
<span class="material-symbols-outlined text-slate-500" data-icon="notifications">notifications</span>
<span class="absolute top-2 right-2 w-2 h-2 bg-secondary rounded-full"></span>
</button>
<div class="h-8 w-8 rounded-full overflow-hidden border border-primary/10">
<img alt="User profile" data-alt="professional portrait of a high-level system administrator in a clean modern setting with soft lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDwUKQRQgbtbmFV-mnM9Mis2cq643Zy80lvMYrtAm93EU7-zvUQgVRhSR7DttDxhIQrX02B9Dnw5A5z4MSQUMsbfZzI1C2fEhbR_jXuPJiagLJ1DrnzrJrubEm6mtnH7BLhDs5mWQUGY36lynfJD1rmeZiGaWjc7LjPcUj__MB75hXWt5bguKdEsWmirFs-Y3pSBJQFhyjKCQJufA93jAB8C-YQA85lbvrlTWQLpjgNiozFqOGyHEy6i0_-eRaVmiCKIt6-JNVUyes"/>
</div>
</div>
</header>
<!-- Content Body -->
<section class="p-8 space-y-8">
<!-- Hero / Title Area -->
<div class="flex justify-between items-end">
<div>
<h2 class="text-3xl font-extrabold text-primary tracking-tight font-headline">Claims Stewardship</h2>
<p class="text-on-surface-variant font-body mt-1">Reviewing verification data for institutional property recovery.</p>
</div>
<div class="flex gap-2 bg-surface-container-low p-1 rounded-lg">
<button class="px-4 py-2 bg-surface-container-lowest text-primary font-semibold rounded-md shadow-sm text-sm">All Requests</button>
<button class="px-4 py-2 text-on-surface-variant font-medium rounded-md text-sm hover:bg-white/50 transition-colors">Pending Review</button>
<button class="px-4 py-2 text-on-surface-variant font-medium rounded-md text-sm hover:bg-white/50 transition-colors">Resolved</button>
</div>
</div>
<!-- Stats Overview - Asymmetric Bento Grid Style -->
<div class="grid grid-cols-12 gap-6">
<div class="col-span-12 md:col-span-4 bg-primary text-on-primary p-6 rounded-xl relative overflow-hidden group">
<div class="absolute -right-4 -bottom-4 opacity-10 group-hover:scale-110 transition-transform duration-500">
<span class="material-symbols-outlined text-9xl" data-icon="verified_user">verified_user</span>
</div>
<p class="text-xs font-bold uppercase tracking-widest opacity-70">Awaiting Validation</p>
<h3 class="text-5xl font-black mt-2">42</h3>
<p class="text-sm mt-4 font-medium flex items-center gap-1">
<span class="material-symbols-outlined text-sm" data-icon="arrow_upward">arrow_upward</span>
                        12% increase this week
                    </p>
</div>
<div class="col-span-12 md:col-span-8 bg-surface-container-lowest p-6 rounded-xl shadow-[0_4px_24px_rgba(24,28,29,0.04)] grid grid-cols-3 gap-6">
<div>
<p class="text-xs font-bold text-outline uppercase tracking-widest">Success Rate</p>
<p class="text-3xl font-bold text-primary mt-1">94.2%</p>
<div class="w-full bg-surface-container-high h-1 rounded-full mt-3 overflow-hidden">
<div class="bg-primary h-full w-[94.2%]"></div>
</div>
</div>
<div>
<p class="text-xs font-bold text-outline uppercase tracking-widest">Avg. Resolution</p>
<p class="text-3xl font-bold text-primary mt-1">18h</p>
<p class="text-[10px] text-on-surface-variant mt-3 font-medium">Target: 24h response time</p>
</div>
<div>
<p class="text-xs font-bold text-outline uppercase tracking-widest">Flagged Items</p>
<p class="text-3xl font-bold text-secondary mt-1">03</p>
<p class="text-[10px] text-on-surface-variant mt-3 font-medium">Security oversight required</p>
</div>
</div>
</div>
<!-- The Ledger (Claims Table) -->
<div class="bg-surface-container-lowest rounded-xl shadow-[0_4px_24px_rgba(24,28,29,0.02)] overflow-hidden">
<div class="overflow-x-auto">
<table class="w-full text-left border-collapse">
<thead>
<tr class="bg-surface-container-low">
<th class="px-6 py-4 text-[10px] font-bold text-outline uppercase tracking-[0.15em]">Item Details</th>
<th class="px-6 py-4 text-[10px] font-bold text-outline uppercase tracking-[0.15em]">Claimant</th>
<th class="px-6 py-4 text-[10px] font-bold text-outline uppercase tracking-[0.15em]">Trust Score</th>
<th class="px-6 py-4 text-[10px] font-bold text-outline uppercase tracking-[0.15em]">Ownership Proof</th>
<th class="px-6 py-4 text-[10px] font-bold text-outline uppercase tracking-[0.15em]">Date Filed</th>
<th class="px-6 py-4 text-[10px] font-bold text-outline uppercase tracking-[0.15em] text-right">Actions</th>
</tr>
</thead>
<tbody class="divide-y divide-surface-container-high">
<!-- Row 1 -->
<tr class="hover:bg-surface-container/30 transition-colors group">
<td class="px-6 py-5">
<div class="flex items-center gap-3">
<div class="w-12 h-12 rounded-lg bg-surface-container-high flex items-center justify-center overflow-hidden">
<img alt="Item Preview" class="object-cover w-full h-full" data-alt="close-up photo of a sleek silver modern laptop on a dark desk with soft professional lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDMczof3Ando_O1_NcbiAo2wVFHqHei24RC6fYLtOPwOZOI5yHVCcEcEIATs1p_rKaf9kau1a9TGAqLBU-w8xLgcm8nSFdN-oBwryfFs5ZGYyjMjFwiZNH7Ym_Gyj035TVGedji-T1gdG8VQYf4BJyTxEC6FTK1gLZZ7KGWIFlroWEun4MJ09C5MnggPDOx7JV2xYITHMRZufAJQKcDE9ZZpdRtDINyPGd9sQyQooe0n98EmzOIeHBfKX_laCNVtgbWn_9ajxPoWs8"/>
</div>
<div>
<p class="font-bold text-primary text-sm">MacBook Pro 14"</p>
<p class="text-xs text-on-surface-variant">Serial: #8291-ZX</p>
</div>
</div>
</td>
<td class="px-6 py-5">
<div class="flex items-center gap-2">
<p class="text-sm font-semibold text-on-surface">Alex Rivera</p>
<span class="w-1.5 h-1.5 rounded-full bg-primary" title="Verified ID"></span>
</div>
<p class="text-xs text-outline">Student ID: 49021</p>
</td>
<td class="px-6 py-5">
<div class="flex items-center gap-2">
<div class="px-2 py-0.5 bg-primary-container/20 text-primary-container text-[10px] font-bold rounded">98%</div>
<div class="flex gap-0.5">
<span class="material-symbols-outlined text-[10px] text-primary" data-icon="star" style="font-variation-settings: 'FILL' 1;">star</span>
<span class="material-symbols-outlined text-[10px] text-primary" data-icon="star" style="font-variation-settings: 'FILL' 1;">star</span>
<span class="material-symbols-outlined text-[10px] text-primary" data-icon="star" style="font-variation-settings: 'FILL' 1;">star</span>
</div>
</div>
</td>
<td class="px-6 py-5">
<p class="text-xs text-on-surface-variant italic truncate max-w-[200px]">"I have the purchase receipt from the University Store and the lock screen wallpaper is a..."</p>
</td>
<td class="px-6 py-5">
<p class="text-xs font-medium text-on-surface">Oct 24, 2023</p>
<p class="text-[10px] text-outline">09:42 AM</p>
</td>
<td class="px-6 py-5 text-right">
<div class="flex justify-end gap-2 opacity-0 group-hover:opacity-100 transition-opacity">
<button class="p-2 hover:bg-primary-container/10 text-primary rounded-lg" title="Approve">
<span class="material-symbols-outlined" data-icon="check_circle">check_circle</span>
</button>
<button class="p-2 hover:bg-error-container/20 text-error rounded-lg" title="Reject">
<span class="material-symbols-outlined" data-icon="cancel">cancel</span>
</button>
<button class="p-2 hover:bg-surface-container-highest text-outline rounded-lg" title="More Info">
<span class="material-symbols-outlined" data-icon="contact_support">contact_support</span>
</button>
</div>
</td>
</tr>
<!-- Row 2 -->
<tr class="hover:bg-surface-container/30 transition-colors group">
<td class="px-6 py-5">
<div class="flex items-center gap-3">
<div class="w-12 h-12 rounded-lg bg-surface-container-high flex items-center justify-center">
<span class="material-symbols-outlined text-outline" data-icon="wallet">wallet</span>
</div>
<div>
<p class="font-bold text-primary text-sm">Leather Wallet</p>
<p class="text-xs text-on-surface-variant">Brown, Fossil Brand</p>
</div>
</div>
</td>
<td class="px-6 py-5">
<div class="flex items-center gap-2">
<p class="text-sm font-semibold text-on-surface">Sarah Jenkins</p>
</div>
<p class="text-xs text-outline">Faculty: History</p>
</td>
<td class="px-6 py-5">
<div class="flex items-center gap-2">
<div class="px-2 py-0.5 bg-secondary-container/20 text-secondary text-[10px] font-bold rounded">65%</div>
<div class="flex gap-0.5">
<span class="material-symbols-outlined text-[10px] text-secondary" data-icon="star" style="font-variation-settings: 'FILL' 1;">star</span>
<span class="material-symbols-outlined text-[10px] text-outline-variant" data-icon="star">star</span>
<span class="material-symbols-outlined text-[10px] text-outline-variant" data-icon="star">star</span>
</div>
</div>
</td>
<td class="px-6 py-5">
<p class="text-xs text-on-surface-variant italic truncate max-w-[200px]">"Contains my state ID and a photo of my dog in the card slot. Left it near the cafe..."</p>
</td>
<td class="px-6 py-5">
<p class="text-xs font-medium text-on-surface">Oct 23, 2023</p>
<p class="text-[10px] text-outline">03:15 PM</p>
</td>
<td class="px-6 py-5 text-right">
<div class="flex justify-end gap-2 opacity-0 group-hover:opacity-100 transition-opacity">
<button class="p-2 hover:bg-primary-container/10 text-primary rounded-lg" title="Approve">
<span class="material-symbols-outlined" data-icon="check_circle">check_circle</span>
</button>
<button class="p-2 hover:bg-error-container/20 text-error rounded-lg" title="Reject">
<span class="material-symbols-outlined" data-icon="cancel">cancel</span>
</button>
<button class="p-2 hover:bg-surface-container-highest text-outline rounded-lg" title="More Info">
<span class="material-symbols-outlined" data-icon="contact_support">contact_support</span>
</button>
</div>
</td>
</tr>
<!-- Row 3 - High Risk -->
<tr class="hover:bg-error-container/5 bg-error-container/10 transition-colors group">
<td class="px-6 py-5">
<div class="flex items-center gap-3">
<div class="w-12 h-12 rounded-lg bg-surface-container-high flex items-center justify-center overflow-hidden border-2 border-error/20">
<img alt="Item Preview" class="object-cover w-full h-full" data-alt="product shot of a white luxury wristwatch on a white surface with elegant soft shadows" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDAue5S_JcLHA_eihP9T_cl5YTd-x_7tHlk_VlhqYmcneHLnmoygvwuOldyTEZbPu-MU95EeTLp99M_Qj8BWwyex8noD0_xeJIR85gweB9M5STUaTezbqRpCpU7GAYxwBvxveCPd2DHMM6NwXmbxJhwILhhEi-mCKBEuyBAQ40ROvGWmLuzVDNaevutSPfiSvVW1JPa1M0EBvlAgMqCVJnjwca9Og-RDtmk3-NKlygSwGS_HLJ7Fg5VloTx6YT6rPSVyVZO6jMWyVQ"/>
</div>
<div>
<p class="font-bold text-error text-sm">Rolex Oyster</p>
<p class="text-xs text-on-surface-variant uppercase tracking-tighter font-bold">High Value Flag</p>
</div>
</div>
</td>
<td class="px-6 py-5">
<div class="flex items-center gap-2">
<p class="text-sm font-semibold text-on-surface">Mark Thompson</p>
<span class="material-symbols-outlined text-error text-xs" data-icon="warning">warning</span>
</div>
<p class="text-xs text-outline">Guest: ID Pending</p>
</td>
<td class="px-6 py-5">
<div class="flex items-center gap-2">
<div class="px-2 py-0.5 bg-error-container text-error text-[10px] font-bold rounded">12%</div>
<span class="text-[10px] text-error font-medium">New Account</span>
</div>
</td>
<td class="px-6 py-5">
<p class="text-xs text-on-surface-variant italic truncate max-w-[200px]">"I dropped it while walking through the library courtyard yesterday afternoon..."</p>
</td>
<td class="px-6 py-5">
<p class="text-xs font-medium text-on-surface">Oct 23, 2023</p>
<p class="text-[10px] text-outline">05:59 PM</p>
</td>
<td class="px-6 py-5 text-right">
<div class="flex justify-end gap-2 opacity-100">
<button class="px-3 py-1.5 bg-primary text-on-primary text-[10px] font-bold rounded uppercase tracking-wide hover:shadow-md transition-all">Verify Now</button>
</div>
</td>
</tr>
</tbody>
</table>
</div>
<div class="p-6 bg-surface-container-lowest flex justify-between items-center border-t border-surface-container">
<p class="text-xs text-on-surface-variant">Showing 3 of 42 pending claims</p>
<div class="flex gap-2">
<button class="w-8 h-8 flex items-center justify-center rounded-lg border border-outline-variant hover:bg-surface-container transition-colors">
<span class="material-symbols-outlined text-sm" data-icon="chevron_left">chevron_left</span>
</button>
<button class="w-8 h-8 flex items-center justify-center rounded-lg bg-primary text-on-primary text-xs font-bold">1</button>
<button class="w-8 h-8 flex items-center justify-center rounded-lg border border-outline-variant hover:bg-surface-container transition-colors text-xs font-medium">2</button>
<button class="w-8 h-8 flex items-center justify-center rounded-lg border border-outline-variant hover:bg-surface-container transition-colors">
<span class="material-symbols-outlined text-sm" data-icon="chevron_right">chevron_right</span>
</button>
</div>
</div>
</div>
<!-- Validation Protocol - Asymmetric Section -->
<div class="grid grid-cols-1 md:grid-cols-2 gap-8 mt-12">
<div class="p-8 rounded-2xl bg-surface-container-highest/30 border border-outline-variant/10">
<h4 class="text-lg font-bold text-primary mb-4 flex items-center gap-2">
<span class="material-symbols-outlined" data-icon="security">security</span>
                        Institutional Security Protocols
                    </h4>
<div class="space-y-4">
<div class="flex items-start gap-4 p-4 bg-white rounded-xl shadow-sm">
<span class="material-symbols-outlined text-secondary" data-icon="account_balance">account_balance</span>
<div>
<p class="text-sm font-bold text-on-surface">Dual-Factor Recovery</p>
<p class="text-xs text-on-surface-variant">Claims for items over $500 require physical ID verification and a digital claim token.</p>
</div>
</div>
<div class="flex items-start gap-4 p-4 bg-white rounded-xl shadow-sm">
<span class="material-symbols-outlined text-primary" data-icon="history_edu">history_edu</span>
<div>
<p class="text-sm font-bold text-on-surface">Stewardship Ledger</p>
<p class="text-xs text-on-surface-variant">Every action taken on a claim is cryptographically signed and stored for 7 years.</p>
</div>
</div>
</div>
</div>
<div class="relative rounded-2xl overflow-hidden min-h-[250px] group">
<img alt="Support" class="absolute inset-0 w-full h-full object-cover" data-alt="high-angle shot of clean office desk with minimalist electronics and glass paperweights reflecting soft natural daylight" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBYhvuoqnMzQvthTKCXdaIchRId8kM8whU9KgPxbhF3C4ukfwyMAGsEEyexn6cKJjUYUAatybs_28YlSt5W9TcPvS6u7tcCZnQg3yMvW5zJBCDMjp2-iofhptJnJY3bHiT9ovOPHVkWgecisTqZgu-U_358U_rv4BVLdjjKVeH2BpsSXrVzA3bPfYVneckg1MT35kKSs_YqRrzyUOVa0iKf8kAUE4XTZFzBim5lp5BbTl7LF7esskCESeSPZOX_rD01O49ea4wuXFM"/>
<div class="absolute inset-0 bg-primary/80 backdrop-blur-sm p-8 flex flex-col justify-end">
<p class="text-white text-xl font-bold font-headline leading-tight">Need assistance with high-priority validation?</p>
<p class="text-primary-fixed text-sm mt-2 opacity-90">Our secondary verification team is available for luxury items and sensitive data storage devices.</p>
<button class="mt-6 self-start px-6 py-2 bg-secondary text-on-secondary font-bold rounded-lg text-sm transition-transform hover:scale-105">Contact Specialist</button>
</div>
</div>
</div>
</section>
<!-- Footer (Authority Source: JSON) -->
<footer class="w-full py-6 mt-auto border-t border-slate-200/10 bg-slate-50 dark:bg-slate-900 flex flex-col md:flex-row justify-between items-center px-12 font-inter text-xs tracking-wide uppercase">
<div class="font-manrope font-black text-teal-900 dark:text-teal-100">Findora</div>
<div class="text-slate-400 py-4 md:py-0">© 2024 Findora Lost &amp; Found. Managed Institutional Stewardship.</div>
<div class="flex gap-6">
<a class="text-slate-400 hover:text-orange-500 transition-colors opacity-80 hover:opacity-100" href="#">Privacy Policy</a>
<a class="text-slate-400 hover:text-orange-500 transition-colors opacity-80 hover:opacity-100" href="#">Terms of Service</a>
<a class="text-slate-400 hover:text-orange-500 transition-colors opacity-80 hover:opacity-100" href="#">Support</a>
</div>
</footer>
</main>
</body></html>