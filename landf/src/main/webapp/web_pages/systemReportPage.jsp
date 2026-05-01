<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Submit Report | Findora</title>
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
        }
      }
    </script>
<style>
        body { font-family: 'Inter', sans-serif; }
        h1, h2, h3 { font-family: 'Manrope', sans-serif; }
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .tonal-shift { background-color: #f1f4f4; }
    </style>
</head>
<body class="bg-background text-on-background min-h-screen flex flex-col">
<!-- TopNavBar -->
<header class="bg-slate-50 dark:bg-slate-900 font-manrope text-sm font-medium full-width top-0 z-50 sticky bg-slate-100 dark:bg-slate-800/50 flat no shadows flex justify-between items-center px-6 py-3 w-full">
<div class="flex items-center gap-8">
<span class="text-xl font-bold text-teal-900 dark:text-teal-100 tracking-tight">Findora</span>
<nav class="hidden md:flex items-center gap-6">
<a class="text-slate-500 dark:text-slate-400 hover:bg-slate-200/50 dark:hover:bg-slate-800 transition-colors px-3 py-1 rounded-lg" href="#">Dashboard</a>
<a class="text-slate-500 dark:text-slate-400 hover:bg-slate-200/50 dark:hover:bg-slate-800 transition-colors px-3 py-1 rounded-lg" href="#">Items</a>
<a class="text-slate-500 dark:text-slate-400 hover:bg-slate-200/50 dark:hover:bg-slate-800 transition-colors px-3 py-1 rounded-lg" href="#">Locations</a>
</nav>
</div>
<div class="flex items-center gap-4">
<div class="relative group">
<span class="material-symbols-outlined text-teal-900 dark:text-teal-400 p-2 hover:bg-slate-200/50 rounded-full cursor-pointer">notifications</span>
<span class="absolute top-2 right-2 w-2 h-2 bg-secondary rounded-full"></span>
</div>
<img alt="User profile" class="w-8 h-8 rounded-full object-cover border border-outline-variant/20" data-alt="professional headshot of a campus administrator in a soft lit office setting, clean and sharp" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDuiP9SsjjKOTEhLRcqit01h6d4gF_Hsua9sRkw36BhB9ZTZYvrPQHk0HYQmyRT9yCb4DvFn4502u6yLELKt40dftAU0JbOJIwXzzRO6GloqntshlAig71UjCXc-c4C3hav3wJTxaAbcAEgwSe-Uts7w2ko-d6-EpNb-hCqL-hgdA3CgyfUwbAKsGXBUMGYqvgKpy8eaz_CKRt_5H0RD1jvSmdmOdRWZcgpJZhXTDV5kdjYaNDs9exdNJiZXkxY-Y657fsGE8-JMQ8"/>
</div>
</header>
<main class="flex-grow flex flex-col items-center py-12 px-6">
<div class="max-w-4xl w-full grid grid-cols-1 md:grid-cols-12 gap-8">
<!-- Left Side: Editorial Context -->
<div class="md:col-span-5 flex flex-col justify-start">
<div class="mb-8">
<span class="text-secondary font-bold tracking-widest text-[0.6875rem] uppercase mb-4 block">Institutional Stewardship</span>
<h1 class="text-4xl md:text-5xl font-extrabold text-primary leading-tight mb-6">
                        Report an <br/>Incident
                    </h1>
<p class="text-on-surface-variant text-base leading-relaxed max-w-sm">
                        Findora maintains a ledger of integrity. Use this form to report suspicious activity, fraudulent listings, or system discrepancies.
                    </p>
</div>
<!-- Alert Style Card (Static Info) -->
<div class="bg-primary-container/10 border-l-4 border-primary p-6 rounded-r-xl mb-8">
<div class="flex gap-3 mb-2">
<span class="material-symbols-outlined text-primary" style="font-variation-settings: 'FILL' 1;">gavel</span>
<span class="font-bold text-primary font-headline">Privacy Protocol</span>
</div>
<p class="text-sm text-primary/80 leading-snug">
                        All reports are reviewed by University Stewardship within 24 hours. Identity anonymization is applied to all initial triage phases.
                    </p>
</div>
<div class="relative h-48 rounded-xl overflow-hidden mt-auto hidden md:block">
<div class="absolute inset-0 bg-gradient-to-t from-primary/40 to-transparent z-10"></div>
<img alt="Institutional Ledger" class="w-full h-full object-cover" data-alt="close up of a fountain pen resting on a crisp white ledger book with elegant typography, soft natural window lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDmacNm-LjT6FSq2BUj68x49teVM5QC-h7HHEtwBSMe_CHvlaPLBJjInQDpDoG4VQFud6_7Azq5g7u6Evl0rKOv8Yk8jA5AzH28gw2gNu9m2SAewbDCyMi_49ndQuFU6WAAhRi65q716CPlcofaEP3yScRHVPRZWK8ehKu9Ba4HaQhlwIvjZ8gm_NYFa7pp1Z7u5VzozfBYyL3SKfNne2spaFQUfTIISk8Xm2Oj-mAGWEDj8-czup_FtxKRMDmxghlqUQgmiCYEVTM"/>
</div>
</div>
<!-- Right Side: The Form Ledger -->
<div class="md:col-span-7">
<div class="bg-surface-container-lowest rounded-xl p-8 shadow-[0_24px_48px_-12px_rgba(24,28,29,0.06)] border border-outline-variant/10">
<form class="space-y-6">
<!-- Report Title -->
<div class="relative">
<label class="absolute -top-2 left-3 bg-surface-container-lowest px-2 text-[0.6875rem] font-bold text-outline uppercase tracking-wider z-10">Report Title</label>
<input class="w-full bg-surface-container-highest border-none rounded-lg px-4 py-4 text-on-surface placeholder:text-outline-variant focus:ring-2 focus:ring-primary/30 transition-all font-body" placeholder="Brief summary of the issue" type="text"/>
</div>
<!-- Item Reference (Optional) -->
<div class="relative">
<label class="absolute -top-2 left-3 bg-surface-container-lowest px-2 text-[0.6875rem] font-bold text-outline uppercase tracking-wider z-10">Item Reference (Optional)</label>
<div class="flex items-center bg-surface-container-highest rounded-lg px-4">
<span class="material-symbols-outlined text-outline-variant mr-2">tag</span>
<input class="w-full bg-transparent border-none py-4 text-on-surface placeholder:text-outline-variant focus:ring-0 font-body" placeholder="ID: #FND-XXXX" type="text"/>
</div>
</div>
<!-- Severity Selector -->
<div class="space-y-3">
<label class="text-[0.6875rem] font-bold text-outline uppercase tracking-wider px-1">Severity Level</label>
<div class="grid grid-cols-3 gap-3">
<button class="py-3 px-2 rounded-lg border-2 border-surface-container-high text-on-surface-variant font-semibold text-sm hover:border-primary-container/40 transition-colors flex items-center justify-center gap-2" type="button">
<span class="w-2 h-2 rounded-full bg-teal-400"></span> Low
                                </button>
<button class="py-3 px-2 rounded-lg border-2 border-primary text-primary font-bold text-sm bg-primary/5 flex items-center justify-center gap-2" type="button">
<span class="w-2 h-2 rounded-full bg-secondary-container"></span> Medium
                                </button>
<button class="py-3 px-2 rounded-lg border-2 border-surface-container-high text-on-surface-variant font-semibold text-sm hover:border-error/40 transition-colors flex items-center justify-center gap-2" type="button">
<span class="w-2 h-2 rounded-full bg-error"></span> High
                                </button>
</div>
</div>
<!-- Description -->
<div class="relative">
<label class="absolute -top-2 left-3 bg-surface-container-lowest px-2 text-[0.6875rem] font-bold text-outline uppercase tracking-wider z-10">Description of issue</label>
<textarea class="w-full bg-surface-container-highest border-none rounded-lg px-4 py-4 text-on-surface placeholder:text-outline-variant focus:ring-2 focus:ring-primary/30 transition-all font-body resize-none" placeholder="Detail the suspicious activity or discrepancy..." rows="4"></textarea>
</div>
<!-- Image Upload (Bento Style Card) -->
<div class="group relative bg-surface-container-low border-2 border-dashed border-outline-variant/30 rounded-xl p-8 flex flex-col items-center justify-center text-center cursor-pointer hover:bg-surface-container-high transition-all">
<div class="w-12 h-12 rounded-full bg-white flex items-center justify-center shadow-sm mb-3 group-hover:scale-110 transition-transform">
<span class="material-symbols-outlined text-primary">cloud_upload</span>
</div>
<span class="text-sm font-bold text-primary">Upload Supporting Evidence</span>
<span class="text-xs text-outline mt-1">PNG, JPG or PDF up to 10MB</span>
<input class="absolute inset-0 opacity-0 cursor-pointer" type="file"/>
</div>
<!-- Submit Button -->
<div class="pt-4">
<button class="w-full bg-secondary-container text-on-secondary-container font-bold py-4 rounded-lg flex items-center justify-center gap-3 hover:shadow-lg hover:-translate-y-0.5 active:scale-95 transition-all" type="submit">
<span>Submit Official Report</span>
<span class="material-symbols-outlined">send</span>
</button>
<p class="text-[10px] text-center text-outline mt-4 uppercase tracking-[0.2em] font-medium">
                                Reference Code will be generated upon submission
                            </p>
</div>
</form>
</div>
</div>
</div>
</main>
<!-- Footer -->
<footer class="bg-slate-50 dark:bg-slate-900 text-teal-900 dark:text-teal-400 font-inter text-xs tracking-wide uppercase w-full py-6 mt-auto border-t border-slate-200/10 flex flex-col md:flex-row justify-between items-center px-12 opacity-80">
<div class="font-manrope font-black text-teal-900 dark:text-teal-100 mb-4 md:mb-0">
            Findora
        </div>
<div class="flex gap-8 mb-4 md:mb-0">
<a class="text-slate-400 hover:text-orange-500 transition-colors" href="#">Privacy Policy</a>
<a class="text-slate-400 hover:text-orange-500 transition-colors" href="#">Terms of Service</a>
<a class="text-slate-400 hover:text-orange-500 transition-colors" href="#">Support</a>
</div>
<div class="text-slate-400">
            © 2024 Findora Lost &amp; Found. Managed Institutional Stewardship.
        </div>
</footer>
</body></html>