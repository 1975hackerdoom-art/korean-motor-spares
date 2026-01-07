// Mobile Menu Toggle
const mobileMenuBtn = document.getElementById('mobile-menu-btn');
const mobileMenu = document.getElementById('mobile-menu');

mobileMenuBtn.addEventListener('click', () => {
    mobileMenu.classList.toggle('hidden');
});

// Dynamic Year
document.getElementById('year').textContent = new Date().getFullYear();

// WhatsApp Quote Form Logic
const form = document.getElementById('whatsapp-form');

form.addEventListener('submit', (e) => {
    e.preventDefault();

    const name = document.getElementById('name').value;
    const phone = document.getElementById('phone').value;
    const email = document.getElementById('email').value;
    const model = document.getElementById('model').value;
    const parts = document.getElementById('parts').value;
    const vin = document.getElementById('vin').value;

    const message = `*New Quote Request*%0A%0A*Name:* ${name}%0A*Phone:* ${phone}%0A*Email:* ${email}%0A*Car Model:* ${model}%0A*Parts Needed:* ${parts}%0A*VIN:* ${vin}`;

    const whatsappUrl = `https://wa.me/27825059074?text=${message}`;

    window.open(whatsappUrl, '_blank');
});

// Enquire Product Logic
function enquireProduct(productName) {
    const message = `Hi, I am interested in the ${productName}. Please give me a price.`;
    const whatsappUrl = `https://wa.me/27825059074?text=${message}`;
    window.open(whatsappUrl, '_blank');
}

// Link to Quote Form Logic
function linkToQuoteForm(partName) {
    const partsInput = document.getElementById('parts');
    const quoteForm = document.getElementById('quote-form');

    if (partsInput && quoteForm) {
        partsInput.value = partName;
        quoteForm.scrollIntoView({ behavior: 'smooth' });
    }
}
