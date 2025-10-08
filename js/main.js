document.addEventListener("DOMContentLoaded", function() {

    function setupNavbarLinks() {
        const historicDropdown = document.querySelector('.navbar-nav .dropdown:first-child');
        
        if (historicDropdown) {
            const historicLinks = historicDropdown.querySelectorAll('.dropdown-menu a');

            historicLinks.forEach(link => {
                if (!link.textContent.toLowerCase().includes('ver todas')) {
                    link.addEventListener('click', function(event) {
                        event.preventDefault();
                        const linkText = this.textContent.trim();
                        if (linkText) {
                            const urlText = linkText.replace(/ /g, '_');
                            window.location.href = `HistoricMoments.html?tema=${urlText}`;
                        }
                    });
                }
            });
        }
    }

});