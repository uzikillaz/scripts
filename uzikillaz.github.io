<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flash's Scripts</title>
    <style>
        :root {
            --text: #f1f1f1;
            --bg: #0a0a0a;
            --border: rgba(255, 255, 255, 0.1);
            --button-bg: rgba(30, 30, 30, 0.7);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }

        body {
            background-color: var(--bg);
            color: var(--text);
            min-height: 100vh;
            background-image: url('https://krnl.cat/img/bg.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow-x: hidden;
        }

        .container {
            width: 100%;
            max-width: 800px;
            padding: 0 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            text-align: center;
            padding: 80px 0 40px;
            width: 100%;
            position: relative;
        }

        .logo {
            font-size: clamp(2.5rem, 8vw, 3.5rem);
            font-weight: 800;
            margin-bottom: 20px;
            background: linear-gradient(90deg, #ff0000, #ff8000, #ffff00, #00ff00, #0000ff, #8000ff, #ff00ff);
            background-size: 400% 400%;
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 15px rgba(255,255,255,0.3);
            position: relative;
            display: inline-block;
            animation: rainbow-text 8s ease infinite;
        }

        .logo::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, #ff0000, #ff8000, #ffff00, #00ff00, #0000ff, #8000ff, #ff00ff);
            background-size: 400% 400%;
            box-shadow: 0 0 15px rgba(255,255,255,0.5);
            border-radius: 2px;
            animation: rainbow-border 8s ease infinite;
        }

        /* Cosmic Background Elements */
        .cosmic-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }

        .star {
            position: absolute;
            background: white;
            border-radius: 50%;
            filter: blur(0.5px);
            animation: twinkle 5s infinite alternate;
        }

        .shooting-star {
            position: absolute;
            width: 4px;
            height: 4px;
            background: linear-gradient(90deg, rgba(255,255,255,0), rgba(255,255,255,0.8));
            border-radius: 50%;
            filter: blur(1px);
        }

        .shooting-star::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 100%;
            width: 150px;
            height: 1px;
            background: linear-gradient(90deg, rgba(255,255,255,0.8), rgba(255,255,255,0));
            transform: translateY(-50%);
        }

        .comet {
            position: absolute;
            width: 6px;
            height: 6px;
            background: radial-gradient(circle, rgba(255,255,255,0.8) 0%, rgba(255,255,255,0) 70%);
            border-radius: 50%;
            filter: blur(0.5px);
        }

        .comet::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 100%;
            width: 200px;
            height: 2px;
            background: linear-gradient(90deg, 
                rgba(255,255,255,0.8) 0%, 
                rgba(200,200,255,0.6) 20%,
                rgba(150,150,255,0.4) 40%,
                rgba(100,100,255,0.2) 60%,
                rgba(50,50,255,0) 100%);
            transform: translateY(-50%);
        }

        @keyframes twinkle {
            0%, 100% { opacity: 0.2; }
            50% { opacity: 1; }
        }

        /* AI Search Styles */
        .search-container {
            width: 100%;
            max-width: 600px;
            margin-bottom: 30px;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.8s ease-out 0.5s forwards;
        }

        .search-box {
            width: 100%;
            padding: 15px 20px;
            border-radius: 8px;
            border: none;
            background: rgba(30, 30, 30, 0.7);
            color: white;
            font-size: 1rem;
            backdrop-filter: blur(5px);
            box-shadow: 0 0 0 1px rgba(255,255,255,0.1);
            transition: all 0.3s ease;
        }

        .search-box:focus {
            outline: none;
            box-shadow: 0 0 0 2px rgba(138, 43, 226, 0.5);
        }

        .search-results {
            margin-top: 15px;
            background: rgba(20, 20, 20, 0.9);
            border-radius: 8px;
            padding: 15px;
            max-height: 300px;
            overflow-y: auto;
            display: none;
            backdrop-filter: blur(10px);
            border: 1px solid var(--border);
        }

        .script-item {
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.2s ease;
        }

        .script-item:hover {
            background: rgba(255,255,255,0.1);
        }

        .button-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            width: 100%;
            padding: 0 20px;
        }

        .script-btn {
            background: var(--button-bg);
            border: none;
            color: transparent;
            padding: 18px;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            height: 100%;
            position: relative;
            overflow: hidden;
            z-index: 1;
            opacity: 0;
            transform: translateY(20px);
            box-shadow: 0 0 0 1px rgba(255,255,255,0.1);
        }

        .script-btn span {
            background: linear-gradient(90deg, #ff0000, #ff8000, #ffff00, #00ff00, #0000ff, #8000ff, #ff00ff);
            background-size: 400% 400%;
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 10px rgba(255,255,255,0.3);
            animation: rainbow-text 8s ease infinite;
            position: relative;
            z-index: 2;
        }

        .script-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, 
                rgba(255, 0, 0, 0.2), 
                rgba(255, 128, 0, 0.2), 
                rgba(255, 255, 0, 0.2), 
                rgba(0, 255, 0, 0.2), 
                rgba(0, 0, 255, 0.2), 
                rgba(128, 0, 255, 0.2), 
                rgba(255, 0, 255, 0.2));
            background-size: 400% 400%;
            opacity: 0;
            z-index: 1;
            transition: opacity 0.3s ease;
            animation: rainbow-bg 8s ease infinite;
        }

        .script-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .script-btn:hover::before {
            opacity: 1;
        }

        .script-btn:active {
            transform: translateY(0);
        }

        .script-btn:nth-child(1) { animation: fadeInUp 0.6s ease-out 0.7s forwards; }
        .script-btn:nth-child(2) { animation: fadeInUp 0.6s ease-out 0.8s forwards; }
        .script-btn:nth-child(3) { animation: fadeInUp 0.6s ease-out 0.9s forwards; }
        .script-btn:nth-child(4) { animation: fadeInUp 0.6s ease-out 1.0s forwards; }

        .info-text {
            color: #aaa;
            margin-top: 40px;
            text-align: center;
            line-height: 1.6;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.8s ease-out 1.1s forwards;
            max-width: 600px;
            padding: 0 20px;
        }

        .highlight {
            font-weight: 600;
            background: linear-gradient(90deg, #ff0000, #ff8000, #ffff00, #00ff00, #0000ff, #8000ff, #ff00ff);
            background-size: 400% 400%;
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 10px rgba(255,255,255,0.3);
            animation: rainbow-text 8s ease infinite;
            padding: 0 5px;
            border-radius: 4px;
        }

        footer {
            margin-top: auto;
            padding: 30px 0;
            text-align: center;
            color: #666;
            font-size: 0.9rem;
            width: 100%;
            opacity: 0;
            animation: fadeIn 1s ease-out 1.3s forwards;
            backdrop-filter: blur(5px);
            background: rgba(10, 10, 10, 0.5);
            border-top: 1px solid var(--border);
        }

        .footer-logo {
            font-weight: 700;
            background: linear-gradient(90deg, #ff0000, #ff8000, #ffff00, #00ff00, #0000ff, #8000ff, #ff00ff);
            background-size: 400% 400%;
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 15px rgba(255,255,255,0.3);
            animation: rainbow-text 8s ease infinite;
        }

        /* Notification System */
        .notification-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000;
            display: flex;
            flex-direction: column-reverse;
            gap: 10px;
            max-width: 300px;
        }

        .notification {
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(10px);
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
            border: 1px solid rgba(255,255,255,0.1);
            display: flex;
            align-items: center;
            gap: 10px;
            transform: translateX(100%);
            opacity: 0;
            animation: slideIn 0.3s ease-out forwards;
            transition: all 0.3s ease;
        }

        .notification.success {
            border-left: 3px solid #4CAF50;
        }

        .notification.error {
            border-left: 3px solid #F44336;
        }

        .notification.exiting {
            animation: slideOut 0.3s ease-out forwards;
        }

        @keyframes slideIn {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        @keyframes slideOut {
            from { transform: translateX(0); opacity: 1; }
            to { transform: translateX(100%); opacity: 0; }
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes rainbow-text {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes rainbow-border {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes rainbow-bg {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            header {
                padding: 60px 0 30px;
            }
            
            .button-grid {
                grid-template-columns: 1fr;
                gap: 15px;
            }
            
            .script-btn {
                padding: 16px;
                font-size: 1rem;
            }

            .notification-container {
                max-width: 90%;
                left: 5%;
                right: 5%;
                bottom: 10px;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="cosmic-bg" id="cosmicBg"></div>
    <div class="notification-container" id="notificationContainer"></div>
    
    <div class="container">
        <header>
            <h1 class="logo">Flash's Scripts</h1>
            <p class="subtitle">Premium Roblox scripts for enhanced gameplay</p>
        </header>

        <!-- AI Search Box -->
        <div class="search-container">
            <input type="text" class="search-box" id="searchBox" placeholder="🔍 Ask our AI to find scripts...">
            <div class="search-results" id="searchResults"></div>
        </div>

        <div class="button-grid">
            <button class="script-btn" onclick="copyScript(this, 'Autofarm', 'loadstring(game:HttpGet("https://example.com/autofarm.lua"))()')">
                <span>Autofarm</span>
            </button>
            <button class="script-btn" onclick="copyScript(this, 'God Mode', 'loadstring(game:HttpGet("https://example.com/godmode.lua"))()')">
                <span>God Mode</span>
            </button>
            <button class="script-btn" onclick="copyScript(this, 'Spawner', 'loadstring(game:HttpGet("https://example.com/spawner.lua"))()')">
                <span>Spawner</span>
            </button>
            <button class="script-btn" onclick="copyScript(this, 'Teleport', 'loadstring(game:HttpGet("https://example.com/teleport.lua"))()')">
                <span>Teleport</span>
            </button>
        </div>

        <p class="info-text">
            For whitelisting or support, contact me on Discord: <span class="highlight">.xflsh</span>
        </p>
    </div>

    <footer>
        &copy; 2025 <span class="footer-logo">Flash's Scripts</span> | All rights reserved
    </footer>

    <script>
        // Script database for AI search
        const scriptDatabase = [
            { name: "Autofarm", description: "Automatically farms resources for you", keywords: ["farm", "auto", "resources", "grind"], code: 'loadstring(game:HttpGet("https://example.com/autofarm.lua"))()' },
            { name: "God Mode", description: "Makes your character invincible", keywords: ["god", "invincible", "immortal", "no damage"], code: 'loadstring(game:HttpGet("https://example.com/godmode.lua"))()' },
            { name: "Spawner", description: "Spawns items or vehicles", keywords: ["spawn", "items", "vehicles", "create"], code: 'loadstring(game:HttpGet("https://example.com/spawner.lua"))()' },
            { name: "Teleport", description: "Teleports you to locations", keywords: ["tp", "teleport", "locations", "move"], code: 'loadstring(game:HttpGet("https://example.com/teleport.lua"))()' }
        ];

        // Enhanced Cosmic Background
        function createCosmicBackground() {
            const cosmicBg = document.getElementById('cosmicBg');
            
            // Create stars
            for (let i = 0; i < 150; i++) {
                const star = document.createElement('div');
                star.className = 'star';
                
                // Random position
                star.style.left = `${Math.random() * 100}vw`;
                star.style.top = `${Math.random() * 100}vh`;
                
                // Random size
                const size = Math.random() * 3 + 0.5;
                star.style.width = `${size}px`;
                star.style.height = `${size}px`;
                
                // Random opacity
                star.style.opacity = Math.random() * 0.8 + 0.2;
                
                // Random twinkle effect
                star.style.animation = `twinkle ${Math.random() * 5 + 3}s infinite ${Math.random() * 5}s alternate`;
                
                cosmicBg.appendChild(star);
            }
            
            // Create shooting stars
            function createShootingStar() {
                const shootingStar = document.createElement('div');
                shootingStar.className = 'shooting-star';
                
                // Start position (right side of screen)
                const startY = Math.random() * 100;
                shootingStar.style.left = '100vw';
                shootingStar.style.top = `${startY}vh`;
                
                // Random size
                const size = Math.random() * 3 + 2;
                shootingStar.style.width = `${size}px`;
                shootingStar.style.height = `${size}px`;
                
                // Random speed
                const duration = Math.random() * 1.5 + 0.5;
                
                // Add to DOM
                cosmicBg.appendChild(shootingStar);
                
                // Animate
                shootingStar.style.transition = `all ${duration}s linear`;
                setTimeout(() => {
                    shootingStar.style.left = `${-150}px`;
                    shootingStar.style.top = `${startY + Math.random() * 20 - 10}vh`;
                }, 10);
                
                // Remove after animation
                setTimeout(() => {
                    shootingStar.remove();
                }, duration * 1000);
            }
            
            // Create comets
            function createComet() {
                const comet = document.createElement('div');
                comet.className = 'comet';
                
                // Start position (random edge)
                const startX = Math.random() > 0.5 ? 100 : Math.random() * 100;
                const startY = Math.random() > 0.5 ? 100 : Math.random() * 100;
                comet.style.left = `${startX}vw`;
                comet.style.top = `${startY}vh`;
                
                // Random size
                const size = Math.random() * 4 + 3;
                comet.style.width = `${size}px`;
                comet.style.height = `${size}px`;
                
                // Random speed
                const duration = Math.random() * 8 + 4;
                
                // Add to DOM
                cosmicBg.appendChild(comet);
                
                // Animate
                comet.style.transition = `all ${duration}s linear`;
                setTimeout(() => {
                    comet.style.left = `${startX - (Math.random() * 50 + 50)}vw`;
                    comet.style.top = `${startY + (Math.random() * 40 - 20)}vh`;
                    comet.style.opacity = '0';
                }, 10);
                
                // Remove after animation
                setTimeout(() => {
                    comet.remove();
                }, duration * 1000);
            }
            
            // Create initial shooting stars and comets
            for (let i = 0; i < 5; i++) {
                setTimeout(createShootingStar, Math.random() * 3000);
                setTimeout(createComet, Math.random() * 5000);
            }
            
            // Continuous creation
            setInterval(createShootingStar, 2000);
            setInterval(createComet, 4000);
        }

        // Notification system
        function showNotification(message, type = 'success') {
            const container = document.getElementById('notificationContainer');
            
            // Remove existing notifications
            const existingNotifications = container.querySelectorAll('.notification');
            existingNotifications.forEach(notification => {
                notification.classList.add('exiting');
                setTimeout(() => notification.remove(), 300);
            });
            
            // Create new notification
            const notification = document.createElement('div');
            notification.className = `notification ${type}`;
            
            const icon = document.createElement('span');
            icon.textContent = type === 'success' ? '✅' : '❌';
            
            const text = document.createElement('span');
            text.textContent = message;
            
            notification.appendChild(icon);
            notification.appendChild(text);
            container.appendChild(notification);
            
            // Auto-remove after 3 seconds
            setTimeout(() => {
                notification.classList.add('exiting');
                setTimeout(() => notification.remove(), 300);
            }, 3000);
        }

        // AI Search Functionality
        function setupSearch() {
            const searchBox = document.getElementById('searchBox');
            const searchResults = document.getElementById('searchResults');
            
            searchBox.addEventListener('input', function() {
                const query = this.value.toLowerCase();
                
                if (query.length < 2) {
                    searchResults.style.display = 'none';
                    return;
                }
                
                // Simple AI-like search (in a real app you'd use a proper search library)
                const results = scriptDatabase.filter(script => {
                    return script.name.toLowerCase().includes(query) || 
                           script.description.toLowerCase().includes(query) ||
                           script.keywords.some(kw => kw.toLowerCase().includes(query));
                });
                
                if (results.length > 0) {
                    searchResults.innerHTML = '';
                    results.forEach(script => {
                        const item = document.createElement('div');
                        item.className = 'script-item';
                        item.innerHTML = `
                            <strong>${script.name}</strong>
                            <p>${script.description}</p>
                        `;
                        item.addEventListener('click', () => {
                            copyScript(item, script.name, script.code);
                            searchBox.value = '';
                            searchResults.style.display = 'none';
                        });
                        searchResults.appendChild(item);
                    });
                    searchResults.style.display = 'block';
                } else {
                    searchResults.innerHTML = '<div class="script-item">No scripts found. Try different keywords.</div>';
                    searchResults.style.display = 'block';
                }
            });
            
            // Hide results when clicking outside
            document.addEventListener('click', function(e) {
                if (!searchBox.contains(e.target) {
                    searchResults.style.display = 'none';
                }
            });
        }

        function copyScript(button, name, content) {
            // Store original button state
            const originalHTML = button.innerHTML;
            
            // Change button to grey state
            button.innerHTML = `<span style="
                background: none;
                color: var(--text);
                text-shadow: none;
                -webkit-text-fill-color: initial;
            ">${name}</span>`;
            
            navigator.clipboard.writeText(content)
                .then(() => {
                    showNotification(`${name} copied to clipboard!`, 'success');
                })
                .catch(err => {
                    console.error('Failed to copy: ', err);
                    showNotification(`Failed to copy ${name}`, 'error');
                })
                .finally(() => {
                    // Return button to original state after 1 second
                    setTimeout(() => {
                        button.innerHTML = originalHTML;
                    }, 1000);
                });
        }

        // Initialize effects
        window.addEventListener('DOMContentLoaded', () => {
            createCosmicBackground();
            setupSearch();
            
            // Adjust on resize
            window.addEventListener('resize', () => {
                const cosmicBg = document.getElementById('cosmicBg');
                cosmicBg.innerHTML = '';
                createCosmicBackground();
            });
        });
    </script>
</body>
</html>
