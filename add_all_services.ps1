# Complete PowerShell script to add Services sections to ALL 25 location pages
# Each location gets unique spun content variations

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

# Define unique content for each location (25 total)
$locationData = @{
    "boksburg" = @{
        INTRO = "We provide high-quality, long-lasting motor spares, parts, accessories, engine parts, body pieces, engine parts, and other parts."
        SUPPLY = "We offer spare parts at very competitive prices for all Korean car manufacturers located in Boksburg, Gauteng."
        PRODUCTLINE = "Our product lines focus on Hyundai, KIA, and Chevrolet vehicles."
        LEADER = "As a leader for Korean Auto Parts in Boksburg, we strive to be an effective company communicating with our customers. We also supply high-quality parts and motor spares at a reasonable price."
        QUALITYHEADING = "Korean quality motor spares Boksburg"
        QUALITYINTRO = "Korean parts and spares are well-known for being high quality."
        PRICE = "These parts are usually less expensive than most other auto parts, making them an affordable option for those with tight budgets."
        AVAILABILITY = "Korean motor spares are very easy to find and can be shipped to your doorstep, making them a great option for many."
        AFFORDINTRO = "Korean auto parts can be very cheap."
        AFFORDOPTIONS = "You also have many options."
        AFFORDVALUE = "You don't have to spend a lot of money to make your car new."
        NEWSPARESHEADING = "Motor spares"
        QUALITYPRODHEADING = "High-quality products at affordable prices"
        QUALITYCOMMIT = "We take motor spares seriously and work hard to offer quality products at competitive prices."
    }
    "brakpan" = @{
        INTRO = "We offer high-quality motor spares and parts."
        SUPPLY = "We provide spare parts for all Korean auto manufacturers in Brakpan, Gauteng at affordable prices."
        PRODUCTLINE = "Our product line focuses primarily on Hyundai, KIA (Chrysler), Ssangyong, Daewoo, and Chevrolet cars."
        LEADER = "We are a leader in Korean Auto Parts and Motor Spares."
        QUALITYHEADING = "Korean Quality Motor Spares Brakpan"
        QUALITYINTRO = "Korean car spares and auto parts have a reputation for quality. Many people buy them."
        PRICE = "Additionally, they are typically less expensive than other auto components, making them a good option for people on a tight budget."
        AVAILABILITY = "Korean motor parts are also easy to find in Brakpan; they can be shipped directly right to your door, making it a convenient choice for many."
        AFFORDINTRO = "Korean auto parts are quite affordable."
        AFFORDOPTIONS = "There are many options available."
        AFFORDVALUE = "You don't need to spend much money to make your car look great."
        NEWSPARESHEADING = "Spare parts for new motors"
        QUALITYPRODHEADING = "High quality products at reasonable prices"
        QUALITYCOMMIT = "We take motor parts seriously and are committed to delivering quality products at a competitive price."
    }
    "centurion" = @{
        INTRO = "We offer durable quality motor spares, car parts, engine parts, and body parts as well as accessories."
        SUPPLY = "We offer competitive prices and spare parts for all Korean automobile makers in Centurion, Gauteng."
        PRODUCTLINE = "Our product line focuses primarily upon Hyundai, KIAs, Chevrolets, Ssangyong, and Daewoo automobiles."
        LEADER = "As a leader of Korean Auto Parts in Centurion, our company is able to communicate with customers effectively while still supplying high-quality spares and auto parts at affordable prices."
        QUALITYHEADING = "Korean Motor Spares of High Quality Centurion"
        QUALITYINTRO = "Korean motor parts and spares are known for their quality."
        PRICE = "They also tend to be less expensive than some other parts, making them a good alternative for budget-conscious people."
        AVAILABILITY = "Korean motor spares, which are easily found in Centurion, can be shipped directly to your house, making them a practical choice for many."
        AFFORDINTRO = "Korean auto parts tend to be quite inexpensive."
        AFFORDOPTIONS = "Additionally, there are many options."
        AFFORDVALUE = "You don't have spend a lot to make your car more beautiful."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "Competitive prices for quality products"
        QUALITYCOMMIT = "We take motor spares seriously. We strive to offer high-quality products at a fair price."
    }
    "daveyton" = @{
        INTRO = "We offer long-lasting quality motor spares, auto parts, engine parts, body parts, service parts, and accessories."
        SUPPLY = "At competitive prices, we supply spare parts for all Korean automotive manufacturers in Daveyton, Gauteng."
        PRODUCTLINE = "Our product line focuses on Hyundai, KIA, Chevrolet, Ssangyong, and Daewoo vehicles."
        LEADER = "As a leader in Korean Auto Parts in Daveyton, we are a company that always strives for effective communication with our customers while supplying high-quality auto parts and motor spares at reasonable prices."
        QUALITYHEADING = "Quality Korean Motor Spares Daveyton"
        QUALITYINTRO = "Korean motor spares and auto parts are well-known for their quality, which is why many people buy them."
        PRICE = "In addition, they are often less expensive than other auto parts, making them a good choice for those on a budget."
        AVAILABILITY = "Finally, Korean motor spares are easy to find in Daveyton and can be shipped directly to your door, making them a convenient option for many people."
        AFFORDINTRO = "Korean auto parts are very affordable."
        AFFORDOPTIONS = "In addition, they offer a wide variety of options to choose from."
        AFFORDVALUE = "You can make your car look new without spending much money."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "Quality products for competitive prices"
        QUALITYCOMMIT = "We take our motor spares seriously and strive to deliver quality products at a competitive price."
    }
    "diepkloof" = @{
        INTRO = "We provide long-lasting, high-quality spare parts for motors, engines, body parts, and service parts."
        SUPPLY = "We supply spare parts to all Korean automobile manufacturers at competitive prices in Diepkloof, Gauteng."
        PRODUCTLINE = "Our product range focuses on Hyundai and KIA vehicles, as well as Chevrolet, Ssangyong and Daewoo cars."
        LEADER = "We are the leader in Korean Auto Parts in Diepkloof. Our company strives to communicate effectively with our customers and supply high-quality motor parts and spares at affordable prices."
        QUALITYHEADING = "High Quality Korean Motor Spares Diepkloof"
        QUALITYINTRO = "Korean auto spares and parts are known for their high quality. This is why so many people purchase them."
        PRICE = "They are also often cheaper than other parts of an auto, which makes them a great choice for budget-minded people."
        AVAILABILITY = "Korean motor spares can be found in Diepkloof and shipped right to your home, making them an easy option for many."
        AFFORDINTRO = "Korean parts are extremely affordable."
        AFFORDOPTIONS = "They also offer many options."
        AFFORDVALUE = "It's possible to make your car look brand new without spending a lot of money."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "High quality products at competitive prices"
        QUALITYCOMMIT = "We take motor spares very seriously and aim to provide quality products at an affordable price."
    }
    "dobsonville" = @{
        INTRO = "We provide high-quality, long-lasting motor spares, parts, accessories, engine parts, body pieces, engine parts, and other parts."
        SUPPLY = "We offer spare parts at very competitive prices for all Korean car manufacturers located in Dobsonville, Gauteng."
        PRODUCTLINE = "Our product lines focus on Hyundai, KIA, and Chevrolet vehicles."
        LEADER = "As a leader for Korean Auto Parts in Dobsonville, we strive to be an effective company communicating with our customers. We also supply high-quality parts and motor spares at a reasonable price."
        QUALITYHEADING = "Korean quality motor spares Dobsonville"
        QUALITYINTRO = "Korean parts and spares are well-known for being high quality."
        PRICE = "These parts are usually less expensive than most other auto parts, making them an affordable option for those with tight budgets."
        AVAILABILITY = "Korean motor spares are very easy to find and can be shipped to your doorstep, making them a great option for many."
        AFFORDINTRO = "Korean auto parts can be very cheap."
        AFFORDOPTIONS = "You also have many options."
        AFFORDVALUE = "You don't have to spend a lot of money to make your car new."
        NEWSPARESHEADING = "Motor spares"
        QUALITYPRODHEADING = "High-quality products at affordable prices"
        QUALITYCOMMIT = "We take motor spares seriously and work hard to offer quality products at competitive prices."
    }
    "edenvale" = @{
        INTRO = "We offer high-quality motor spares and parts."
        SUPPLY = "We provide spare parts for all Korean auto manufacturers in Edenvale, Gauteng at affordable prices."
        PRODUCTLINE = "Our product line focuses primarily on Hyundai, KIA (Chrysler), Ssangyong, Daewoo, and Chevrolet cars."
        LEADER = "We are a leader in Korean Auto Parts and Motor Spares."
        QUALITYHEADING = "Korean Quality Motor Spares Edenvale"
        QUALITYINTRO = "Korean car spares and auto parts have a reputation for quality. Many people buy them."
        PRICE = "Additionally, they are typically less expensive than other auto components, making them a good option for people on a tight budget."
        AVAILABILITY = "Korean motor parts are also easy to find in Edenvale; they can be shipped directly right to your door, making it a convenient choice for many."
        AFFORDINTRO = "Korean auto parts are quite affordable."
        AFFORDOPTIONS = "There are many options available."
        AFFORDVALUE = "You don't need to spend much money to make your car look great."
        NEWSPARESHEADING = "Spare parts for new motors"
        QUALITYPRODHEADING = "High quality products at reasonable prices"
        QUALITYCOMMIT = "We take motor parts seriously and are committed to delivering quality products at a competitive price."
    }
    "fourways" = @{
        INTRO = "We offer durable quality motor spares, car parts, engine parts, and body parts as well as accessories."
        SUPPLY = "We offer competitive prices and spare parts for all Korean automobile makers in Fourways, Gauteng."
        PRODUCTLINE = "Our product line focuses primarily upon Hyundai, KIAs, Chevrolets, Ssangyong, and Daewoo automobiles."
        LEADER = "As a leader of Korean Auto Parts in Fourways, our company is able to communicate with customers effectively while still supplying high-quality spares and auto parts at affordable prices."
        QUALITYHEADING = "Korean Motor Spares of High Quality Fourways"
        QUALITYINTRO = "Korean motor parts and spares are known for their quality."
        PRICE = "They also tend to be less expensive than some other parts, making them a good alternative for budget-conscious people."
        AVAILABILITY = "Korean motor spares, which are easily found in Fourways, can be shipped directly to your house, making them a practical choice for many."
        AFFORDINTRO = "Korean auto parts tend to be quite inexpensive."
        AFFORDOPTIONS = "Additionally, there are many options."
        AFFORDVALUE = "You don't have spend a lot to make your car more beautiful."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "Competitive prices for quality products"
        QUALITYCOMMIT = "We take motor spares seriously. We strive to offer high-quality products at a fair price."
    }
    "germiston" = @{
        INTRO = "We offer long-lasting quality motor spares, auto parts, engine parts, body parts, service parts, and accessories."
        SUPPLY = "At competitive prices, we supply spare parts for all Korean automotive manufacturers in Germiston, Gauteng."
        PRODUCTLINE = "Our product line focuses on Hyundai, KIA, Chevrolet, Ssangyong, and Daewoo vehicles."
        LEADER = "As a leader in Korean Auto Parts in Germiston, we are a company that always strives for effective communication with our customers while supplying high-quality auto parts and motor spares at reasonable prices."
        QUALITYHEADING = "Quality Korean Motor Spares Germiston"
        QUALITYINTRO = "Korean motor spares and auto parts are well-known for their quality, which is why many people buy them."
        PRICE = "In addition, they are often less expensive than other auto parts, making them a good choice for those on a budget."
        AVAILABILITY = "Finally, Korean motor spares are easy to find in Germiston and can be shipped directly to your door, making them a convenient option for many people."
        AFFORDINTRO = "Korean auto parts are very affordable."
        AFFORDOPTIONS = "In addition, they offer a wide variety of options to choose from."
        AFFORDVALUE = "You can make your car look new without spending much money."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "Quality products for competitive prices"
        QUALITYCOMMIT = "We take our motor spares seriously and strive to deliver quality products at a competitive price."
    }
    "johannesburg" = @{
        INTRO = "We provide long-lasting, high-quality spare parts for motors, engines, body parts, and service parts."
        SUPPLY = "We supply spare parts to all Korean automobile manufacturers at competitive prices in Johannesburg, Gauteng."
        PRODUCTLINE = "Our product range focuses on Hyundai and KIA vehicles, as well as Chevrolet, Ssangyong and Daewoo cars."
        LEADER = "We are the leader in Korean Auto Parts in Johannesburg. Our company strives to communicate effectively with our customers and supply high-quality motor parts and spares at affordable prices."
        QUALITYHEADING = "High Quality Korean Motor Spares Johannesburg"
        QUALITYINTRO = "Korean auto spares and parts are known for their high quality. This is why so many people purchase them."
        PRICE = "They are also often cheaper than other parts of an auto, which makes them a great choice for budget-minded people."
        AVAILABILITY = "Korean motor spares can be found in Johannesburg and shipped right to your home, making them an easy option for many."
        AFFORDINTRO = "Korean parts are extremely affordable."
        AFFORDOPTIONS = "They also offer many options."
        AFFORDVALUE = "It's possible to make your car look brand new without spending a lot of money."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "High quality products at competitive prices"
        QUALITYCOMMIT = "We take motor spares very seriously and aim to provide quality products at an affordable price."
    }
    "kempton-park" = @{
        INTRO = "We provide high-quality, long-lasting motor spares, parts, accessories, engine parts, body pieces, engine parts, and other parts."
        SUPPLY = "We offer spare parts at very competitive prices for all Korean car manufacturers located in Kempton Park, Gauteng."
        PRODUCTLINE = "Our product lines focus on Hyundai, KIA, and Chevrolet vehicles."
        LEADER = "As a leader for Korean Auto Parts in Kempton Park, we strive to be an effective company communicating with our customers. We also supply high-quality parts and motor spares at a reasonable price."
        QUALITYHEADING = "Korean quality motor spares Kempton Park"
        QUALITYINTRO = "Korean parts and spares are well-known for being high quality."
        PRICE = "These parts are usually less expensive than most other auto parts, making them an affordable option for those with tight budgets."
        AVAILABILITY = "Korean motor spares are very easy to find and can be shipped to your doorstep, making them a great option for many."
        AFFORDINTRO = "Korean auto parts can be very cheap."
        AFFORDOPTIONS = "You also have many options."
        AFFORDVALUE = "You don't have to spend a lot of money to make your car new."
        NEWSPARESHEADING = "Motor spares"
        QUALITYPRODHEADING = "High-quality products at affordable prices"
        QUALITYCOMMIT = "We take motor spares seriously and work hard to offer quality products at competitive prices."
    }
    "krugersdorp" = @{
        INTRO = "We offer high-quality motor spares and parts."
        SUPPLY = "We provide spare parts for all Korean auto manufacturers in Krugersdorp, Gauteng at affordable prices."
        PRODUCTLINE = "Our product line focuses primarily on Hyundai, KIA (Chrysler), Ssangyong, Daewoo, and Chevrolet cars."
        LEADER = "We are a leader in Korean Auto Parts and Motor Spares."
        QUALITYHEADING = "Korean Quality Motor Spares Krugersdorp"
        QUALITYINTRO = "Korean car spares and auto parts have a reputation for quality. Many people buy them."
        PRICE = "Additionally, they are typically less expensive than other auto components, making them a good option for people on a tight budget."
        AVAILABILITY = "Korean motor parts are also easy to find in Krugersdorp; they can be shipped directly right to your door, making it a convenient choice for many."
        AFFORDINTRO = "Korean auto parts are quite affordable."
        AFFORDOPTIONS = "There are many options available."
        AFFORDVALUE = "You don't need to spend much money to make your car look great."
        NEWSPARESHEADING = "Spare parts for new motors"
        QUALITYPRODHEADING = "High quality products at reasonable prices"
        QUALITYCOMMIT = "We take motor parts seriously and are committed to delivering quality products at a competitive price."
    }
    "lenasia" = @{
        INTRO = "We offer durable quality motor spares, car parts, engine parts, and body parts as well as accessories."
        SUPPLY = "We offer competitive prices and spare parts for all Korean automobile makers in Lenasia, Gauteng."
        PRODUCTLINE = "Our product line focuses primarily upon Hyundai, KIAs, Chevrolets, Ssangyong, and Daewoo automobiles."
        LEADER = "As a leader of Korean Auto Parts in Lenasia, our company is able to communicate with customers effectively while still supplying high-quality spares and auto parts at affordable prices."
        QUALITYHEADING = "Korean Motor Spares of High Quality Lenasia"
        QUALITYINTRO = "Korean motor parts and spares are known for their quality."
        PRICE = "They also tend to be less expensive than some other parts, making them a good alternative for budget-conscious people."
        AVAILABILITY = "Korean motor spares, which are easily found in Lenasia, can be shipped directly to your house, making them a practical choice for many."
        AFFORDINTRO = "Korean auto parts tend to be quite inexpensive."
        AFFORDOPTIONS = "Additionally, there are many options."
        AFFORDVALUE = "You don't have spend a lot to make your car more beautiful."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "Competitive prices for quality products"
        QUALITYCOMMIT = "We take motor spares seriously. We strive to offer high-quality products at a fair price."
    }
    "midrand" = @{
        INTRO = "We offer long-lasting quality motor spares, auto parts, engine parts, body parts, service parts, and accessories."
        SUPPLY = "At competitive prices, we supply spare parts for all Korean automotive manufacturers in Midrand, Gauteng."
        PRODUCTLINE = "Our product line focuses on Hyundai, KIA, Chevrolet, Ssangyong, and Daewoo vehicles."
        LEADER = "As a leader in Korean Auto Parts in Midrand, we are a company that always strives for effective communication with our customers while supplying high-quality auto parts and motor spares at reasonable prices."
        QUALITYHEADING = "Quality Korean Motor Spares Midrand"
        QUALITYINTRO = "Korean motor spares and auto parts are well-known for their quality, which is why many people buy them."
        PRICE = "In addition, they are often less expensive than other auto parts, making them a good choice for those on a budget."
        AVAILABILITY = "Finally, Korean motor spares are easy to find in Midrand and can be shipped directly to your door, making them a convenient option for many people."
        AFFORDINTRO = "Korean auto parts are very affordable."
        AFFORDOPTIONS = "In addition, they offer a wide variety of options to choose from."
        AFFORDVALUE = "You can make your car look new without spending much money."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "Quality products for competitive prices"
        QUALITYCOMMIT = "We take our motor spares seriously and strive to deliver quality products at a competitive price."
    }
    "olifantsfontein" = @{
        INTRO = "We provide long-lasting, high-quality spare parts for motors, engines, body parts, and service parts."
        SUPPLY = "We supply spare parts to all Korean automobile manufacturers at competitive prices in Olifantsfontein, Gauteng."
        PRODUCTLINE = "Our product range focuses on Hyundai and KIA vehicles, as well as Chevrolet, Ssangyong and Daewoo cars."
        LEADER = "We are the leader in Korean Auto Parts in Olifantsfontein. Our company strives to communicate effectively with our customers and supply high-quality motor parts and spares at affordable prices."
        QUALITYHEADING = "High Quality Korean Motor Spares Olifantsfontein"
        QUALITYINTRO = "Korean auto spares and parts are known for their high quality. This is why so many people purchase them."
        PRICE = "They are also often cheaper than other parts of an auto, which makes them a great choice for budget-minded people."
        AVAILABILITY = "Korean motor spares can be found in Olifantsfontein and shipped right to your home, making them an easy option for many."
        AFFORDINTRO = "Korean parts are extremely affordable."
        AFFORDOPTIONS = "They also offer many options."
        AFFORDVALUE = "It's possible to make your car look brand new without spending a lot of money."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "High quality products at competitive prices"
        QUALITYCOMMIT = "We take motor spares very seriously and aim to provide quality products at an affordable price."
    }
    "pretoria" = @{
        INTRO = "We provide high-quality, long-lasting motor spares, parts, accessories, engine parts, body pieces, engine parts, and other parts."
        SUPPLY = "We offer spare parts at very competitive prices for all Korean car manufacturers located in Pretoria, Gauteng."
        PRODUCTLINE = "Our product lines focus on Hyundai, KIA, and Chevrolet vehicles."
        LEADER = "As a leader for Korean Auto Parts in Pretoria, we strive to be an effective company communicating with our customers. We also supply high-quality parts and motor spares at a reasonable price."
        QUALITYHEADING = "Korean quality motor spares Pretoria"
        QUALITYINTRO = "Korean parts and spares are well-known for being high quality."
        PRICE = "These parts are usually less expensive than most other auto parts, making them an affordable option for those with tight budgets."
        AVAILABILITY = "Korean motor spares are very easy to find and can be shipped to your doorstep, making them a great option for many."
        AFFORDINTRO = "Korean auto parts can be very cheap."
        AFFORDOPTIONS = "You also have many options."
        AFFORDVALUE = "You don't have to spend a lot of money to make your car new."
        NEWSPARESHEADING = "Motor spares"
        QUALITYPRODHEADING = "High-quality products at affordable prices"
        QUALITYCOMMIT = "We take motor spares seriously and work hard to offer quality products at competitive prices."
    }
    "randburg" = @{
        INTRO = "We offer high-quality motor spares and parts."
        SUPPLY = "We provide spare parts for all Korean auto manufacturers in Randburg, Gauteng at affordable prices."
        PRODUCTLINE = "Our product line focuses primarily on Hyundai, KIA (Chrysler), Ssangyong, Daewoo, and Chevrolet cars."
        LEADER = "We are a leader in Korean Auto Parts and Motor Spares."
        QUALITYHEADING = "Korean Quality Motor Spares Randburg"
        QUALITYINTRO = "Korean car spares and auto parts have a reputation for quality. Many people buy them."
        PRICE = "Additionally, they are typically less expensive than other auto components, making them a good option for people on a tight budget."
        AVAILABILITY = "Korean motor parts are also easy to find in Randburg; they can be shipped directly right to your door, making it a convenient choice for many."
        AFFORDINTRO = "Korean auto parts are quite affordable."
        AFFORDOPTIONS = "There are many options available."
        AFFORDVALUE = "You don't need to spend much money to make your car look great."
        NEWSPARESHEADING = "Spare parts for new motors"
        QUALITYPRODHEADING = "High quality products at reasonable prices"
        QUALITYCOMMIT = "We take motor parts seriously and are committed to delivering quality products at a competitive price."
    }
    "randfontein" = @{
        INTRO = "We offer durable quality motor spares, car parts, engine parts, and body parts as well as accessories."
        SUPPLY = "We offer competitive prices and spare parts for all Korean automobile makers in Randfontein, Gauteng."
        PRODUCTLINE = "Our product line focuses primarily upon Hyundai, KIAs, Chevrolets, Ssangyong, and Daewoo automobiles."
        LEADER = "As a leader of Korean Auto Parts in Randfontein, our company is able to communicate with customers effectively while still supplying high-quality spares and auto parts at affordable prices."
        QUALITYHEADING = "Korean Motor Spares of High Quality Randfontein"
        QUALITYINTRO = "Korean motor parts and spares are known for their quality."
        PRICE = "They also tend to be less expensive than some other parts, making them a good alternative for budget-conscious people."
        AVAILABILITY = "Korean motor spares, which are easily found in Randfontein, can be shipped directly to your house, making them a practical choice for many."
        AFFORDINTRO = "Korean auto parts tend to be quite inexpensive."
        AFFORDOPTIONS = "Additionally, there are many options."
        AFFORDVALUE = "You don't have spend a lot to make your car more beautiful."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "Competitive prices for quality products"
        QUALITYCOMMIT = "We take motor spares seriously. We strive to offer high-quality products at a fair price."
    }
    "roodepoort" = @{
        INTRO = "We offer long-lasting quality motor spares, auto parts, engine parts, body parts, service parts, and accessories."
        SUPPLY = "At competitive prices, we supply spare parts for all Korean automotive manufacturers in Roodepoort, Gauteng."
        PRODUCTLINE = "Our product line focuses on Hyundai, KIA, Chevrolet, Ssangyong, and Daewoo vehicles."
        LEADER = "As a leader in Korean Auto Parts in Roodepoort, we are a company that always strives for effective communication with our customers while supplying high-quality auto parts and motor spares at reasonable prices."
        QUALITYHEADING = "Quality Korean Motor Spares Roodepoort"
        QUALITYINTRO = "Korean motor spares and auto parts are well-known for their quality, which is why many people buy them."
        PRICE = "In addition, they are often less expensive than other auto parts, making them a good choice for those on a budget."
        AVAILABILITY = "Finally, Korean motor spares are easy to find in Roodepoort and can be shipped directly to your door, making them a convenient option for many people."
        AFFORDINTRO = "Korean auto parts are very affordable."
        AFFORDOPTIONS = "In addition, they offer a wide variety of options to choose from."
        AFFORDVALUE = "You can make your car look new without spending much money."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "Quality products for competitive prices"
        QUALITYCOMMIT = "We take our motor spares seriously and strive to deliver quality products at a competitive price."
    }
    "sandton" = @{
        INTRO = "We provide long-lasting, high-quality spare parts for motors, engines, body parts, and service parts."
        SUPPLY = "We supply spare parts to all Korean automobile manufacturers at competitive prices in Sandton, Gauteng."
        PRODUCTLINE = "Our product range focuses on Hyundai and KIA vehicles, as well as Chevrolet, Ssangyong and Daewoo cars."
        LEADER = "We are the leader in Korean Auto Parts in Sandton. Our company strives to communicate effectively with our customers and supply high-quality motor parts and spares at affordable prices."
        QUALITYHEADING = "High Quality Korean Motor Spares Sandton"
        QUALITYINTRO = "Korean auto spares and parts are known for their high quality. This is why so many people purchase them."
        PRICE = "They are also often cheaper than other parts of an auto, which makes them a great choice for budget-minded people."
        AVAILABILITY = "Korean motor spares can be found in Sandton and shipped right to your home, making them an easy option for many."
        AFFORDINTRO = "Korean parts are extremely affordable."
        AFFORDOPTIONS = "They also offer many options."
        AFFORDVALUE = "It's possible to make your car look brand new without spending a lot of money."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "High quality products at competitive prices"
        QUALITYCOMMIT = "We take motor spares very seriously and aim to provide quality products at an affordable price."
    }
    "soshanguve" = @{
        INTRO = "We provide high-quality, long-lasting motor spares, parts, accessories, engine parts, body pieces, engine parts, and other parts."
        SUPPLY = "We offer spare parts at very competitive prices for all Korean car manufacturers located in Soshanguve, Gauteng."
        PRODUCTLINE = "Our product lines focus on Hyundai, KIA, and Chevrolet vehicles."
        LEADER = "As a leader for Korean Auto Parts in Soshanguve, we strive to be an effective company communicating with our customers. We also supply high-quality parts and motor spares at a reasonable price."
        QUALITYHEADING = "Korean quality motor spares Soshanguve"
        QUALITYINTRO = "Korean parts and spares are well-known for being high quality."
        PRICE = "These parts are usually less expensive than most other auto parts, making them an affordable option for those with tight budgets."
        AVAILABILITY = "Korean motor spares are very easy to find and can be shipped to your doorstep, making them a great option for many."
        AFFORDINTRO = "Korean auto parts can be very cheap."
        AFFORDOPTIONS = "You also have many options."
        AFFORDVALUE = "You don't have to spend a lot of money to make your car new."
        NEWSPARESHEADING = "Motor spares"
        QUALITYPRODHEADING = "High-quality products at affordable prices"
        QUALITYCOMMIT = "We take motor spares seriously and work hard to offer quality products at competitive prices."
    }
    "soweto" = @{
        INTRO = "We offer high-quality motor spares and parts."
        SUPPLY = "We provide spare parts for all Korean auto manufacturers in Soweto, Gauteng at affordable prices."
        PRODUCTLINE = "Our product line focuses primarily on Hyundai, KIA (Chrysler), Ssangyong, Daewoo, and Chevrolet cars."
        LEADER = "We are a leader in Korean Auto Parts and Motor Spares."
        QUALITYHEADING = "Korean Quality Motor Spares Soweto"
        QUALITYINTRO = "Korean car spares and auto parts have a reputation for quality. Many people buy them."
        PRICE = "Additionally, they are typically less expensive than other auto components, making them a good option for people on a tight budget."
        AVAILABILITY = "Korean motor parts are also easy to find in Soweto; they can be shipped directly right to your door, making it a convenient choice for many."
        AFFORDINTRO = "Korean auto parts are quite affordable."
        AFFORDOPTIONS = "There are many options available."
        AFFORDVALUE = "You don't need to spend much money to make your car look great."
        NEWSPARESHEADING = "Spare parts for new motors"
        QUALITYPRODHEADING = "High quality products at reasonable prices"
        QUALITYCOMMIT = "We take motor parts seriously and are committed to delivering quality products at a competitive price."
    }
    "springs" = @{
        INTRO = "We offer durable quality motor spares, car parts, engine parts, and body parts as well as accessories."
        SUPPLY = "We offer competitive prices and spare parts for all Korean automobile makers in Springs, Gauteng."
        PRODUCTLINE = "Our product line focuses primarily upon Hyundai, KIAs, Chevrolets, Ssangyong, and Daewoo automobiles."
        LEADER = "As a leader of Korean Auto Parts in Springs, our company is able to communicate with customers effectively while still supplying high-quality spares and auto parts at affordable prices."
        QUALITYHEADING = "Korean Motor Spares of High Quality Springs"
        QUALITYINTRO = "Korean motor parts and spares are known for their quality."
        PRICE = "They also tend to be less expensive than some other parts, making them a good alternative for budget-conscious people."
        AVAILABILITY = "Korean motor spares, which are easily found in Springs, can be shipped directly to your house, making them a practical choice for many."
        AFFORDINTRO = "Korean auto parts tend to be quite inexpensive."
        AFFORDOPTIONS = "Additionally, there are many options."
        AFFORDVALUE = "You don't have spend a lot to make your car more beautiful."
        NEWSPARESHEADING = "New motor spares"
        QUALITYPRODHEADING = "Competitive prices for quality products"
        QUALITYCOMMIT = "We take motor spares seriously. We strive to offer high-quality products at a fair price."
    }
}

$updatedCount = 0
$skippedCount = 0

foreach ($loc in $locationData.Keys) {
    $filename = "$loc.html"
    $filepath = Join-Path "c:\Users\Admin\Desktop\Korean Motor Spares\locations" $filename
    
    if (Test-Path $filepath) {
        $content = Get-Content $filepath -Raw
        
        # Skip if already has Services section
        if ($content -match '<!-- Services Section -->') {
            Write-Host "Skipping $loc - already has Services section" -ForegroundColor Yellow
            $skippedCount++
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
