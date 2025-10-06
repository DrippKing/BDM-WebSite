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

    const navbarPlaceholder = document.getElementById("navbar-placeholder");
    
    if (navbarPlaceholder) {
        const templateId = navbarPlaceholder.getAttribute("data-template");
        const templateUrl = '../html/templates/navbar.html'; 

        fetch(templateUrl)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(data => {
                const tempDiv = document.createElement('div');
                tempDiv.innerHTML = data;
                const navbarTemplate = tempDiv.querySelector(`#${templateId}`);
                
                if (navbarTemplate) {
                    navbarPlaceholder.replaceWith(navbarTemplate.cloneNode(true));
                    setupNavbarLinks();
                } else {
                    console.error(`Template with id "${templateId}" not found in ${templateUrl}`);
                }
            })
            .catch(error => {
                console.error('Error fetching navbar:', error);
            });
    }
});