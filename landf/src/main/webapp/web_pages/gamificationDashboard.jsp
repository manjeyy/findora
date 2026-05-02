<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&amp;family=Plus+Jakarta+Sans:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
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
                        "lg": "0.5rem",
                        "xl": "0.75rem",
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
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        h1, h2, h3 { font-family: 'Manrope', sans-serif; }
        .glass-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(20px);
        }
    </style>
</head>
<body class="bg-surface text-on-surface min-h-screen">
<!-- TopNavBar -->
<nav class="fixed top-0 w-full z-50 bg-[#f7fafa]/80 dark:bg-slate-900/80 backdrop-blur-md flex justify-between items-center px-8 h-20 max-w-full">
<div class="text-xl font-bold tracking-tighter text-teal-900 dark:text-teal-100">The Curated Findora</div>
<div class="hidden md:flex gap-8 items-center">
<a class="text-slate-500 hover:text-teal-600 transition-colors duration-200" href="#">Dashboard</a>
<a class="text-slate-500 hover:text-teal-600 transition-colors duration-200" href="#">Analytics</a>
<a class="text-slate-500 hover:text-teal-600 transition-colors duration-200" href="#">Directory</a>
<button class="bg-gradient-to-br from-primary to-primary-container text-on-primary px-6 py-2.5 rounded-full font-semibold transition-transform active:scale-95 duration-150">
                Report Found Item
            </button>
<div class="w-10 h-10 rounded-full overflow-hidden border-2 border-primary-fixed">
<img alt="User profile Findora" data-alt="Close-up portrait of a professional concierge smiling warmly in a bright modern office setting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCQj0WwiAj-2K6ClExEJ-FqJhsfBrCLXH3mYrODjqFdyu_8fwKPcwxWd8dW5N29j-kV2OIsI6MWzpJHMduT3tQkj1GaBHvLJmFksuicJpVROEuoaK1x9ia8880FA4boMVVHFJZjDHjrhIPTuxymTvg7M1YHKHXBOCArlBFYzZzRWGeKR--2qr_z064bwvGP0qT5Pe-Rj4gWQcQ8LzjyPKB92PXKphmeMFsjKOVa9h0_XvMQZPqA6UWlFfkPBHEXQp4A00QyuKk9lAw"/>
</div>
</div>
</nav>
<main class="pt-28 pb-32 px-4 md:px-12 max-w-7xl mx-auto">
<!-- Hero: Points Display & Progress -->
<section class="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-12">
<div class="lg:col-span-2 glass-card rounded-xl p-8 bg-surface-container-lowest border border-outline-variant/15 flex flex-col justify-between">
<div>
<span class="text-on-surface-variant font-label text-sm tracking-wider">REPUTATION SCORE</span>
<h1 class="text-7xl md:text-8xl font-extrabold text-primary tracking-tighter mt-2 mb-4">12,450</h1>
<div class="flex items-center gap-2 text-tertiary font-bold mb-8">
<span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">stars</span>
<span>Level 24 Master Findora</span>
</div>
</div>
<div class="space-y-4">
<div class="flex justify-between items-end">
<div class="space-y-1">
<p class="text-sm text-on-surface-variant">NEXT MILESTONE</p>
<p class="font-bold">Elite Guardian Title</p>
</div>
<p class="text-primary font-bold">1,550 <span class="text-on-surface-variant font-normal">pts to go</span></p>
</div>
<div class="h-4 bg-surface-container-high rounded-full overflow-hidden">
<div class="h-full bg-gradient-to-r from-primary to-primary-container w-[78%] rounded-full shadow-inner"></div>
</div>
</div>
</div>
<!-- Stats Quick View -->
<div class="grid grid-cols-1 gap-4">
<div class="bg-primary-container text-on-primary-container p-6 rounded-xl flex items-center justify-between">
<div>
<p class="text-sm opacity-80 mb-1">Items Reunited</p>
<p class="text-3xl font-black">42</p>
</div>
<span class="material-symbols-outlined text-4xl opacity-50" style="font-variation-settings: 'FILL' 1;">volunteer_activism</span>
</div>
<div class="bg-secondary-container text-on-secondary-container p-6 rounded-xl flex items-center justify-between">
<div>
<p class="text-sm opacity-80 mb-1">Global Rank</p>
<p class="text-3xl font-black">#128</p>
</div>
<span class="material-symbols-outlined text-4xl opacity-50" style="font-variation-settings: 'FILL' 1;">workspace_premium</span>
</div>
<div class="bg-tertiary-container text-on-tertiary-container p-6 rounded-xl flex items-center justify-between">
<div>
<p class="text-sm opacity-80 mb-1">Community Trust</p>
<p class="text-3xl font-black">98%</p>
</div>
<span class="material-symbols-outlined text-4xl opacity-50" style="font-variation-settings: 'FILL' 1;">verified_user</span>
</div>
</div>
</section>
<!-- Bento Grid Bottom -->
<section class="grid grid-cols-1 md:grid-cols-12 gap-8">
<!-- Leaderboard (Local Area) -->
<div class="md:col-span-4 bg-surface-container-lowest rounded-xl p-6 border border-outline-variant/15">
<div class="flex justify-between items-center mb-8">
<h2 class="text-xl font-bold tracking-tight">Local Leaders</h2>
<span class="text-xs text-on-surface-variant bg-surface-container-high px-2 py-1 rounded-full uppercase tracking-widest">San Francisco</span>
</div>
<div class="space-y-6">
<div class="flex items-center gap-4 group">
<span class="text-secondary font-black w-4">1</span>
<img alt="Top User" class="w-10 h-10 rounded-full object-cover" data-alt="Portrait of a young man with a friendly smile wearing outdoor gear in a sunny city square" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDK1tNG4XHXhTx5CbOqpmIIrGF2WFRKtlJGUqrCPCQoTnlk4b-JlmsdoW_pwrlYYV8csI2uMIysv_OSHamluDbVXUp2l38pNQrNz4ORZJuCnFrajVOhJqil4K1oJm-_A6tsl15Ki-7B_f4KidPDamZlDWJySbko5EPGguvuD6grmx0DdYmKlFXQOdXc0Tnmu5XEba3dkdw6pIgQOKMPwZeqrGAkMqSTzJ3v0lvNzFnI962viteaYYBrO3Fob7qMZU-fzC94je0_4bo"/>
<div class="flex-1">
<p class="font-bold text-sm">Elena Rodriguez</p>
<p class="text-xs text-on-surface-variant">15,200 pts</p>
</div>
<span class="material-symbols-outlined text-secondary-container" style="font-variation-settings: 'FILL' 1;">military_tech</span>
</div>
<div class="flex items-center gap-4 group bg-primary-fixed/20 p-2 -mx-2 rounded-lg">
<span class="text-primary font-black w-4">2</span>
<img alt="User profile Findora" class="w-10 h-10 rounded-full object-cover" data-alt="Portrait of a professional concierge smiling warmly in a bright modern office setting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAvEm3LNE6EJXTLiB8vEUM3SQ51Hu1r-JUF-h_bUa1nvJvFapwr7OI58krMkpoNhS32l0SBaY3fuLRCb6MEqWxZTvRikTyWkNlNGJMHqFULNi33enjJwgj8blVaM-sLOBGYmU5gysfgGKy5SrPEtEw4oVhw1YO2cUO5G68PJXyveTh56baaC7GH5YzzuvRWnFxrL771Y4bLPHoAY3VMAerZA6acfIiAB4flIsZkLwWLT2zn4eG-5f8A8dgMRxYtUXuMqxbRvHyWMlI"/>
<div class="flex-1">
<p class="font-bold text-sm">You (Findora)</p>
<p class="text-xs text-on-surface-variant">12,450 pts</p>
</div>
<span class="material-symbols-outlined text-primary" style="font-variation-settings: 'FILL' 1;">trending_up</span>
</div>
<div class="flex items-center gap-4 group">
<span class="text-on-surface-variant font-black w-4">3</span>
<img alt="Rank 3 User" class="w-10 h-10 rounded-full object-cover" data-alt="Portrait of a middle aged man with glasses and a kind expression in a bright library environment" src="https://lh3.googleusercontent.com/aida-public/AB6AXuADclOaYf_NsfaICED_vaXvaYDvgFH31CUJJaBj6Vl5F_zNDU6wVFf7N0ZibsSqq_LOFVGpcN-QOktxTfLh0XK0amkIaOdNtWIDrzv-88ajX_hdSnV6o_3PluziA-W9mm6M16MkjCkcu2u5uZxlNNo0xQa-aYWsvFMbIJgG3JjqJYb5VENqH5rASbruo0lZgBsoQjoh1_MUATDl8HK4JSUJtOWrFVtHt-YafhnCFcl4xMVk8LSqXNPzhao0McCPQQjF4SjHz3AnLfo"/>
<div class="flex-1">
<p class="font-bold text-sm">Marcus Chen</p>
<p class="text-xs text-on-surface-variant">11,900 pts</p>
</div>
</div>
<div class="flex items-center gap-4 group">
<span class="text-on-surface-variant font-black w-4">4</span>
<img alt="Rank 4 User" class="w-10 h-10 rounded-full object-cover" data-alt="Portrait of a stylish young woman with headphones in a vibrant urban cafe setting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBmLB8piukwz4tpI27sJg6_eTVnlc4Q9DrgatC4gFy1g2THbdJKHhQ09VU5iRCOE8JDQQc8zrLcsOaEn2HRRY4heoUrbyjhK2UXU8CJGQsKNy5xTeusV4pEgl8GwNJpMZMaZOmt0JAymh751R8kBsvKUjcPU3ZMID_E3ZKsTCT5zZXJi_835iNvHBektXJbhVNdEBtoirJg5ZAp5nsmRID8KNwPNQPUQCmRUHuoN-ek9amYrcoCW78p32KVElTPo6bAz8xTYQMXKNs"/>
<div class="flex-1">
<p class="font-bold text-sm">Sarah Jenkins</p>
<p class="text-xs text-on-surface-variant">10,500 pts</p>
</div>
</div>
</div>
<button class="w-full mt-8 py-3 text-primary font-bold text-sm hover:bg-surface-container-low rounded-xl transition-colors">
                    View Full Leaderboard
                </button>
</div>
<!-- Active Missions & Badges -->
<div class="md:col-span-8 space-y-8">
<!-- Missions -->
<div class="bg-surface-container-lowest rounded-xl p-8 border border-outline-variant/15">
<h2 class="text-xl font-bold mb-6">Active Missions</h2>
<div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
<div class="p-5 bg-surface-container-low rounded-xl border border-outline-variant/10 relative overflow-hidden group">
<div class="relative z-10">
<div class="flex justify-between items-start mb-3">
<span class="bg-secondary-container/20 text-on-secondary-container text-[10px] font-bold px-2 py-0.5 rounded-full uppercase tracking-tighter">BOUNTY</span>
<span class="text-primary font-bold text-sm">+500 XP</span>
</div>
<h3 class="font-bold mb-1">The Triple Finder</h3>
<p class="text-xs text-on-surface-variant mb-4">Report 3 found items in the next 48 hours to complete.</p>
<div class="w-full bg-surface-variant h-1.5 rounded-full overflow-hidden">
<div class="bg-primary h-full w-[66%]"></div>
</div>
<p class="text-[10px] text-on-surface-variant mt-2">2 of 3 items reported</p>
</div>
</div>
<div class="p-5 bg-surface-container-low rounded-xl border border-outline-variant/10 group">
<div class="flex justify-between items-start mb-3">
<span class="bg-tertiary-container/20 text-on-tertiary-container text-[10px] font-bold px-2 py-0.5 rounded-full uppercase tracking-tighter">CHALLENGE</span>
<span class="text-primary font-bold text-sm">+250 XP</span>
</div>
<h3 class="font-bold mb-1">Validation Guru</h3>
<p class="text-xs text-on-surface-variant mb-4">Validate 5 pending item descriptions in your local area.</p>
<div class="w-full bg-surface-variant h-1.5 rounded-full overflow-hidden">
<div class="bg-primary h-full w-[20%]"></div>
</div>
<p class="text-[10px] text-on-surface-variant mt-2">1 of 5 validated</p>
</div>
</div>
</div>
<!-- Badges Earned -->
<div class="bg-surface-container-lowest rounded-xl p-8 border border-outline-variant/15">
<div class="flex justify-between items-center mb-8">
<h2 class="text-xl font-bold">Badges Earned</h2>
<a class="text-primary text-sm font-semibold" href="#">See all 18</a>
</div>
<div class="flex flex-wrap gap-6 justify-between md:justify-start">
<div class="flex flex-col items-center gap-2 group cursor-pointer">
<div class="w-16 h-16 rounded-full bg-primary-fixed flex items-center justify-center text-primary-fixed-variant shadow-sm group-hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-3xl" style="font-variation-settings: 'FILL' 1;">handshake</span>
</div>
<span class="text-[10px] font-bold text-center uppercase tracking-tighter">Honest Soul</span>
</div>
<div class="flex flex-col items-center gap-2 group cursor-pointer">
<div class="w-16 h-16 rounded-full bg-tertiary-fixed flex items-center justify-center text-on-tertiary-fixed-variant shadow-sm group-hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-3xl" style="font-variation-settings: 'FILL' 1;">history_edu</span>
</div>
<span class="text-[10px] font-bold text-center uppercase tracking-tighter">Historian</span>
</div>
<div class="flex flex-col items-center gap-2 group cursor-pointer">
<div class="w-16 h-16 rounded-full bg-secondary-fixed flex items-center justify-center text-on-secondary-fixed-variant shadow-sm group-hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-3xl" style="font-variation-settings: 'FILL' 1;">local_police</span>
</div>
<span class="text-[10px] font-bold text-center uppercase tracking-tighter">Local Legend</span>
</div>
<div class="flex flex-col items-center gap-2 group cursor-pointer opacity-40 grayscale">
<div class="w-16 h-16 rounded-full bg-surface-container-highest flex items-center justify-center text-on-surface-variant shadow-sm">
<span class="material-symbols-outlined text-3xl" style="font-variation-settings: 'FILL' 0;">lock</span>
</div>
<span class="text-[10px] font-bold text-center uppercase tracking-tighter">Overseer</span>
</div>
<div class="flex flex-col items-center gap-2 group cursor-pointer opacity-40 grayscale">
<div class="w-16 h-16 rounded-full bg-surface-container-highest flex items-center justify-center text-on-surface-variant shadow-sm">
<span class="material-symbols-outlined text-3xl" style="font-variation-settings: 'FILL' 0;">lock</span>
</div>
<span class="text-[10px] font-bold text-center uppercase tracking-tighter">Restorer</span>
</div>
</div>
</div>
</div>
</section>
</main>
<!-- BottomNavBar -->
<div class="md:hidden fixed bottom-0 left-0 w-full flex justify-around items-center px-4 pb-6 pt-3 bg-white/80 dark:bg-slate-900/80 backdrop-blur-xl shadow-[0_-8px_24px_rgba(24,28,29,0.06)] z-50 rounded-t-3xl">
<div class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 px-5 py-2">
<span class="material-symbols-outlined">home</span>
<span class="text-[11px] font-medium font-body">Home</span>
</div>
<div class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 px-5 py-2">
<span class="material-symbols-outlined">search</span>
<span class="text-[11px] font-medium font-body">Search</span>
</div>
<div class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 px-5 py-2">
<span class="material-symbols-outlined">add_circle</span>
<span class="text-[11px] font-medium font-body">Report</span>
</div>
<div class="flex flex-col items-center justify-center bg-teal-50 dark:bg-teal-900/30 text-teal-700 dark:text-teal-300 rounded-2xl px-5 py-2">
<span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">person</span>
<span class="text-[11px] font-medium font-body">Profile</span>
</div>
</div>
</body></html>