<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Report Found Item | Findora</title>
    <jsp:include page="/components/head.jsp"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .glass-effect {
            backdrop-filter: blur(12px);
            background: rgba(0, 101, 101, 0.05);
        }
    </style>
</head>
<body class="bg-background text-on-background font-body min-h-screen flex flex-col">
<!-- Navigation -->
<jsp:include page="/components/navbar.jsp"/>

<!-- Main Content -->
<main class="flex-1 min-h-screen flex flex-col">
    <div class="flex-1 px-6 py-12 md:px-12 lg:px-24">
        <div class="max-w-5xl mx-auto">
            <!-- Editorial Header -->
            <div class="mb-12">
                <span class="text-secondary font-bold tracking-widest text-[0.65rem] mt-12 uppercase mb-2 block"> </span>
                <h2 class="text-4xl md:text-5xl font-extrabold font-headline text-primary mb-4 leading-tight">Found Item Submission Portal</h2>
            </div>

            <!-- Form Section -->
            <form method="POST" action="${pageContext.request.contextPath}/report-found-item" class="grid grid-cols-1 md:grid-cols-12 gap-8 mt-24" enctype="multipart/form-data">
                <!-- Image Upload: Left Column -->
                <div class="md:col-span-12 lg:col-span-5 flex flex-col">
                    <label class="font-headline font-bold text-lg text-primary mb-4">Photo</label>
                    <div class="relative group cursor-pointer flex-grow bg-surface-container-highest rounded-xl min-h-[320px] flex flex-col items-center justify-center border-2 border-dashed border-outline-variant hover:border-primary transition-all overflow-hidden">
                        <div class="absolute inset-0 z-0">
                            <div class="w-full h-full glass-effect"></div>
                        </div>
                        <div class="relative z-10 flex flex-col items-center p-8 text-center">
                            <div class="w-16 h-16 bg-surface-container-lowest rounded-full flex items-center justify-center mb-4 shadow-sm group-hover:scale-110 transition-transform">
                                <span class="material-symbols-outlined text-3xl text-primary">photo_camera</span>
                            </div>
                            <h3 class="font-headline font-bold text-lg text-on-surface mb-1">Upload Item Photo</h3>
                            <p class="text-sm text-on-surface-variant mb-4">Drag and drop or click to select image</p>
                            <input type="file" name="imageFile" accept="image/*" class="w-full text-sm text-on-surface bg-surface-container-lowest border border-outline-variant rounded-lg px-4 py-3 mb-3 file:mr-4 file:rounded-full file:border-0 file:bg-primary file:text-on-primary file:px-4 file:py-2"/>
                            <input type="text" name="imageUrl" placeholder="Or paste image URL" class="w-full px-4 py-2 rounded-lg border border-outline-variant focus:ring-2 focus:ring-primary mb-2"/>
                            <span class="text-xs text-on-surface-variant">Recommended: JPG or PNG, 5MB max</span>
                        </div>
                    </div>
                </div>

                <!-- Form Fields: Right Column -->
                <div class="md:col-span-12 lg:col-span-7 flex flex-col gap-6">
                    <div>
                        <label class="font-headline font-bold text-lg text-primary mb-2 block">Item Name</label>
                        <input type="text" name="title" required placeholder="e.g., Silver Fountain Pen" class="w-full px-4 py-3 rounded-xl border border-outline-variant focus:ring-2 focus:ring-primary focus:border-transparent"/>
                    </div>

                    <div>
                        <label class="font-headline font-bold text-lg text-primary mb-2 block">Detailed Description</label>
                        <textarea name="description" required placeholder="Describe the item, its condition, any markings, initials, or distinguishing features..." class="w-full px-4 py-3 rounded-xl border border-outline-variant focus:ring-2 focus:ring-primary focus:border-transparent min-h-[120px] resize-none"></textarea>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="font-headline font-bold text-lg text-primary mb-2 block">Item Category</label>
                            <select name="category" required class="w-full px-4 py-3 rounded-xl border border-outline-variant focus:ring-2 focus:ring-primary focus:border-transparent">
                                <option value="">Select Category</option>
                                <option value="personal">Personal</option>
                                <option value="accessory">Accessory</option>
                                <option value="bag">Bag</option>
                                <option value="electronics">Electronics</option>
                                <option value="clothing">Clothing</option>
                                <option value="jewelry">Jewelry</option>
                                <option value="documents">Documents</option>
                                <option value="other">Other</option>
                            </select>
                        </div>

                        <div>
                            <label class="font-headline font-bold text-lg text-primary mb-2 block">Discovery Location</label>
                            <select name="locationId" required class="w-full px-4 py-3 rounded-xl border border-outline-variant focus:ring-2 focus:ring-primary focus:border-transparent">
                                <option value="">Select Location</option>
                                <c:forEach var="location" items="${locations}">
                                    <option value="${location.locationId}">${location.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div>
                        <label class="font-headline font-bold text-lg text-primary mb-2 block">Date Found</label>
                        <input type="date" name="eventDate" required class="w-full px-4 py-3 rounded-xl border border-outline-variant focus:ring-2 focus:ring-primary focus:border-transparent"/>
                    </div>

                    <!-- Action Buttons -->
                    <div class="grid grid-cols-2 gap-4 mt-6">
                        <button type="reset" class="py-3 bg-surface-container-high text-on-surface font-bold rounded-xl hover:bg-surface-container-low transition-colors">
                            Clear Form
                        </button>
                        <button type="submit" class="py-3 bg-primary text-on-primary font-bold rounded-xl hover:bg-primary-container transition-colors">
                            Submit Found Item
                        </button>
                    </div>
                </div>
            </form>

            <!-- Guidelines -->
            
        </div>
    </div>
</main>

<jsp:include page="/components/footer.jsp"/>
</body>
</html>
