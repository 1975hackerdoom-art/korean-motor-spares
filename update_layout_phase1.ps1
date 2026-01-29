# PowerShell script to update all location pages with 2-column layout and images

$locationFiles = @(
    "alberton", "benoni", "boksburg", "brakpan", "centurion",
    "daveyton", "diepkloof", "dobsonville", "edenvale", "fourways",
    "germiston", "johannesburg", "kempton-park", "krugersdorp", "lenasia",
    "midrand", "olifantsfontein", "pretoria", "randburg", "randfontein",
    "roodepoort", "sandton", "soshanguve", "soweto", "springs"
)

$updatedCount = 0

foreach ($loc in $locationFiles) {
    $filepath = "c:\Users\Admin\Desktop\Korean Motor Spares\locations\$loc.html"
    
    if (Test-Path $filepath) {
        $content = Get-Content $filepath -Raw
        
        # Update Services Section with 2-column layout and image
        $servicesOld = @'
    <!-- Services Section -->
    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="max-w-4xl mx-auto">
                <h2 class="text-3xl font-bold mb-8 text-center">Services</h2>
                
                <div class="space-y-6 text-lg text-gray-700">
'@
        
        $servicesNew = @'
    <!-- Services Section -->
    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="max-w-6xl mx-auto">
                <h2 class="text-3xl font-bold mb-8 text-center">Services</h2>
                
                <div class="grid md:grid-cols-2 gap-8 items-center">
                    <div>
                        <img src="../images/mechanic.png" alt="Korean Motor Spares Services" class="rounded-lg shadow-lg w-full">
                    </div>
                    <div class="space-y-6 text-lg text-gray-700">
'@
        
        $content = $content -replace [regex]::Escape($servicesOld), $servicesNew
        
        # Close the grid div for Services
        $content = $content -replace '(\s+</div>\s+</div>\s+</div>\s+</section>\s+<!-- Expert Section -->)', @'
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Expert Section -->
'@
        
        # Update Expert Section with 2-column layout and image
        $expertPattern = '(<!-- Expert Section -->\s+<section class="py-16 bg-white">\s+<div class="container mx-auto px-4">\s+<div class="max-w-4xl mx-auto">)'
        $expertReplacement = @'
<!-- Expert Section -->
    <section class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <div class="max-w-6xl mx-auto">
'@
        $content = $content -replace $expertPattern, $expertReplacement
        
        # Add image to Expert section
        $expertImagePattern = '(<h2 class="text-3xl font-bold mb-8 text-center">Expert Quality Car Spares [^<]+</h2>\s+<div class="space-y-6 text-lg text-gray-700">)'
        $expertImageReplacement = @'
<h2 class="text-3xl font-bold mb-8 text-center">Expert Quality Car Spares $1</h2>
                
                <div class="grid md:grid-cols-2 gap-8 items-center">
                    <div class="order-2 md:order-1 space-y-6 text-lg text-gray-700">
'@
        
        # Simpler approach - just update Quality section
        $qualityOld = '    <!-- Quality Korean Motor Spares Section -->' + "`r`n" + 
        '    <section class="py-16 bg-white">' + "`r`n" +
        '        <div class="container mx-auto px-4">' + "`r`n" +
        '            <div class="max-w-4xl mx-auto">'
        
        $qualityNew = @'
    <!-- Quality Korean Motor Spares Section -->
    <section class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <div class="max-w-6xl mx-auto">
'@
        
        $content = $content -replace [regex]::Escape($qualityOld), $qualityNew
        
        # Update Innovation Section
        $innovationOld = '    <!-- Innovation Section -->' + "`r`n" +
        '    <section class="py-16 bg-gray-50">' + "`r`n" +
        '        <div class="container mx-auto px-4">' + "`r`n" +
        '            <div class="max-w-4xl mx-auto">'
        
        $innovationNew = @'
    <!-- Innovation Section -->
    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="max-w-6xl mx-auto">
'@
        
        $content = $content -replace [regex]::Escape($innovationOld), $innovationNew
        
        # Write updated content
        Set-Content -Path $filepath -Value $content -NoNewline
        
        Write-Host "Updated $loc.html" -ForegroundColor Green
        $updatedCount++
    }
    else {
        Write-Host "File not found: $loc.html" -ForegroundColor Red
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Phase 1 Complete: Updated max-width on $updatedCount files" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
