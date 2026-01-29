# PowerShell script to add Expert section to all location pages
# This section will be inserted after the Services section

$expertTemplate = @'
    <!-- Expert Section -->
    <section class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <div class="max-w-4xl mx-auto">
                <h2 class="text-3xl font-bold mb-8 text-center">Expert Quality Car Spares {LOCATION}</h2>
                
                <div class="space-y-6 text-lg text-gray-700">
                    <p>
                        {SUPPLIER} {WHATSAPP}
                    </p>
                </div>
            </div>
        </div>
    </section>

'@

# Define unique content for each location (25 total)
$locationData = @{
    "alberton"        = @{
        LOCATION = "Alberton"
        SUPPLIER = "We are your online supplier for all Korean motor spares."
        WHATSAPP = "You can chat directly with any of our Branches via WhatsApp."
    }
    "benoni"          = @{
        LOCATION = "Benoni"
        SUPPLIER = "All Korean motor spares can be purchased online from us."
        WHATSAPP = "Chat with any branch via WhatsApp."
    }
    "boksburg"        = @{
        LOCATION = "Boksburg"
        SUPPLIER = "We are your online supplier of all Korean motor parts."
        WHATSAPP = "WhatsApp allows you to chat with any branch."
    }
    "brakpan"         = @{
        LOCATION = "Brakpan"
        SUPPLIER = "All Korean motor spares are available online at our supplier."
        WHATSAPP = "WhatsApp is a great way to communicate with any of our branches."
    }
    "centurion"       = @{
        LOCATION = "Centurion"
        SUPPLIER = "We are your online source for all Korean spare parts."
        WHATSAPP = "WhatsApp can be used to chat directly with any branch."
    }
    "daveyton"        = @{
        LOCATION = "Daveyton"
        SUPPLIER = "We are your online supplier for all Korean motor spares."
        WHATSAPP = "You can chat directly with any of our Branches via WhatsApp."
    }
    "diepkloof"       = @{
        LOCATION = "Diepkloof"
        SUPPLIER = "All Korean motor spares can be purchased online from us."
        WHATSAPP = "Chat with any branch via WhatsApp."
    }
    "dobsonville"     = @{
        LOCATION = "Dobsonville"
        SUPPLIER = "We are your online supplier of all Korean motor parts."
        WHATSAPP = "WhatsApp allows you to chat with any branch."
    }
    "edenvale"        = @{
        LOCATION = "Edenvale"
        SUPPLIER = "All Korean motor spares are available online at our supplier."
        WHATSAPP = "WhatsApp is a great way to communicate with any of our branches."
    }
    "fourways"        = @{
        LOCATION = "Fourways"
        SUPPLIER = "We are your online source for all Korean spare parts."
        WHATSAPP = "WhatsApp can be used to chat directly with any branch."
    }
    "germiston"       = @{
        LOCATION = "Germiston"
        SUPPLIER = "We are your online supplier for all Korean motor spares."
        WHATSAPP = "You can chat directly with any of our Branches via WhatsApp."
    }
    "johannesburg"    = @{
        LOCATION = "Johannesburg"
        SUPPLIER = "All Korean motor spares can be purchased online from us."
        WHATSAPP = "Chat with any branch via WhatsApp."
    }
    "kempton-park"    = @{
        LOCATION = "Kempton Park"
        SUPPLIER = "We are your online supplier of all Korean motor parts."
        WHATSAPP = "WhatsApp allows you to chat with any branch."
    }
    "krugersdorp"     = @{
        LOCATION = "Krugersdorp"
        SUPPLIER = "All Korean motor spares are available online at our supplier."
        WHATSAPP = "WhatsApp is a great way to communicate with any of our branches."
    }
    "lenasia"         = @{
        LOCATION = "Lenasia"
        SUPPLIER = "We are your online source for all Korean spare parts."
        WHATSAPP = "WhatsApp can be used to chat directly with any branch."
    }
    "midrand"         = @{
        LOCATION = "Midrand"
        SUPPLIER = "We are your online supplier for all Korean motor spares."
        WHATSAPP = "You can chat directly with any of our Branches via WhatsApp."
    }
    "olifantsfontein" = @{
        LOCATION = "Olifantsfontein"
        SUPPLIER = "All Korean motor spares can be purchased online from us."
        WHATSAPP = "Chat with any branch via WhatsApp."
    }
    "pretoria"        = @{
        LOCATION = "Pretoria"
        SUPPLIER = "We are your online supplier of all Korean motor parts."
        WHATSAPP = "WhatsApp allows you to chat with any branch."
    }
    "randburg"        = @{
        LOCATION = "Randburg"
        SUPPLIER = "All Korean motor spares are available online at our supplier."
        WHATSAPP = "WhatsApp is a great way to communicate with any of our branches."
    }
    "randfontein"     = @{
        LOCATION = "Randfontein"
        SUPPLIER = "We are your online source for all Korean spare parts."
        WHATSAPP = "WhatsApp can be used to chat directly with any branch."
    }
    "roodepoort"      = @{
        LOCATION = "Roodepoort"
        SUPPLIER = "We are your online supplier for all Korean motor spares."
        WHATSAPP = "You can chat directly with any of our Branches via WhatsApp."
    }
    "sandton"         = @{
        LOCATION = "Sandton"
        SUPPLIER = "All Korean motor spares can be purchased online from us."
        WHATSAPP = "Chat with any branch via WhatsApp."
    }
    "soshanguve"      = @{
        LOCATION = "Soshanguve"
        SUPPLIER = "We are your online supplier of all Korean motor parts."
        WHATSAPP = "WhatsApp allows you to chat with any branch."
    }
    "soweto"          = @{
        LOCATION = "Soweto"
        SUPPLIER = "All Korean motor spares are available online at our supplier."
        WHATSAPP = "WhatsApp is a great way to communicate with any of our branches."
    }
    "springs"         = @{
        LOCATION = "Springs"
        SUPPLIER = "We are your online source for all Korean spare parts."
        WHATSAPP = "WhatsApp can be used to chat directly with any branch."
    }
}

$updatedCount = 0
$skippedCount = 0

foreach ($loc in $locationData.Keys) {
    $filename = "$loc.html"
    $filepath = Join-Path "c:\Users\Admin\Desktop\Korean Motor Spares\locations" $filename
    
    if (Test-Path $filepath) {
        $content = Get-Content $filepath -Raw
        
        # Skip if already has Expert section
        if ($content -match '<!-- Expert Section -->') {
            Write-Host "Skipping $loc - already has Expert section" -ForegroundColor Yellow
            $skippedCount++
            continue
        }
        
        # Replace placeholders in template
        $expert = $expertTemplate
        foreach ($key in $locationData[$loc].Keys) {
            $expert = $expert -replace "{$key}", $locationData[$loc][$key]
        }
        
        # Insert after Services section (before Quality Korean Motor Spares Section)
        $newContent = $content -replace '(\s+<!-- Quality Korean Motor Spares Section -->)', "`r`n$expert`$1"
        
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
