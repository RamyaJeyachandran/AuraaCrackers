document.addEventListener('DOMContentLoaded', function() {
    gsap.registerPlugin(ScrollTrigger);

    const isMobile = window.innerWidth < 768;

    // Hero Entrance
    gsap.from(".animate-hero", {
        autoAlpha: 0,
        y: 50,
        duration: 1.2,
        ease: "power3.out",
        stagger: 0.2
    });

    // Category Cards Entrance (Disabled temporarily to fix visibility)
    /*
    gsap.from(".category-card", {
        autoAlpha: 0,
        y: 60,
        duration: 1,
        stagger: 0.1,
        ease: "power2.out",
        scrollTrigger: {
            trigger: ".category-grid",
            start: "top bottom-=100",
            toggleActions: "play none none none"
        }
    });
    */

    // 3D Tilt for Support Cards
    if (!isMobile) {
        document.querySelectorAll('.glass-support-card').forEach(card => {
            card.addEventListener('mousemove', (e) => {
                const rect = card.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                const centerX = rect.width / 2;
                const centerY = rect.height / 2;
                const rotateX = (y - centerY) / 15;
                const rotateY = (centerX - x) / 15;

                gsap.to(card, {
                    rotateX: rotateX,
                    rotateY: rotateY,
                    scale: 1.05,
                    duration: 0.5,
                    ease: "power2.out"
                });
            });

            card.addEventListener('mouseleave', () => {
                gsap.to(card, {
                    rotateX: 0,
                    rotateY: 0,
                    scale: 1,
                    duration: 1,
                    ease: "elastic.out(1, 0.3)"
                });
            });
        });
    }

    // Sequential Support Entrances
    gsap.from(".fade-up-support", {
        opacity: 0,
        y: 50,
        stagger: 0.2,
        duration: 1.5,
        ease: "power4.out",
        scrollTrigger: {
            trigger: ".support-float-block",
            start: "top 70%"
        }
    });

    // Parallax Header
    gsap.to(".support-header-3d", {
        y: -50,
        scrollTrigger: {
            trigger: ".support-header-3d",
            scrub: true
        }
    });

    // Testimonial Carousel Logic
    const track = document.getElementById('testimonial-track');
    if (track) {
        const slides = Array.from(track.children);
        const dotsContainer = document.getElementById('carousel-dots');
        let currentIdx = 0;
        let autoScrollInterval;

        function getSlidesPerView() {
            if (window.innerWidth >= 1024) return 3;
            if (window.innerWidth >= 768) return 2;
            return 1;
        }

        function setupDots() {
            if (!dotsContainer) return;
            dotsContainer.innerHTML = '';
            const count = slides.length - (getSlidesPerView() - 1);
            for (let i = 0; i < count; i++) {
                const dot = document.createElement('div');
                dot.className = `carousel-dot ${i === 0 ? 'active' : ''}`;
                dot.onclick = () => goToSlide(i);
                dotsContainer.appendChild(dot);
            }
        }

        function updateCarousel() {
            const perView = getSlidesPerView();
            const slideWidth = 100 / perView;
            track.style.transform = `translateX(-${currentIdx * slideWidth}%)`;

            // Update active states
            slides.forEach((slide, i) => {
                slide.classList.remove('active');
                if (i >= currentIdx && i < currentIdx + perView) {
                    slide.classList.add('active');
                }
            });

            // Update dots
            if (dotsContainer) {
                const dots = Array.from(dotsContainer.children);
                dots.forEach((dot, i) => {
                    dot.classList.toggle('active', i === currentIdx);
                });
            }
        }

        window.nextSlide = function() {
            const perView = getSlidesPerView();
            currentIdx = (currentIdx + 1) % (slides.length - (perView - 1));
            updateCarousel();
        }

        window.prevSlide = function() {
            const perView = getSlidesPerView();
            const maxIdx = slides.length - perView;
            currentIdx = (currentIdx - 1 + (maxIdx + 1)) % (maxIdx + 1);
            updateCarousel();
        }

        function goToSlide(idx) {
            currentIdx = idx;
            updateCarousel();
            resetAutoScroll();
        }

        function startAutoScroll() {
            autoScrollInterval = setInterval(nextSlide, 5000);
        }

        function resetAutoScroll() {
            clearInterval(autoScrollInterval);
            startAutoScroll();
        }

        // Initialize Carousel
        setupDots();
        updateCarousel();
        startAutoScroll();

        // Pause on hover
        track.parentElement.addEventListener('mouseenter', () => clearInterval(autoScrollInterval));
        track.parentElement.addEventListener('mouseleave', startAutoScroll);

        // Handle Resize
        window.addEventListener('resize', () => {
            setupDots();
            updateCarousel();
        });
    }

    // Magnetic Button Logic
    document.querySelectorAll('.magnetic-wrap').forEach(wrap => {
        const btn = wrap.querySelector('.magnetic-btn');
        if (!btn) return;
        const magneticStrength = 22; // Movement range
        const tiltStrength = 10;   // Rotation range

        wrap.addEventListener('mousemove', e => {
            const rect = wrap.getBoundingClientRect();
            const mouseX = e.clientX - rect.left;
            const mouseY = e.clientY - rect.top;
            
            const centerX = rect.width / 2;
            const centerY = rect.height / 2;
            
            const deltaX = (mouseX - centerX) / centerX;
            const deltaY = (mouseY - centerY) / centerY;
            
            // Multi-axis movement and tilt
            const moveX = deltaX * magneticStrength;
            const moveY = deltaY * magneticStrength;
            const rotateX = -deltaY * tiltStrength;
            const rotateY = deltaX * tiltStrength;
            
            btn.style.transform = `translate3d(${moveX}px, ${moveY}px, 0) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
        });

        wrap.addEventListener('mouseleave', () => {
            btn.style.transform = 'translate3d(0, 0, 0) rotateX(0deg) rotateY(0deg)';
        });
    });
});
