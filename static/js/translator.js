/**
 * Google Translate Widget Callback
 * This must be in global scope for the Google script to call it
 */
function googleTranslateElementInit() {
    console.log('Google Translate: Initialization started...');
    try {
        new google.translate.TranslateElement({
            pageLanguage: 'en',
            includedLanguages: 'ta,te,kn,ml,hi,mr,bn,gu,pa,or,ur,as,sa,mai,sd,ne,kok,mni,doi,brx,sat,ks',
            autoDisplay: false
        }, 'google_translate_element');
        console.log('Google Translate: Initialization successful.');
    } catch (e) {
        console.error('Google Translate: Initialization failed:', e);
    }
}

// Global script load check
setTimeout(() => {
    if (typeof google === 'undefined' || typeof google.translate === 'undefined') {
        console.error('CRITICAL: Google Translate script failed to load or is blocked by the network/firewall.');
    }
}, 5000);

(function() {
    // 22 Scheduled Indian Languages Data
    const LANGUAGES = [
        { code: 'ta', name: 'Tamil', native: 'தமிழ்', priority: true },
        { code: 'te', name: 'Telugu', native: 'తెలుగు', priority: true },
        { code: 'kn', name: 'Kannada', native: 'ಕನ್ನಡ', priority: true },
        { code: 'ml', name: 'Malayalam', native: 'മലയാളം', priority: true },
        { code: 'hi', name: 'Hindi', native: 'हिन्दी', priority: true },
        { code: 'mr', name: 'Marathi', native: 'मराठी', priority: true },
        { code: 'bn', name: 'Bengali', native: 'বাংলা', priority: true },
        { code: 'gu', name: 'Gujarati', native: 'ગુજરાતી', priority: true },
        { code: 'pa', name: 'Punjabi', native: 'ਪੰਜਾਬੀ', priority: true },
        { code: 'or', name: 'Odia', native: 'ଓଡ଼ିଆ', priority: false },
        { code: 'ur', name: 'Urdu', native: 'اردو', priority: false, rtl: true },
        { code: 'as', name: 'Assamese', native: 'অসমীয়া', priority: false },
        { code: 'sa', name: 'Sanskrit', native: 'संस्कृतम्', priority: false },
        { code: 'mai', name: 'Maithili', native: 'मैथिली', priority: false },
        { code: 'sd', name: 'Sindhi', native: 'سنڌي', priority: false, rtl: true },
        { code: 'ne', name: 'Nepali', native: 'नेपाली', priority: false },
        { code: 'kok', name: 'Konkani', native: 'कोंकणी', priority: false },
        { code: 'mni', name: 'Manipuri', native: 'ꯃꯩꯇꯩꯂꯣꯟ', priority: false },
        { code: 'doi', name: 'Dogri', native: 'डोगरी', priority: false },
        { code: 'brx', name: 'Bodo', native: 'बर\'', priority: false },
        { code: 'sat', name: 'Santali', native: 'ᱥᱟᱱᱛᱟᱲᱤ', priority: false },
        { code: 'ks', name: 'Kashmiri', native: 'کٲशুর', priority: false, rtl: true }
    ];

    let currentLang = localStorage.getItem('auraa_selected_lang') || 'en';

    /**
     * Initialize the Translator UI and Widget
     */
    function init() {
        createUI();
        setupEventListeners();
        applyRTLIfNecessary(currentLang);
        
        // If there was a saved language, we need to wait for Google Widget to load then trigger it
        if (currentLang !== 'en') {
            triggerSavedTranslation();
            updateTriggerLabels(currentLang);
        } else {
            updateTriggerLabels('en');
        }
    }

    /**
     * Update the text in the translator buttons to show the current language
     */
    function updateTriggerLabels(code) {
        const labels = document.querySelectorAll('.auraa-current-lang');
        const langData = LANGUAGES.find(l => l.code === code);
        
        // If English or not found, show "Translate" (or "English" if you prefer)
        const name = (code === 'en' || !langData) ? 'Translate' : langData.name;
        
        labels.forEach(label => {
            label.textContent = name;
        });
    }

    /**
     * Create the custom Dropdown UI
     */
    function createUI() {
        const containers = [
            'auraa-language-list', 
            'auraa-language-list-mobile', 
            'auraa-language-list-topbar', 
            'auraa-language-list-mobile-header'
        ];
        
        // Sort languages: Priority first, then alphabetical
        const sortedLangs = [...LANGUAGES].sort((a, b) => {
            if (a.priority && !b.priority) return -1;
            if (!a.priority && b.priority) return 1;
            return a.name.localeCompare(b.name);
        });

        containers.forEach(id => {
            const listContainer = document.getElementById(id);
            if (!listContainer) return;

            let html = '';
            let priorityEnded = false;

            sortedLangs.forEach(lang => {
                if (!lang.priority && !priorityEnded) {
                    html += '<div class="auraa-priority-divider">Other Languages</div>';
                    priorityEnded = true;
                }
                
                const activeClass = lang.code === currentLang ? 'active' : '';
                html += `
                    <div class="auraa-language-item ${activeClass}" data-code="${lang.code}" data-search="${lang.name.toLowerCase()} ${lang.native}">
                        <span class="eng-name">${lang.name}</span>
                        <span class="native-script">${lang.native}</span>
                    </div>
                `;
            });

            listContainer.innerHTML = html;
        });
    }

    /**
     * Setup Event Listeners
     */
    function setupEventListeners() {
        // Handle all translator containers (desktop and mobile)
        const containers = document.querySelectorAll('.auraa-translator-container');
        
        containers.forEach(container => {
            const trigger = container.querySelector('.auraa-translator-trigger');
            const searchInput = container.querySelector('.auraa-translator-search input');
            const resetBtn = container.querySelector('.auraa-reset-btn');
            const list = container.querySelector('.auraa-language-list');

            // Toggle dropdown
            trigger.addEventListener('click', (e) => {
                e.stopPropagation();
                
                // Close other open translator containers first
                containers.forEach(c => {
                    if (c !== container) c.classList.remove('active');
                });

                container.classList.toggle('active');
                if (container.classList.contains('active')) {
                    searchInput.focus();
                }
            });

            // Search Filter
            searchInput.addEventListener('input', (e) => {
                const val = e.target.value.toLowerCase();
                const items = list.querySelectorAll('.auraa-language-item');
                items.forEach(item => {
                    const searchStr = item.getAttribute('data-search');
                    item.style.display = searchStr.includes(val) ? 'flex' : 'none';
                });
            });

            // Language Selection
            list.addEventListener('click', (e) => {
                const item = e.target.closest('.auraa-language-item');
                if (!item) return;

                const code = item.getAttribute('data-code');
                selectLanguage(code);
                container.classList.remove('active');
            });

            // Reset to English
            resetBtn.addEventListener('click', () => {
                resetTranslation();
            });
        });

        // Close on outside click or backdrop click
        document.addEventListener('click', (e) => {
            containers.forEach(container => {
                // If it's active and we click outside the dropdown or on the container itself (backdrop)
                if (container.classList.contains('active')) {
                    const dropdown = container.querySelector('.auraa-translator-dropdown');
                    const trigger = container.querySelector('.auraa-translator-trigger');
                    
                    if (!dropdown.contains(e.target) && !trigger.contains(e.target)) {
                        container.classList.remove('active');
                    }
                }
            });
        });
    }

    /**
     * Handle Language Selection
     */
    function selectLanguage(code) {
        if (code === currentLang) return;

        showLoading(true);
        currentLang = code;
        localStorage.setItem('auraa_selected_lang', code);
        
        // Update UI active state
        document.querySelectorAll('.auraa-language-item').forEach(item => {
            item.classList.toggle('active', item.getAttribute('data-code') === code);
        });

        applyRTLIfNecessary(code);
        updateTriggerLabels(code);
        executeGoogleTranslate(code);
    }

    /**
     * Execute Google Translation via the hidden widget
     */
    function executeGoogleTranslate(code) {
        // 1. Check if the Google Translate library is even loaded
        if (typeof google === 'undefined' || typeof google.translate === 'undefined') {
            console.warn('Google Translate script not loaded yet. Retrying...');
            setTimeout(() => executeGoogleTranslate(code), 1000);
            return;
        }

        // 2. Try to find the combo box
        const combo = document.querySelector('.goog-te-combo');
        
        if (combo) {
            console.log('Google Translate widget found, applying:', code);
            combo.value = code;
            combo.dispatchEvent(new Event('change'));
            
            // Success - hide loading
            setTimeout(() => {
                showLoading(false);
            }, 1000);
        } else {
            // 3. Library is loaded but UI is not ready
            const widgetDiv = document.getElementById('google_translate_element');
            if (widgetDiv && widgetDiv.innerHTML.length > 0) {
                console.log('Widget UI partially ready but combo not found. Retrying...');
            } else {
                console.log('Google Translate widget div empty. Retrying...');
            }
            
            setTimeout(() => executeGoogleTranslate(code), 1000);
        }
    }

    /**
     * Trigger translation for a saved language on page load
     */
    function triggerSavedTranslation() {
        const checkWidget = setInterval(() => {
            const combo = document.querySelector('.goog-te-combo');
            if (combo) {
                clearInterval(checkWidget);
                executeGoogleTranslate(currentLang);
            }
        }, 500);
        
        // Timeout after 10 seconds to prevent infinite loop
        setTimeout(() => clearInterval(checkWidget), 10000);
    }

    /**
     * Reset Translation and clear cookies
     */
    function resetTranslation() {
        localStorage.removeItem('auraa_selected_lang');
        
        // 1. Try to set the combo box back to English first
        const combo = document.querySelector('.goog-te-combo');
        if (combo) {
            combo.value = ''; // Google uses empty string for original
            combo.dispatchEvent(new Event('change'));
        }

        // 2. Clear Google Translate Cookies aggressively
        const domains = [
            window.location.hostname, 
            '.' + window.location.hostname,
            window.location.host,
            '.' + window.location.host
        ];
        
        domains.forEach(domain => {
            document.cookie = `googtrans=; expires=Thu, 01 Jan 1970 00:00:00 UTC; domain=${domain}; path=/;`;
            document.cookie = `googtrans=; expires=Thu, 01 Jan 1970 00:00:00 UTC; domain=${domain};`;
        });
        
        // 3. Force reload to restore original English
        setTimeout(() => {
            window.location.reload();
        }, 100);
    }

    /**
     * Apply RTL direction for specific languages
     */
    function applyRTLIfNecessary(code) {
        const langData = LANGUAGES.find(l => l.code === code);
        if (langData && langData.rtl) {
            document.documentElement.setAttribute('dir', 'rtl');
        } else {
            document.documentElement.setAttribute('dir', 'ltr');
        }
    }

    /**
     * Show/Hide Loading Overlay
     */
    function showLoading(show) {
        const loader = document.getElementById('auraa-translator-loading');
        if (loader) {
            loader.style.display = show ? 'flex' : 'none';
        }
    }

    // Initialize on DOM load
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
