$servicesTemplate = @'
    <!-- Services Section -->
    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="max-w-4xl mx-auto">
                <h2 class="text-3xl font-bold mb-8 text-center">Services</h2>
                
                <div class="space-y-6 text-lg text-gray-700">
                    <p>
                        {INTRO} {SUPPLY} {PRODUCTLINE}
                    </p>
                    
                    <p>
                        {LEADER}
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
                <h2 class="text-3xl font-bold mb-8 text-center">{QUALITYHEADING}</h2>
                
                <div class="space-y-6 text-lg text-gray-700">
                    <p>
                        {QUALITYINTRO} {PRICE} {AVAILABILITY}
                    </p>
                    
                    <h3 class="text-2xl font-bold mt-8 mb-4">Affordability</h3>
                    <p>
                        {AFFORDINTRO} {AFFORDOPTIONS} {AFFORDVALUE}
                    </p>
                    
                    <h3 class="text-2xl font-bold mt-8 mb-4">{NEWSPARESHEADING}</h3>
                    <p>
                        We only deal with new products, imported from South Korea, made for South Korean brands such as Hyundai, KIA, Daewoo, and Ssangyong
                    </p>
                    
                    <h3 class="text-2xl font-bold mt-8 mb-4">{QUALITYPRODHEADING}</h3>
                    <p>
                        {QUALITYCOMMIT}
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

'@

# Define variations for each location
$locationData = @{
    "alberton" = @{
        INTRO = "We offer long-lasting quality motor spares, auto parts, engine parts, body parts, service parts, and accessories."
        SUPPLY = "At competitive prices, we supply spare parts for all Korean automotive manufacturers in Alberton, Gauteng."
        PRODUCTLINE = "Our product line focuses on Hyundai, KIA, Chevrolet, Ssangyong, and Daewoo vehicles."
        LEADER = "As a leader in Korean Auto Parts in Alberton, we are a company that always strives for effective communication with our customers while supplying high-quality auto parts and motor spares at reasonable prices."
        QUALITYHEADING = "Quality Korean Motor Spares Alberton"
        QUALITYINTRO = "Korean motor spares and auto parts are well-known for their quality, which is why many people buy them."
        PRICE = "In addition, they are often less expensive than other auto parts, making them a good choice for those on a budget."
        AVAILABILITY = "Finally, Korean motor spares are easy to find in Alberton and can be shipped directly to your door, making them a convenient option for many people."
        AFFORDINTRO = "Korean auto parts are very affordable."
        AFFORDOPTIONS = "In addition, they offer a wide variety of options to choose from."
        AFFORDVALUE = "You can make your car look new without spending much money."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "Quality products for competitive prices"
        QUALITYCOMMIT = "We take our motor spares seriously and strive to deliver quality products at a competitive price."
    }
    "benoni" = @{
        INTRO = "We provide long-lasting, high-quality spare parts for motors, engines, body parts, and service parts."
        SUPPLY = "We supply spare parts to all Korean automobile manufacturers at competitive prices in Benoni, Gauteng."
        PRODUCTLINE = "Our product range focuses on Hyundai and KIA vehicles, as well as Chevrolet, Ssangyong and Daewoo cars."
        LEADER = "We are the leader in Korean Auto Parts in Benoni. Our company strives to communicate effectively with our customers and supply high-quality motor parts and spares at affordable prices."
        QUALITYHEADING = "High Quality Korean Motor Spares Benoni"
        QUALITYINTRO = "Korean auto spares and parts are known for their high quality. This is why so many people purchase them."
        PRICE = "They are also often cheaper than other parts of an auto, which makes them a great choice for budget-minded people."
        AVAILABILITY = "Korean motor spares can be found in Benoni and shipped right to your home, making them an easy option for many."
        AFFORDINTRO = "Korean parts are extremely affordable."
        AFFORDOPTIONS = "They also offer many options."
        AFFORDVALUE = "It's possible to make your car look brand new without spending a lot of money."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "High quality products at competitive prices"
        QUALITYCOMMIT = "We take motor spares very seriously and aim to provide quality products at an affordable price."
    }
}

# Add more locations with different variations...
# (continuing with similar pattern for all 25 locations)

foreach ($loc in $locationData.Keys) {
    $filename = "$loc.html"
    $filepath = Join-Path "c:\Users\Admin\Desktop\Korean Motor Spares\locations" $filename
    
    if (Test-Path $filepath) {
        $content = Get-Content $filepath -Raw
        
        # Skip if already has Services section
        if ($content -match '<!-- Services Section -->') {
            Write-Host "Skipping $loc - already has Services section" -ForegroundColor Yellow
            continue
        }
        
        # Replace placeholders in template
        $services = $servicesTemplate
        foreach ($key in $locationData[$loc].Keys) {
            $services = $services -replace "{$key}", $locationData[$loc][$key]
        }
        
        # Insert before footer
        $newContent = $content -replace '(\s+<!-- Footer -->)', "`r`n$services`$1"
        
        # Write back
        Set-Content -Path $filepath -Value $newContent -NoNewline
        
        Write-Host "Updated $loc" -ForegroundColor Green
    }
}
