<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Submit Found Item | Findora</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;family=Inter:wght@300;400;500;600&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <script id="tailwind-config"> tailwind.config = {
        darkMode: "class", theme: {
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
                "borderRadius": {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
                "fontFamily": {"headline": ["Manrope"], "body": ["Inter"], "label": ["Inter"]}
            },
        },
    } </script>
    <style> .material-symbols-outlined {
        font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
    }

    .glass-effect {
        backdrop-filter: blur(12px);
        background: rgba(0, 101, 101, 0.05);
    } </style>
</head>
<body class="bg-background text-on-background font-body min-h-screen flex">
<!-- SideNavBar -->
<aside class="hidden md:flex h-screen w-64 fixed left-0 top-0 bg-slate-100 flex-col py-8 px-4 z-50">
    <div class="mb-10 px-2">
        <h1 class="text-lg font-bold text-teal-900 font-headline">Findora Admin</h1>
        <p class="text-xs text-slate-500 font-medium">Institutional Ledger</p>
    </div>
    <nav class="flex-1 space-y-1">
        <a class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-slate-500 hover:bg-white hover:text-teal-800 transition-all duration-300 ease-in-out font-manrope text-sm"
           href="#">
            <span class="material-symbols-outlined">dashboard</span> Dashboard </a>
        <a class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-teal-900 font-bold border-r-4 border-orange-500 bg-white font-manrope text-sm"
           href="#">
            <span class="material-symbols-outlined">inventory_2</span> Items </a>
        <a class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-slate-500 hover:bg-white hover:text-teal-800 transition-all duration-300 ease-in-out font-manrope text-sm"
           href="#">
            <span class="material-symbols-outlined">location_on</span> Locations </a>
        <a class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-slate-500 hover:bg-white hover:text-teal-800 transition-all duration-300 ease-in-out font-manrope text-sm"
           href="#">
            <span class="material-symbols-outlined">group</span> Users </a>
        <a class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-slate-500 hover:bg-white hover:text-teal-800 transition-all duration-300 ease-in-out font-manrope text-sm"
           href="#">
            <span class="material-symbols-outlined">assignment_turned_in</span> Claims </a>
        <a class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-slate-500 hover:bg-white hover:text-teal-800 transition-all duration-300 ease-in-out font-manrope text-sm"
           href="#">
            <span class="material-symbols-outlined">analytics</span> Reports </a>
    </nav>
    <button class="mt-auto w-full py-3 bg-secondary-container text-on-secondary-container font-semibold rounded-lg hover:shadow-lg transition-all active:scale-95">
        Report Found Item
    </button>
</aside>
<!-- Main Content Canvas -->
<main class="flex-1 md:ml-64 min-h-screen flex flex-col">
    <!-- TopNavBar -->
    <header class="bg-slate-50 text-teal-900 font-manrope text-sm font-medium full-width top-0 z-40 sticky flex justify-between items-center px-6 py-3 w-full">
        <div class="flex items-center gap-4">
            <button class="md:hidden p-2 rounded-full hover:bg-slate-200/50">
                <span class="material-symbols-outlined">menu</span>
            </button>
            <span class="text-xl font-bold text-teal-900 tracking-tight">Findora</span>
        </div>
        <div class="hidden md:flex flex-1 max-w-md mx-8">
            <div class="relative w-full">
                <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline">search</span>
                <input class="w-full pl-10 pr-4 py-2 bg-surface-container-high rounded-full border-none focus:ring-2 focus:ring-primary/20 text-on-surface"
                       placeholder="Search the ledger..." type="text"/>
            </div>
        </div>
        <div class="flex items-center gap-4">
            <button class="p-2 rounded-full hover:bg-slate-200/50 transition-colors">
                <span class="material-symbols-outlined">notifications</span>
            </button>
            <div class="w-8 h-8 rounded-full overflow-hidden bg-surface-container-highest">
                <img alt="User profile" class="w-full h-full object-cover"
                     data-alt="professional headshot of a campus administrator with a friendly expression in a modern office setting"
                     src="https://lh3.googleusercontent.com/aida-public/AB6AXuAOvsQm9ybo1ed7fXIy7pVYiz_eib9nYHOqtGj4wlI2lPNxsgKgeZeR3GwdvOqhdEK1HyWqbXd6013KrNHUNwDHoZrcfzv_yfbRNzXB3Y3olm3OMnu9qwBi8XUfVwl8Nq3_w4UxF8egjAznuz34dCkgcku7fx3VXAWgaxhodnFc-PUr0iUbJja8wWj944bOGae-3sv10Kl_FwZ5twOTD2cdYdFNfgnHyop6jhVJOC1I-_rbacSmcw_PhSf2k_nZavwtG9AvkquiJN4"/>
            </div>
        </div>
    </header>
    <!-- Page Content -->
    <div class="flex-1 px-6 py-12 md:px-12 lg:px-24">
        <div class="max-w-5xl mx-auto">
            <!-- Editorial Header -->
            <div class="mb-12">
                <span class="text-secondary font-bold tracking-widest text-[0.65rem] uppercase mb-2 block">Institutional Stewardship</span>
                <h2 class="text-4xl md:text-5xl font-extrabold font-headline text-primary mb-4 leading-tight">Found Item
                    <br/>Submission Portal</h2>
                <p class="text-on-surface-variant max-w-xl text-lg leading-relaxed">Your professional integrity helps
                    reconnect owners with their belongings. Please record the details with editorial precision.</p>
            </div>
            <!-- Form Section (Asymmetric Layout) -->
            <form class="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
                <!-- Left Column: Visual Ledger -->
                <div class="lg:col-span-5 space-y-8">
                    <div class="bg-surface-container-lowest rounded-xl p-6 shadow-sm border border-outline-variant/10">
                        <label class="block text-primary font-bold text-sm uppercase tracking-wider mb-4">Item
                            Documentation</label>
                        <div class="relative aspect-square rounded-lg bg-surface-container-highest flex flex-col items-center justify-center border-2 border-dashed border-outline-variant hover:border-primary transition-colors cursor-pointer overflow-hidden group">
                            <div class="text-center group-hover:scale-105 transition-transform">
                                <span class="material-symbols-outlined text-4xl text-outline mb-2">add_a_photo</span>
                                <p class="text-sm font-medium text-on-surface-variant">Upload Clear Picture</p>
                                <p class="text-xs text-outline mt-1 px-4">JPG, PNG up to 10MB</p>
                            </div>
                            <!-- Potential Image Preview (Hidden by default) -->
                            <img alt="Item preview"
                                 class="absolute inset-0 w-full h-full object-cover opacity-0 group-hover:opacity-10 transition-opacity"
                                 data-alt="high quality product photography of a misplaced smartphone on a clean white surface with soft natural lighting"
                                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuAzUineiNOZuZU6dA1zXxrf4TOc2wqLsPkL6A62jUNxLTBuExi0Wn_M8jYpYrpm9Brd6PDXxdZCoRbDIfGs_Sqt9PRtF2tV5LdAT0ftKaUFkSythK5N_FCDzjph3stcyvNjLVeRWdIFCeagdpHjaJtypYm4-FwO8IQ_3w93QTwahtv_F78SvUIWMQjTqYuMNPawMD7hCILE5khaskdamrbEKnHuCJQSKErakTHOigkrMnbTgtjhPY5RhF5T_fKKEbbSAyclR1fLw04"/>
                        </div>
                    </div>
                    <div class="bg-primary-container p-8 rounded-xl text-on-primary-container relative overflow-hidden">
                        <div class="relative z-10">
                            <h4 class="text-xl font-bold font-headline mb-2">Security Note</h4>
                            <p class="text-sm leading-relaxed opacity-90">High-value items (wallets, electronics,
                                jewelry) should be delivered directly to the Central Security Office after digital
                                logging.</p>
                        </div>
                        <span class="material-symbols-outlined absolute -right-4 -bottom-4 text-9xl opacity-10"
                              style="font-variation-settings: 'FILL' 1;">security</span>
                    </div>
                </div>
                <!-- Right Column: Data Entry -->
                <div class="lg:col-span-7 bg-surface-container-lowest rounded-xl p-8 shadow-sm border border-outline-variant/10">
                    <div class="space-y-6">
                        <!-- Basic Info -->
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div class="relative">
                                <label class="block text-[0.65rem] font-bold text-outline uppercase mb-1 ml-1">Item
                                    Name</label>
                                <input class="w-full bg-surface-container-highest border-none rounded-lg px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 placeholder:text-outline/50"
                                       placeholder="e.g. Blue Hydroflask" type="text"/>
                            </div>
                            <div class="relative">
                                <label class="block text-[0.65rem] font-bold text-outline uppercase mb-1 ml-1">Category</label>
                                <select class="w-full bg-surface-container-highest border-none rounded-lg px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 appearance-none">
                                    <option>Electronics</option>
                                    <option>Accessories</option>
                                    <option>Books/Documents</option>
                                    <option>Clothing</option>
                                    <option>Keys/IDs</option>
                                </select>
                            </div>
                        </div>
                        <!-- Description -->
                        <div>
                            <label class="block text-[0.65rem] font-bold text-outline uppercase mb-1 ml-1">Detailed
                                Description</label>
                            <textarea
                                    class="w-full bg-surface-container-highest border-none rounded-lg px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20 placeholder:text-outline/50"
                                    placeholder="Describe unique markings, scratches, or contents..."
                                    rows="4"></textarea>
                        </div>
                        <!-- Logistics -->
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-[0.65rem] font-bold text-outline uppercase mb-1 ml-1">Date
                                    Found</label>
                                <div class="relative">
                                    <input class="w-full bg-surface-container-highest border-none rounded-lg px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20"
                                           type="date"/>
                                </div>
                            </div>
                            <div>
                                <label class="block text-[0.65rem] font-bold text-outline uppercase mb-1 ml-1">Found
                                    Location</label>
                                <div class="relative">
                                    <input class="w-full bg-surface-container-highest border-none rounded-lg px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20"
                                           placeholder="e.g. Library 2nd Floor" type="text"/>
                                </div>
                            </div>
                        </div>
                        <!-- Extra Notes -->
                        <div>
                            <label class="block text-[0.65rem] font-bold text-outline uppercase mb-1 ml-1">Extra Notes
                                (Private)</label>
                            <input class="w-full bg-surface-container-highest border-none rounded-lg px-4 py-3 text-on-surface focus:ring-2 focus:ring-primary/20"
                                   placeholder="Internal staff comments..." type="text"/>
                        </div>
                        <div class="pt-6">
                            <button class="w-full bg-secondary-container text-on-secondary-container font-bold py-4 rounded-lg shadow-sm hover:shadow-md transition-all active:scale-[0.98] flex items-center justify-center gap-2"
                                    type="submit">
                                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">assignment_turned_in</span>
                                Submit Found Item
                            </button>
                            <p class="text-center text-[0.6875rem] text-outline mt-4 font-medium uppercase tracking-widest">
                                Formalizing entry into Findora Ledger v4.2</p>
                        </div>
                    </div>
                </div>
            </form>
            <!-- Map Context Section -->
            <div class="mt-16 bg-surface-container-low rounded-2xl overflow-hidden shadow-sm">
                <div class="p-8 flex flex-col md:flex-row items-center justify-between gap-8">
                    <div class="max-w-md">
                        <h3 class="text-2xl font-bold font-headline text-primary mb-3">Location Context</h3>
                        <p class="text-on-surface-variant text-sm leading-relaxed">Pinpoint exactly where the item was
                            found to help our pattern matching algorithm suggest potential owners who were in the same
                            vicinity.</p>
                    </div>
                    <div class="w-full md:w-1/2 aspect-video rounded-xl overflow-hidden bg-surface-container-highest relative group">
                        <img alt="Map view" class="w-full h-full object-cover"
                             data-alt="a clean, stylized digital map of a university campus showing buildings and pathways in a minimal architectural style"
                             data-location="San Francisco"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuDEu_LXe6BaaqdVGy8XZkgoSFr8k0BxHVndikv5V-XL7L2FvgZGJM_HQU2ECBuvujp4QXEkn97LHmPsZko7XmghdRgJYXJSyrgLnbOeqK25NtrCqqxBjQoZckjDXeeExb7i0ejNbaEzEQKu3BnLKrR6DdjoPq9xv8WzxUOzx0SavYn1BbClUYUcE7dGDUJDCn1zK3z86JWjZ5KLErs06OoY-Ml9dd7kEXi4JzsYE9HQFfT8z8q1PAo6NkmvWSOSC6vHmQpyraZc-ZU"/>
                        <div class="absolute inset-0 bg-primary/20 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity">
<span class="bg-white text-primary px-4 py-2 rounded-full font-bold text-sm shadow-xl flex items-center gap-2">
<span class="material-symbols-outlined text-sm">location_on</span> Tag Precise Location </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <footer class="bg-slate-50 text-teal-900 font-inter text-xs tracking-wide uppercase w-full py-6 mt-auto border-t border-slate-200/10 flex flex-col md:flex-row justify-between items-center px-12">
        <div class="font-manrope font-black text-teal-900 mb-4 md:mb-0"> Findora</div>
        <div class="text-slate-400 text-center md:text-left mb-4 md:mb-0"> © 2024 Findora Lost &amp; Found. Managed
            Institutional Stewardship.
        </div>
        <div class="flex gap-6">
            <a class="text-slate-400 hover:text-orange-500 transition-colors opacity-80 hover:opacity-100" href="#">Privacy
                Policy</a>
            <a class="text-slate-400 hover:text-orange-500 transition-colors opacity-80 hover:opacity-100" href="#">Terms
                of Service</a>
            <a class="text-slate-400 hover:text-orange-500 transition-colors opacity-80 hover:opacity-100" href="#">Support</a>
        </div>
    </footer>
</main>
<!-- Mobile Navigation (Bottom) -->
<nav class="md:hidden fixed bottom-0 left-0 right-0 bg-white h-16 flex items-center justify-around px-4 z-50 shadow-[0_-4px_20px_rgba(0,0,0,0.05)]">
    <button class="flex flex-col items-center gap-1 text-slate-500">
        <span class="material-symbols-outlined">dashboard</span>
    </button>
    <button class="flex flex-col items-center gap-1 text-teal-700">
        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">inventory_2</span>
    </button>
    <button class="flex flex-col items-center gap-1 -mt-8 bg-secondary-container p-4 rounded-full text-white shadow-lg">
        <span class="material-symbols-outlined">add</span>
    </button>
    <button class="flex flex-col items-center gap-1 text-slate-500">
        <span class="material-symbols-outlined">location_on</span>
    </button>
    <button class="flex flex-col items-center gap-1 text-slate-500">
        <span class="material-symbols-outlined">group</span>
    </button>
</nav>
</body>
</html>