// Cargar el header en todas las páginas
document.addEventListener('DOMContentLoaded', () => {
    fetch('./html/header.html')
        .then(response => response.text())
        .then(data => {
            document.querySelector('header-placeholder').innerHTML = data;
        });
});
