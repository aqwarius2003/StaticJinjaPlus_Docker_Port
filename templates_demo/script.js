// Console messages
console.log("%cHello World", "color: #ff00ff; font-weight: bold;");
console.log("%cRIP хомяки 1995-2015", "color: #00ffff; font-weight: bold;");

// Анимация счетчика
function animateCounter() {
    const counter = document.getElementById('counter');
    const visitorCount = document.getElementById('visitor-count');
    let count = 0;
    const target = Math.floor(Math.random() * 10000) + 1000;

    const interval = setInterval(() => {
        count += Math.floor(target / 50);
        if (count > target) {
            count = target;
            clearInterval(interval);
        }
        counter.textContent = count.toString().padStart(4, '0');
        visitorCount.textContent = count.toString().padStart(4, '0');
    }, 50);
}

document.addEventListener('DOMContentLoaded', animateCounter);