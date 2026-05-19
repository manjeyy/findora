<html>
<head>
    <jsp:include page="/components/head.jsp"/>
    <title>Create Account | Findora</title>
    <script id="tailwind-config"> tailwind.config = {
        darkMode: "class", theme: {
            extend: {
                colors: {
                    "surface-container-low": "#f1f4f4",
                    "outline-variant": "#bec9c8",
                    "on-background": "#181c1d",
                    "on-tertiary-fixed-variant": "#004883",
                    "tertiary-fixed-dim": "#a4c9ff",
                    "surface-container-high": "#e6e9e9",
                    "on-primary-fixed": "#002020",
                    "surface-container": "#ebeeee",
                    background: "#f7fafa",
                    "surface-container-highest": "#e0e3e3",
                    "primary-fixed-dim": "#87d4d3",
                    "error-container": "#ffdad6",
                    "on-error-container": "#93000a",
                    error: "#ba1a1a",
                    "on-secondary": "#ffffff",
                    "on-primary-fixed-variant": "#004f4f",
                    "inverse-primary": "#87d4d3",
                    secondary: "#944a00",
                    "on-secondary-fixed": "#301400",
                    "secondary-fixed-dim": "#ffb783",
                    "surface-bright": "#f7fafa",
                    "surface-variant": "#e0e3e3",
                    "primary-container": "#006565",
                    "surface-tint": "#0b6969",
                    "on-tertiary-fixed": "#001c39",
                    "on-surface-variant": "#3f4948",
                    "surface-dim": "#d7dbdb",
                    surface: "#f7fafa",
                    "primary-fixed": "#a3f0ef",
                    "on-surface": "#181c1d",
                    "inverse-on-surface": "#eef1f1",
                    "on-tertiary": "#ffffff",
                    "secondary-container": "#fc8f34",
                    primary: "#004b4b",
                    "secondary-fixed": "#ffdcc5",
                    "surface-container-lowest": "#ffffff",
                    "tertiary-fixed": "#d4e3ff",
                    "on-primary-container": "#92dfdf",
                    "on-error": "#ffffff",
                    "inverse-surface": "#2d3131",
                    "on-secondary-container": "#663100",
                    outline: "#6f7979",
                    tertiary: "#00437c",
                    "on-tertiary-container": "#b7d3ff",
                    "on-primary": "#ffffff",
                    "tertiary-container": "#005ba4",
                    "on-secondary-fixed-variant": "#713700",
                },
                borderRadius: {DEFAULT: "0.25rem", lg: "0.5rem", xl: "0.75rem", full: "9999px",},
                fontFamily: {headline: ["Manrope"], body: ["Inter"], label: ["Inter"],},
            },
        },
    }; </script>
    <style> .glass-effect {
        background: rgba(255, 255, 255, 0.7);
        backdrop-filter: blur(12px);
    }

    .editorial-gradient {
        background: linear-gradient(135deg, #004b4b 0%, #006565 100%);
    } </style>
</head>
<body class="bg-background font-body text-on-background min-h-screen flex flex-col">
<!-- Subtle Navigation Suppression Logic Applied: No SideNav or TopAppBar for Focused Transactional Flow -->
<main class="flex-grow flex items-center justify-center p-6 relative overflow-hidden">
    <!-- Abstract Decorative Elements (The Curated Ledger Aesthetic) -->
    <div class="absolute top-[-10%] right-[-5%] w-96 h-96 rounded-full bg-primary-fixed opacity-20 blur-3xl"></div>
    <div class="absolute bottom-[-10%] left-[-5%] w-80 h-80 rounded-full bg-secondary-fixed opacity-15 blur-3xl"></div>
    <!-- Create Account Card -->
    <div class="w-full max-w-[480px] z-10"> <!-- Brand Identity Anchor -->
        <div class="mb-10 text-left">
            <div class="flex items-center gap-3 mb-4">
                <div class="w-10 h-10 editorial-gradient rounded-lg flex items-center justify-center text-white"><span
                        class="material-symbols-outlined"
                        data-icon="account_balance_wallet">account_balance_wallet</span></div>
                <span class="font-headline text-2xl font-extrabold tracking-tight text-primary">Findora</span></div>
            <h1 class="font-headline text-4xl font-extrabold text-on-surface mb-2 leading-tight"> Create your
                account </h1>
            <p class="text-on-surface-variant font-medium tracking-wide"> Join the institutional stewardship of lost
                property. </p></div> <!-- Main Ledger Container -->
        <div class="bg-surface-container-lowest rounded-xl p-8 md:p-10 shadow-[0_24px_48px_-12px_rgba(24,28,29,0.06)] relative overflow-hidden">
            <!-- Tonal accent line at top -->
            <div class="absolute top-0 left-0 w-full h-1 bg-secondary-container"></div>
            <form class="space-y-6"> <!-- Full Name Field -->
                <div class="space-y-2"><label class="block text-[11px] font-bold uppercase tracking-widest text-outline"
                                              for="fullname">Full Name</label>
                    <div class="relative"><input
                            class="w-full bg-surface-container-highest border-none rounded-lg px-4 py-3.5 text-on-surface focus:ring-2 focus:ring-primary/30 transition-all placeholder:text-outline-variant"
                            id="fullname" name="fullname" placeholder="Professor John Doe" type="text"/>
                        <div class="absolute inset-y-0 right-4 flex items-center text-outline-variant"><span
                                class="material-symbols-outlined text-[20px]" data-icon="person">person</span></div>
                    </div>
                </div> <!-- Email Field -->
                <div class="space-y-2"><label class="block text-[11px] font-bold uppercase tracking-widest text-outline"
                                              for="email">Institutional Email</label>
                    <div class="relative"><input
                            class="w-full bg-surface-container-highest border-none rounded-lg px-4 py-3.5 text-on-surface focus:ring-2 focus:ring-primary/30 transition-all placeholder:text-outline-variant"
                            id="email" name="email" placeholder="j.doe@institution.edu" type="email"/>
                        <div class="absolute inset-y-0 right-4 flex items-center text-outline-variant"><span
                                class="material-symbols-outlined text-[20px]" data-icon="mail">mail</span></div>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4"> <!-- Password Field -->
                    <div class="space-y-2"><label
                            class="block text-[11px] font-bold uppercase tracking-widest text-outline" for="password">Password</label>
                        <div class="relative"><input
                                class="w-full bg-surface-container-highest border-none rounded-lg px-4 py-3.5 text-on-surface focus:ring-2 focus:ring-primary/30 transition-all placeholder:text-outline-variant"
                                id="password" name="password" placeholder="••••••••" type="password"/></div>
                    </div> <!-- Confirm Password Field -->
                    <div class="space-y-2"><label
                            class="block text-[11px] font-bold uppercase tracking-widest text-outline"
                            for="confirm-password">Confirm</label>
                        <div class="relative"><input
                                class="w-full bg-surface-container-highest border-none rounded-lg px-4 py-3.5 text-on-surface focus:ring-2 focus:ring-primary/30 transition-all placeholder:text-outline-variant"
                                id="confirm-password" name="confirm-password" placeholder="••••••••" type="password"/>
                        </div>
                    </div>
                </div> <!-- Terms Checkbox -->
                <div class="flex items-start gap-3 py-2"><input
                        class="mt-1 rounded border-outline-variant text-secondary focus:ring-secondary" id="terms"
                        type="checkbox"/> <label class="text-xs text-on-surface-variant leading-relaxed" for="terms"> I
                    agree to the <a class="text-primary font-semibold hover:underline" href="#">Terms of Service</a> and
                    the <a class="text-primary font-semibold hover:underline" href="#">Stewardship Guidelines</a>.
                </label></div> <!-- Action Button -->
                <button class="w-full bg-secondary-container hover:bg-secondary text-on-secondary-container hover:text-white font-headline font-bold py-4 rounded-lg shadow-sm hover:shadow-lg hover:shadow-secondary/20 transition-all active:scale-[0.98] flex items-center justify-center gap-2"
                        type="submit"><span>Create Account</span> <span class="material-symbols-outlined text-[20px]"
                                                                        data-icon="arrow_forward">arrow_forward</span>
                </button>
            </form> <!-- Footer Navigation -->
            <div class="mt-10 pt-8 border-t border-outline-variant/10 text-center"><p
                    class="text-sm text-on-surface-variant"> Already part of the ledger? <a
                    class="text-primary font-bold ml-1 hover:underline decoration-2 underline-offset-4" href="#">Back to
                Login</a></p></div>
        </div> <!-- Support Attribution -->
        <div class="mt-8 flex justify-between items-center px-2"><span
                class="text-[10px] font-bold text-outline uppercase tracking-[0.2em]">Institutional Stewardship</span>
            <div class="flex gap-4"><a
                    class="text-[10px] font-bold text-outline uppercase tracking-[0.2em] hover:text-primary transition-colors"
                    href="#">Privacy</a> <a
                    class="text-[10px] font-bold text-outline uppercase tracking-[0.2em] hover:text-primary transition-colors"
                    href="#">Support</a></div>
        </div>
    </div>
</main>
<jsp:include page="/components/footer.jsp"/>
</body>
</html>
