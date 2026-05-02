<!DOCTYPE html><html class="light" lang="en"><head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Findora Admin | Location Dashboard</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;family=Inter:wght@400;500;600&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet">
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
        body { font-family: 'Inter', sans-serif; }
        h1, h2, h3 { font-family: 'Manrope', sans-serif; }
    </style>
</head>
<body class="bg-surface text-on-surface">
<aside class="bg-slate-100 dark:bg-slate-950 h-screen w-64 fixed left-0 top-0 flex flex-col h-full py-8 px-4 font-manrope text-sm z-50">
<div class="mb-8 px-2">
<h1 class="text-lg font-bold text-teal-900 dark:text-teal-100" style="">Findora Admin</h1>
<p class="text-slate-500 dark:text-slate-400 text-[10px] tracking-widest uppercase" style="">Institutional Ledger</p>
</div>
<nav class="flex-1 space-y-1">
<a class="flex items-center gap-3 px-3 py-2 text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out group" href="#" style="">
<span class="material-symbols-outlined text-[20px]" style="">dashboard</span>
<span class="" style="">Dashboard</span>
</a>
<a class="flex items-center gap-3 px-3 py-2 text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out group" href="#" style="">
<span class="material-symbols-outlined text-[20px]" style="">inventory_2</span>
<span class="" style="">Items</span>
</a>
<a class="flex items-center gap-3 px-3 py-2 text-teal-900 dark:text-teal-200 font-bold border-r-4 border-orange-500 bg-white dark:bg-slate-900 transition-all duration-300 ease-in-out" href="#" style="">
<span class="material-symbols-outlined text-[20px]" style="font-variation-settings: &quot;FILL&quot; 1;">location_on</span>
<span class="" style="">Locations</span>
</a>
<a class="flex items-center gap-3 px-3 py-2 text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out group" href="#" style="">
<span class="material-symbols-outlined text-[20px]" style="">group</span>
<span class="" style="">Users</span>
</a>
<a class="flex items-center gap-3 px-3 py-2 text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out group" href="#" style="">
<span class="material-symbols-outlined text-[20px]" style="">assignment_turned_in</span>
<span class="" style="">Claims</span>
</a>
<a class="flex items-center gap-3 px-3 py-2 text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out group" href="#" style="">
<span class="material-symbols-outlined text-[20px]" style="">analytics</span>
<span class="" style="">Reports</span>
</a>
</nav>
<div class="mt-auto">
<button class="w-full bg-secondary text-white py-3 rounded-lg flex items-center justify-center gap-2 hover:bg-on-secondary-fixed-variant transition-all active:scale-95 shadow-sm" style="">
<span class="material-symbols-outlined text-[18px]" style="">add</span>
<span class="font-bold" style="">Report Found Item</span>
</button>
</div>
</aside>
<main class="ml-64 min-h-screen">
<header class="sticky top-0 z-40 bg-slate-50 dark:bg-slate-900 flex justify-between items-center px-8 py-4 w-full">
<div class="flex items-center gap-6">
<div class="relative">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 text-[18px]" style="">search</span>
<input class="pl-10 pr-4 py-2 bg-surface-container-low border-none rounded-full text-sm focus:ring-2 focus:ring-primary w-80 font-body" placeholder="Search institutional data..." type="text">
</div>
</div>
<div class="flex items-center gap-4">
<button class="p-2 text-slate-500 hover:bg-slate-200/50 rounded-full transition-colors relative" style="">
<span class="material-symbols-outlined" style="">notifications</span>
<span class="absolute top-2 right-2 w-2 h-2 bg-secondary rounded-full"></span>
</button>
<div class="flex items-center gap-3 pl-4 border-l border-slate-200 dark:border-slate-800">
<div class="text-right">
<p class="text-sm font-bold text-teal-900 dark:text-teal-100" style="">Location Admin</p>
<p class="text-[10px] text-slate-500 uppercase" style="">Primary Access</p>
</div>
<div class="w-10 h-10 rounded-full bg-primary overflow-hidden border-2 border-surface-container-highest">
<img alt="User profile" class="w-full h-full object-cover" data-alt="professional portrait of a man with spectacles in a modern office environment, soft daylight, sharp focus" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDnenuREyydthC4Hp_4Q17NC3X2dZpDRZRHyvvH1wzKbWQDiou0wTKWoG_pdxsyH5qVSy8-oTUyOXLTmvVzqO8-o7W1WCxq0QHtB3CpS76cJOAWI0ZkwWEUyjvZVQIaNq8D9bd0dRo5cL34UzlwK2a6-5P83hSfvpR1agHPhFIWUotAvYTUKCbKIqN8laGrIUuITonMECIkutUUBN5dCrhQElYiWytNSCB_d1HhDt8WZFIRKSZ3oe2wcHuuKJYzUOLIQDvphFMJ9ig" style="">
</div>
</div>
</div>
</header>
<section class="p-8">
<div class="mb-8 flex justify-between items-end">
<div>
<h2 class="text-3xl font-extrabold text-primary tracking-tight" style="">Location Admin Overview</h2>
<p class="text-on-surface-variant font-medium" style="">Monitoring Central Campus Distribution Hubs</p>
</div>
<div class="flex gap-3">
<button class="px-5 py-2.5 bg-surface-container-lowest text-primary font-bold rounded-lg hover:bg-surface-container-high transition-colors flex items-center gap-2 text-sm shadow-sm" style="">
<span class="material-symbols-outlined text-[18px]" style="">add_location</span>
                        Add Location
                    </button>
<button class="px-5 py-2.5 bg-primary text-white font-bold rounded-lg hover:bg-primary-container transition-colors flex items-center gap-2 text-sm shadow-sm" style="">
<span class="material-symbols-outlined text-[18px]" style="">list_alt</span>
                        View Listed Items
                    </button>
</div>
</div>
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-10">
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm relative overflow-hidden group">
<div class="flex justify-between items-start mb-4">
<div class="p-2 bg-primary-fixed text-primary rounded-lg">
<span class="material-symbols-outlined" style="">inventory</span>
</div>
<span class="text-secondary text-xs font-bold" style="">+12% vs LW</span>
</div>
<p class="text-outline text-xs uppercase tracking-wider font-bold mb-1" style="">Total Lost Items</p>
<p class="text-3xl font-black text-on-surface" style="">1,284</p>
<div class="absolute -right-4 -bottom-4 opacity-5 group-hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-8xl" style="">search</span>
</div>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm relative overflow-hidden group">
<div class="flex justify-between items-start mb-4">
<div class="p-2 bg-tertiary-fixed text-tertiary rounded-lg">
<span class="material-symbols-outlined" style="font-variation-settings: &quot;FILL&quot; 1;">check_circle</span>
</div>
<span class="text-primary text-xs font-bold" style="">+5.2% vs LW</span>
</div>
<p class="text-outline text-xs uppercase tracking-wider font-bold mb-1" style="">Total Found Items</p>
<p class="text-3xl font-black text-on-surface" style="">942</p>
<div class="absolute -right-4 -bottom-4 opacity-5 group-hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-8xl" style="">inventory_2</span>
</div>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm relative overflow-hidden group">
<div class="flex justify-between items-start mb-4">
<div class="p-2 bg-secondary-fixed text-on-secondary-container rounded-lg">
<span class="material-symbols-outlined" style="font-variation-settings: &quot;FILL&quot; 1;">handshake</span>
</div>
<span class="text-outline text-xs font-bold" style="">Stable</span>
</div>
<p class="text-outline text-xs uppercase tracking-wider font-bold mb-1" style="">Total Claimed Items</p>
<p class="text-3xl font-black text-on-surface" style="">715</p>
<div class="absolute -right-4 -bottom-4 opacity-5 group-hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-8xl" style="">how_to_reg</span>
</div>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm relative overflow-hidden group">
<div class="flex justify-between items-start mb-4">
<div class="p-2 bg-error-container text-on-error-container rounded-lg">
<span class="material-symbols-outlined" style="font-variation-settings: &quot;FILL&quot; 1;">priority_high</span>
</div>
<span class="text-error font-bold text-xs" style="">High Alert</span>
</div>
<p class="text-outline text-xs uppercase tracking-wider font-bold mb-1" style="">Pending Reports</p>
<p class="text-3xl font-black text-on-surface" style="">43</p>
<div class="absolute -right-4 -bottom-4 opacity-5 group-hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-8xl" style="">error</span>
</div>
</div>
</div>
<div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
<div class="lg:col-span-2 space-y-8">
<div class="bg-surface-container-lowest rounded-xl p-8 shadow-sm">
<div class="flex justify-between items-center mb-6">
<h3 class="text-xl font-bold text-primary" style="">Item Monitoring Ledger</h3>
<div class="flex gap-2">
<button class="px-3 py-1 bg-surface-container-low text-primary text-xs font-bold rounded-lg border border-outline-variant/15" style="">Daily</button>
<button class="px-3 py-1 bg-primary text-white text-xs font-bold rounded-lg" style="">Weekly</button>
</div>
</div>
<div class="overflow-x-auto">
<table class="w-full text-left">
<thead>
<tr class="bg-surface-container-low text-outline text-[10px] uppercase tracking-widest font-bold">
<th class="py-4 px-4 rounded-l-lg" style="">Item Type</th>
<th class="py-4 px-4" style="">Identifier</th>
<th class="py-4 px-4" style="">Status</th>
<th class="py-4 px-4" style="">Reported By</th>
<th class="py-4 px-4 rounded-r-lg" style="">Risk Level</th>
</tr>
</thead>
<tbody class="divide-y divide-surface-container">
<tr class="group hover:bg-surface-container-low transition-colors">
<td class="py-5 px-4 font-bold text-on-surface flex items-center gap-3" style="">
<div class="w-8 h-8 rounded bg-slate-100 flex items-center justify-center">
<span class="material-symbols-outlined text-slate-500" style="">laptop_mac</span>
</div>
                                            MacBook Pro M2
                                        </td>
<td class="py-5 px-4 text-sm text-outline-variant font-mono" style="">#LP-20491</td>
<td class="py-5 px-4" style="">
<span class="px-3 py-1 bg-tertiary/10 text-tertiary text-[10px] font-bold rounded-full uppercase" style="">Processing</span>
</td>
<td class="py-5 px-4 text-sm text-on-surface-variant font-medium" style="">John Smith</td>
<td class="py-5 px-4" style="">
<div class="w-full bg-surface-container-high h-1.5 rounded-full overflow-hidden">
<div class="bg-error h-full w-[85%]"></div>
</div>
</td>
</tr>
<tr class="group hover:bg-surface-container-low transition-colors">
<td class="py-5 px-4 font-bold text-on-surface flex items-center gap-3" style="">
<div class="w-8 h-8 rounded bg-slate-100 flex items-center justify-center">
<span class="material-symbols-outlined text-slate-500" style="">key</span>
</div>
                                            Keyring (Silver)
                                        </td>
<td class="py-5 px-4 text-sm text-outline-variant font-mono" style="">#LP-20495</td>
<td class="py-5 px-4" style="">
<span class="px-3 py-1 bg-primary-container/10 text-primary text-[10px] font-bold rounded-full uppercase" style="">Staged</span>
</td>
<td class="py-5 px-4 text-sm text-on-surface-variant font-medium" style="">Emily Davis</td>
<td class="py-5 px-4" style="">
<div class="w-full bg-surface-container-high h-1.5 rounded-full overflow-hidden">
<div class="bg-secondary h-full w-[25%]"></div>
</div>
</td>
</tr>
<tr class="group hover:bg-surface-container-low transition-colors">
<td class="py-5 px-4 font-bold text-on-surface flex items-center gap-3" style="">
<div class="w-8 h-8 rounded bg-slate-100 flex items-center justify-center">
<span class="material-symbols-outlined text-slate-500" style="">wallet</span>
</div>
                                            Leather Wallet
                                        </td>
<td class="py-5 px-4 text-sm text-outline-variant font-mono" style="">#LP-20502</td>
<td class="py-5 px-4" style="">
<span class="px-3 py-1 bg-secondary-container/10 text-secondary text-[10px] font-bold rounded-full uppercase" style="">Verified</span>
</td>
<td class="py-5 px-4 text-sm text-on-surface-variant font-medium" style="">Marc Chen</td>
<td class="py-5 px-4" style="">
<div class="w-full bg-surface-container-high h-1.5 rounded-full overflow-hidden">
<div class="bg-primary h-full w-[60%]"></div>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<div class="grid grid-cols-2 gap-6">
<div class="bg-primary text-white p-8 rounded-2xl overflow-hidden relative shadow-lg">
<h3 class="text-xl font-bold mb-2" style="">Central Library Hub</h3>
<p class="text-primary-fixed-dim text-sm mb-6" style="">Primary Collection point for north campus items.</p>
<div class="flex items-center gap-4">
<div>
<p class="text-2xl font-black" style="">154</p>
<p class="text-[10px] uppercase font-bold opacity-70" style="">Current Items</p>
</div>
<div class="w-px h-10 bg-white/20"></div>
<div>
<p class="text-2xl font-black" style="">98%</p>
<p class="text-[10px] uppercase font-bold opacity-70" style="">Claim Rate</p>
</div>
</div>
<span class="material-symbols-outlined absolute -top-10 -right-10 text-[200px] opacity-10 pointer-events-none" style="">auto_stories</span>
</div>
<div class="bg-secondary-container p-8 rounded-2xl overflow-hidden relative shadow-lg text-on-secondary-container">
<h3 class="text-xl font-bold mb-2" style="">Sports Complex Hub</h3>
<p class="text-on-secondary-fixed-variant text-sm mb-6" style="">South quadrant secondary ledger active.</p>
<div class="flex items-center gap-4">
<div>
<p class="text-2xl font-black" style="">42</p>
<p class="text-[10px] uppercase font-bold opacity-70" style="">Pending</p>
</div>
<div class="w-px h-10 bg-on-secondary-container/20"></div>
<button class="ml-auto bg-on-secondary-container text-white p-2 rounded-full shadow-lg active:scale-95 transition-transform" style="">
<span class="material-symbols-outlined" style="">arrow_forward</span>
</button>
</div>
<span class="material-symbols-outlined absolute -top-10 -right-10 text-[200px] opacity-10 pointer-events-none" style="">fitness_center</span>
</div>
</div>
</div>
<div class="space-y-6">
<div class="bg-surface-container-lowest rounded-xl p-6 shadow-sm">
<h3 class="text-sm font-bold text-primary uppercase tracking-widest mb-6" style="">Recent Activity Feed</h3>
<div class="space-y-6">
<div class="flex gap-4 items-start relative">
<div class="absolute left-3.5 top-8 bottom-[-24px] w-0.5 bg-surface-container-high"></div>
<div class="w-7 h-7 rounded-full bg-primary flex items-center justify-center shrink-0 z-10">
<span class="material-symbols-outlined text-white text-[14px]" style="">location_on</span>
</div>
<div class="pt-0.5">
<p class="text-xs font-bold text-on-surface" style="">Location Reassigned</p>
<p class="text-[11px] text-outline leading-tight mt-1" style="">Section B Hub reassigned to Admin Sarah J.</p>
<p class="text-[10px] text-primary font-bold mt-2" style="">14 mins ago</p>
</div>
</div>
<div class="flex gap-4 items-start relative">
<div class="absolute left-3.5 top-8 bottom-[-24px] w-0.5 bg-surface-container-high"></div>
<div class="w-7 h-7 rounded-full bg-secondary-container flex items-center justify-center shrink-0 z-10">
<span class="material-symbols-outlined text-on-secondary-container text-[14px]" style="">update</span>
</div>
<div class="pt-0.5">
<p class="text-xs font-bold text-on-surface" style="">Ledger Synchronized</p>
<p class="text-[11px] text-outline leading-tight mt-1" style="">Cross-hub data reconciliation completed.</p>
<p class="text-[10px] text-primary font-bold mt-2" style="">2 hours ago</p>
</div>
</div>
<div class="flex gap-4 items-start relative">
<div class="w-7 h-7 rounded-full bg-tertiary-fixed text-tertiary flex items-center justify-center shrink-0 z-10">
<span class="material-symbols-outlined text-[14px]" style="">shield</span>
</div>
<div class="pt-0.5">
<p class="text-xs font-bold text-on-surface" style="">Policy Update</p>
<p class="text-[11px] text-outline leading-tight mt-1" style="">New institutional stewardship protocols active.</p>
<p class="text-[10px] text-primary font-bold mt-2" style="">Yesterday</p>
</div>
</div>
</div>
<button class="w-full mt-8 py-2 text-[11px] uppercase font-black text-outline hover:text-primary transition-colors border border-dashed border-outline-variant/30 rounded-lg" style="">View Full Log</button>
</div>
<div class="bg-surface-container-high rounded-xl overflow-hidden shadow-sm p-4">
<div class="aspect-square bg-surface-container-low rounded-lg mb-4 flex items-center justify-center overflow-hidden grayscale contrast-125 opacity-70">
<img alt="Mapping visual" class="w-full h-full object-cover" data-alt="blueprint styled topological map of a university campus with teal and orange highlights on specific buildings" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBmvjOKVEHfGLU4MLx9x2AxyKRmvYr7yuBuQjf1NANjvVdAfmBLE83kKcAuYtRE7pCaOm3b6qhvmcBL19tU0ECwcpjJexfFhV6FrOwHYOn9u9tV0EnABA3CkCpqlzDV1X048AFOT8sDFPW2uYCnBkkJDhmXqsup6HmZb0mYE2XbYG0IhdbYZgA57oEAgVeruTx0ZTx18fABrZ8zDMm8_wctCVNl-6dem6eCOHONNCGgzrOwTybnzGodg4lnzlAYGmZo6D_Z4Gm5PBk" style="">
</div>
<div class="px-2 pb-2">
<h4 class="font-bold text-sm text-primary" style="">System Integrity Map</h4>
<p class="text-[11px] text-on-surface-variant" style="">Live visual of active distribution hubs.</p>
</div>
</div>
</div>
</div>
</section>
<footer class="bg-slate-50 dark:bg-slate-900 border-t border-slate-200/10 w-full py-6 mt-12 flex flex-col md:flex-row justify-between items-center px-12 font-inter text-xs tracking-wide uppercase opacity-80 hover:opacity-100 transition-all">
<p class="font-manrope font-black text-teal-900 dark:text-teal-100 mb-4 md:mb-0" style="">© 2024 Findora Lost &amp; Found. Managed Institutional Stewardship.</p>
<div class="flex gap-8">
<a class="text-slate-400 hover:text-orange-500 transition-colors" href="#" style="">Privacy Policy</a>
<a class="text-slate-400 hover:text-orange-500 transition-colors" href="#" style="">Terms of Service</a>
<a class="text-slate-400 hover:text-orange-500 transition-colors" href="#" style="">Support</a>
</div>
</footer>
</main>
</body></html>