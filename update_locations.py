import os
import random

# Define the base directory
locations_dir = r"c:\Users\Admin\Desktop\Korean Motor Spares\locations"

# Define all location files
location_files = [
    "alberton.html", "benoni.html", "boksburg.html", "brakpan.html", "centurion.html",
    "daveyton.html", "diepkloof.html", "dobsonville.html", "edenvale.html", "fourways.html",
    "germiston.html", "johannesburg.html", "kempton-park.html", "krugersdorp.html", "lenasia.html",
    "midrand.html", "olifantsfontein.html", "pretoria.html", "randburg.html", "randfontein.html",
    "roodepoort.html", "sandton.html", "soshanguve.html", "soweto.html", "springs.html"
]

# Define spin variations
intro_variations = [
    "We offer long-lasting quality motor spares, auto parts, engine parts, body parts, service parts, and accessories.",
    "We provide long-lasting, high-quality spare parts for motors, engines, body parts, and service parts.",
    "We provide high-quality, long-lasting motor spares, parts, accessories, engine parts, body pieces, engine parts, and other parts.",
    "We offer high-quality motor spares and parts.",
    "We offer durable quality motor spares, car parts, engine parts, and body parts as well as accessories."
]

supply_variations = [
    "At competitive prices, we supply spare parts for all Korean automotive manufacturers in {location}, Gauteng.",
    "We supply spare parts to all Korean automobile manufacturers at competitive prices in {location}, Gauteng.",
    "We offer spare parts at very competitive prices for all Korean car manufacturers located in {location}, Gauteng.",
    "We provide spare parts for all Korean auto manufacturers in {location}, Gauteng at affordable prices.",
    "We offer competitive prices and spare parts for all Korean automobile makers in {location}, Gauteng."
]

product_line_variations = [
    "Our product line focuses on Hyundai, KIA, Chevrolet, Ssangyong, and Daewoo vehicles.",
    "Our product range focuses on Hyundai and KIA vehicles, as well as Chevrolet, Ssangyong and Daewoo cars.",
    "Our product lines focus on Hyundai, KIA, and Chevrolet vehicles.",
    "Our product line focuses primarily on Hyundai, KIA (Chrysler), Ssangyong, Daewoo, and Chevrolet cars.",
    "Our product line focuses primarily upon Hyundai, KIAs, Chevrolets, Ssangyong, and Daewoo automobiles."
]

leader_variations = [
    "As a leader in Korean Auto Parts in {location}, we are a company that always strives for effective communication with our customers while supplying high-quality auto parts and motor spares at reasonable prices.",
    "We are the leader in Korean Auto Parts in {location}. Our company strives to communicate effectively with our customers and supply high-quality motor parts and spares at affordable prices.",
    "As a leader for Korean Auto Parts in {location}, we strive to be an effective company communicating with our customers. We also supply high-quality parts and motor spares at a reasonable price.",
    "We are a leader in Korean Auto Parts and Motor Spares.",
    "As a leader of Korean Auto Parts in {location}, our company is able to communicate with customers effectively while still supplying high-quality spares and auto parts at affordable prices."
]

quality_heading_variations = [
    "Quality Korean Motor Spares {location}",
    "High Quality Korean Motor Spares {location}",
    "Korean quality motor spares {location}",
    "Korean Quality Motor Spares {location}",
    "Korean Motor Spares of High Quality {location}"
]

quality_intro_variations = [
    "Korean motor spares and auto parts are well-known for their quality, which is why many people buy them.",
    "Korean auto spares and parts are known for their high quality. This is why so many people purchase them.",
    "Korean parts and spares are well-known for being high quality.",
    "Korean car spares and auto parts have a reputation for quality. Many people buy them.",
    "Korean motor parts and spares are known for their quality."
]

price_variations = [
    "In addition, they are often less expensive than other auto parts, making them a good choice for those on a budget.",
    "They are also often cheaper than other parts of an auto, which makes them a great choice for budget-minded people.",
    "These parts are usually less expensive than most other auto parts, making them an affordable option for those with tight budgets.",
    "Additionally, they are typically less expensive than other auto components, making them a good option for people on a tight budget.",
    "They also tend to be less expensive than some other parts, making them a good alternative for budget-conscious people."
]

availability_variations = [
    "Finally, Korean motor spares are easy to find in {location} and can be shipped directly to your door, making them a convenient option for many people.",
    "Korean motor spares can be found in {location} and shipped right to your home, making them an easy option for many.",
    "Korean motor spares are very easy to find and can be shipped to your doorstep, making them a great option for many.",
    "Korean motor parts are also easy to find in {location}; they can be shipped directly right to your door, making it a convenient choice for many.",
    "Korean motor spares, which are easily found in {location}, can be shipped directly to your house, making them a practical choice for many."
]

affordability_intro_variations = [
    "Korean auto parts are very affordable.",
    "Korean parts are extremely affordable.",
    "Korean auto parts can be very cheap.",
    "Korean auto parts are quite affordable.",
    "Korean auto parts tend to be quite inexpensive."
]

affordability_options_variations = [
    "In addition, they offer a wide variety of options to choose from.",
    "They also offer many options.",
    "You also have many options.",
    "There are many options available.",
    "Additionally, there are many options."
]

affordability_value_variations = [
    "You can make your car look new without spending much money.",
    "It's possible to make your car look brand new without spending a lot of money.",
    "You don't have to spend a lot of money to make your car new.",
    "You don't need to spend much money to make your car look great.",
    "You don't have spend a lot to make your car more beautiful."
]

new_spares_heading_variations = [
    "New motor spares",
    "New motor spares",
    "Motor spares",
    "Spare parts for new motors",
    "New motor spares"
]

quality_products_heading_variations = [
    "Quality products for competitive prices",
    "High quality products at competitive prices",
    "High-quality products at affordable prices",
    "High quality products at reasonable prices",
    "Competitive prices for quality products"
]

quality_commitment_variations = [
    "We take our motor spares seriously and strive to deliver quality products at a competitive price.",
    "We take motor spares very seriously and aim to provide quality products at an affordable price.",
    "We take motor spares seriously and work hard to offer quality products at competitive prices.",
    "We take motor parts seriously and are committed to delivering quality products at a competitive price.",
    "We take motor spares seriously. We strive to offer high-quality products at a fair price."
]

def get_location_name(filename):
    """Extract location name from filename"""
    name = filename.replace('.html', '').replace('-', ' ')
    return name.title()

def process_location_file(filepath, location_name):
    """Read location file and add Services section before footer"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Check if Services section already exists
        if '<!-- Services Section -->' in content:
            print(f"Services section already exists in {location_name}, skipping...")
            return False
        
        # Find the footer
        footer_start = content.find('    <!-- Footer -->')
        if footer_start == -1:
            print(f"Could not find footer in {location_name}")
            return False
        
        # Select random variations
        intro = random.choice(intro_variations)
        supply = random.choice(supply_variations).format(location=location_name)
        product_line = random.choice(product_line_variations)
        leader = random.choice(leader_variations).format(location=location_name)
        
        quality_heading = random.choice(quality_heading_variations).format(location=location_name)
        quality_intro = random.choice(quality_intro_variations)
        price = random.choice(price_variations)
        availability = random.choice(availability_variations).format(location=location_name)
        
        affordability_intro = random.choice(affordability_intro_variations)
        affordability_options = random.choice(affordability_options_variations)
        affordability_value = random.choice(affordability_value_variations)
        
        new_spares_heading = random.choice(new_spares_heading_variations)
        quality_products_heading = random.choice(quality_products_heading_variations)
        quality_commitment = random.choice(quality_commitment_variations)
        
        # Create the Services section
        services_section = f'''    <!-- Services Section -->
    <section class="py-16 bg-gray-50">
        <div class="container mx-auto px-4">
            <div class="max-w-4xl mx-auto">
                <h2 class="text-3xl font-bold mb-8 text-center">Services</h2>
                
                <div class="space-y-6 text-lg text-gray-700">
                    <p>
                        {intro} {supply} {product_line}
                    </p>
                    
                    <p>
                        {leader}
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
                <h2 class="text-3xl font-bold mb-8 text-center">{quality_heading}</h2>
                
                <div class="space-y-6 text-lg text-gray-700">
                    <p>
                        {quality_intro} {price} {availability}
                    </p>
                    
                    <h3 class="text-2xl font-bold mt-8 mb-4">Affordability</h3>
                    <p>
                        {affordability_intro} {affordability_options} {affordability_value}
                    </p>
                    
                    <h3 class="text-2xl font-bold mt-8 mb-4">{new_spares_heading}</h3>
                    <p>
                        We only deal with new products, imported from South Korea, made for South Korean brands such as Hyundai, KIA, Daewoo, and Ssangyong
                    </p>
                    
                    <h3 class="text-2xl font-bold mt-8 mb-4">{quality_products_heading}</h3>
                    <p>
                        {quality_commitment}
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

'''
        
        # Insert the Services section before the footer
        new_content = content[:footer_start] + services_section + content[footer_start:]
        
        # Write the updated content
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        
        print(f"✓ Updated {location_name}")
        return True
        
    except Exception as e:
        print(f"✗ Error processing {location_name}: {str(e)}")
        return False

# Process all location files
print("Starting to update location pages...\n")
updated_count = 0
for filename in location_files:
    filepath = os.path.join(locations_dir, filename)
    location_name = get_location_name(filename)
    
    if os.path.exists(filepath):
        if process_location_file(filepath, location_name):
            updated_count += 1
    else:
        print(f"✗ File not found: {filename}")

print(f"\n{'='*50}")
print(f"Completed! Updated {updated_count} out of {len(location_files)} location pages.")
print(f"{'='*50}")
