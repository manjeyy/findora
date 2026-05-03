<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Claim Item | Findora</title>
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
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            display: inline-block;
            vertical-align: middle;
        }
        body { font-family: 'Inter', sans-serif; }
        h1, h2, h3 { font-family: 'Manrope', sans-serif; }
        .glass-panel {
            background: rgba(0, 101, 101, 0.05);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(190, 201, 200, 0.15);
        }
    </style>
</head>
<body class="bg-background text-on-background min-h-screen flex flex-col">
<!-- TopNavBar -->
<header class="bg-slate-50 dark:bg-slate-900 font-manrope text-sm font-medium full-width top-0 z-50 sticky flex justify-between items-center px-6 py-3 w-full">
<div class="flex items-center gap-8">
<span class="text-xl font-bold text-teal-900 dark:text-teal-100 tracking-tight">Findora</span>
<nav class="hidden md:flex gap-6 items-center">
<a class="text-slate-500 dark:text-slate-400 hover:bg-slate-200/50 dark:hover:bg-slate-800 transition-colors px-3 py-1 rounded-lg" href="#">Dashboard</a>
<a class="text-teal-700 dark:text-teal-300 font-semibold px-3 py-1 rounded-lg" href="#">Claims</a>
<a class="text-slate-500 dark:text-slate-400 hover:bg-slate-200/50 dark:hover:bg-slate-800 transition-colors px-3 py-1 rounded-lg" href="#">Items</a>
</nav>
</div>
<div class="flex items-center gap-4">
<button class="p-2 rounded-full hover:bg-slate-200/50 dark:hover:bg-slate-800 transition-colors">
<span class="material-symbols-outlined text-teal-900 dark:text-teal-400" data-icon="notifications">notifications</span>
</button>
<div class="h-8 w-8 rounded-full bg-surface-container-highest overflow-hidden">
<img alt="User profile" data-alt="professional headshot of a person with friendly expression in bright office setting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAY_W7qQH_rLRkOJOrfBfQtjLirVFLEl8gSKcbSFlZugQBl7BNowblGZemO9DhQqjRSKWaNPjVwV909KttsxWZbAoM3X0Gil_wlBmkRLAnRBCIpYVwMF0Dx7jp9yf6JUgonU8DfYrucfNmCwpViKkzw4KFZ6t2o6TyQP-6K9X6jcyOiRIN7fL-2VC-UHn8hCienwG1q7gHHV9jAS6P2HkpBaFaROaiYdFqIddFhhy2c9pK5qO0qse6LRcH4zSKO1i-W5Sm0s9koifE"/>
</div>
</div>
</header>
<main class="flex-grow flex flex-col items-center justify-center p-6 md:p-12 lg:p-20">
<div class="w-full max-w-6xl grid grid-cols-1 md:grid-cols-12 gap-8 items-start">
<!-- Left Column: Item Preview -->
<div class="md:col-span-5 flex flex-col gap-6">
<div class="flex items-center gap-2 mb-2">
<button class="flex items-center text-primary font-semibold hover:opacity-70 transition-opacity">
<span class="material-symbols-outlined mr-1" data-icon="arrow_back">arrow_back</span>
                        Back to Ledger
                    </button>
</div>
<div class="bg-surface-container-lowest rounded-xl overflow-hidden shadow-sm">
<div class="h-80 w-full overflow-hidden relative">
<img class="w-full h-full object-cover" data-alt="close-up of a high-end silver laptop resting on a minimalist library desk with soft overhead lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuB5FVd0s9drss8LgzRgwx6mCafXSFqlkbeuakYRLhVluJp5Z8kSSiQnAqQyTP-WaAucOtA85YRdsQB7ujaMLQ7oMczrP3q2GPj-hsGJ09UFPii4NqXYY-8v2k74QYOigXplTzj7qItB9V0QG4sRUYu7Ckg0zve2gHMZ4wtwsyISK1SbFi9GiV0ejBmWCjgzSD3RRwYLDCqKiNSyf30MFktiQBXxeRpDoY8JY76drVP3gkV8JuMYowkveD3T6sIdfk4pWBervT4ziTw"/>
<div class="absolute top-4 left-4">
<span class="bg-primary text-on-primary px-3 py-1 rounded-full text-xs font-bold uppercase tracking-widest">Found</span>
</div>
</div>
<div class="p-8">
<h1 class="text-3xl font-extrabold text-primary mb-2 tracking-tight">Silver MacBook Air M2</h1>
<p class="text-on-surface-variant leading-relaxed mb-6 font-body">Found in the North Study Wing, 3rd Floor. The device is in a grey felt sleeve and has a distinctive sticker on the bottom left corner.</p>
<div class="space-y-4 pt-6 border-t border-outline-variant/15">
<div class="flex items-center gap-4">
<div class="bg-surface-container-highest p-2 rounded-lg text-primary">
<span class="material-symbols-outlined" data-icon="location_on">location_on</span>
</div>
<div>
<p class="text-[10px] uppercase tracking-wider text-outline font-bold">Location Found</p>
<p class="font-semibold text-on-surface">Central Library, North Wing</p>
</div>
</div>
<div class="flex items-center gap-4">
<div class="bg-surface-container-highest p-2 rounded-lg text-primary">
<span class="material-symbols-outlined" data-icon="calendar_today">calendar_today</span>
</div>
<div>
<p class="text-[10px] uppercase tracking-wider text-outline font-bold">Date Found</p>
<p class="font-semibold text-on-surface">October 14, 2024</p>
</div>
</div>
<div class="flex items-center gap-4">
<div class="bg-surface-container-highest p-2 rounded-lg text-primary">
<span class="material-symbols-outlined" data-icon="fingerprint">fingerprint</span>
</div>
<div>
<p class="text-[10px] uppercase tracking-wider text-outline font-bold">Reference ID</p>
<p class="font-semibold text-on-surface font-mono">FIN-99238-LW</p>
</div>
</div>
</div>
</div>
</div>
<div class="glass-panel p-6 rounded-xl flex items-start gap-4">
<span class="material-symbols-outlined text-secondary" data-icon="gavel">gavel</span>
<div>
<h4 class="font-bold text-primary text-sm mb-1">Institutional Stewardship</h4>
<p class="text-xs text-on-surface-variant font-body">Claims are legally binding statements of ownership. Providing false information may result in institutional disciplinary action.</p>
</div>
</div>
</div>
<!-- Right Column: Form -->
<div class="md:col-span-7 bg-surface-container-lowest p-8 md:p-12 rounded-xl shadow-sm">
<div class="mb-10">
<h2 class="text-2xl font-bold text-primary mb-2">Claim Ownership</h2>
<p class="text-on-surface-variant">Please provide specific details to verify this item belongs to you. Our stewards will review your request within 24 hours.</p>
</div>
<form class="space-y-8">
<!-- Ownership Proof Field -->
<div class="space-y-2">
<label class="block text-[10px] uppercase tracking-widest font-black text-outline ml-1">Evidence of Ownership</label>
<div class="relative group">
<textarea class="w-full bg-surface-container-highest border-none rounded-lg p-4 focus:ring-2 focus:ring-primary/30 transition-all font-body text-on-surface placeholder-outline-variant/60" placeholder="Describe any unique markings, stickers, engravings, or contents that only the owner would know..." rows="4"></textarea>
</div>
</div>
<!-- Unique Identifier Field -->
<div class="space-y-2">
<label class="block text-[10px] uppercase tracking-widest font-black text-outline ml-1">Unique Identifier (Optional)</label>
<div class="relative">
<input class="w-full bg-surface-container-highest border-none rounded-lg p-4 focus:ring-2 focus:ring-primary/30 transition-all font-body text-on-surface placeholder-outline-variant/60" placeholder="Serial number, device name, or specific lock-screen details" type="text"/>
<div class="absolute right-4 top-1/2 -translate-y-1/2 text-outline-variant">
<span class="material-symbols-outlined" data-icon="shield">shield</span>
</div>
</div>
</div>
<!-- Image/Receipt Upload (Mock) -->
<div class="space-y-2">
<label class="block text-[10px] uppercase tracking-widest font-black text-outline ml-1">Supportive Documentation</label>
<div class="border-2 border-dashed border-outline-variant/30 rounded-lg p-8 flex flex-col items-center justify-center bg-surface-container-low hover:bg-surface-container transition-colors cursor-pointer group">
<span class="material-symbols-outlined text-primary mb-2 text-3xl group-hover:scale-110 transition-transform" data-icon="cloud_upload">cloud_upload</span>
<p class="text-sm font-semibold text-on-surface">Click to upload receipts or photos</p>
<p class="text-xs text-outline mt-1">PNG, JPG or PDF up to 5MB</p>
</div>
</div>
<div class="flex items-start gap-3 py-4">
<input class="mt-1 rounded border-outline-variant text-primary focus:ring-primary" type="checkbox"/>
<label class="text-xs text-on-surface-variant font-body">I attest that the information provided is accurate and I am the lawful owner of this property. I understand that fraudulent claims are subject to the terms of institutional policy.</label>
</div>
<div class="pt-4">
<button class="w-full bg-secondary-container text-on-secondary-container font-bold py-4 rounded-lg shadow-md hover:shadow-lg transition-all active:scale-[0.98] flex items-center justify-center gap-2" type="submit">
<span class="material-symbols-outlined" data-icon="verified">verified</span>
                            Submit Claim
                        </button>
</div>
</form>
<div class="mt-8 pt-8 border-t border-outline-variant/10 flex justify-between items-center text-[10px] font-bold text-outline uppercase tracking-tighter">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-[14px]" data-icon="lock">lock</span>
                        Encrypted Connection
                    </div>
<div>Ver 4.1.0-Institutional</div>
</div>
</div>
</div>
</main>
<!-- Footer -->
<footer class="bg-slate-50 dark:bg-slate-900 text-teal-900 dark:text-teal-400 font-inter text-xs tracking-wide uppercase w-full py-6 mt-auto border-t border-slate-200/10 flex flex-col md:flex-row justify-between items-center px-12">
<span class="font-manrope font-black text-teal-900 dark:text-teal-100 mb-4 md:mb-0">© 2024 Findora Lost &amp; Found. Managed Institutional Stewardship.</span>
<div class="flex gap-8">
<a class="text-slate-400 hover:text-orange-500 transition-colors opacity-80 hover:opacity-100" href="#">Privacy Policy</a>
<a class="text-slate-400 hover:text-orange-500 transition-colors opacity-80 hover:opacity-100" href="#">Terms of Service</a>
<a class="text-slate-400 hover:text-orange-500 transition-colors opacity-80 hover:opacity-100" href="#">Support</a>
</div>
</footer>
</body></html>