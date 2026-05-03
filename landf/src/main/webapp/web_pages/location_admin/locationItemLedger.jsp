<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Findora | Admin Ledger</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;family=Inter:wght@400;500;600&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <script id="tailwind-config"> tailwind.config = {
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
    <%@ page import="java.util.List" %> <%@ page import="com.landf.features.items.ItemModel" %> <% request.setAttribute("activeSection", "items"); request.setAttribute("sectionLabel", "Location Item Ledger"); request.setAttribute("searchPlaceholder", "Search local items..."); List<ItemModel> items = (List<ItemModel>) request.getAttribute("locationItems"); if (items == null) { items = List.of(); } %>
    <html class="light" lang="en">
    <head> <jsp:include page="/components/head.jsp" /> <title>Location Item Ledger | Findora</title>
        <style> body {font - family: 'Inter', sans-serif; background: #f7fafa;} h1, h2,
            h3 {font - family: 'Manrope', sans-serif;} </style>
    </head>
    <body class="text-slate-900"> <jsp:include page="/components/location-admin/sidebar.jsp" />
    <main class="ml-64 min-h-screen"> <jsp:include page="/components/location-admin/header.jsp" />
        <section class="p-8 space-y-6">
            <div class="flex items-end justify-between gap-4">
                <div><h1 class="text-3xl font-black tracking-tight">Location Item Ledger</h1> <p
                    class="mt-1 text-sm text-slate-500">Approve, flag, or close items tied to this location only.</p>
                </div>
                <div
                    class="rounded-full bg-slate-100 px-4 py-2 text-sm font-semibold text-slate-700"><%= items.size() %> items
                </div>
            </div>
            <div class="rounded-3xl bg-white border border-slate-200 overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-left">
                        <thead class="bg-slate-50 text-[10px] uppercase tracking-[0.2em] text-slate-500">
                        <tr>
                            <th class="px-6 py-4">Item</th>
                            <th class="px-6 py-4">Status</th>
                            <th class="px-6 py-4">Moderation</th>
                            <th class="px-6 py-4">Reporter</th>
                            <th class="px-6 py-4 text-right">Action</th>
                        </tr>
                        </thead>
                        <tbody> <% for (ItemModel item : items) { %>
                        <tr class="border-t border-slate-100 hover:bg-slate-50/70">
                            <td class="px-6 py-5"><p class="font-semibold text-slate-900"><%= item.getTitle() %></p> <p
                                class="text-xs text-slate-500">#<%= item.getItemId() %> · <%= item.getType() %> · <%= item.getLocationName() %></p>
                            </td>
                            <td class="px-6 py-5 text-sm text-slate-600"><%= item.getStatus() %></td>
                            <td class="px-6 py-5 text-sm text-slate-600"><%= item.getModerationStatus() %></td>
                            <td class="px-6 py-5 text-sm text-slate-600"><%= item.getUsername() %></td>
                            <td class="px-6 py-5">
                                <form class="flex justify-end gap-2" method="post"
                                      action="<%= request.getContextPath() %>/location-admin/items/moderate"><input
                                    name="itemId" type="hidden" value="<%= item.getItemId() %>"/>
                                    <button
                                        class="rounded-lg border border-emerald-200 px-3 py-2 text-xs font-semibold text-emerald-700"
                                        name="action" value="approve" type="submit">Approve
                                    </button>
                                    <button
                                        class="rounded-lg border border-amber-200 px-3 py-2 text-xs font-semibold text-amber-700"
                                        name="action" value="flag" type="submit">Flag
                                    </button>
                                    <button
                                        class="rounded-lg border border-red-200 px-3 py-2 text-xs font-semibold text-red-700"
                                        name="action" value="mark_spam" type="submit">Spam
                                    </button>
                                    <button
                                        class="rounded-lg border border-slate-200 px-3 py-2 text-xs font-semibold text-slate-700"
                                        name="action" value="close" type="submit">Close
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <% } %> </tbody>
                    </table>
                </div>
            </div>
        </section>
    </main>
    </body>
    </html>
    </button>
    </td>
    </tr>
    <!-- Item 2 -->
    <tr class="hover:bg-surface-container-low/50 transition-colors group">
        <td class="px-6 py-5">
            <div class="w-16 h-12 rounded-lg overflow-hidden bg-surface-container-highest">
                <img class="w-full h-full object-cover"
                     data-alt="high quality leather wallet with cards showing on a textured wooden background"
                     src="https://lh3.googleusercontent.com/aida-public/AB6AXuBMKvRRPeq3RaBPNO29ms5_y-IzuYZ2-yzIWcgxCG2B3AEC6oRFSdUulZ57_e2RR2Z-mNLUf4ZiDU-Qskm5YNlC72_a58i_eUlvsANWuozcH7MPpP8e5eWsOkpsOXaa0DCrptrpVcsSumzxQV9dPH8Vo9dt__d6tD765IOwKW4_5F8R6g2H55lXif-NDzx_GOSla6kzKobTj4Pw0Z-XfolzQPkKsVAegVapM5Yl7QAjNB_QcObySO1clFnPRDT4dJDBXuZc-0HZxaI"/>
            </div>
        </td>
        <td class="px-6 py-5">
            <div class="font-semibold text-primary">Leather Wallet</div>
            <div class="text-xs text-outline">Tan leather, Multiple IDs</div>
        </td>
        <td class="px-6 py-5">
            <span
                class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-primary-fixed text-on-primary-fixed-variant"> Lost </span>
        </td>
        <td class="px-6 py-5 text-sm text-on-surface-variant font-medium">Oct 22, 2023</td>
        <td class="px-6 py-5">
            <div class="flex items-center gap-2">
                <span class="w-2 h-2 rounded-full bg-teal-500"></span>
                <span class="text-sm font-semibold text-teal-700">Claimed</span>
            </div>
        </td>
        <td class="px-6 py-5 text-right">
            <button class="text-primary hover:text-secondary p-1 transition-colors">
                <span class="material-symbols-outlined">visibility</span>
            </button>
        </td>
    </tr>
    <!-- Item 3 -->
    <tr class="hover:bg-surface-container-low/50 transition-colors group">
        <td class="px-6 py-5">
            <div class="w-16 h-12 rounded-lg overflow-hidden bg-surface-container-highest">
                <img class="w-full h-full object-cover"
                     data-alt="modern wireless noise-canceling headphones on a neutral gray background"
                     src="https://lh3.googleusercontent.com/aida-public/AB6AXuA9TBkldMfnVOzcI7KGXkVs5mYPb21sIwmfhySSZzwEag38Vw4M4x5gp2i4QmxcHa1-3gMNJeZJj9FuwIKcY-irCUn1IgDmJcufAOuvhJgnBDKWumQTpDxHXVCf1VT133fgCz38XwcrtOaQaTQ21h-UASZeIWdmKNVu5pnllaXJmGSA7R3EPe8vQKWvVi2hr0fxJUodgLPqJnA2R3zHjOg27spx2u1IdRimpDsFCFXqMiMyYgDd8E9lEYry2L4DvxKwJrn36vKghXs"/>
            </div>
        </td>
        <td class="px-6 py-5">
            <div class="font-semibold text-primary">Sony WH-1000XM4</div>
            <div class="text-xs text-outline">Black case included</div>
        </td>
        <td class="px-6 py-5">
            <span
                class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-tertiary-fixed text-on-tertiary-fixed-variant"> Found </span>
        </td>
        <td class="px-6 py-5 text-sm text-on-surface-variant font-medium">Oct 21, 2023</td>
        <td class="px-6 py-5">
            <div class="flex items-center gap-2">
                <span class="w-2 h-2 rounded-full bg-secondary-container animate-pulse"></span>
                <span class="text-sm font-semibold text-on-secondary-container">Processing</span>
            </div>
        </td>
        <td class="px-6 py-5 text-right">
            <button class="text-primary hover:text-secondary p-1 transition-colors">
                <span class="material-symbols-outlined">edit_square</span>
            </button>
        </td>
    </tr>
    <!-- Item 4 -->
    <tr class="hover:bg-surface-container-low/50 transition-colors group">
        <td class="px-6 py-5">
            <div class="w-16 h-12 rounded-lg overflow-hidden bg-surface-container-highest">
                <img class="w-full h-full object-cover"
                     data-alt="a pair of elegant prescription glasses with tortoise shell frames on a white marble surface"
                     src="https://lh3.googleusercontent.com/aida-public/AB6AXuCuv5HjSBjipW4h6YFrrMf3xQ95SjNRlpnwvo9LGNp3UJUYnpUK5uYZaBijUMYpqXPJqc83f51v-4dU5hiygxWhbWxeYdNVpqLvsE37PcwHb5HYrQaBxPA1AQxuaYDtDLQtLDHAuT_tcrstPwxaSt8ADUT2TE4ksB6ghSGzmsxnzmvYHyR3am_3tKOYwds444xbEolOo62hdcY_fayl4D18p1A-o8e9CW9F_WhvGfaNKBCeH6IGaT-p5qFPK0djPfDJ8Nvk9gTH8n8"/>
            </div>
        </td>
        <td class="px-6 py-5">
            <div class="font-semibold text-primary">Prescription Glasses</div>
            <div class="text-xs text-outline">Ray-Ban Frames</div>
        </td>
        <td class="px-6 py-5">
            <span
                class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-tertiary-fixed text-on-tertiary-fixed-variant"> Found </span>
        </td>
        <td class="px-6 py-5 text-sm text-on-surface-variant font-medium">Oct 20, 2023</td>
        <td class="px-6 py-5">
            <div class="flex items-center gap-2">
                <span class="w-2 h-2 rounded-full bg-secondary-container"></span>
                <span class="text-sm font-semibold text-on-secondary-container">Open Case</span>
            </div>
        </td>
        <td class="px-6 py-5 text-right">
            <button class="text-primary hover:text-secondary p-1 transition-colors">
                <span class="material-symbols-outlined">edit_square</span>
            </button>
        </td>
    </tr>
    </tbody>
    </table>
    </div>
    <!-- Pagination -->
    <div class="px-6 py-4 bg-surface-container-low flex items-center justify-between">
        <span class="text-xs text-outline font-medium uppercase tracking-wider">Page 1 of 42</span>
        <div class="flex gap-2">
            <button class="p-2 rounded-lg hover:bg-surface-container-highest transition-colors disabled:opacity-30">
                <span class="material-symbols-outlined">chevron_left</span>
            </button>
            <button class="p-2 rounded-lg hover:bg-surface-container-highest transition-colors">
                <span class="material-symbols-outlined">chevron_right</span>
            </button>
        </div>
    </div>
    </div>
    </div>
    <!-- Footer -->
    <footer
        class="bg-slate-50 border-t border-slate-200/10 w-full py-6 mt-auto flex flex-col md:flex-row justify-between items-center px-12">
        <div class="font-manrope font-black text-teal-900 uppercase tracking-widest text-xs">FINDORA</div>
        <p class="font-inter text-[10px] tracking-wide uppercase text-slate-400 my-4 md:my-0">© 2024 Findora
            Lost &amp; Found. Managed Institutional Stewardship.</p>
        <div class="flex gap-6">
            <a class="font-inter text-xs tracking-wide uppercase text-slate-400 hover:text-orange-500 transition-colors"
               href="#">Privacy Policy</a>
            <a class="font-inter text-xs tracking-wide uppercase text-slate-400 hover:text-orange-500 transition-colors"
               href="#">Terms of Service</a>
            <a class="font-inter text-xs tracking-wide uppercase text-slate-400 hover:text-orange-500 transition-colors"
               href="#">Support</a>
        </div>
    </footer>
    </main>
    <!-- FAB Suppression Logic (Suppressing as per mandate for Details/Admin Ledger) -->
    </body></html>