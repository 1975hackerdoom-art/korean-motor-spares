# PowerShell script to link images in location pages to the homepage quote form

$locationFiles = Get-ChildItem -Path ".\locations\*.html"

# Define the NEW image section HTML with links
$linkedImageSection = @"
    <!-- Image Gallery Section -->
    <section class="py-12 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="max-w-6xl mx-auto">
                <h2 class="text-3xl font-bold mb-8 text-center">Quality Korean Auto Parts</h2>
                
                <!-- Two Column Image Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                    <!-- Image 1 -->
                    <a href="../index.html#quote-form" class="block group">
                        <div class="rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300 h-full">
                            <img src="../images/location-parts-1.jpg" alt="Korean Car Parts - Clutch Kits" class="w-full h-64 object-cover group-hover:opacity-95 transition-opacity">
                            <div class="bg-white p-4">
                                <h3 class="font-bold text-lg text-brand-blue group-hover:text-brand-red transition-colors">Clutch Kits & Components</h3>
                                <p class="text-gray-600 text-sm mt-2">Complete clutch kits for all Korean vehicle models</p>
                            </div>
                        </div>
                    </a>
                    
                    <!-- Image 2 -->
                    <a href="../index.html#quote-form" class="block group">
                        <div class="rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300 h-full">
                            <img src="../images/location-parts-2.jpg" alt="Korean Car Parts - Oil Filters" class="w-full h-64 object-cover group-hover:opacity-95 transition-opacity">
                            <div class="bg-white p-4">
                                <h3 class="font-bold text-lg text-brand-blue group-hover:text-brand-red transition-colors">Filters & Service Parts</h3>
                                <p class="text-gray-600 text-sm mt-2">High-quality oil filters and service components</p>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                    <!-- Image 3 -->
                    <a href="../index.html#quote-form" class="block group">
                        <div class="rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300 h-full">
                            <img src="../images/location-brands.jpg" alt="Korean Car Brands - Hyundai, KIA, Daewoo, SsangYong" class="w-full h-64 object-cover group-hover:opacity-95 transition-opacity">
                            <div class="bg-white p-4">
                                <h3 class="font-bold text-lg text-brand-blue group-hover:text-brand-red transition-colors">All Korean Brands</h3>
                                <p class="text-gray-600 text-sm mt-2">Parts for Hyundai, KIA, Daewoo, and SsangYong vehicles</p>
                            </div>
                        </div>
                    </a>
                    
                    <!-- Image 4 -->
                    <a href="../index.html#quote-form" class="block group">
                        <div class="rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300 h-full">
                            <img src="../images/location-workshop.jpg" alt="Korean Car Parts Workshop" class="w-full h-64 object-cover group-hover:opacity-95 transition-opacity">
                            <div class="bg-white p-4">
                                <h3 class="font-bold text-lg text-brand-blue group-hover:text-brand-red transition-colors">Expert Installation</h3>
                                <p class="text-gray-600 text-sm mt-2">Professional fitting and installation services available</p>
                            </div>
                        </div>
                    </a>
                </div>
                
                <!-- Single Full Width Image -->
                <a href="../index.html#quote-form" class="block group">
                    <div class="rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300">
                        <img src="../images/location-engine.png" alt="Korean Car Engine Parts" class="w-full h-80 object-cover group-hover:opacity-95 transition-opacity">
                        <div class="bg-white p-4">
                            <h3 class="font-bold text-lg text-brand-blue group-hover:text-brand-red transition-colors">Engine Components & More</h3>
                            <p class="text-gray-600 text-sm mt-2">Comprehensive range of engine parts, body panels, and accessories for all Korean vehicles</p>
                        </div>
                    </div>
                </a>
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
        
        # Regex to match the existing Image Gallery Section
        # Matches from <!-- Image Gallery Section --> to the closing </section> tag of that section
        # We use (?s) for single-line mode so . matches newlines
        $pattern = '(?s)\s*<!-- Image Gallery Section -->.*?<section.*?>.*?</section>'
        
        if ($content -match $pattern) {
            # Replace the old section with the new linked section
            $newContent = $content -replace $pattern, $linkedImageSection
            
            # Write the updated content back to the file
            Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8 -NoNewline
            
            Write-Host "  Successfully updated image section with links" -ForegroundColor Green
            $processedCount++
        }
        else {
            Write-Host "  Could not find image gallery section to replace" -ForegroundColor Yellow
            $errorCount++
        }
    }
    catch {
        Write-Host "  Error processing file: $_" -ForegroundColor Red
        $errorCount++
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Update Complete!" -ForegroundColor Green
Write-Host "Files updated: $processedCount" -ForegroundColor Green
Write-Host "Files skipped/errors: $errorCount" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
