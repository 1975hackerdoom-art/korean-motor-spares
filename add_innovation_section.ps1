# PowerShell script to add Innovation section to all location pages
# This section will be inserted after the Quality Korean Motor Spares section

$innovationTemplate = @'
    <!-- Innovation Section -->
    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="max-w-4xl mx-auto">
                <h2 class="text-3xl font-bold mb-8 text-center">Innovation</h2>
                
                <!-- Popular Parts and Categories -->
                <div class="mb-12">
                    <h3 class="text-2xl font-bold mb-6">Popular Parts and Categories - The latest automotive spare parts</h3>
                    <p class="text-lg text-gray-700 mb-6">
                        {BRANCHES}
                    </p>
                </div>
                
                <!-- Korean Motor Parts - Service Kit Parts -->
                <div class="mb-12">
                    <h3 class="text-2xl font-bold mb-6">Korean Motor Parts - Korean Service Kit Parts</h3>
                    <p class="text-lg text-gray-700 mb-4">
                        {PARTS} {QUALITY}
                    </p>
                </div>
                
                <!-- Korean Motor Parts Clutch Kits -->
                <div class="mb-12">
                    <h3 class="text-2xl font-bold mb-6">Korean Motor Parts Clutch Kits</h3>
                    <p class="text-lg text-gray-700 mb-4">
                        {PRODUCTINFO} {CLUTCHINFO} {STOCK} {APSKIT}
                    </p>
                </div>
                
                <!-- Call to Action -->
                <div class="bg-brand-blue text-white p-8 rounded-lg text-center">
                    <h3 class="text-2xl font-bold mb-4">Car Body Kits and Car Body Accessories</h3>
                    <p class="text-xl mb-6">24/7 Availability . Discounted Prices.</p>
                    <a href="../index.html#quote-form" class="inline-block bg-brand-red hover:bg-red-700 text-white font-bold py-3 px-8 rounded shadow-lg transition">
                        Get Quote
                    </a>
                </div>
            </div>
        </div>
    </section>

'@

# Define unique content for each location (25 total)
$locationData = @{
    "alberton"        = @{
        LOCATION    = "Alberton"
        BRANCHES    = "We have branches across South Africa, including: Alberton, and offer various parts and accessories at competitive prices."
        PARTS       = "We supply a wide range of engine, suspension, service, and body parts."
        QUALITY     = "AFFORDABLE prices and QUALITY parts are all in one place!"
        PRODUCTINFO = "Product Information."
        CLUTCHINFO  = "KOREAN SPARE PARTS - SECO CLUTCH: clutch disk, cover, and bearing."
        STOCK       = "We have SECO clutch in Stock."
        APSKIT      = "Buy APS Korean auto parts-clutch kit; the high quality can improve your vehicle's performance."
    }
    "benoni"          = @{
        LOCATION    = "Benoni"
        BRANCHES    = "We have branches in South Africa including Benoni and offer parts and accessories at affordable prices."
        PARTS       = "We offer a variety of engine, suspension, service and body parts."
        QUALITY     = "All the parts you need at a reasonable price and of high quality are available in one location!"
        PRODUCTINFO = "Information about the product."
        CLUTCHINFO  = "KOREAN SPARE PIECES - SECO CLUTCH: Clutch disk, cover, bearing."
        STOCK       = "SECO clutch is in stock"
        APSKIT      = "Get APS Korean parts-clutch kits; they are high-quality and can increase your vehicle's performance."
    }
    "boksburg"        = @{
        LOCATION    = "Boksburg"
        BRANCHES    = "We have branches throughout South Africa, including Boksburg area. We offer parts and accessories at competitive rates."
        PARTS       = "We stock a large range of engine, suspension and service parts."
        QUALITY     = "We offer affordable prices and high-quality parts all in one place."
        PRODUCTINFO = "Information."
        CLUTCHINFO  = "KOREAN SPARE PARTS SECO CLUTCH: Bearing, clutch disk, cover and cover."
        STOCK       = "SECO clutches are in stock."
        APSKIT      = "Get APS Korean auto parts-clutch set; high quality can enhance your vehicle's performance."
    }
    "brakpan"         = @{
        LOCATION    = "Brakpan"
        BRANCHES    = "We have branches all over South Africa, including in Brakpan, and offer a variety of parts and accessories at very competitive prices."
        PARTS       = "We have a large selection of engine, suspension service, and body part options."
        QUALITY     = "You will find all the necessary parts at affordable prices."
        PRODUCTINFO = "Product Information."
        CLUTCHINFO  = "KOREAN SPARE PARTICLES - SECO CLUTCH - Clutch, cover, and bearing."
        STOCK       = "SECO clutch stock."
        APSKIT      = "Buy APS Korean auto parts clutch kit. The high quality will improve your vehicle's performance."
    }
    "centurion"       = @{
        LOCATION    = "Centurion"
        BRANCHES    = "We have branches across South Africa, including: Centurion, and offer various parts and accessories at competitive prices."
        PARTS       = "We provide a wide variety of engine and suspension parts, as well as service and body components."
        QUALITY     = "We have all you need for affordable and high quality parts!"
        PRODUCTINFO = "Product Information."
        CLUTCHINFO  = "KOREAN PARTS - SECO CLUTCH. Clutch disc, cover, and bearing."
        STOCK       = "SECO clutches in stock"
        APSKIT      = "Buy APS Korean auto parts - clutch kit. It will enhance the performance of your vehicle."
    }
    "daveyton"        = @{
        LOCATION    = "Daveyton"
        BRANCHES    = "We have branches in South Africa including Daveyton and offer parts and accessories at affordable prices."
        PARTS       = "We supply a wide range of engine, suspension, service, and body parts."
        QUALITY     = "AFFORDABLE prices and QUALITY parts are all in one place!"
        PRODUCTINFO = "Information about the product."
        CLUTCHINFO  = "KOREAN SPARE PARTS - SECO CLUTCH: clutch disk, cover, and bearing."
        STOCK       = "We have SECO clutch in Stock."
        APSKIT      = "Get APS Korean parts-clutch kits; they are high-quality and can increase your vehicle's performance."
    }
    "diepkloof"       = @{
        LOCATION    = "Diepkloof"
        BRANCHES    = "We have branches throughout South Africa, including Diepkloof area. We offer parts and accessories at competitive rates."
        PARTS       = "We offer a variety of engine, suspension, service and body parts."
        QUALITY     = "All the parts you need at a reasonable price and of high quality are available in one location!"
        PRODUCTINFO = "Information."
        CLUTCHINFO  = "KOREAN SPARE PIECES - SECO CLUTCH: Clutch disk, cover, bearing."
        STOCK       = "SECO clutch is in stock"
        APSKIT      = "Get APS Korean auto parts-clutch set; high quality can enhance your vehicle's performance."
    }
    "dobsonville"     = @{
        LOCATION    = "Dobsonville"
        BRANCHES    = "We have branches all over South Africa, including in Dobsonville, and offer a variety of parts and accessories at very competitive prices."
        PARTS       = "We stock a large range of engine, suspension and service parts."
        QUALITY     = "We offer affordable prices and high-quality parts all in one place."
        PRODUCTINFO = "Product Information."
        CLUTCHINFO  = "KOREAN SPARE PARTS SECO CLUTCH: Bearing, clutch disk, cover and cover."
        STOCK       = "SECO clutches are in stock."
        APSKIT      = "Buy APS Korean auto parts clutch kit. The high quality will improve your vehicle's performance."
    }
    "edenvale"        = @{
        LOCATION    = "Edenvale"
        BRANCHES    = "We have branches across South Africa, including: Edenvale, and offer various parts and accessories at competitive prices."
        PARTS       = "We have a large selection of engine, suspension service, and body part options."
        QUALITY     = "You will find all the necessary parts at affordable prices."
        PRODUCTINFO = "Information about the product."
        CLUTCHINFO  = "KOREAN SPARE PARTICLES - SECO CLUTCH - Clutch, cover, and bearing."
        STOCK       = "SECO clutch stock."
        APSKIT      = "Buy APS Korean auto parts - clutch kit. It will enhance the performance of your vehicle."
    }
    "fourways"        = @{
        LOCATION    = "Fourways"
        BRANCHES    = "We have branches in South Africa including Fourways and offer parts and accessories at affordable prices."
        PARTS       = "We provide a wide variety of engine and suspension parts, as well as service and body components."
        QUALITY     = "We have all you need for affordable and high quality parts!"
        PRODUCTINFO = "Information."
        CLUTCHINFO  = "KOREAN PARTS - SECO CLUTCH. Clutch disc, cover, and bearing."
        STOCK       = "SECO clutches in stock"
        APSKIT      = "Get APS Korean parts-clutch kits; they are high-quality and can increase your vehicle's performance."
    }
    "germiston"       = @{
        LOCATION    = "Germiston"
        BRANCHES    = "We have branches throughout South Africa, including Germiston area. We offer parts and accessories at competitive rates."
        PARTS       = "We supply a wide range of engine, suspension, service, and body parts."
        QUALITY     = "AFFORDABLE prices and QUALITY parts are all in one place!"
        PRODUCTINFO = "Product Information."
        CLUTCHINFO  = "KOREAN SPARE PARTS - SECO CLUTCH: clutch disk, cover, and bearing."
        STOCK       = "We have SECO clutch in Stock."
        APSKIT      = "Get APS Korean auto parts-clutch set; high quality can enhance your vehicle's performance."
    }
    "johannesburg"    = @{
        LOCATION    = "Johannesburg"
        BRANCHES    = "We have branches all over South Africa, including in Johannesburg, and offer a variety of parts and accessories at very competitive prices."
        PARTS       = "We offer a variety of engine, suspension, service and body parts."
        QUALITY     = "All the parts you need at a reasonable price and of high quality are available in one location!"
        PRODUCTINFO = "Information about the product."
        CLUTCHINFO  = "KOREAN SPARE PIECES - SECO CLUTCH: Clutch disk, cover, bearing."
        STOCK       = "SECO clutch is in stock"
        APSKIT      = "Buy APS Korean auto parts clutch kit. The high quality will improve your vehicle's performance."
    }
    "kempton-park"    = @{
        LOCATION    = "Kempton Park"
        BRANCHES    = "We have branches across South Africa, including: Kempton Park, and offer various parts and accessories at competitive prices."
        PARTS       = "We stock a large range of engine, suspension and service parts."
        QUALITY     = "We offer affordable prices and high-quality parts all in one place."
        PRODUCTINFO = "Information."
        CLUTCHINFO  = "KOREAN SPARE PARTS SECO CLUTCH: Bearing, clutch disk, cover and cover."
        STOCK       = "SECO clutches are in stock."
        APSKIT      = "Buy APS Korean auto parts - clutch kit. It will enhance the performance of your vehicle."
    }
    "krugersdorp"     = @{
        LOCATION    = "Krugersdorp"
        BRANCHES    = "We have branches in South Africa including Krugersdorp and offer parts and accessories at affordable prices."
        PARTS       = "We have a large selection of engine, suspension service, and body part options."
        QUALITY     = "You will find all the necessary parts at affordable prices."
        PRODUCTINFO = "Product Information."
        CLUTCHINFO  = "KOREAN SPARE PARTICLES - SECO CLUTCH - Clutch, cover, and bearing."
        STOCK       = "SECO clutch stock."
        APSKIT      = "Get APS Korean parts-clutch kits; they are high-quality and can increase your vehicle's performance."
    }
    "lenasia"         = @{
        LOCATION    = "Lenasia"
        BRANCHES    = "We have branches throughout South Africa, including Lenasia area. We offer parts and accessories at competitive rates."
        PARTS       = "We provide a wide variety of engine and suspension parts, as well as service and body components."
        QUALITY     = "We have all you need for affordable and high quality parts!"
        PRODUCTINFO = "Information about the product."
        CLUTCHINFO  = "KOREAN PARTS - SECO CLUTCH. Clutch disc, cover, and bearing."
        STOCK       = "SECO clutches in stock"
        APSKIT      = "Get APS Korean auto parts-clutch set; high quality can enhance your vehicle's performance."
    }
    "midrand"         = @{
        LOCATION    = "Midrand"
        BRANCHES    = "We have branches all over South Africa, including in Midrand, and offer a variety of parts and accessories at very competitive prices."
        PARTS       = "We supply a wide range of engine, suspension, service, and body parts."
        QUALITY     = "AFFORDABLE prices and QUALITY parts are all in one place!"
        PRODUCTINFO = "Information."
        CLUTCHINFO  = "KOREAN SPARE PARTS - SECO CLUTCH: clutch disk, cover, and bearing."
        STOCK       = "We have SECO clutch in Stock."
        APSKIT      = "Buy APS Korean auto parts clutch kit. The high quality will improve your vehicle's performance."
    }
    "olifantsfontein" = @{
        LOCATION    = "Olifantsfontein"
        BRANCHES    = "We have branches across South Africa, including: Olifantsfontein, and offer various parts and accessories at competitive prices."
        PARTS       = "We offer a variety of engine, suspension, service and body parts."
        QUALITY     = "All the parts you need at a reasonable price and of high quality are available in one location!"
        PRODUCTINFO = "Product Information."
        CLUTCHINFO  = "KOREAN SPARE PIECES - SECO CLUTCH: Clutch disk, cover, bearing."
        STOCK       = "SECO clutch is in stock"
        APSKIT      = "Buy APS Korean auto parts - clutch kit. It will enhance the performance of your vehicle."
    }
    "pretoria"        = @{
        LOCATION    = "Pretoria"
        BRANCHES    = "We have branches in South Africa including Pretoria and offer parts and accessories at affordable prices."
        PARTS       = "We stock a large range of engine, suspension and service parts."
        QUALITY     = "We offer affordable prices and high-quality parts all in one place."
        PRODUCTINFO = "Information about the product."
        CLUTCHINFO  = "KOREAN SPARE PARTS SECO CLUTCH: Bearing, clutch disk, cover and cover."
        STOCK       = "SECO clutches are in stock."
        APSKIT      = "Get APS Korean parts-clutch kits; they are high-quality and can increase your vehicle's performance."
    }
    "randburg"        = @{
        LOCATION    = "Randburg"
        BRANCHES    = "We have branches throughout South Africa, including Randburg area. We offer parts and accessories at competitive rates."
        PARTS       = "We have a large selection of engine, suspension service, and body part options."
        QUALITY     = "You will find all the necessary parts at affordable prices."
        PRODUCTINFO = "Information."
        CLUTCHINFO  = "KOREAN SPARE PARTICLES - SECO CLUTCH - Clutch, cover, and bearing."
        STOCK       = "SECO clutch stock."
        APSKIT      = "Get APS Korean auto parts-clutch set; high quality can enhance your vehicle's performance."
    }
    "randfontein"     = @{
        LOCATION    = "Randfontein"
        BRANCHES    = "We have branches all over South Africa, including in Randfontein, and offer a variety of parts and accessories at very competitive prices."
        PARTS       = "We provide a wide variety of engine and suspension parts, as well as service and body components."
        QUALITY     = "We have all you need for affordable and high quality parts!"
        PRODUCTINFO = "Product Information."
        CLUTCHINFO  = "KOREAN PARTS - SECO CLUTCH. Clutch disc, cover, and bearing."
        STOCK       = "SECO clutches in stock"
        APSKIT      = "Buy APS Korean auto parts clutch kit. The high quality will improve your vehicle's performance."
    }
    "roodepoort"      = @{
        LOCATION    = "Roodepoort"
        BRANCHES    = "We have branches across South Africa, including: Roodepoort, and offer various parts and accessories at competitive prices."
        PARTS       = "We supply a wide range of engine, suspension, service, and body parts."
        QUALITY     = "AFFORDABLE prices and QUALITY parts are all in one place!"
        PRODUCTINFO = "Information about the product."
        CLUTCHINFO  = "KOREAN SPARE PARTS - SECO CLUTCH: clutch disk, cover, and bearing."
        STOCK       = "We have SECO clutch in Stock."
        APSKIT      = "Buy APS Korean auto parts - clutch kit. It will enhance the performance of your vehicle."
    }
    "sandton"         = @{
        LOCATION    = "Sandton"
        BRANCHES    = "We have branches in South Africa including Sandton and offer parts and accessories at affordable prices."
        PARTS       = "We offer a variety of engine, suspension, service and body parts."
        QUALITY     = "All the parts you need at a reasonable price and of high quality are available in one location!"
        PRODUCTINFO = "Information."
        CLUTCHINFO  = "KOREAN SPARE PIECES - SECO CLUTCH: Clutch disk, cover, bearing."
        STOCK       = "SECO clutch is in stock"
        APSKIT      = "Get APS Korean parts-clutch kits; they are high-quality and can increase your vehicle's performance."
    }
    "soshanguve"      = @{
        LOCATION    = "Soshanguve"
        BRANCHES    = "We have branches throughout South Africa, including Soshanguve area. We offer parts and accessories at competitive rates."
        PARTS       = "We stock a large range of engine, suspension and service parts."
        QUALITY     = "We offer affordable prices and high-quality parts all in one place."
        PRODUCTINFO = "Product Information."
        CLUTCHINFO  = "KOREAN SPARE PARTS SECO CLUTCH: Bearing, clutch disk, cover and cover."
        STOCK       = "SECO clutches are in stock."
        APSKIT      = "Get APS Korean auto parts-clutch set; high quality can enhance your vehicle's performance."
    }
    "soweto"          = @{
        LOCATION    = "Soweto"
        BRANCHES    = "We have branches all over South Africa, including in Soweto, and offer a variety of parts and accessories at very competitive prices."
        PARTS       = "We have a large selection of engine, suspension service, and body part options."
        QUALITY     = "You will find all the necessary parts at affordable prices."
        PRODUCTINFO = "Information about the product."
        CLUTCHINFO  = "KOREAN SPARE PARTICLES - SECO CLUTCH - Clutch, cover, and bearing."
        STOCK       = "SECO clutch stock."
        APSKIT      = "Buy APS Korean auto parts clutch kit. The high quality will improve your vehicle's performance."
    }
    "springs"         = @{
        LOCATION    = "Springs"
        BRANCHES    = "We have branches across South Africa, including: Springs, and offer various parts and accessories at competitive prices."
        PARTS       = "We provide a wide variety of engine and suspension parts, as well as service and body components."
        QUALITY     = "We have all you need for affordable and high quality parts!"
        PRODUCTINFO = "Information."
        CLUTCHINFO  = "KOREAN PARTS - SECO CLUTCH. Clutch disc, cover, and bearing."
        STOCK       = "SECO clutches in stock"
        APSKIT      = "Buy APS Korean auto parts - clutch kit. It will enhance the performance of your vehicle."
    }
}

$updatedCount = 0
$skippedCount = 0

foreach ($loc in $locationData.Keys) {
    $filename = "$loc.html"
    $filepath = Join-Path "c:\Users\Admin\Desktop\Korean Motor Spares\locations" $filename
    
    if (Test-Path $filepath) {
        $content = Get-Content $filepath -Raw
        
        # Skip if already has Innovation section
        if ($content -match '<!-- Innovation Section -->') {
            Write-Host "Skipping $loc - already has Innovation section" -ForegroundColor Yellow
            $skippedCount++
            continue
        }
        
        # Replace placeholders in template
        $innovation = $innovationTemplate
        foreach ($key in $locationData[$loc].Keys) {
            $innovation = $innovation -replace "{$key}", $locationData[$loc][$key]
        }
        
        # Insert after Quality Korean Motor Spares section (before Footer)
        $newContent = $content -replace '(\s+<!-- Footer -->)', "`r`n$innovation`$1"
        
        # Write back
        Set-Content -Path $filepath -Value $newContent -NoNewline
        
        Write-Host "Updated $loc" -ForegroundColor Green
        $updatedCount++
    }
    else {
        Write-Host "File not found: $filename" -ForegroundColor Red
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Completed!" -ForegroundColor Cyan
Write-Host "Updated: $updatedCount" -ForegroundColor Green
Write-Host "Skipped: $skippedCount" -ForegroundColor Yellow
Write-Host "Total: $($locationData.Count)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
