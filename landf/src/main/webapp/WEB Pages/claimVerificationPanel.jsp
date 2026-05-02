<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Claim Verification Panel | The Curated Custodian</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&amp;family=Plus+Jakarta+Sans:wght@400;500;600&amp;display=swap" rel="stylesheet"/>
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
    </style>
</head>
<body class="bg-surface text-on-surface flex overflow-hidden h-screen">
<!-- Sidebar Navigation (From JSON SideNavBar) -->
<aside class="h-screen w-72 bg-[#f1f4f4] dark:bg-slate-950 flex flex-col py-8 shrink-0">
<div class="text-lg font-black text-teal-900 dark:text-teal-100 px-6 py-8">
            Admin Console
            <span class="block text-xs font-medium text-slate-500 uppercase tracking-widest mt-1">System Admin</span>
</div>
<nav class="flex-grow space-y-1">
<a class="text-slate-500 dark:text-slate-400 pl-10 py-3 block hover:bg-white/50 dark:hover:bg-slate-800/50 transition-all translate-x-1 duration-200" href="#">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined">dashboard</span>
<span>Overview</span>
</div>
</a>
<a class="text-slate-500 dark:text-slate-400 pl-10 py-3 block hover:bg-white/50 dark:hover:bg-slate-800/50 transition-all translate-x-1 duration-200" href="#">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined">inventory_2</span>
<span>All Items</span>
</div>
</a>
<a class="bg-white dark:bg-slate-900 text-teal-700 dark:text-teal-300 rounded-l-full ml-4 pl-6 py-3 font-semibold translate-x-1 duration-200" href="#">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">verified</span>
<span>Claims</span>
</div>
</a>
<a class="text-slate-500 dark:text-slate-400 pl-10 py-3 block hover:bg-white/50 dark:hover:bg-slate-800/50 transition-all translate-x-1 duration-200" href="#">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined">group</span>
<span>Users</span>
</div>
</a>
<a class="text-slate-500 dark:text-slate-400 pl-10 py-3 block hover:bg-white/50 dark:hover:bg-slate-800/50 transition-all translate-x-1 duration-200" href="#">
<div class="flex items-center gap-3">
<span class="material-symbols-outlined">settings</span>
<span>Settings</span>
</div>
</a>
</nav>
<div class="px-6 mt-auto">
<button class="w-full py-4 px-6 bg-teal-700 text-white rounded-xl font-bold flex items-center justify-center gap-2 hover:bg-teal-800 transition-colors">
<span class="material-symbols-outlined">download</span>
                Export Report
            </button>
</div>
</aside>
<main class="flex-grow flex flex-col overflow-hidden relative">
<!-- Top Navigation (From JSON TopNavBar) -->
<header class="fixed top-0 w-full z-50 bg-[#f7fafa]/80 dark:bg-slate-900/80 backdrop-blur-md flex justify-between items-center px-8 h-20 max-w-full">
<div class="text-xl font-bold tracking-tighter text-teal-900 dark:text-teal-100">Findora</div>
<div class="flex items-center gap-8">
<nav class="hidden lg:flex items-center gap-8">
<a class="text-slate-500 dark:text-slate-400 hover:text-teal-600 transition-colors duration-200" href="#">Dashboard</a>
<a class="text-slate-500 dark:text-slate-400 hover:text-teal-600 transition-colors duration-200" href="#">Analytics</a>
<a class="text-slate-500 dark:text-slate-400 hover:text-teal-600 transition-colors duration-200" href="#">Directory</a>
</nav>
<button class="bg-gradient-to-br from-[#006565] to-[#008080] text-white px-6 py-2.5 rounded-xl font-bold text-sm hover:opacity-90 transition-all scale-95 duration-150">
                    Report Found Item
                </button>
<div class="w-10 h-10 rounded-full overflow-hidden bg-surface-container-high ring-2 ring-teal-600/20 ring-offset-2 ring-offset-background">
<img alt="User profile concierge" data-alt="professional male portrait with kind eyes in a bright studio setting, minimalist aesthetic" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDsRQ-7B_esH-GjT0Z2VAhMxcxjMDMKush3MXcJf0FAWIhqLYmAfVQiD2scGgHnu2iRPR7W-xJn6u9KxY4w7AMBhdejVFOiqYUidYHB2W6TA9ERT8I8EyoMo8N0OHKsdzDo4SIWUMSHrmZxBlrF54lboj92BYdlIRdnprSsnz0eY9rNjoySAVGYshQr3CWGHODHIlAmHAE00e37wiiiwO76CUMHzVogxfNMvxHHiV8m48oH-LKSLcZSha0MdHp0E4E-kYDqhuzL18s"/>
</div>
</div>
</header>
<!-- Main Content Area: Split View Panel -->
<div class="mt-20 flex-grow flex overflow-hidden">
<!-- Left Panel: Claims List (Master) -->
<section class="w-96 border-r border-outline-variant/15 flex flex-col bg-surface overflow-y-auto">
<div class="p-8 border-b border-outline-variant/15">
<h2 class="text-2xl font-extrabold tracking-tight text-on-surface mb-2">Pending Claims</h2>
<p class="text-sm text-on-surface-variant font-medium">Verify 12 pending ownership requests</p>
</div>
<div class="divide-y divide-outline-variant/10">
<!-- Claim Card: Active -->
<div class="p-6 bg-surface-container-lowest border-l-4 border-primary cursor-pointer transition-colors">
<div class="flex justify-between items-start mb-3">
<span class="text-[10px] font-bold tracking-widest text-primary uppercase bg-primary-container/20 px-2 py-0.5 rounded-full">High Priority</span>
<span class="text-xs text-on-surface-variant">2 hours ago</span>
</div>
<h3 class="font-bold text-lg mb-1 leading-tight">Vintage Leather Briefcase</h3>
<p class="text-sm text-on-surface-variant mb-4">Reported at Central Station</p>
<div class="flex items-center gap-2">
<div class="w-6 h-6 rounded-full bg-surface-container-high overflow-hidden">
<img alt="Claimant Avatar" data-alt="close-up portrait of a woman with a confident expression in natural daylight" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCArpNAb-ETGXucO-tJzXAv00d3gGejavfT51wPw5CUO53AQ2ATGJVGvwrejkaw-OTJGCj1jmnih8e1w34yz1Fo3ltG5dmDrs7W866Wx2kAz85BY0pmTQCSv5hvhN4KL67AtbK-s_m44fc9ysTPpcUG7AiBFdIowat39kQ1hi8IChy_mwO7bsF8Lc-CAW8TaHa6q9mc7hkUB3szbN0gcD7YYJcINlAZi9gXArIsMndWUQ6cQ40U5ekZG41cQMmhiYKa7Niv1ZyXUVk"/>
</div>
<span class="text-sm font-semibold">Elena Vance</span>
<div class="ml-auto flex items-center text-tertiary font-bold text-xs">
<span class="material-symbols-outlined text-[14px] mr-0.5" style="font-variation-settings: 'FILL' 1;">star</span>
                                982
                            </div>
</div>
</div>
<!-- Claim Card: Inactive -->
<div class="p-6 hover:bg-surface-container-low cursor-pointer transition-colors">
<div class="flex justify-between items-start mb-3">
<span class="text-[10px] font-bold tracking-widest text-on-surface-variant uppercase bg-surface-container-high px-2 py-0.5 rounded-full">New</span>
<span class="text-xs text-on-surface-variant">4 hours ago</span>
</div>
<h3 class="font-bold text-lg mb-1 leading-tight">Silver Leica M6</h3>
<p class="text-sm text-on-surface-variant mb-4">Found in Golden Gate Park</p>
<div class="flex items-center gap-2">
<div class="w-6 h-6 rounded-full bg-surface-container-high overflow-hidden">
<img alt="Claimant Avatar" data-alt="professional male portrait with a neutral expression in high-key lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAxzJWFv_UHkPCDnFfLpOrBqcefq5yBd4uZ6m04bv0VMw2XeVz_6K3b4slQ1iy17YyxQv2ssB8iEWcrUsPrwhRwMyOTdv26bu_oEbxLWV3ICa3bEnBNjN7lE08F7NKN0I0xaIRtBAnuJ7jdA6RUwPGHe5xYE3XD-jJUXLrgNhUDH_JFxngwbOzS0NoummYeDyknGc4sZ2njDw7FUvS8VL1sbVTHhUq4lSlesjk-vxwww9Fv8vpSmWsSdOz5o_TDJBlfEtJS8AJYn-I"/>
</div>
<span class="text-sm font-semibold">Julian Ross</span>
<div class="ml-auto flex items-center text-tertiary font-bold text-xs">
<span class="material-symbols-outlined text-[14px] mr-0.5" style="font-variation-settings: 'FILL' 1;">star</span>
                                1,240
                            </div>
</div>
</div>
<!-- Claim Card: Inactive -->
<div class="p-6 hover:bg-surface-container-low cursor-pointer transition-colors opacity-75">
<div class="flex justify-between items-start mb-3">
<span class="text-[10px] font-bold tracking-widest text-on-surface-variant uppercase bg-surface-container-high px-2 py-0.5 rounded-full">Expiring</span>
<span class="text-xs text-on-surface-variant">1 day ago</span>
</div>
<h3 class="font-bold text-lg mb-1 leading-tight">Monogrammed Fountain Pen</h3>
<p class="text-sm text-on-surface-variant mb-4">Hotel Lobby Lounge</p>
<div class="flex items-center gap-2">
<div class="w-6 h-6 rounded-full bg-surface-container-high overflow-hidden">
<img alt="Claimant Avatar" data-alt="friendly smiling man with glasses in a warm office environment" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBUNPmcY2IMxdFQ3aYIYKR1unb1f8PEFS7wKQR6LRttRKnZ0EfEAtGuG_Or5l_fJD6ncGUkMhHjfj8UgZlS1n2ActCSL63vTpE0rj6DTLDUafKBLHt3wS4yEFoHxE80mSS4VqDU-RFJqhgQArnbamvt9HB_zgAhAGDrEqA2UQupel7rQBvssl6BSb79RJZmwnVX7Wq-JWswXFGrcv0u4QceuIKHifV3_ULJrj1jg63XiMlpBuHYMG5WTlkKnnefdCbi93IqPJPNurc"/>
</div>
<span class="text-sm font-semibold">David Chen</span>
<div class="ml-auto flex items-center text-tertiary font-bold text-xs">
<span class="material-symbols-outlined text-[14px] mr-0.5" style="font-variation-settings: 'FILL' 1;">star</span>
                                450
                            </div>
</div>
</div>
</div>
</section>
<!-- Right Panel: Claim Details (Detail View) -->
<section class="flex-grow flex flex-col bg-surface-container-low overflow-y-auto">
<!-- Header Actions -->
<div class="p-8 flex items-center justify-between sticky top-0 bg-surface-container-low/90 backdrop-blur-sm z-10">
<div class="flex items-center gap-4">
<span class="bg-primary-container text-on-primary text-xs font-bold px-3 py-1 rounded-full">CLAIM #CV-8921</span>
<h1 class="text-3xl font-extrabold tracking-tight">Claim Verification</h1>
</div>
<div class="flex gap-4">
<button class="bg-surface-container-lowest text-error border-2 border-error/10 px-6 py-2.5 rounded-xl font-bold hover:bg-error/5 transition-all flex items-center gap-2">
<span class="material-symbols-outlined">block</span>
                            Reject Claim
                        </button>
<button class="bg-tertiary text-on-tertiary px-8 py-2.5 rounded-xl font-extrabold shadow-lg shadow-tertiary/20 hover:scale-105 transition-all flex items-center gap-2">
<span class="material-symbols-outlined">verified_user</span>
                            Approve Claim
                        </button>
</div>
</div>
<div class="px-8 pb-12 grid grid-cols-12 gap-8">
<!-- Item Information Bento Card -->
<div class="col-span-12 lg:col-span-7 bg-surface-container-lowest p-8 rounded-xl">
<h2 class="text-xl font-bold mb-6 text-on-surface border-b border-outline-variant/10 pb-4">Item Catalog Details</h2>
<div class="grid grid-cols-2 gap-8">
<div class="space-y-6">
<div>
<p class="text-xs font-bold uppercase tracking-widest text-on-surface-variant mb-1">Item Title</p>
<p class="text-lg font-semibold">Vintage Brown Leather Briefcase</p>
</div>
<div>
<p class="text-xs font-bold uppercase tracking-widest text-on-surface-variant mb-1">Estimated Value</p>
<p class="text-lg font-semibold text-primary">$450.00 USD</p>
</div>
<div>
<p class="text-xs font-bold uppercase tracking-widest text-on-surface-variant mb-1">Distinguishing Marks</p>
<p class="text-sm leading-relaxed">Scuffed bottom right corner, gold-tone hardware with mild oxidation, monogrammed initials "E.V" inside the front flap.</p>
</div>
</div>
<div class="relative group">
<div class="rounded-xl overflow-hidden aspect-square">
<img alt="Item Image" class="w-full h-full object-cover" data-alt="close-up of a premium leather briefcase with fine stitching and polished metal buckles against a neutral background" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDt7y0PFq1O48m-pmqIfoufcON4hcJntQV6KPZI7-7U7f6t5XaCIey0rJWjTBOxtnD6bsmgGp4-_urMdCrVBOYxK9On4zLlOSGHlCEfFTqEzsN27S9Mqkb84Tx4ivpL9w7hiZ2ccdnlsN_jZGWJFJszL-oPCQceyT12-kM07ft79vWeXTge6GEgsXVoJM-9Uy8Gco0fMcO3osM-xYLrdZfZDhqANhoEoSaVKfPjIv_MfAeBbAaEPsdPixVU25SAwi3aY-TASKb5llY"/>
</div>
<div class="absolute bottom-4 left-4 right-4 bg-surface-container-lowest/90 backdrop-blur p-3 rounded-lg flex items-center gap-3">
<span class="material-symbols-outlined text-primary">location_on</span>
<div>
<p class="text-[10px] font-bold uppercase">Discovery Site</p>
<p class="text-xs font-semibold">Platform 4, Central Station</p>
</div>
</div>
</div>
</div>
</div>
<!-- User Reputation & Activity Bento Card -->
<div class="col-span-12 lg:col-span-5 bg-surface-container-lowest p-8 rounded-xl flex flex-col justify-between">
<div>
<h2 class="text-xl font-bold mb-6 text-on-surface border-b border-outline-variant/10 pb-4">Claimant Profile</h2>
<div class="flex items-center gap-4 mb-8">
<div class="w-16 h-16 rounded-full overflow-hidden bg-surface-container-low ring-4 ring-tertiary-fixed/50">
<img alt="Elena Vance" data-alt="close-up portrait of a woman with a confident expression in natural daylight" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDTCn2JXlSq4N0fd5GdgHxp6emvLzId_GVBJQ4WwuCZ6ICrPaONUeInAergGVTrja3Evrc0k_rsQRtCBw0scLAE3IkQoL5PhImTjGtJiIpVNz44VK5tzlpbIVKHIYfOslC8oGNDwME27wA0II2GpzZrilvkugvRLrepwrrZPpAcJcYRKvIE7NaxR5T_RCnh175K2B40H_lYWNY-vPn-z6uQUqA3XoYHIm3jU3ZD22LAvzHcB5YNlBe6zll_63eI6yzmOHXoL0z1W7A"/>
</div>
<div>
<p class="text-xl font-bold">Elena Vance</p>
<p class="text-sm text-on-surface-variant">Member since October 2021</p>
</div>
</div>
<div class="grid grid-cols-2 gap-4 mb-8">
<div class="bg-surface-container-low p-4 rounded-xl text-center">
<p class="text-2xl font-black text-tertiary">982</p>
<p class="text-[10px] font-bold uppercase tracking-wider text-on-surface-variant">Reputation Score</p>
</div>
<div class="bg-surface-container-low p-4 rounded-xl text-center">
<p class="text-2xl font-black text-primary">14</p>
<p class="text-[10px] font-bold uppercase tracking-wider text-on-surface-variant">Successful Claims</p>
</div>
</div>
</div>
<div class="p-4 bg-tertiary-container/10 border border-tertiary/10 rounded-xl">
<div class="flex items-center gap-2 mb-2">
<span class="material-symbols-outlined text-tertiary" style="font-variation-settings: 'FILL' 1;">verified</span>
<span class="text-sm font-bold text-tertiary">Verified Identity</span>
</div>
<p class="text-xs text-on-surface-variant leading-relaxed">Identity confirmed via government-issued ID. High trust rating from 3 separate custodial institutions.</p>
</div>
</div>
<!-- Ownership Proof Bento Card -->
<div class="col-span-12 bg-surface-container-lowest p-8 rounded-xl">
<h2 class="text-xl font-bold mb-6 text-on-surface border-b border-outline-variant/10 pb-4">Evidence of Ownership</h2>
<div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
<div class="lg:col-span-2 space-y-6">
<div class="bg-surface-container-low p-6 rounded-xl border-l-4 border-secondary">
<p class="text-xs font-bold uppercase tracking-widest text-on-secondary-fixed-variant mb-3">User Statement</p>
<p class="italic text-on-surface leading-relaxed font-medium">
                                        "I left this briefcase near the ticket kiosks at Central Station yesterday afternoon. It contains a collection of architectural blueprints and a specific fountain pen engraved with my father's initials 'J.V.'. The leather has a small stain from coffee on the interior lining of the middle pocket."
                                    </p>
</div>
<div class="grid grid-cols-2 gap-4">
<div class="p-4 rounded-xl border border-outline-variant/20 flex items-center gap-4">
<div class="w-12 h-12 bg-primary-container/10 rounded-lg flex items-center justify-center">
<span class="material-symbols-outlined text-primary">receipt_long</span>
</div>
<div>
<p class="text-sm font-bold">Purchase_Receipt.pdf</p>
<p class="text-xs text-on-surface-variant">Verified by Retailer API</p>
</div>
</div>
<div class="p-4 rounded-xl border border-outline-variant/20 flex items-center gap-4">
<div class="w-12 h-12 bg-primary-container/10 rounded-lg flex items-center justify-center">
<span class="material-symbols-outlined text-primary">image</span>
</div>
<div>
<p class="text-sm font-bold">Ownership_Photo_1.jpg</p>
<p class="text-xs text-on-surface-variant">Metadata Matched</p>
</div>
</div>
</div>
</div>
<div class="space-y-4">
<p class="text-xs font-bold uppercase tracking-widest text-on-surface-variant">User-Provided Proof Photo</p>
<div class="rounded-xl overflow-hidden shadow-md">
<img alt="Proof Photo" data-alt="a lifestyle photograph of a person holding the same vintage briefcase in a casual home setting, soft natural lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCk-6PP1ZXFSAJQnmx4IhQnaT16ku2gtW_ifC0ZWIVGkvXzsybaack9up_KUteLg4yQbKVyh6qiIcGPE7XpG20A-VAv6GbNXiwaaBME533rEWqfCrl9xjoWH1gJpyX3Pe3GavyrZ3ZoDxLUrWVUbK2wTW40qdH4KteEMyQT5c4OgFobezDEfiCkJa8ls-XDj1_-fcDAUJYFptHXI4lbeCEVR3xU4emR8Za6Zd-Nd4qcOVotxRvX3CEgekz0-h9gQKqWCmC6yB92NM0"/>
</div>
<p class="text-[11px] text-on-surface-variant leading-tight">Image Analysis: 94% visual match with item #CV-8921. Taken: 05/14/2023.</p>
</div>
</div>
</div>
</div>
</section>
</div>
</main>
<!-- Bottom Nav for Mobile Only (From JSON) -->
<nav class="md:hidden fixed bottom-0 left-0 w-full flex justify-around items-center px-4 pb-6 pt-3 bg-white/80 dark:bg-slate-900/80 backdrop-blur-xl z-50 rounded-t-3xl shadow-[0_-8px_24px_rgba(24,28,29,0.06)]">
<a class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 px-5 py-2 tap-highlight-none active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined">home</span>
<span class="text-[11px] font-medium Plus Jakarta Sans">Home</span>
</a>
<a class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 px-5 py-2 tap-highlight-none active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined">search</span>
<span class="text-[11px] font-medium Plus Jakarta Sans">Search</span>
</a>
<a class="flex flex-col items-center justify-center bg-teal-50 dark:bg-teal-900/30 text-teal-700 dark:text-teal-300 rounded-2xl px-5 py-2 tap-highlight-none active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">add_circle</span>
<span class="text-[11px] font-medium Plus Jakarta Sans">Report</span>
</a>
<a class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 px-5 py-2 tap-highlight-none active:scale-90 transition-transform" href="#">
<span class="material-symbols-outlined">person</span>
<span class="text-[11px] font-medium Plus Jakarta Sans">Profile</span>
</a>
</nav>
</body></html>