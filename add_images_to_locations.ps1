# PowerShell script to add two-column image layout to all location pages
# This script adds a responsive image gallery after the hero section

$locationFiles = Get-ChildItem -Path ".\locations\*.html"

# Define the image section HTML to be inserted
$imageSection = @"

    <!-- Image Gallery Section -->
    <section class="py-12 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="max-w-6xl mx-auto">
                <h2 class="text-3xl font-bold mb-8 text-center">Quality Korean Auto Parts</h2>
                
                <!-- Two Column Image Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                    <!-- Image 1 -->
                    <div class="rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300">
                        <img src="../images/location-parts-1.jpg" alt="Korean Car Parts - Clutch Kits" class="w-full h-64 object-cover">
                        <div class="bg-white p-4">
                            <h3 class="font-bold text-lg text-brand-blue">Clutch Kits & Components</h3>
                            <p class="text-gray-600 text-sm mt-2">Complete clutch kits for all Korean vehicle models</p>
                        </div>
                    </div>
                    
                    <!-- Image 2 -->
                    <div class="rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300">
                        <img src="../images/location-parts-2.jpg" alt="Korean Car Parts - Oil Filters" class="w-full h-64 object-cover">
                        <div class="bg-white p-4">
                            <h3 class="font-bold text-lg text-brand-blue">Filters & Service Parts</h3>
                            <p class="text-gray-600 text-sm mt-2">High-quality oil filters and service components</p>
                        </div>
                    </div>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                    <!-- Image 3 -->
                    <div class="rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300">
                        <img src="../images/location-brands.jpg" alt="Korean Car Brands - Hyundai, KIA, Daewoo, SsangYong" class="w-full h-64 object-cover">
                        <div class="bg-white p-4">
                            <h3 class="font-bold text-lg text-brand-blue">All Korean Brands</h3>
                            <p class="text-gray-600 text-sm mt-2">Parts for Hyundai, KIA, Daewoo, and SsangYong vehicles</p>
                        </div>
                    </div>
                    
                    <!-- Image 4 -->
                    <div class="rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300">
                        <img src="../images/location-workshop.jpg" alt="Korean Car Parts Workshop" class="w-full h-64 object-cover">
                        <div class="bg-white p-4">
                            <h3 class="font-bold text-lg text-brand-blue">Expert Installation</h3>
                            <p class="text-gray-600 text-sm mt-2">Professional fitting and installation services available</p>
                        </div>
                    </div>
                </div>
                
                <!-- Single Full Width Image -->
                <div class="rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300">
                    <img src="../images/location-engine.png" alt="Korean Car Engine Parts" class="w-full h-80 object-cover">
                    <div class="bg-white p-4">
                        <h3 class="font-bold text-lg text-brand-blue">Engine Components & More</h3>
                        <p class="text-gray-600 text-sm mt-2">Comprehensive range of engine parts, body panels, and accessories for all Korean vehicles</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
"@

$processedCount = 0
$errorCount = 0

foreach ($file in $locationFiles) {
    try {
        Write-Host "Processing: $($file.Name)" -ForegroundColor Cyan
        
        # Read the file content
        $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
        
        # Check if image section already exists
        if ($content -match "<!-- Image Gallery Section -->") {
            Write-Host "  Image section already exists, skipping..." -ForegroundColor Yellow
            continue
        }
        
        # Find the location hero section end tag and insert after it
        # Looking for the closing </section> tag after the hero section
        $pattern = '(</section>\s*\r?\n\s*<!-- Content -->)'
        
        if ($content -match $pattern) {
            # Insert the image section between hero and content sections
            $newContent = $content -replace $pattern, ("</section>" + $imageSection + "`r`n`r`n    <!-- Content -->")
            
            # Write the updated content back to the file
            Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8 -NoNewline
            
            Write-Host "  Successfully added image section" -ForegroundColor Green
            $processedCount++
        }
        else {
            Write-Host "  Could not find insertion point" -ForegroundColor Red
            $errorCount++
        }
    }
    catch {
        Write-Host "  Error processing file: $_" -ForegroundColor Red
        $errorCount++
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Processing Complete!" -ForegroundColor Green
Write-Host "Files processed: $processedCount" -ForegroundColor Green
Write-Host "Files skipped/errors: $errorCount" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
