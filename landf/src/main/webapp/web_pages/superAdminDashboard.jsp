<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Findora Super Admin Dashboard</title>
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
                },
            },
        }
    </script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f7fafa;
        }
        h1, h2, h3, .font-headline {
            font-family: 'Manrope', sans-serif;
        }
    </style>
</head>
<body class="flex min-h-screen text-on-surface">
<!-- SideNavBar -->
<aside class="bg-slate-100 dark:bg-slate-950 h-screen w-64 fixed left-0 top-0 flex flex-col py-8 px-4 hidden md:flex z-50">
<div class="mb-10 px-2">
<h1 class="text-lg font-bold text-teal-900 dark:text-teal-100">Findora Admin</h1>
<p class="text-slate-500 dark:text-slate-400 text-[10px] font-manrope tracking-widest uppercase mt-1">Institutional Ledger</p>
</div>
<nav class="flex-1 space-y-1">
<a class="flex items-center gap-3 px-3 py-2.5 rounded-lg transition-all duration-300 ease-in-out text-teal-900 dark:text-teal-200 font-bold border-r-4 border-orange-500 bg-white dark:bg-slate-900" href="#">
<span class="material-symbols-outlined">dashboard</span>
<span class="font-manrope text-sm">Dashboard</span>
</a>
<a class="flex items-center gap-3 px-3 py-2.5 rounded-lg transition-all duration-300 ease-in-out text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800" href="#">
<span class="material-symbols-outlined">inventory_2</span>
<span class="font-manrope text-sm">Items</span>
</a>
<a class="flex items-center gap-3 px-3 py-2.5 rounded-lg transition-all duration-300 ease-in-out text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800" href="#">
<span class="material-symbols-outlined">location_on</span>
<span class="font-manrope text-sm">Locations</span>
</a>
<a class="flex items-center gap-3 px-3 py-2.5 rounded-lg transition-all duration-300 ease-in-out text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800" href="#">
<span class="material-symbols-outlined">group</span>
<span class="font-manrope text-sm">Users</span>
</a>
<a class="flex items-center gap-3 px-3 py-2.5 rounded-lg transition-all duration-300 ease-in-out text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800" href="#">
<span class="material-symbols-outlined">assignment_turned_in</span>
<span class="font-manrope text-sm">Claims</span>
</a>
<a class="flex items-center gap-3 px-3 py-2.5 rounded-lg transition-all duration-300 ease-in-out text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800" href="#">
<span class="material-symbols-outlined">analytics</span>
<span class="font-manrope text-sm">Reports</span>
</a>
</nav>
<div class="mt-auto">
<button class="w-full bg-secondary text-on-secondary px-4 py-3 rounded-lg font-manrope font-semibold text-sm shadow-sm hover:brightness-110 active:scale-95 transition-all">
                Report Found Item
            </button>
</div>
</aside>
<!-- Main Content Area -->
<main class="flex-1 md:ml-64 flex flex-col min-h-screen">
<!-- TopNavBar -->
<header class="bg-slate-50 dark:bg-slate-900 text-teal-900 dark:text-teal-400 font-manrope text-sm font-medium full-width top-0 z-40 sticky flex justify-between items-center px-6 py-3 w-full">
<div class="flex items-center gap-4 flex-1">
<div class="relative w-full max-w-md">
<span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400">search</span>
<input class="w-full pl-10 pr-4 py-2 bg-slate-100 dark:bg-slate-800/50 border-none rounded-full focus:ring-2 focus:ring-primary/20 text-xs" placeholder="Search item IDs, serial numbers, or claimants..." type="text"/>
</div>
</div>
<div class="flex items-center gap-4">
<button class="p-2 rounded-full hover:bg-slate-200/50 dark:hover:bg-slate-800 transition-colors relative">
<span class="material-symbols-outlined">notifications</span>
<span class="absolute top-2 right-2 w-2 h-2 bg-secondary rounded-full"></span>
</button>
<div class="flex items-center gap-3 ml-2 pl-4 border-l border-slate-200/20">
<div class="text-right hidden sm:block">
<p class="text-xs font-bold text-teal-900 dark:text-teal-100">Super Admin</p>
<p class="text-[10px] text-slate-500">System Overseer</p>
</div>
<img alt="User profile" class="w-10 h-10 rounded-full border-2 border-primary-fixed" data-alt="Professional headshot of a middle-aged male administrator in a clean office setting, soft natural lighting, high resolution" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDarmgfHEAdyGQjR7jcl-q629duZUWaCTdnUpuRH7dftrXB3ivm75tY2dNcGabuVMWhkpB2aGdtS_EtOnQ3lwf1ZzvlUPCeXByGLDU6qVDSMl6aSAPLuJOT4rV47BZ55GgBvaHmsAI32OEE8ZA8akF8Z43NDB2KfVfjaQz1e-6oIJ4KME7HksHRxMbPymlQYh3F17ZgAyxerXXl6jfGMeO9L7P1o1FlBHBvvDYEETwBedxmlA6uJbxsQ_rH0gCVmlEY1VxhAInLk64"/>
</div>
</div>
</header>
<!-- Dashboard Canvas -->
<div class="p-6 lg:p-10 space-y-8">
<!-- Hero Header Section (Asymmetric) -->
<div class="grid grid-cols-1 lg:grid-cols-12 gap-8 items-end">
<div class="lg:col-span-8">
<h2 class="text-display-lg text-4xl lg:text-5xl font-extrabold text-primary tracking-tight mb-2">System Overview</h2>
<p class="text-slate-500 max-w-xl font-body">Manage the lifecycle of recovered property across all institutional branches. Monitor health, claims efficiency, and asset stewardship in real-time.</p>
</div>
<div class="lg:col-span-4 flex justify-end gap-3">
<div class="p-4 bg-surface-container-low rounded-xl flex items-center gap-4 w-full">
<div class="w-10 h-10 rounded-lg bg-primary-container flex items-center justify-center">
<span class="material-symbols-outlined text-on-primary-container">dns</span>
</div>
<div>
<p class="text-[10px] font-bold uppercase tracking-widest text-slate-400">System Health</p>
<p class="text-sm font-bold text-teal-900">Operational (99.9%)</p>
</div>
</div>
</div>
</div>
<!-- Analytics Bento Grid -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
<!-- Card 1 -->
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border border-outline-variant/10 group hover:bg-primary transition-all duration-300">
<div class="flex justify-between items-start mb-4">
<div class="p-2 bg-surface-container-low rounded-lg group-hover:bg-primary-container">
<span class="material-symbols-outlined text-primary group-hover:text-on-primary-container">group</span>
</div>
<span class="text-[10px] font-bold text-teal-600 bg-teal-50 px-2 py-1 rounded group-hover:bg-teal-900/30 group-hover:text-white">+12%</span>
</div>
<p class="text-slate-500 text-xs font-medium group-hover:text-primary-fixed">Total Users</p>
<h3 class="text-3xl font-black text-teal-900 mt-1 group-hover:text-white">12,842</h3>
</div>
<!-- Card 2 -->
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border border-outline-variant/10 group hover:bg-primary transition-all duration-300">
<div class="flex justify-between items-start mb-4">
<div class="p-2 bg-surface-container-low rounded-lg group-hover:bg-primary-container">
<span class="material-symbols-outlined text-primary group-hover:text-on-primary-container">inventory_2</span>
</div>
<span class="text-[10px] font-bold text-orange-600 bg-orange-50 px-2 py-1 rounded group-hover:bg-orange-900/30 group-hover:text-white">Active</span>
</div>
<p class="text-slate-500 text-xs font-medium group-hover:text-primary-fixed">Total Items</p>
<h3 class="text-3xl font-black text-teal-900 mt-1 group-hover:text-white">3,109</h3>
</div>
<!-- Card 3 -->
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border border-outline-variant/10 group hover:bg-primary transition-all duration-300">
<div class="flex justify-between items-start mb-4">
<div class="p-2 bg-surface-container-low rounded-lg group-hover:bg-primary-container">
<span class="material-symbols-outlined text-primary group-hover:text-on-primary-container">assignment_turned_in</span>
</div>
<span class="text-[10px] font-bold text-teal-600 bg-teal-50 px-2 py-1 rounded group-hover:bg-teal-900/30 group-hover:text-white">84% Rate</span>
</div>
<p class="text-slate-500 text-xs font-medium group-hover:text-primary-fixed">Active Claims</p>
<h3 class="text-3xl font-black text-teal-900 mt-1 group-hover:text-white">427</h3>
</div>
<!-- Card 4 -->
<div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm border border-outline-variant/10 group hover:bg-primary transition-all duration-300">
<div class="flex justify-between items-start mb-4">
<div class="p-2 bg-surface-container-low rounded-lg group-hover:bg-primary-container">
<span class="material-symbols-outlined text-primary group-hover:text-on-primary-container">account_balance</span>
</div>
<span class="text-[10px] font-bold text-slate-500 bg-slate-50 px-2 py-1 rounded">24 Units</span>
</div>
<p class="text-slate-500 text-xs font-medium group-hover:text-primary-fixed">Locations</p>
<h3 class="text-3xl font-black text-teal-900 mt-1 group-hover:text-white">18</h3>
</div>
</div>
<!-- Main Ledger Section -->
<div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
<!-- Left: Detailed Ledger Table -->
<div class="lg:col-span-2 bg-surface-container-lowest rounded-2xl overflow-hidden shadow-sm">
<div class="px-6 py-5 border-b border-outline-variant/10 flex justify-between items-center">
<div>
<h3 class="text-lg font-bold text-teal-900">Recent Recoveries</h3>
<p class="text-xs text-slate-400">Live feed of items logged into the system.</p>
</div>
<button class="text-teal-700 font-bold text-xs uppercase tracking-widest hover:text-orange-500 transition-colors">View All</button>
</div>
<div class="overflow-x-auto">
<table class="w-full text-left">
<thead>
<tr class="bg-surface-container-low">
<th class="px-6 py-4 text-[10px] font-bold uppercase tracking-widest text-slate-500">Item Name</th>
<th class="px-6 py-4 text-[10px] font-bold uppercase tracking-widest text-slate-500">Location</th>
<th class="px-6 py-4 text-[10px] font-bold uppercase tracking-widest text-slate-500">Date Logged</th>
<th class="px-6 py-4 text-[10px] font-bold uppercase tracking-widest text-slate-500">Status</th>
</tr>
</thead>
<tbody class="divide-y divide-slate-100">
<tr class="hover:bg-slate-50/80 transition-colors">
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="w-8 h-8 rounded bg-surface-container-highest overflow-hidden">
<img alt="Headphones" class="w-full h-full object-cover" data-alt="Close up of a pair of expensive modern noise-canceling headphones on a light surface" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCsFNksDjgaWWpb8RnDJZfM7UgWxmHK0ZTP3fm8vWjrgAzMgaGVyzq169Vhc-1ED-9bf-T5AJoFQFfaogXTabLQsHknj-DJimohHPjvK-d18ZtfUaSoesNNNsjHc_5WsPku3TI1-hZChBN-TA723qCcU8eWeJ2pmKgLwnx6GU4losrZxCvyDjVUhxKzWnOXGrXWPf3VXCAXT3BomE7awBsT37PZxy8OO-sUQzJ1t_VgsnUmKvau8czWn1wOKs1YKHzQj3Iczp5WkAk"/>
</div>
<span class="text-sm font-semibold text-teal-950">Sony WH-1000XM4</span>
</div>
</td>
<td class="px-6 py-4 text-sm text-slate-600">Central Library, Floor 2</td>
<td class="px-6 py-4 text-sm text-slate-400">Oct 24, 2023</td>
<td class="px-6 py-4">
<span class="bg-orange-100 text-orange-700 text-[10px] font-black px-2 py-1 rounded-full uppercase">Pending Claim</span>
</td>
</tr>
<tr class="hover:bg-slate-50/80 transition-colors">
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="w-8 h-8 rounded bg-surface-container-highest overflow-hidden">
<img alt="Macbook" class="w-full h-full object-cover" data-alt="Top view of an open slim silver laptop on a clean wooden desk" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDUuZTZB8VSFEY39l4OEWS3WTSDIjxy40ksuE4nYca9Nxx65RzLZ0-wOBmvBJ6pgiWSy8b2YuPvhLj4IqPuluAtWUjAcUx4L_s71IkEL9sXnEZfvyZNU1X3qQsIjSy355O-Z8K7VVe02TAen7_Poj0fEGvO7ZxCfV1LrO125-_tKFNwEWl1Tk_VTJqLk_SPAR171grSrRLqWM_fWjLVnvcZAHB0WYtWrygO_L6mGwfXOtaU7pbpXGMwW1dQC-Kpps7mJPQ_Pee7CL8"/>
</div>
<span class="text-sm font-semibold text-teal-950">MacBook Air M2 (Silver)</span>
</div>
</td>
<td class="px-6 py-4 text-sm text-slate-600">Science Wing, Lab 4</td>
<td class="px-6 py-4 text-sm text-slate-400">Oct 23, 2023</td>
<td class="px-6 py-4">
<span class="bg-teal-100 text-teal-700 text-[10px] font-black px-2 py-1 rounded-full uppercase">Returned</span>
</td>
</tr>
<tr class="hover:bg-slate-50/80 transition-colors">
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="w-8 h-8 rounded bg-surface-container-highest overflow-hidden">
<img alt="Wallet" class="w-full h-full object-cover" data-alt="A thick leather wallet with visible cards inside resting on a textured concrete surface" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA9vvk1oJjMhP1NqzykhG-TXVYB2pqjBsMzi9W6fQUEyCkXjrfllWQONR-HUqMUP1LFuonkDsYQu5NOvJdqsDrLuI1BAS9LJg0JrAXBygsjk6JdbSWnlPusfG-Cpi_tVN8xenibVyhS_fxPQJDTSiHXhoUxA2rRnsKG7f6tP_3qIxzGdrbvzhA_nTiLGSSZfsiP19Z7KUBrl7t4JSg8i-VuFa7Za4i6L8ds-hPoE00Y77nZYFsds5yYwAsCrMGCS2-r_Jv8vS0HLmU"/>
</div>
<span class="text-sm font-semibold text-teal-950">Leather Wallet (Brown)</span>
</div>
</td>
<td class="px-6 py-4 text-sm text-slate-600">Student Union Cafe</td>
<td class="px-6 py-4 text-sm text-slate-400">Oct 22, 2023</td>
<td class="px-6 py-4">
<span class="bg-slate-100 text-slate-500 text-[10px] font-black px-2 py-1 rounded-full uppercase">Archived</span>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<!-- Right: High Level Activity & Charts (Asymmetric UI) -->
<div class="space-y-6">
<div class="bg-primary text-on-primary p-8 rounded-2xl relative overflow-hidden">
<div class="relative z-10">
<h4 class="text-xl font-extrabold mb-1">System Audit</h4>
<p class="text-primary-fixed/80 text-xs mb-6">Last integrity check: 2 hours ago</p>
<div class="space-y-4">
<div class="flex justify-between items-center text-xs">
<span class="opacity-80">Storage Capacity</span>
<span class="font-bold">62%</span>
</div>
<div class="w-full bg-primary-container rounded-full h-1.5">
<div class="bg-secondary-container h-1.5 rounded-full" style="width: 62%"></div>
</div>
<div class="flex justify-between items-center text-xs">
<span class="opacity-80">Database Latency</span>
<span class="font-bold">14ms</span>
</div>
<div class="w-full bg-primary-container rounded-full h-1.5">
<div class="bg-secondary-container h-1.5 rounded-full" style="width: 14%"></div>
</div>
</div>
</div>
<!-- Abstract decorative background -->
<div class="absolute -right-4 -bottom-4 w-32 h-32 bg-secondary/10 rounded-full blur-3xl"></div>
</div>
<!-- Rapid Actions Panel -->
<div class="bg-surface-container-low p-6 rounded-2xl border border-outline-variant/10">
<h4 class="text-sm font-bold text-teal-950 mb-4 px-1">Quick Management</h4>
<div class="grid grid-cols-2 gap-3">
<button class="flex flex-col items-center justify-center p-4 bg-white rounded-xl hover:shadow-md transition-all group">
<span class="material-symbols-outlined text-primary mb-2 group-hover:scale-110 transition-transform">person_add</span>
<span class="text-[10px] font-bold text-slate-600 uppercase">Add Admin</span>
</button>
<button class="flex flex-col items-center justify-center p-4 bg-white rounded-xl hover:shadow-md transition-all group">
<span class="material-symbols-outlined text-primary mb-2 group-hover:scale-110 transition-transform">location_searching</span>
<span class="text-[10px] font-bold text-slate-600 uppercase">New Zone</span>
</button>
<button class="flex flex-col items-center justify-center p-4 bg-white rounded-xl hover:shadow-md transition-all group">
<span class="material-symbols-outlined text-primary mb-2 group-hover:scale-110 transition-transform">file_download</span>
<span class="text-[10px] font-bold text-slate-600 uppercase">Export CSV</span>
</button>
<button class="flex flex-col items-center justify-center p-4 bg-white rounded-xl hover:shadow-md transition-all group">
<span class="material-symbols-outlined text-primary mb-2 group-hover:scale-110 transition-transform">settings</span>
<span class="text-[10px] font-bold text-slate-600 uppercase">Config</span>
</button>
</div>
</div>
</div>
</div>
<!-- Bottom Asymmetric Section: Activity Map/Heatmap placeholder -->
<div class="bg-white rounded-3xl p-8 shadow-sm grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
<div class="order-2 md:order-1">
<span class="text-[10px] font-black tracking-[0.2em] text-orange-500 uppercase mb-4 block">Spatial Distribution</span>
<h3 class="text-3xl font-black text-teal-900 leading-tight mb-4">Item Recovery Hotspots</h3>
<p class="text-slate-500 text-sm mb-6 max-w-md">Our intelligence ledger shows that the highest frequency of lost items occurs within the North Science Quad and Student Union. Automated reminders have been sent to branch managers.</p>
<div class="flex gap-4">
<div class="flex items-center gap-2">
<div class="w-3 h-3 rounded-full bg-teal-500"></div>
<span class="text-xs font-bold text-slate-700">Low Density</span>
</div>
<div class="flex items-center gap-2">
<div class="w-3 h-3 rounded-full bg-orange-400"></div>
<span class="text-xs font-bold text-slate-700">High Density</span>
</div>
</div>
</div>
<div class="order-1 md:order-2 rounded-2xl overflow-hidden h-64 bg-slate-200 relative group">
<img alt="Campus Map" class="w-full h-full object-cover grayscale opacity-60 group-hover:grayscale-0 group-hover:opacity-100 transition-all duration-700" data-alt="Stylized top-down 3D architectural plan of a modern university campus with highlighted orange areas for traffic density" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCUwWG7jqYaKzcX1q-yx_vw1chNfOMJZUGqX_OLidDlP4JW8C322XSRMq59iTXpx0iwnw4Muk7uvtbxmlGon8mtj1IHnsuXnHvobEf6dJb1wWSfuRcjx3ROQh9qPkbOjObILyuZM82-X3qWlJ_31TA6FWg5KY-ee7djbZEPyJuyJq2w_on8t3tGRa7_xCw9dzMJQV4VbaK-y6H8jn36QnbE809iDxFlRfyrFnK0HzXu7IgPw8pjkHW-IsLDkJsteH10NyNw8dX5zgE"/>
<div class="absolute inset-0 bg-gradient-to-t from-teal-900/40 to-transparent"></div>
<div class="absolute top-4 right-4 bg-white/90 backdrop-blur-md p-2 rounded-lg text-[10px] font-bold shadow-lg">
                        DATA LOCATION: UNIVERSITY_MAIN
                    </div>
</div>
</div>
</div>
<!-- Footer -->
<footer class="bg-slate-50 dark:bg-slate-900 text-teal-900 dark:text-teal-400 font-inter text-xs tracking-wide uppercase border-t border-slate-200/10 w-full py-6 mt-auto flex flex-col md:flex-row justify-between items-center px-12">
<div class="font-manrope font-black text-teal-900 dark:text-teal-100 mb-4 md:mb-0">
                Findora
            </div>
<div class="text-slate-400 text-[10px] mb-4 md:mb-0">
                © 2024 Findora Lost &amp; Found. Managed Institutional Stewardship.
            </div>
<div class="flex gap-6">
<a class="text-slate-400 hover:text-orange-500 transition-colors" href="#">Privacy Policy</a>
<a class="text-slate-400 hover:text-orange-500 transition-colors" href="#">Terms of Service</a>
<a class="text-slate-400 hover:text-orange-500 transition-colors" href="#">Support</a>
</div>
</footer>
</main>
<!-- Mobile Bottom Nav -->
<div class="md:hidden fixed bottom-0 left-0 right-0 bg-white/90 backdrop-blur-xl border-t border-slate-100 flex justify-around items-center py-3 z-50">
<button class="flex flex-col items-center text-teal-700 font-bold">
<span class="material-symbols-outlined">dashboard</span>
<span class="text-[9px]">Home</span>
</button>
<button class="flex flex-col items-center text-slate-400">
<span class="material-symbols-outlined">inventory_2</span>
<span class="text-[9px]">Items</span>
</button>
<div class="bg-secondary p-3 rounded-full -translate-y-6 shadow-xl border-4 border-white">
<span class="material-symbols-outlined text-white">add</span>
</div>
<button class="flex flex-col items-center text-slate-400">
<span class="material-symbols-outlined">assignment_turned_in</span>
<span class="text-[9px]">Claims</span>
</button>
<button class="flex flex-col items-center text-slate-400">
<span class="material-symbols-outlined">person</span>
<span class="text-[9px]">Profile</span>
</button>
</div>
</body></html>