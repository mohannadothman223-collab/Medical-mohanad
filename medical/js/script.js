// ===== Smooth Navigation ===== 
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth'
            });
        }
    });
});

// ===== Form Submission ===== 
document.getElementById('appointmentForm')?.addEventListener('submit', function(e) {
    e.preventDefault();
    
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;
    const doctor = document.getElementById('doctor').value;
    const message = document.getElementById('message').value;
    
    if (name && email && phone && doctor && message) {
        alert(`Thank you ${name}! Your appointment request has been received. We will contact you at ${email} to confirm your appointment.`);
        this.reset();
    } else {
        alert('Please fill in all required fields.');
    }
});

document.getElementById('contactForm')?.addEventListener('submit', function(e) {
    e.preventDefault();
    
    const name = document.getElementById('contact-name')?.value;
    const email = document.getElementById('contact-email')?.value;
    const subject = document.getElementById('subject')?.value;
    const message = document.getElementById('contact-message')?.value;
    
    if (name && email && subject && message) {
        alert(`Thank you ${name} for contacting Mohannad Medical Clinic! We will get back to you as soon as possible.`);
        this.reset();
    } else {
        alert('Please fill in all required fields.');
    }
});

// ===== Image/Video Lazy Loading ===== 
document.addEventListener('DOMContentLoaded', function() {
    const lazyElements = document.querySelectorAll('img[loading="lazy"], video[loading="lazy"]');
    
    if ('IntersectionObserver' in window) {
        const imageObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const element = entry.target;
                    if (element.tagName === 'IMG') {
                        element.src = element.dataset.src || element.src;
                    } else if (element.tagName === 'VIDEO') {
                        element.src = element.dataset.src || element.src;
                    }
                    observer.unobserve(element);
                }
            });
        });
        
        lazyElements.forEach(img => imageObserver.observe(img));
    }
});

// ===== Scroll Animation ===== 
window.addEventListener('scroll', function() {
    const cards = document.querySelectorAll('.card, .doctor-card, .testimonial');
    
    cards.forEach(card => {
        const rect = card.getBoundingClientRect();
        if (rect.top < window.innerHeight) {
            card.style.animation = 'fadeIn 0.6s ease forwards';
        }
    });
});

// ===== Dark Mode Toggle (Optional) ===== 
function toggleDarkMode() {
    document.body.classList.toggle('dark-mode');
    localStorage.setItem('darkMode', document.body.classList.contains('dark-mode'));
}

// Check saved preference
if (localStorage.getItem('darkMode') === 'true') {
    document.body.classList.add('dark-mode');
}

// ===== Active Navigation Link ===== 
window.addEventListener('scroll', function() {
    let current = '';
    const sections = document.querySelectorAll('section');
    
    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        if (pageYOffset >= sectionTop - 60) {
            current = section.getAttribute('id');
        }
    });
    
    document.querySelectorAll('.nav-links a').forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href').slice(1) === current) {
            link.classList.add('active');
        }
    });
});
