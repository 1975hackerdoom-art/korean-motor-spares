# PowerShell script to add Services section to all location pages

$locationsDir = "c:\Users\Admin\Desktop\Korean Motor Spares\locations"

# Define all location files with their proper names
$locations = @{
    "alberton.html" = "Alberton"
    "benoni.html" = "Benoni"
    "boksburg.html" = "Boksburg"
    "brakpan.html" = "Brakpan"
    "centurion.html" = "Centurion"
    "daveyton.html" = "Daveyton"
    "diepkloof.html" = "Diepkloof"
    "dobsonville.html" = "Dobsonville"
    "edenvale.html" = "Edenvale"
    "fourways.html" = "Fourways"
    "germiston.html" = "Germiston"
    "johannesburg.html" = "Johannesburg"
    "kempton-park.html" = "Kempton Park"
    "krugersdorp.html" = "Krugersdorp"
    "lenasia.html" = "Lenasia"
    "midrand.html" = "Midrand"
    "olifantsfontein.html" = "Olifantsfontein"
    "pretoria.html" = "Pretoria"
    "randburg.html" = "Randburg"
    "randfontein.html" = "Randfontein"
    "roodepoort.html" = "Roodepoort"
    "sandton.html" = "Sandton"
    "soshanguve.html" = "Soshanguve"
    "soweto.html" = "Soweto"
    "springs.html" = "Springs"
}

# Define spin variations
$introVariations = @(
    "We offer long-lasting quality motor spares, auto parts, engine parts, body parts, service parts, and accessories.",
    "We provide long-lasting, high-quality spare parts for motors, engines, body parts, and service parts.",
    "We provide high-quality, long-lasting motor spares, parts, accessories, engine parts, body pieces, engine parts, and other parts.",
    "We offer high-quality motor spares and parts.",
    "We offer durable quality motor spares, car parts, engine parts, and body parts as well as accessories."
)

$supplyVariations = @(
    "At competitive prices, we supply spare parts for all Korean automotive manufacturers in {0}, Gauteng.",
    "We supply spare parts to all Korean automobile manufacturers at competitive prices in {0}, Gauteng.",
    "We offer spare parts at very competitive prices for all Korean car manufacturers located in {0}, Gauteng.",
    "We provide spare parts for all Korean auto manufacturers in {0}, Gauteng at affordable prices.",
    "We offer competitive prices and spare parts for all Korean automobile makers in {0}, Gauteng."
)

$productLineVariations = @(
    "Our product line focuses on Hyundai, KIA, Chevrolet, Ssangyong, and Daewoo vehicles.",
    "Our product range focuses on Hyundai and KIA vehicles, as well as Chevrolet, Ssangyong and Daewoo cars.",
    "Our product lines focus on Hyundai, KIA, and Chevrolet vehicles.",
    "Our product line focuses primarily on Hyundai, KIA (Chrysler), Ssangyong, Daewoo, and Chevrolet cars.",
    "Our product line focuses primarily upon Hyundai, KIAs, Chevrolets, Ssangyong, and Daewoo automobiles."
)

$leaderVariations = @(
    "As a leader in Korean Auto Parts in {0}, we are a company that always strives for effective communication with our customers while supplying high-quality auto parts and motor spares at reasonable prices.",
    "We are the leader in Korean Auto Parts in {0}. Our company strives to communicate effectively with our customers and supply high-quality motor parts and spares at affordable prices.",
    "As a leader for Korean Auto Parts in {0}, we strive to be an effective company communicating with our customers. We also supply high-quality parts and motor spares at a reasonable price.",
    "We are a leader in Korean Auto Parts and Motor Spares.",
    "As a leader of Korean Auto Parts in {0}, our company is able to communicate with customers effectively while still supplying high-quality spares and auto parts at affordable prices."
)

$qualityHeadingVariations = @(
    "Quality Korean Motor Spares {0}",
    "High Quality Korean Motor Spares {0}",
    "Korean quality motor spares {0}",
    "Korean Quality Motor Spares {0}",
    "Korean Motor Spares of High Quality {0}"
)

$qualityIntroVariations = @(
    "Korean motor spares and auto parts are well-known for their quality, which is why many people buy them.",
    "Korean auto spares and parts are known for their high quality. This is why so many people purchase them.",
    "Korean parts and spares are well-known for being high quality.",
    "Korean car spares and auto parts have a reputation for quality. Many people buy them.",
    "Korean motor parts and spares are known for their quality."
)

$priceVariations = @(
    "In addition, they are often less expensive than other auto parts, making them a good choice for those on a budget.",
    "They are also often cheaper than other parts of an auto, which makes them a great choice for budget-minded people.",
    "These parts are usually less expensive than most other auto parts, making them an affordable option for those with tight budgets.",
    "Additionally, they are typically less expensive than other auto components, making them a good option for people on a tight budget.",
    "They also tend to be less expensive than some other parts, making them a good alternative for budget-conscious people."
)

$availabilityVariations = @(
    "Finally, Korean motor spares are easy to find in {0} and can be shipped directly to your door, making them a convenient option for many people.",
    "Korean motor spares can be found in {0} and shipped right to your home, making them an easy option for many.",
    "Korean motor spares are very easy to find and can be shipped to your doorstep, making them a great option for many.",
    "Korean motor parts are also easy to find in {0}; they can be shipped directly right to your door, making it a convenient choice for many.",
    "Korean motor spares, which are easily found in {0}, can be shipped directly to your house, making them a practical choice for many."
)

$affordabilityIntroVariations = @(
    "Korean auto parts are very affordable.",
    "Korean parts are extremely affordable.",
    "Korean auto parts can be very cheap.",
    "Korean auto parts are quite affordable.",
    "Korean auto parts tend to be quite inexpensive."
)

$affordabilityOptionsVariations = @(
    "In addition, they offer a wide variety of options to choose from.",
    "They also offer many options.",
    "You also have many options.",
    "There are many options available.",
    "Additionally, there are many options."
)

$affordabilityValueVariations = @(
    "You can make your car look new without spending much money.",
    "It's possible to make your car look brand new without spending a lot of money.",
    "You don't have to spend a lot of money to make your car new.",
    "You don't need to spend much money to make your car look great.",
    "You don't have spend a lot to make your car more beautiful."
)

$newSparesHeadingVariations = @(
    "New motor spares",
    "New motor spares",
    "Motor spares",
    "Spare parts for new motors",
    "New motor spares"
)

$qualityProductsHeadingVariations = @(
    "Quality products for competitive prices",
    "High quality products at competitive prices",
    "High-quality products at affordable prices",
    "High quality products at reasonable prices",
    "Competitive prices for quality products"
)

$qualityCommitmentVariations = @(
    "We take our motor spares seriously and strive to deliver quality products at a competitive price.",
    "We take motor spares very seriously and aim to provide quality products at an affordable price.",
    "We take motor spares seriously and work hard to offer quality products at competitive prices.",
    "We take motor parts seriously and are committed to delivering quality products at a competitive price.",
    "We take motor spares seriously. We strive to offer high-quality products at a fair price."
)

$updatedCount = 0

foreach ($file in $locations.Keys) {
    $filepath = Join-Path $locationsDir $file
    $locationName = $locations[$file]
    
    if (Test-Path $filepath) {
        $content = Get-Content $filepath -Raw
        
        # Check if Services section already exists
        if ($content -match '<!-- Services Section -->') {
            Write-Host "Services section already exists in $locationName, skipping..." -ForegroundColor Yellow
            continue
        }
        
        # Find the footer
        if ($content -match '    <!-- Footer -->') {
            # Select random variations
            $intro = Get-Random -InputObject $introVariations
            $supply = (Get-Random -InputObject $supplyVariations) -f $locationName
            $productLine = Get-Random -InputObject $productLineVariations
            $leader = (Get-Random -InputObject $leaderVariations) -f $locationName
            
            $qualityHeading = (Get-Random -InputObject $qualityHeadingVariations) -f $locationName
            $qualityIntro = Get-Random -InputObject $qualityIntroVariations
            $price = Get-Random -InputObject $priceVariations
            $availability = (Get-Random -InputObject $availabilityVariations) -f $locationName
            
            $affordabilityIntro = Get-Random -InputObject $affordabilityIntroVariations
            $affordabilityOptions = Get-Random -InputObject $affordabilityOptionsVariations
            $affordabilityValue = Get-Random -InputObject $affordabilityValueVariations
            
            $newSparesHeading = Get-Random -InputObject $newSparesHeadingVariations
            $qualityProductsHeading = Get-Random -InputObject $qualityProductsHeadingVariations
            $qualityCommitment = Get-Random -InputObject $qualityCommitmentVariations
            
            # Create the Services section
            $servicesSection = @"
    <!-- Services Section -->
    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="max-w-4xl mx-auto">
                <h2 class="text-3xl font-bold mb-8 text-center">Services</h2>
                
                <div class="space-y-6 text-lg text-gray-700">
                    <p>
                        $intro $supply $productLine
                    </p>
                    
                    <p>
                        $leader
                    </p>
                    
                    <ul class="list-disc list-inside space-y-2 ml-4">
                        <li>Car Body Kits Swaping</li>
                        <li>Car Face lifting</li>
                        <li>Body Kits Repair</li>
                        <li>Custom Modifications</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Quality Korean Motor Spares Section -->
    <section class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <div class="max-w-4xl mx-auto">
                <h2 class="text-3xl font-bold mb-8 text-center">$qualityHeading</h2>
                
                <div class="space-y-6 text-lg text-gray-700">
                    <p>
                        $qualityIntro $price $availability
                    </p>
                    
                    <h3 class="text-2xl font-bold mt-8 mb-4">Affordability</h3>
                    <p>
                        $affordabilityIntro $affordabilityOptions $affordabilityValue
                    </p>
                    
                    <h3 class="text-2xl font-bold mt-8 mb-4">$newSparesHeading</h3>
                    <p>
                        We only deal with new products, imported from South Korea, made for South Korean brands such as Hyundai, KIA, Daewoo, and Ssangyong
                    </p>
                    
                    <h3 class="text-2xl font-bold mt-8 mb-4">$qualityProductsHeading</h3>
                    <p>
                        $qualityCommitment
                    </p>
                    
                    <div class="text-center mt-10">
                        <a href="../index.html#contact" class="inline-block bg-brand-red hover:bg-red-700 text-white font-bold py-3 px-8 rounded shadow-lg transition">
                            Contact Now
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

"@
            
            # Insert the Services section before the footer
            $newContent = $content -replace '    <!-- Footer -->', "$servicesSection    <!-- Footer -->"
            
            # Write the updated content
            Set-Content -Path $filepath -Value $newContent -NoNewline
            
            Write-Host "✓ Updated $locationName" -ForegroundColor Green
            $updatedCount++
        }
        else {
            Write-Host "✗ Could not find footer in $locationName" -ForegroundColor Red
        }
    }
    else {
        Write-Host "✗ File not found: $file" -ForegroundColor Red
    }
}

Write-Host "`n$('='*50)" -ForegroundColor Cyan
Write-Host "Completed! Updated $updatedCount out of $($locations.Count) location pages." -ForegroundColor Cyan
Write-Host "$('='*50)" -ForegroundColor Cyan
