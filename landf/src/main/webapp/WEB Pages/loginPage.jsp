<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Login | Findora Institutional Ledger</title>
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
            display: inline-block;
            vertical-align: middle;
        }
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f7fafa;
        }
        h1, h2, h3, .brand-font {
            font-family: 'Manrope', sans-serif;
        }
    </style>
</head>
<body class="bg-background text-on-surface min-h-screen flex flex-col items-center justify-center p-4">
<!-- The Shell (Navigation suppressed for focused login journey) -->
<main class="w-full max-w-6xl grid grid-cols-1 md:grid-cols-12 gap-0 overflow-hidden rounded-xl bg-surface-container-lowest shadow-sm">
<!-- Welcome Section (Visual Anchor) -->
<section class="md:col-span-7 relative hidden md:flex flex-col justify-between p-12 bg-primary overflow-hidden">
<!-- Decorative Grain & Texture -->
<div class="absolute inset-0 opacity-20 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] pointer-events-none"></div>
<div class="absolute -top-24 -left-24 w-96 h-96 bg-primary-container rounded-full blur-[120px] opacity-40"></div>
<div class="absolute -bottom-24 -right-24 w-64 h-64 bg-secondary rounded-full blur-[100px] opacity-20"></div>
<div class="relative z-10">
<div class="flex items-center gap-2 mb-12">
<span class="material-symbols-outlined text-primary-fixed text-4xl" data-icon="account_balance">account_balance</span>
<span class="brand-font text-2xl font-extrabold text-surface-container-lowest tracking-tight">Findora</span>
</div>
<h1 class="text-5xl font-extrabold text-surface-container-lowest leading-tight tracking-tighter mb-6">
                    Professional Stewardship <br/>
<span class="text-primary-fixed">for Institutional Assets.</span>
</h1>
<p class="text-primary-fixed-dim text-lg font-light max-w-md leading-relaxed">
                    Access the centralized ledger for lost property management. Designed for security, built for efficiency, and managed with institutional care.
                </p>
</div>
<div class="relative z-10 flex items-center gap-4">
<div class="w-12 h-12 rounded-lg bg-surface-container-lowest/10 backdrop-blur-md flex items-center justify-center">
<span class="material-symbols-outlined text-primary-fixed" data-icon="verified_user">verified_user</span>
</div>
<div>
<p class="text-surface-container-lowest text-sm font-semibold">Authorized Personnel Only</p>
<p class="text-primary-fixed-dim text-xs opacity-70">Secure 256-bit AES Encrypted Session</p>
</div>
</div>
<!-- Representative Background Image -->
<div class="absolute inset-0 z-0">
<img alt="modern office hallway" class="w-full h-full object-cover opacity-10 mix-blend-overlay" data-alt="Modern architectural interior of a minimalist university building with clean lines, glass walls, and soft natural sunlight" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBk4A7kSxHXUoDhSiSKAW-9kGwev6wpgooBqMs1-q-MZJmqJpweAzPCCrWGtgVrScvh7llnHjHDt8G8yOZUnNVu0mTGjhkXKX-AI0mkESpzr_vjgHuR8CZVJby1SlTZZxz6oxu7-xYmICBlesTh0npre1pz15Vze0r8q4XYyzSgLiQRnSKN-fJNkKftuZ6IWH7IXHhWnf1w5u8F3Fh4V8Z4hz-QmhgW8F3wfle0VvoRkWNbHXVGJcj1M3zBAZ6c6_Kj1_dRQ72-aG8"/>
</div>
</section>
<!-- Login Form Container -->
<section class="md:col-span-5 flex flex-col justify-center p-8 md:p-16 bg-surface-container-lowest">
<div class="md:hidden flex items-center gap-2 mb-8">
<span class="material-symbols-outlined text-primary text-3xl" data-icon="account_balance">account_balance</span>
<span class="brand-font text-xl font-bold text-primary tracking-tight">Findora</span>
</div>
<div class="mb-10">
<h2 class="text-3xl font-extrabold text-on-surface tracking-tight mb-2">Welcome Back</h2>
<p class="text-on-surface-variant text-sm">Please enter your credentials to access the ledger.</p>
</div>
<form class="space-y-6">
<!-- Email Field -->
<div class="space-y-1.5">
<label class="block text-[0.6875rem] font-semibold text-outline uppercase tracking-wider ml-1" for="email">Email Address</label>
<div class="relative group">
<div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
<span class="material-symbols-outlined text-outline group-focus-within:text-primary transition-colors" data-icon="mail">mail</span>
</div>
<input class="block w-full pl-12 pr-4 py-3.5 bg-surface-container-highest border-0 rounded-lg text-on-surface text-sm placeholder:text-outline/50 focus:ring-2 focus:ring-primary/20 transition-all outline-none" id="email" name="email" placeholder="admin@findora.edu" required="" type="email"/>
</div>
</div>
<!-- Password Field -->
<div class="space-y-1.5">
<div class="flex justify-between items-center px-1">
<label class="block text-[0.6875rem] font-semibold text-outline uppercase tracking-wider" for="password">Password</label>
<a class="text-[0.6875rem] font-bold text-primary hover:text-primary-container transition-colors" href="#">Forgot Password?</a>
</div>
<div class="relative group">
<div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
<span class="material-symbols-outlined text-outline group-focus-within:text-primary transition-colors" data-icon="lock">lock</span>
</div>
<input class="block w-full pl-12 pr-12 py-3.5 bg-surface-container-highest border-0 rounded-lg text-on-surface text-sm placeholder:text-outline/50 focus:ring-2 focus:ring-primary/20 transition-all outline-none" id="password" name="password" placeholder="••••••••" required="" type="password"/>
<div class="absolute inset-y-0 right-0 pr-4 flex items-center cursor-pointer">
<span class="material-symbols-outlined text-outline hover:text-on-surface" data-icon="visibility">visibility</span>
</div>
</div>
</div>
<!-- Remember Me -->
<div class="flex items-center gap-3 py-2">
<input class="w-4 h-4 rounded border-outline-variant text-primary focus:ring-primary/20 bg-surface-container-highest" id="remember" type="checkbox"/>
<label class="text-sm text-on-surface-variant font-medium cursor-pointer" for="remember">Keep me signed in for 30 days</label>
</div>
<!-- Login Button -->
<button class="w-full py-4 bg-secondary-container text-on-secondary-container font-bold rounded-lg shadow-sm hover:shadow-md active:scale-[0.98] transition-all flex items-center justify-center gap-2" type="submit">
<span>Login</span>
<span class="material-symbols-outlined" data-icon="arrow_forward">arrow_forward</span>
</button>
</form>
<div class="mt-12 pt-8 border-t border-surface-container-high text-center">
<p class="text-on-surface-variant text-sm mb-4">New to the Findora Ledger?</p>
<a class="inline-flex items-center gap-2 px-6 py-2.5 border border-outline-variant rounded-full text-on-surface font-semibold text-sm hover:bg-surface-container-low transition-colors" href="#">
<span class="material-symbols-outlined text-lg" data-icon="person_add">person_add</span>
                    Create Account
                </a>
</div>
</section>
</main>
<!-- Simple Footer for Transactional Pages -->
<footer class="mt-8 text-center">
<p class="text-outline text-[0.6875rem] uppercase tracking-widest font-medium">
            © 2024 Findora Lost &amp; Found. Managed Institutional Stewardship.
        </p>
<div class="flex justify-center gap-6 mt-2">
<a class="text-outline text-[0.6875rem] font-bold hover:text-primary transition-colors" href="#">Privacy Policy</a>
<a class="text-outline text-[0.6875rem] font-bold hover:text-primary transition-colors" href="#">Support</a>
</div>
</footer>
</body></html>