// Cargar el footer en todas las páginas
document.addEventListener('DOMContentLoaded', () => {
    fetch('./html/footer.html')
        .then(response => response.text())
        .then(data => {
            document.querySelector('footer-placeholder').innerHTML = data;
        });
});
