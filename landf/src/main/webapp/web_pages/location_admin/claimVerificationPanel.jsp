<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Claim Verification Panel | The Curated Custodian</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&amp;family=Plus+Jakarta+Sans:wght@400;500;600&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
          rel="stylesheet"/>
    <script id="tailwind-config"> tailwind.config = {darkMode: "class",
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
    <%@ page import="java.util.List" %> <%@ page import="com.landf.features.admin.AdminReportView" %> <% request.setAttribute("activeSection", "reports"); request.setAttribute("sectionLabel", "Location Reports"); request.setAttribute("searchPlaceholder", "Search reports and targets..."); List<AdminReportView> reports = (List<AdminReportView>) request.getAttribute("reports"); if (reports == null) { reports = List.of(); } %>
    <html class="light" lang="en">
    <head> <jsp:include page="/components/head.jsp" /> <title>Location Reports | Findora</title>
        <style> body {font - family: 'Inter', sans-serif; background: #f7fafa;} h1, h2,
            h3 {font - family: 'Manrope', sans-serif;} </style>
    </head>
    <body class="text-slate-900"> <jsp:include page="/components/location-admin/sidebar.jsp" />
    <main class="ml-64 min-h-screen"> <jsp:include page="/components/location-admin/header.jsp" />
        <section class="p-8 space-y-6">
            <div class="flex items-end justify-between gap-4">
                <div><h1 class="text-3xl font-black tracking-tight">Report Review</h1> <p
                    class="mt-1 text-sm text-slate-500">Reports tied to items or claims in this location.</p></div>
                <div
                    class="rounded-full bg-slate-100 px-4 py-2 text-sm font-semibold text-slate-700"><%= reports.size() %> reports
                </div>
            </div>
            <div class="rounded-3xl bg-white border border-slate-200 overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-left">
                        <thead class="bg-slate-50 text-[10px] uppercase tracking-[0.2em] text-slate-500">
                        <tr>
                            <th class="px-6 py-4">Target</th>
                            <th class="px-6 py-4">Reporter</th>
                            <th class="px-6 py-4">Reason</th>
                            <th class="px-6 py-4">Status</th>
                            <th class="px-6 py-4 text-right">Decision</th>
                        </tr>
                        </thead>
                        <tbody> <% for (AdminReportView report : reports) { %>
                        <tr class="border-t border-slate-100 hover:bg-slate-50/70">
                            <td class="px-6 py-5"><p
                                class="font-semibold text-slate-900"><%= report.getTargetType() %> #<%= report.getTargetId() %></p>
                                <p class="text-xs text-slate-500">Report #<%= report.getReportId() %></p></td>
                            <td class="px-6 py-5 text-sm text-slate-600"><%= report.getReporterUsername() %></td>
                            <td class="px-6 py-5 text-sm text-slate-600"><%= report.getReason() %></td>
                            <td class="px-6 py-5 text-sm text-slate-600"><%= report.getStatus() %></td>
                            <td class="px-6 py-5">
                                <form class="flex justify-end gap-2" method="post"
                                      action="<%= request.getContextPath() %>/location-admin/reports/review"><input
                                    name="reportId" type="hidden" value="<%= report.getReportId() %>"/> <input
                                    name="notes" type="hidden" value="Location admin review"/>
                                    <button
                                        class="rounded-lg border border-emerald-200 px-3 py-2 text-xs font-semibold text-emerald-700"
                                        name="decision" value="resolved" type="submit">Resolve
                                    </button>
                                    <button
                                        class="rounded-lg border border-red-200 px-3 py-2 text-xs font-semibold text-red-700"
                                        name="decision" value="rejected" type="submit">Reject
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
    <span class="material-symbols-outlined text-tertiary" style="font-variation-settings: 'FILL' 1;">verified</span>
    <span class="text-sm font-bold text-tertiary">Verified Identity</span>
    </div>
    <p class="text-xs text-on-surface-variant leading-relaxed">Identity confirmed via government-issued ID. High trust
        rating from 3 separate custodial institutions.</p>
    </div>
    </div>
    <!-- Ownership Proof Bento Card -->
    <div class="col-span-12 bg-surface-container-lowest p-8 rounded-xl">
        <h2 class="text-xl font-bold mb-6 text-on-surface border-b border-outline-variant/10 pb-4">Evidence of
            Ownership</h2>
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 space-y-6">
                <div class="bg-surface-container-low p-6 rounded-xl border-l-4 border-secondary">
                    <p class="text-xs font-bold uppercase tracking-widest text-on-secondary-fixed-variant mb-3">User
                        Statement</p>
                    <p class="italic text-on-surface leading-relaxed font-medium"> "I left this briefcase near the
                        ticket kiosks at Central Station yesterday afternoon. It contains a collection of architectural
                        blueprints and a specific fountain pen engraved with my father's initials 'J.V.'. The leather
                        has a small stain from coffee on the interior lining of the middle pocket." </p>
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
                <p class="text-xs font-bold uppercase tracking-widest text-on-surface-variant">User-Provided Proof
                    Photo</p>
                <div class="rounded-xl overflow-hidden shadow-md">
                    <img alt="Proof Photo"
                         data-alt="a lifestyle photograph of a person holding the same vintage briefcase in a casual home setting, soft natural lighting"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuCk-6PP1ZXFSAJQnmx4IhQnaT16ku2gtW_ifC0ZWIVGkvXzsybaack9up_KUteLg4yQbKVyh6qiIcGPE7XpG20A-VAv6GbNXiwaaBME533rEWqfCrl9xjoWH1gJpyX3Pe3GavyrZ3ZoDxLUrWVUbK2wTW40qdH4KteEMyQT5c4OgFobezDEfiCkJa8ls-XDj1_-fcDAUJYFptHXI4lbeCEVR3xU4emR8Za6Zd-Nd4qcOVotxRvX3CEgekz0-h9gQKqWCmC6yB92NM0"/>
                </div>
                <p class="text-[11px] text-on-surface-variant leading-tight">Image Analysis: 94% visual match with item
                    #CV-8921. Taken: 05/14/2023.</p>
            </div>
        </div>
    </div>
    </div>
    </section>
    </div>
    </main>
    <!-- Bottom Nav for Mobile Only (From JSON) -->
    <nav
        class="md:hidden fixed bottom-0 left-0 w-full flex justify-around items-center px-4 pb-6 pt-3 bg-white/80 backdrop-blur-xl z-50 rounded-t-3xl shadow-[0_-8px_24px_rgba(24,28,29,0.06)]">
        <a class="flex flex-col items-center justify-center text-slate-400 px-5 py-2 tap-highlight-none active:scale-90 transition-transform"
           href="#">
            <span class="material-symbols-outlined">home</span>
            <span class="text-[11px] font-medium Plus Jakarta Sans">Home</span>
        </a>
        <a class="flex flex-col items-center justify-center text-slate-400 px-5 py-2 tap-highlight-none active:scale-90 transition-transform"
           href="#">
            <span class="material-symbols-outlined">search</span>
            <span class="text-[11px] font-medium Plus Jakarta Sans">Search</span>
        </a>
        <a class="flex flex-col items-center justify-center bg-teal-50 text-teal-700 rounded-2xl px-5 py-2 tap-highlight-none active:scale-90 transition-transform"
           href="#">
            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">add_circle</span>
            <span class="text-[11px] font-medium Plus Jakarta Sans">Report</span>
        </a>
        <a class="flex flex-col items-center justify-center text-slate-400 px-5 py-2 tap-highlight-none active:scale-90 transition-transform"
           href="#">
            <span class="material-symbols-outlined">person</span>
            <span class="text-[11px] font-medium Plus Jakarta Sans">Profile</span>
        </a>
    </nav>
    </body></html>