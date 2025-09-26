document.addEventListener("DOMContentLoaded", function() {
    const navbarPlaceholder = document.getElementById("navbar-placeholder");
    
    if (navbarPlaceholder) {
        const templateId = navbarPlaceholder.getAttribute("data-template");
        
        // Ajusta la ruta a la carpeta de templates
        // Si tus páginas están en /pages/, la ruta correcta es ../templates/
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
                    // Reemplaza el placeholder con la navbar clonada
                    navbarPlaceholder.replaceWith(navbarTemplate.cloneNode(true));
                } else {
                    console.error(`Template with id "${templateId}" not found in ${templateUrl}`);
                }
            })
            .catch(error => {
                console.error('Error fetching navbar:', error);
            });
    }
});