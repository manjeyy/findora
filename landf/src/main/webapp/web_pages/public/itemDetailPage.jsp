<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&amp;family=Plus+Jakarta+Sans:wght@400;500;600&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script id="tailwind-config"> tailwind.config = {
        darkMode: "class", theme: {
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
                "borderRadius": {"DEFAULT": "0.25rem", "lg": "1rem", "xl": "1.5rem", "full": "9999px"},
                "fontFamily": {"headline": ["Manrope"], "body": ["Plus Jakarta Sans"], "label": ["Plus Jakarta Sans"]}
            }
        }
    } </script>
    <style> .material-symbols-outlined {
        font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
    }

    .text-editorial {
        letter-spacing: -0.02em;
    }

    .signature-gradient {
        background: linear-gradient(135deg, #006565 0%, #008080 100%);
    }

    .glass-nav {
        backdrop-filter: blur(20px);
    } </style>
</head>
<body class="bg-surface font-body text-on-surface selection:bg-primary-fixed selection:text-on-primary-fixed">
<header class="fixed top-0 w-full z-50 bg-[#f7fafa]/80 backdrop-blur-md flex justify-between items-center px-8 h-20 max-w-full">
    <div class="flex items-center gap-2">
        <span class="text-xl font-bold tracking-tighter text-teal-900 font-headline">Findora</span>
    </div>
    <nav class="hidden md:flex items-center gap-8">
        <a class="text-slate-500 font-medium hover:text-teal-600 transition-colors duration-200 font-label" href="#">Dashboard</a>
        <a class="text-slate-500 font-medium hover:text-teal-600 transition-colors duration-200 font-label" href="#">Analytics</a>
        <a class="text-teal-800 font-bold border-b-2 border-teal-600 font-label" href="#">Directory</a>
    </nav>
    <div class="flex items-center gap-4">
        <button class="hidden md:block signature-gradient text-on-primary px-6 py-2.5 rounded-xl font-semibold shadow-sm hover:opacity-90 transition-opacity font-label">
            Report Found Item
        </button>
        <div class="w-10 h-10 rounded-full overflow-hidden bg-surface-container-high">
            <img alt="User profile concierge" class="w-full h-full object-cover"
                 data-alt="professional portrait of a concierge in a sharp uniform with friendly expression soft studio lighting"
                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuAyDFo3qieL-R2o2zfqURmW4koxklCHoLwDJ4LW-xmZGLmji0KWJA9l-eJlHhl3MVl-3980ulswEreTXrrXVnnPQa0O-wAhGpGgK00QO-pbrOypUebCg2dVK7c3KrbCMAkcj2Um59obgMxnCRhJ64sKlQIR7KHy--vM6dMtm3M1sQi5Qz0DKZnunf9iDnqasEV91p2Y0d27oBIClSnPGOMbOFNsUYG5mceOW2J1N0JaNOl8SHkKeGUCgypXk2k3_Z9p3g3IQayBLGo"/>
        </div>
    </div>
</header>
<main class="pt-32 pb-24 px-6 md:px-12 lg:px-24 max-w-7xl mx-auto">
    <!-- Breadcrumb / Back Navigation -->
    <nav class="mb-8 flex items-center gap-2 text-on-surface-variant text-sm font-label">
        <a class="hover:text-primary" href="#">Directory</a>
        <span class="material-symbols-outlined text-xs">chevron_right</span>
        <span class="font-semibold text-on-surface">Item Details</span>
    </nav>
    <!-- Main Detail Grid -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-12 items-start">
        <!-- Left: Asymmetric Image Gallery -->
        <div class="lg:col-span-7 space-y-6">
            <div class="aspect-[4/5] md:aspect-[16/11] rounded-xl overflow-hidden bg-surface-container-low">
                <img class="w-full h-full object-cover shadow-sm transition-transform duration-500 hover:scale-105"
                     data-alt="Premium minimal designer watch with leather strap sitting on a clean stone surface with soft morning light"
                     src="https://lh3.googleusercontent.com/aida-public/AB6AXuDx07xUI9F097NeU-KT-5xd8Uw4BChvniJTvZhilRaZzRcP6GpgyGsgtcOSrhiIfWJxS6WWW6b00UKzGPvlLNcIJxxTJckhAk9ED_pSMEmEDGmKGESMM2vhuTg1ikZzo4VSnNoyXuwQVEdorvtmh7uATMdEjnGX6DA_v-yPdOcTkg1UFvm8P1lCZDUhg3E-nJs6-g5JDHgGso0xYBw4lYYL6gpMWu6l26PRcltf5su1sx5ENVAoDbMn87xod6IDAH9sIXZ9dfej22M"/>
            </div>
            <div class="grid grid-cols-3 gap-4">
                <div class="aspect-square rounded-lg overflow-hidden bg-surface-container-low">
                    <img class="w-full h-full object-cover"
                         data-alt="Close up detail of a watch dial with silver hour markers and luminous hands under soft lighting"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuApIzZDcrHGd_07hxhXCycK_38bNJN76vkcZBMGYEZp9CfPry3yxBhAEhnN2y7zzGMKtm086OdmfX6WZUNSo6LYdsT8ujXXMzifG2pRiLvcMySmZuWflWDob1WldvZTvt8ePmk6lhynM6g0r6yUGvZohyopPxvY6OJTJ-Aox_9I-xkJfQBTUkTOmcoTsqJipS1YHUsmOhddkxyLcCGW8WhSiQXpLvvUXoBLqcK7GeiTfddAHcwO8XQY8m5igD5XzLfbWcovCDkvBdM"/>
                </div>
                <div class="aspect-square rounded-lg overflow-hidden bg-surface-container-low">
                    <img class="w-full h-full object-cover"
                         data-alt="Side profile of a premium watch showing the crown and brushed metal finish on the case"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuBz13qqlCj2G0Xz0V_pRZpFVaKNuH6QYvGvHfhDq6A34-fARv4bys74O2CmXqGoB5KiR2hoNZPThcpMqsNJ0VbV5qz1QdSiPf4pbNgvpkjxlpYgIGmrBq1Vf3U2DDH8jtlcPZuXtdVwx-m4E4jUWEjo2qz-IlfwBcVO3jjSvYYGLruSCIgtS7U2DcMIjvW1WjL0coEfmD3xAfshhZ9yZFcBm3IaoDXoxZiU33EWx3H8pdizJJTbj_vVAmzUKgaV6d8v4OiLuW-9Gyg"/>
                </div>
                <div class="relative aspect-square rounded-lg overflow-hidden bg-surface-container-low group cursor-pointer">
                    <img class="w-full h-full object-cover opacity-60"
                         data-alt="Watch strap buckle detail showing fine leather grain and clean stitching"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuAz4DWDMCZOjHdPExHx6qLyXk53H4eK1aNEf87wA0fCqvRGguZT1-TM7L8lg_uVZo7ZYqPCNEphCxK66uSuTGfT2adgsXy2AboLycOE7aw5GjilhXxfIljZuqaEiS8MMJu_6xColpmLq-NrfhYd3OZDExQC8Cs8XXMJmPr4k9LfjfnsFZem_w7xFCIv8uV3K-YXpw3qqyJfFaJ3YF9Y2PlLRdd9WpXOhn7Blc2HpcFg5fJWSHxqnL4Wb0jwZPwhxHP7IZtcMcs356I"/>
                    <div class="absolute inset-0 flex items-center justify-center font-headline font-bold text-on-surface">
                        +2 More
                    </div>
                </div>
            </div>
        </div>
        <!-- Right: Content & Actions -->
        <div class="lg:col-span-5 flex flex-col gap-8">
            <div class="space-y-4">
                <div class="flex items-center gap-3">
                    <span class="bg-primary-container text-on-primary-container px-4 py-1 rounded-full text-xs font-bold font-label uppercase tracking-wider">Open</span>
                    <span class="text-on-surface-variant text-sm font-label">Ref: #TC-98231</span>
                </div>
                <h1 class="text-4xl md:text-5xl font-headline font-extrabold text-editorial text-on-surface">Silver
                    Chronograph Watch</h1>
                <p class="text-lg text-on-surface-variant leading-relaxed font-body"> Found near the South Terminal
                    lounge area. The item appears to be a high-end stainless steel chronograph with a tan leather strap.
                    No visible scratches on the sapphire crystal. </p>
            </div>
            <div class="space-y-6 bg-surface-container-lowest p-8 rounded-xl">
                <div class="flex items-start gap-4">
                    <div class="w-10 h-10 rounded-full bg-primary-fixed flex items-center justify-center">
                        <span class="material-symbols-outlined text-on-primary-fixed">calendar_today</span>
                    </div>
                    <div>
                        <p class="text-xs font-bold text-on-surface-variant uppercase font-label">Date Found</p>
                        <p class="text-on-surface font-semibold">October 14th, 2023 • 2:45 PM</p>
                    </div>
                </div>
                <div class="flex items-start gap-4">
                    <div class="w-10 h-10 rounded-full bg-primary-fixed flex items-center justify-center">
                        <span class="material-symbols-outlined text-on-primary-fixed">location_on</span>
                    </div>
                    <div class="w-full">
                        <p class="text-xs font-bold text-on-surface-variant uppercase font-label mb-2">Location
                            Found</p>
                        <div class="h-40 w-full rounded-lg bg-surface-variant overflow-hidden">
                            <img class="w-full h-full object-cover grayscale opacity-80 hover:grayscale-0 transition-all duration-300"
                                 data-alt="Minimal map preview showing a transit terminal area with teal colored markers and soft gray background"
                                 data-location="Heathrow Terminal 5"
                                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuBIGPpDOcEQDMiRUBTwM-ctouT-AJS6qaUw3RyCaX9CmjcwGEZ7I0zI6IFUaX67Y40qGfyf4FxsyDPgLgw1yhN0K8woi_XWpJfLvPpj1STO8VerfofJJ-C-Vif0MkQy-8wlIRn3QM4MVYLTuU-OfIJj3LeH3bZhxF72HQhhwwcxvpc69uosoxHzMMwUjD7vswdciuSlSzkGUuzjO2JjaWj7XfA6hxwE_Bu8XM5ZFhRebaH32emA4xXhxlCnnIMyaAYUWrH7osr6Ki4"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex flex-col gap-4">
                <button class="w-full py-5 px-8 rounded-xl bg-secondary-container text-on-secondary-fixed font-bold text-lg font-headline shadow-sm hover:scale-[1.01] active:scale-95 transition-all">
                    Claim this Item
                </button>
                <button class="w-full py-4 px-8 rounded-xl border-2 border-outline-variant text-primary font-bold font-headline hover:bg-surface-container-low transition-colors">
                    Mark as Resolved
                </button>
            </div>
        </div>
    </div>
    <!-- Match Suggestions Section -->
    <section class="mt-24">
        <div class="flex items-end justify-between mb-8">
            <div>
                <span class="text-primary font-bold font-label text-sm uppercase tracking-widest">Intelligent Curation</span>
                <h2 class="text-3xl font-headline font-bold text-editorial">Potential Match Suggestions</h2>
            </div>
            <button class="text-primary font-bold font-label flex items-center gap-2 hover:gap-3 transition-all"> View
                All <span class="material-symbols-outlined">arrow_forward</span>
            </button>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            <!-- Suggestion Card 1 -->
            <div class="group bg-surface-container-lowest rounded-lg overflow-hidden transition-all hover:shadow-[0_8px_24px_rgba(24,28,29,0.06)]">
                <div class="aspect-square overflow-hidden">
                    <img class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                         data-alt="Luxury watch in a presentation box with soft velvet lining and moody ambient lighting"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuCPmKGTOKCdPIPfziQ3qYZhVFhoXeAp5pkxQCNkJjmWtvv90wNJ_2SnFi-9yEVeotnUqVl9ATUPAT67pFsoKTOr-MnwnJeAIBLlA_fBVO6dlxxK_G5eUtctNElvxubtcAuZpg9KFmnaMYoInzVqvb42gyUC-aJ5AcQLGrzSIkL-ayJMDLy2a97YIPmitldHqi6wWOI__dqL3UYBYNmzGrx-ejhq5P_YJJ3BRxRVWw3E-9GXsYN_7Cg7d0Yjpj8vzN5a5SlpXYA31zI"/>
                </div>
                <div class="p-6">
                    <div class="flex justify-between items-start mb-2">
                        <span class="text-xs font-bold text-secondary-container font-label uppercase">85% Match</span>
                        <span class="text-xs text-on-surface-variant font-label">2 days ago</span>
                    </div>
                    <h3 class="font-headline font-bold text-lg mb-1">Brown Leather Watch</h3>
                    <p class="text-sm text-on-surface-variant font-body">Reported lost in Terminal 4</p>
                </div>
            </div>
            <!-- Suggestion Card 2 -->
            <div class="group bg-surface-container-lowest rounded-lg overflow-hidden transition-all hover:shadow-[0_8px_24px_rgba(24,28,29,0.06)]">
                <div class="aspect-square overflow-hidden">
                    <img class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                         data-alt="Classic analog watch on a wooden table with soft focus morning light from a window"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuCmNVnBWrot6JtE9_n1cQi-SlZV_u_A1Qn1kknePW0j-VCnbgTzdBytL9xsXrmMkxJLKQ4NDfK4zv01tscqHlLHGc_MOpP7BksrK2P5dz9ufsBbFXunO8UTaIqV6OqXw67KfehQyL6ssT2YMeZ2pqYt8L7-0_kZwmW2SKpK3tazMJ3RgXmwKy2TDIHetrnqWWlzecgJe4GLvnBFfNrtPSQkawjRgXWM5ANkQDXNyhpRSibbRFo3kb0EBLyUsr9iAbVOgXPqmAfKMZo"/>
                </div>
                <div class="p-6">
                    <div class="flex justify-between items-start mb-2">
                        <span class="text-xs font-bold text-secondary-container font-label uppercase">72% Match</span>
                        <span class="text-xs text-on-surface-variant font-label">5 days ago</span>
                    </div>
                    <h3 class="font-headline font-bold text-lg mb-1">Analog Wristwatch</h3>
                    <p class="text-sm text-on-surface-variant font-body">Reported lost near Gate 22</p>
                </div>
            </div>
            <!-- Suggestion Card 3 -->
            <div class="group bg-surface-container-lowest rounded-lg overflow-hidden transition-all hover:shadow-[0_8px_24px_rgba(24,28,29,0.06)]">
                <div class="aspect-square overflow-hidden">
                    <img class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                         data-alt="Close up of a watch dial showing Roman numerals and blue hands on white face"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuABUcLaLz5K61r-VCV3bXEafewjNQo4XEOP8qBNdzVWASnljhVdHQUqrHZuXt34CsIo7CXDjWmg8GMVhniAaSaFuGNue49bhmjO34bC8LKS5KvC-658TST5BDXCS3h-oBigyFw-ZMw6xSy20YhwJvAxmP3wjw6b823YXm8-SfgBh2lmlqheIeq-TsZasqeW-8rMQ1jEyWG0oN-_6v2QmKpVOlRT5MXr1CjkNXlFcUcOM3ThoXK0GmOJyqfhHVspGZaZFbxFqfv1Ucc"/>
                </div>
                <div class="p-6">
                    <div class="flex justify-between items-start mb-2">
                        <span class="text-xs font-bold text-secondary-container font-label uppercase">64% Match</span>
                        <span class="text-xs text-on-surface-variant font-label">1 week ago</span>
                    </div>
                    <h3 class="font-headline font-bold text-lg mb-1">Silver Dress Watch</h3>
                    <p class="text-sm text-on-surface-variant font-body">Reported lost at Duty Free</p>
                </div>
            </div>
            <!-- Empty State Suggestion / CTA -->
            <div class="border-2 border-dashed border-outline-variant rounded-lg p-6 flex flex-col items-center justify-center text-center gap-4 group hover:bg-surface-container-low transition-colors cursor-pointer">
                <div class="w-12 h-12 rounded-full bg-surface-container-high flex items-center justify-center group-hover:bg-primary-fixed transition-colors">
                    <span class="material-symbols-outlined text-primary">search</span>
                </div>
                <div>
                    <h3 class="font-headline font-bold">Not seeing it?</h3>
                    <p class="text-sm text-on-surface-variant font-body px-4">Refine your search or check related
                        categories</p>
                </div>
            </div>
        </div>
    </section>
</main>
<!-- Mobile Navigation -->
<nav class="md:hidden fixed bottom-0 left-0 w-full flex justify-around items-center px-4 pb-6 pt-3 bg-white/80 backdrop-blur-xl z-50 rounded-t-3xl shadow-[0_-8px_24px_rgba(24,28,29,0.06)]">
    <a class="flex flex-col items-center justify-center text-slate-400 px-5 py-2 tap-highlight-none active:scale-90 transition-transform"
       href="#">
        <span class="material-symbols-outlined">home</span>
        <span class="text-[11px] font-medium font-label">Home</span>
    </a>
    <a class="flex flex-col items-center justify-center text-slate-400 px-5 py-2 tap-highlight-none active:scale-90 transition-transform"
       href="#">
        <span class="material-symbols-outlined">search</span>
        <span class="text-[11px] font-medium font-label">Search</span>
    </a>
    <a class="flex flex-col items-center justify-center text-slate-400 px-5 py-2 tap-highlight-none active:scale-90 transition-transform"
       href="#">
        <span class="material-symbols-outlined">add_circle</span>
        <span class="text-[11px] font-medium font-label">Report</span>
    </a>
    <a class="flex flex-col items-center justify-center text-slate-400 px-5 py-2 tap-highlight-none active:scale-90 transition-transform"
       href="#">
        <span class="material-symbols-outlined">person</span>
        <span class="text-[11px] font-medium font-label">Profile</span>
    </a>
</nav>
</body>
</html>