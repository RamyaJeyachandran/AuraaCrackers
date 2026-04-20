/*
 * File: phone-handler.js
 * Purpose: Intercept phone clicks and show Auraa Branded Popup
 * Placement: /static/js/phone-handler.js
 * Dependencies: None (Vanilla JS)
 *
 * Testing Checklist:
 * 1. [ ] Popup appears on clicking navbar/home/footer numbers
 * 2. [ ] WhatsApp button opens mobile app (api.whatsapp.com)
 * 3. [ ] WhatsApp button opens web version on desktop (web.whatsapp.com)
 * 4. [ ] Call button triggers native dialer (tel:)
 * 5. [ ] Close (X) button works
 * 6. [ ] Clicking outside the card closes the popup
 * 7. [ ] Pressing 'Escape' key closes the popup
 * 8. [ ] Translator does not break phone digits (notranslate class)
 */

(function() {
    'use strict';

    const POPUP_HTML = `
        <div id="auraa-phone-popup" class="auraa-popup-overlay" aria-modal="true" role="dialog">
            <div class="auraa-popup-card">
                <button class="auraa-popup-close" aria-label="Close">&times;</button>
                <p class="auraa-popup-label"></p>
                <p class="auraa-popup-number"></p>
                <div class="auraa-popup-buttons">
                    <a href="#" class="auraa-btn-whatsapp" target="_blank" rel="noopener noreferrer">
                        <svg class="auraa-btn-icon" viewBox="0 0 24 24"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z"/></svg>
                        Chat on WhatsApp
                    </a>
                    <a href="#" class="auraa-btn-call">
                        <svg class="auraa-btn-icon" viewBox="0 0 24 24"><path d="M6.62 10.79a15.15 15.15 0 006.59 6.59l2.2-2.2a1 1 0 011.11-.27 11.72 11.72 0 003.69.59 1 1 0 011 1V20a1 1 0 01-1 1A19 19 0 013 4a1 1 0 011-1h3.21a1 1 0 011 1 11.72 11.72 0 00.59 3.69 1 1 0 01-.27 1.11l-2.2 2.2z"/></svg>
                        Call Now
                    </a>
                </div>
            </div>
        </div>
    `;

    function init() {
        // Inject popup if not already present
        if (!document.getElementById('auraa-phone-popup')) {
            document.body.insertAdjacentHTML('beforeend', POPUP_HTML);
        }

        const popup = document.getElementById('auraa-phone-popup');
        const card = popup.querySelector('.auraa-popup-card');
        const closeBtn = popup.querySelector('.auraa-popup-close');
        const labelEl = popup.querySelector('.auraa-popup-label');
        const numberEl = popup.querySelector('.auraa-popup-number');
        const whatsappBtn = popup.querySelector('.auraa-btn-whatsapp');
        const callBtn = popup.querySelector('.auraa-btn-call');

        function openPopup(data) {
            const { number, wpNumber, message, label } = data;
            
            labelEl.textContent = label || 'Support';
            numberEl.textContent = number;

            // WhatsApp logic
            const isMobile = window.innerWidth < 768;
            const wpBase = isMobile ? 'https://api.whatsapp.com/send' : 'https://web.whatsapp.com/send';
            const wpUrl = `${wpBase}?phone=${wpNumber}&text=${encodeURIComponent(message)}`;
            
            whatsappBtn.href = wpUrl;
            callBtn.setAttribute('data-href', `tel:+${wpNumber}`);

            popup.classList.add('active');
            document.body.style.overflow = 'hidden'; // Prevent scroll
        }

        function closePopup() {
            popup.classList.remove('active');
            document.body.style.overflow = '';
        }

        // Event Delegation for clicks
        document.addEventListener('click', function(e) {
            // Support both a[href^="tel:"] and elements with .auraa-phone class
            const phoneLink = e.target.closest('a[href^="tel:"]') || e.target.closest('.auraa-phone');
            
            if (phoneLink) {
                // Only prevent default if we have the popup data or it's a tel link
                if (phoneLink.tagName === 'A' || phoneLink.classList.contains('auraa-phone')) {
                    e.preventDefault();
                    e.stopPropagation();
                }
                
                const data = {
                    number: getCleanNumber(phoneLink),
                    wpNumber: phoneLink.getAttribute('data-wp-number'),
                    message: phoneLink.getAttribute('data-wp-message'),
                    label: phoneLink.getAttribute('data-phone-label')
                };

                // If it's a "raw" tel link without data attributes, we provide defaults
                if (!data.wpNumber) {
                    const rawTel = (phoneLink.getAttribute('href') || '').replace('tel:', '');
                    data.wpNumber = rawTel.replace(/\+/g, '').replace(/\s/g, '') || '919080560340';
                    data.message = "Hello Auraa Crackers! I need assistance.";
                    data.label = phoneLink.textContent.includes('+') ? "Support" : phoneLink.textContent.trim();
                }

                openPopup(data);
            }
        }, true); // Use capture to intercept before other handlers

        // Close handlers
        closeBtn.addEventListener('click', closePopup);
        
        whatsappBtn.addEventListener('click', (e) => {
            // We let the link open in target="_blank", then close
            setTimeout(closePopup, 800);
        });

        callBtn.addEventListener('click', (e) => {
            e.preventDefault();
            const tel = callBtn.getAttribute('data-href');
            if (tel) {
                window.location.href = tel;
                setTimeout(closePopup, 800);
            }
        });
        
        popup.addEventListener('click', (e) => {
            if (!card.contains(e.target)) closePopup();
        });
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') closePopup();
        });

        // Add notranslate to all tel links
        document.querySelectorAll('a[href^="tel:"]').forEach(link => {
            link.classList.add('notranslate');
        });
    }

    // Helper to get clean number (no labels)
    function getCleanNumber(link) {
        // 1. Get raw text
        let text = link.textContent.trim();
        
        // 2. Remove any text that looks like a label (anything after a space or a '+' not at the start)
        // We only want digits, spaces, and the leading +
        const match = text.match(/\+?[0-9\s-]+/);
        return match ? match[0].trim() : text;
    }

    // Toast System for Clipboard Feedback
    function showToast(message) {
        const existing = document.getElementById('auraa-toast');
        if (existing) existing.remove();

        const toast = document.createElement('div');
        toast.id = 'auraa-toast';
        toast.innerHTML = `
            <div style="background: #0A325A; color: white; padding: 12px 24px; border-radius: 50px; border: 1px solid #FFD700; box-shadow: 0 10px 30px rgba(0,0,0,0.3); font-weight: 800; font-size: 11px; text-transform: uppercase; letter-spacing: 1px; display: flex; align-items: center; gap: 8px;">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                ${message}
            </div>
        `;
        toast.style.cssText = "position: fixed; bottom: 100px; left: 50%; transform: translateX(-50%) translateY(20px); opacity: 0; transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275); z-index: 100002; pointer-events: none;";
        document.body.appendChild(toast);

        // Animate in
        requestAnimationFrame(() => {
            toast.style.transform = "translateX(-50%) translateY(0)";
            toast.style.opacity = "1";
        });

        // Animate out
        setTimeout(() => {
            toast.style.transform = "translateX(-50%) translateY(-20px)";
            toast.style.opacity = "0";
            setTimeout(() => toast.remove(), 400);
        }, 2500);
    }

    // Expose toast to window for use in other scripts (like Bank Copy)
    window.auraaShowToast = showToast;

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
