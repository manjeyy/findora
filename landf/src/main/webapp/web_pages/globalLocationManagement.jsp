<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Manage Locations | Findora Admin</title>
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
                }
            }
        }
    </script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        body { font-family: 'Inter', sans-serif; }
        h1, h2, h3, .font-headline { font-family: 'Manrope', sans-serif; }
    </style>
</head>
<body class="bg-background text-on-background min-h-screen flex">
<!-- SideNavBar (Authority: JSON) -->
<aside class="hidden md:flex flex-col h-screen w-64 fixed left-0 top-0 bg-slate-100 dark:bg-slate-950 py-8 px-4 z-50">
<div class="mb-10 px-2">
<h1 class="text-lg font-bold text-teal-900 dark:text-teal-100 tracking-tight">Findora Admin</h1>
<p class="text-slate-500 dark:text-slate-400 text-xs font-medium uppercase tracking-wider">Institutional Ledger</p>
</div>
<nav class="flex-1 space-y-1">
<a class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined" data-icon="dashboard">dashboard</span>
<span class="font-manrope text-sm">Dashboard</span>
</a>
<a class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined" data-icon="inventory_2">inventory_2</span>
<span class="font-manrope text-sm">Items</span>
</a>
<a class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-teal-900 dark:text-teal-200 font-bold border-r-4 border-orange-500 bg-white dark:bg-slate-900 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined" data-icon="location_on">location_on</span>
<span class="font-manrope text-sm">Locations</span>
</a>
<a class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined" data-icon="group">group</span>
<span class="font-manrope text-sm">Users</span>
</a>
<a class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined" data-icon="assignment_turned_in">assignment_turned_in</span>
<span class="font-manrope text-sm">Claims</span>
</a>
<a class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-slate-500 dark:text-slate-400 hover:bg-white dark:hover:bg-slate-900 hover:text-teal-800 transition-all duration-300 ease-in-out" href="#">
<span class="material-symbols-outlined" data-icon="analytics">analytics</span>
<span class="font-manrope text-sm">Reports</span>
</a>
</nav>
<div class="mt-auto px-2">
<button class="w-full bg-secondary text-white py-3 px-4 rounded-lg font-bold text-sm flex items-center justify-center gap-2 hover:bg-secondary-container transition-all">
<span class="material-symbols-outlined text-sm" data-icon="add">add</span>
                Report Found Item
            </button>
</div>
</aside>
<!-- Main Content Canvas -->
<main class="flex-1 md:ml-64 flex flex-col min-h-screen">
<!-- TopNavBar (Authority: JSON) -->
<header class="bg-slate-50 dark:bg-slate-900 sticky top-0 z-50 flex justify-between items-center px-6 py-3 w-full">
<div class="flex items-center gap-4">
<div class="relative">
<span class="absolute inset-y-0 left-3 flex items-center text-slate-400">
<span class="material-symbols-outlined text-lg" data-icon="search">search</span>
</span>
<input class="bg-slate-100 dark:bg-slate-800 border-none rounded-full py-2 pl-10 pr-4 text-sm focus:ring-2 focus:ring-primary w-64 md:w-80" placeholder="Search locations..." type="text"/>
</div>
</div>
<div class="flex items-center gap-4">
<button class="p-2 text-teal-900 dark:text-teal-400 hover:bg-slate-200/50 dark:hover:bg-slate-800 transition-colors rounded-full">
<span class="material-symbols-outlined" data-icon="notifications">notifications</span>
</button>
<img alt="User profile" class="w-9 h-9 rounded-full object-cover border-2 border-primary/20" data-alt="Close-up portrait of a professional male administrator in a clean office setting, soft corporate lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDmU-uUJC_5FJ9Zt2j78cNDoKDdYU9BkdBHkkfWGGkiB4z5GifU34i1s3vIjvgIUAoq6G2rtPWevCV8KcPK21HD7qaOmqDcidBgwf142s7Gk7Dha9AJWtrHbpyoEA8Ng0Ir0J3vhEqOiVIRTquyNoVPGKQQ3cug_wc0xHVZDIw8kdQ1Sk5jtP1LgvXs_t05hSq4YRo_iTksnZ2iacqVCEiy8bMFeT1JtH5rCsN6gxkGrFMYPSwSkXV5ZGqJU3eclYSFTC1L8XgInuU"/>
</div>
</header>
<section class="p-8 lg:p-12 max-w-7xl w-full mx-auto">
<!-- Editorial Header -->
<div class="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12">
<div>
<span class="text-xs font-bold uppercase tracking-widest text-secondary mb-2 block">Stewardship Console</span>
<h2 class="text-4xl md:text-5xl font-extrabold text-primary tracking-tight font-headline">Manage Locations</h2>
<p class="text-on-surface-variant mt-2 max-w-lg">Oversee the physical touchpoints of the institution's lost and found network. Ensure accountability across all departments.</p>
</div>
<div class="flex gap-3">
<button class="px-6 py-3 bg-primary text-white rounded-lg font-semibold flex items-center gap-2 hover:shadow-lg transition-all active:scale-95">
<span class="material-symbols-outlined" data-icon="add_location">add_location</span>
                        New Location
                    </button>
</div>
</div>
<!-- Bento-Style Stat Overview -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
<div class="bg-surface-container-lowest p-6 rounded-xl border border-outline-variant/15 flex items-center justify-between">
<div>
<p class="text-label-sm text-on-surface-variant uppercase tracking-wider font-bold">Total Hubs</p>
<h3 class="text-3xl font-bold text-primary mt-1">24</h3>
</div>
<div class="p-3 bg-primary-fixed-dim rounded-lg text-primary">
<span class="material-symbols-outlined" data-icon="lan">lan</span>
</div>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl border border-outline-variant/15 flex items-center justify-between">
<div>
<p class="text-label-sm text-on-surface-variant uppercase tracking-wider font-bold">Active Custodians</p>
<h3 class="text-3xl font-bold text-primary mt-1">18</h3>
</div>
<div class="p-3 bg-secondary-fixed-dim rounded-lg text-secondary">
<span class="material-symbols-outlined" data-icon="shield_person">shield_person</span>
</div>
</div>
<div class="bg-surface-container-lowest p-6 rounded-xl border border-outline-variant/15 flex items-center justify-between">
<div>
<p class="text-label-sm text-on-surface-variant uppercase tracking-wider font-bold">Items in Transit</p>
<h3 class="text-3xl font-bold text-primary mt-1">142</h3>
</div>
<div class="p-3 bg-tertiary-fixed-dim rounded-lg text-tertiary">
<span class="material-symbols-outlined" data-icon="package_2">package_2</span>
</div>
</div>
</div>
<!-- The Ledger: Locations Grid -->
<div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
<!-- Location Card 1 -->
<div class="group relative bg-surface-container-lowest rounded-xl overflow-hidden transition-all duration-300 hover:shadow-2xl hover:shadow-primary/5 flex flex-col md:flex-row">
<div class="w-full md:w-48 h-48 md:h-auto overflow-hidden">
<img alt="Main Library Exterior" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="Wide shot of a modern glass and stone university library building at dusk with interior lights glowing warmly" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBXjir8dgN7Lr_U28l7LEiiqQ5x_NbPkO0dsR7mUmzMzSjyxyNZeJOj-Zh0ZKp-oh8teRJXp3BDQ33CZv9XSFBh2dI4R6xcQXtj8fJ5L9e1Pfw55k_X4Ajrq6adLSTUD7IaQgbVlascKniYz1VqGW-IwiAqrM8rQ8aP3VA9QKYfgIERdnEn_EdMEOEAvmEutUsDiNr24Wti-180w1HoAyFAgp08KcEwfUE_xIcBGaaLPD1u0BmnxmpU4HxI3fY5XJecMoFlq26IaUI"/>
</div>
<div class="p-6 flex-1 flex flex-col">
<div class="flex justify-between items-start mb-4">
<div>
<h3 class="text-xl font-bold text-primary leading-tight">Main Campus Library</h3>
<div class="flex items-center gap-1 text-on-surface-variant text-xs mt-1">
<span class="material-symbols-outlined text-sm" data-icon="pin_drop">pin_drop</span>
                                    Zone A - Sector 4
                                </div>
</div>
<span class="px-2.5 py-0.5 rounded-full bg-teal-100 text-teal-800 text-[10px] font-bold uppercase tracking-wider">Active</span>
</div>
<div class="grid grid-cols-2 gap-4 mb-6">
<div>
<p class="text-[10px] text-on-surface-variant uppercase tracking-widest font-bold">Managed By</p>
<p class="text-sm font-semibold text-primary">Dr. Elena Vance</p>
</div>
<div>
<p class="text-[10px] text-on-surface-variant uppercase tracking-widest font-bold">Stored Items</p>
<p class="text-sm font-semibold text-primary">84 Units</p>
</div>
</div>
<div class="mt-auto pt-4 flex items-center justify-between gap-2 border-t border-surface-container-low">
<div class="flex gap-1">
<button class="p-2 hover:bg-surface-container-low rounded-lg text-primary transition-colors" title="Edit">
<span class="material-symbols-outlined" data-icon="edit_note">edit_note</span>
</button>
<button class="p-2 hover:bg-surface-container-low rounded-lg text-secondary transition-colors" title="Deactivate">
<span class="material-symbols-outlined" data-icon="pause_circle">pause_circle</span>
</button>
<button class="p-2 hover:bg-error-container hover:text-error rounded-lg text-on-surface-variant transition-colors" title="Remove">
<span class="material-symbols-outlined" data-icon="delete_outline">delete_outline</span>
</button>
</div>
<button class="text-xs font-bold text-primary hover:underline">View Details</button>
</div>
</div>
</div>
<!-- Location Card 2 -->
<div class="group relative bg-surface-container-lowest rounded-xl overflow-hidden transition-all duration-300 hover:shadow-2xl hover:shadow-primary/5 flex flex-col md:flex-row">
<div class="w-full md:w-48 h-48 md:h-auto overflow-hidden">
<img alt="Student Sports Center" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="Interior view of a high-ceilinged athletic center with blue gym floors and natural light streaming through high windows" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDCdDU_2rkMP8YrPXQ0KRums8j48p2xX43odnwBxvIgBUjFmtFL00xfNPrbaDRb8sa_vb1U2O1x3OMGaStM4cwHnyvvnocSli8oK8U_CuPHoAWYt4bBtuO78rg82fYy32EURyWYNIG0w9eiQjJ-oRE9wFQIScTUWVKm7DPr4t3y430-Wu0bMmz1KrhVKvmn3PxtoL5SXjbniJ8yksg_tF7tdSo68U78DEcxJFBpDzepysD7X9xz5_0lrTtnBoLhnyunVu-M8efemHo"/>
</div>
<div class="p-6 flex-1 flex flex-col">
<div class="flex justify-between items-start mb-4">
<div>
<h3 class="text-xl font-bold text-primary leading-tight">Athletic Center</h3>
<div class="flex items-center gap-1 text-on-surface-variant text-xs mt-1">
<span class="material-symbols-outlined text-sm" data-icon="pin_drop">pin_drop</span>
                                    West Wing - Locker Hub
                                </div>
</div>
<span class="px-2.5 py-0.5 rounded-full bg-teal-100 text-teal-800 text-[10px] font-bold uppercase tracking-wider">Active</span>
</div>
<div class="grid grid-cols-2 gap-4 mb-6">
<div>
<p class="text-[10px] text-on-surface-variant uppercase tracking-widest font-bold">Managed By</p>
<p class="text-sm font-semibold text-primary">Coach Marcus Miller</p>
</div>
<div>
<p class="text-[10px] text-on-surface-variant uppercase tracking-widest font-bold">Stored Items</p>
<p class="text-sm font-semibold text-primary">31 Units</p>
</div>
</div>
<div class="mt-auto pt-4 flex items-center justify-between gap-2 border-t border-surface-container-low">
<div class="flex gap-1">
<button class="p-2 hover:bg-surface-container-low rounded-lg text-primary transition-colors" title="Edit">
<span class="material-symbols-outlined" data-icon="edit_note">edit_note</span>
</button>
<button class="p-2 hover:bg-surface-container-low rounded-lg text-secondary transition-colors" title="Deactivate">
<span class="material-symbols-outlined" data-icon="pause_circle">pause_circle</span>
</button>
<button class="p-2 hover:bg-error-container hover:text-error rounded-lg text-on-surface-variant transition-colors" title="Remove">
<span class="material-symbols-outlined" data-icon="delete_outline">delete_outline</span>
</button>
</div>
<button class="text-xs font-bold text-primary hover:underline">View Details</button>
</div>
</div>
</div>
<!-- Location Card 3 (Offline State) -->
<div class="group relative bg-surface-container-low rounded-xl overflow-hidden transition-all duration-300 flex flex-col md:flex-row opacity-80">
<div class="w-full md:w-48 h-48 md:h-auto overflow-hidden grayscale">
<img alt="East Residence Hall" class="w-full h-full object-cover" data-alt="Architecture shot of a modern brick residential dorm building with large windows under a clear sky" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDHlS4DBNFgNpCZCRRvVU7vYZvhoaSeHBlB_7p5M22_XJD38eGh0yN6GgXWthheibxBRLGcBv9XGAIxbHNWalYEjrvuqQJqvXp-PmWhwBN_xxCFtZVLfQb_sa-qXXb6m-_e0tx0t2fldbSeaboOjwSemMDax9VPOPin3r5UW9zGZENW7Pk5_owNEyqPRqRVfcf7cpMg7dOO8Gcm9HOneFPj0mX277zMP8Z6EoPJqBAqi90gmdYUVQdqX2g2TUWyotdaQE52vgAyHuk"/>
</div>
<div class="p-6 flex-1 flex flex-col">
<div class="flex justify-between items-start mb-4">
<div>
<h3 class="text-xl font-bold text-primary leading-tight">East Residence Hall</h3>
<div class="flex items-center gap-1 text-on-surface-variant text-xs mt-1">
<span class="material-symbols-outlined text-sm" data-icon="pin_drop">pin_drop</span>
                                    Zone B - Residential
                                </div>
</div>
<span class="px-2.5 py-0.5 rounded-full bg-surface-container-highest text-on-surface-variant text-[10px] font-bold uppercase tracking-wider">Deactivated</span>
</div>
<div class="grid grid-cols-2 gap-4 mb-6">
<div>
<p class="text-[10px] text-on-surface-variant uppercase tracking-widest font-bold">Managed By</p>
<p class="text-sm font-semibold text-primary">Unassigned</p>
</div>
<div>
<p class="text-[10px] text-on-surface-variant uppercase tracking-widest font-bold">Stored Items</p>
<p class="text-sm font-semibold text-primary">0 Units</p>
</div>
</div>
<div class="mt-auto pt-4 flex items-center justify-between gap-2 border-t border-surface-container-highest">
<div class="flex gap-1">
<button class="p-2 hover:bg-surface-container-highest rounded-lg text-primary transition-colors" title="Edit">
<span class="material-symbols-outlined" data-icon="edit_note">edit_note</span>
</button>
<button class="p-2 hover:bg-primary-container hover:text-white rounded-lg text-secondary transition-colors" title="Reactivate">
<span class="material-symbols-outlined" data-icon="play_circle">play_circle</span>
</button>
<button class="p-2 hover:bg-error-container hover:text-error rounded-lg text-on-surface-variant transition-colors" title="Remove">
<span class="material-symbols-outlined" data-icon="delete_outline">delete_outline</span>
</button>
</div>
<button class="text-xs font-bold text-primary hover:underline">View History</button>
</div>
</div>
</div>
<!-- Location Card 4 -->
<div class="group relative bg-surface-container-lowest rounded-xl overflow-hidden transition-all duration-300 hover:shadow-2xl hover:shadow-primary/5 flex flex-col md:flex-row">
<div class="w-full md:w-48 h-48 md:h-auto overflow-hidden">
<img alt="University Cafe" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" data-alt="Interior of a modern bustling university cafe with wood accents and industrial lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAXQnPIlw0KWttC6aD4QXXmuinUmZ2-LTjO4S6EaPKDfBVP_ubPFQxQLtvoZh17Ir2lWzLP-yrdUwL6P7_BG3R6OTfxaOSFmSLC8Ac7YlInbsnGRqiyLPm879PgUgkZS5ie--AoDqiCvdKHHdCiFaEKYBHX-CtF2PDyUlE-6AiqKKQqhuMmkT3CHr5rw8bx-f2glEPSjoTVvRNFkMs6lOj-HKGJcFvCZQSb1myM5OlVfmL4cLZovP4lXXXQV-IHwa9dB4iKRBk-8AM"/>
</div>
<div class="p-6 flex-1 flex flex-col">
<div class="flex justify-between items-start mb-4">
<div>
<h3 class="text-xl font-bold text-primary leading-tight">Student Union Cafe</h3>
<div class="flex items-center gap-1 text-on-surface-variant text-xs mt-1">
<span class="material-symbols-outlined text-sm" data-icon="pin_drop">pin_drop</span>
                                    Zone A - Food Services
                                </div>
</div>
<span class="px-2.5 py-0.5 rounded-full bg-teal-100 text-teal-800 text-[10px] font-bold uppercase tracking-wider">Active</span>
</div>
<div class="grid grid-cols-2 gap-4 mb-6">
<div>
<p class="text-[10px] text-on-surface-variant uppercase tracking-widest font-bold">Managed By</p>
<p class="text-sm font-semibold text-primary">Sarah Jenkins</p>
</div>
<div>
<p class="text-[10px] text-on-surface-variant uppercase tracking-widest font-bold">Stored Items</p>
<p class="text-sm font-semibold text-primary">27 Units</p>
</div>
</div>
<div class="mt-auto pt-4 flex items-center justify-between gap-2 border-t border-surface-container-low">
<div class="flex gap-1">
<button class="p-2 hover:bg-surface-container-low rounded-lg text-primary transition-colors" title="Edit">
<span class="material-symbols-outlined" data-icon="edit_note">edit_note</span>
</button>
<button class="p-2 hover:bg-surface-container-low rounded-lg text-secondary transition-colors" title="Deactivate">
<span class="material-symbols-outlined" data-icon="pause_circle">pause_circle</span>
</button>
<button class="p-2 hover:bg-error-container hover:text-error rounded-lg text-on-surface-variant transition-colors" title="Remove">
<span class="material-symbols-outlined" data-icon="delete_outline">delete_outline</span>
</button>
</div>
<button class="text-xs font-bold text-primary hover:underline">View Details</button>
</div>
</div>
</div>
</div>
<!-- Pagination/Footer Actions -->
<div class="mt-12 flex justify-between items-center bg-surface-container p-4 rounded-xl">
<span class="text-xs font-semibold text-on-surface-variant">Showing 4 of 24 Locations</span>
<div class="flex gap-2">
<button class="p-2 rounded-lg bg-surface-container-lowest text-primary hover:bg-primary hover:text-white transition-all">
<span class="material-symbols-outlined" data-icon="chevron_left">chevron_left</span>
</button>
<button class="p-2 rounded-lg bg-primary text-white">
<span class="material-symbols-outlined" data-icon="chevron_right">chevron_right</span>
</button>
</div>
</div>
</section>
<!-- Footer (Authority: JSON) -->
<footer class="bg-slate-50 dark:bg-slate-900 w-full py-6 mt-auto border-t border-slate-200/10 flex flex-col md:flex-row justify-between items-center px-12">
<div class="font-manrope font-black text-teal-900 dark:text-teal-100 mb-4 md:mb-0">
                FINDORA
            </div>
<p class="font-inter text-xs tracking-wide uppercase text-slate-400">
                © 2024 Findora Lost &amp; Found. Managed Institutional Stewardship.
            </p>
<div class="flex gap-6 mt-4 md:mt-0">
<a class="font-inter text-xs tracking-wide uppercase text-slate-400 hover:text-orange-500 transition-colors" href="#">Privacy Policy</a>
<a class="font-inter text-xs tracking-wide uppercase text-slate-400 hover:text-orange-500 transition-colors" href="#">Terms of Service</a>
<a class="font-inter text-xs tracking-wide uppercase text-slate-400 hover:text-orange-500 transition-colors" href="#">Support</a>
</div>
</footer>
</main>
<!-- Mobile Nav Bar (Authority: JSON) -->
<nav class="md:hidden fixed bottom-0 left-0 right-0 bg-slate-50 dark:bg-slate-900 border-t border-slate-200/10 flex justify-around py-3 px-6 z-50">
<button class="flex flex-col items-center gap-1 text-slate-500">
<span class="material-symbols-outlined" data-icon="dashboard">dashboard</span>
</button>
<button class="flex flex-col items-center gap-1 text-teal-700 font-semibold">
<span class="material-symbols-outlined" data-icon="location_on" style="font-variation-settings: 'FILL' 1;">location_on</span>
</button>
<button class="flex flex-col items-center gap-1 text-slate-500">
<span class="material-symbols-outlined" data-icon="inventory_2">inventory_2</span>
</button>
<button class="flex flex-col items-center gap-1 text-slate-500">
<span class="material-symbols-outlined" data-icon="group">group</span>
</button>
</nav>
</body></html>