function mostrarAsesoria(id) {
  // Ocultar todas las asesorías
  let asesorias = document.querySelectorAll('.asesorias');
  asesorias.forEach(asesoria => asesoria.style.display = 'none');

  // Mostrar la asesoría seleccionada
  document.getElementById(id).style.display = 'block';
  // Hacer scroll hasta la asesoría seleccionada
  document.getElementById(id).scrollIntoView({ behavior: 'smooth' });
}