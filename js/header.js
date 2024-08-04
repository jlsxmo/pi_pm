function iluminar(event) {
    // Obtener el enlace que disparó el evento
    const enlace = event.target;
  
    // Obtener el elemento <li> padre del enlace
    const li = enlace.parentElement;
  
    // Cambiar el color del borde superior del <li>  
    li.style.borderTop = '5px solid #FFCB7E';
  
    // Compensamos los 5 px del borde superior del <li>
    enlace.style.marginTop = '15px';
  }
  
  function apagar(event) {
    // Obtener el enlace que disparó el evento
    const enlace = event.target;
  
    // Obtener el elemento <li> padre del enlace
    const li = enlace.parentElement;
  
    // Restaurar el color del borde superior del <li>
    li.style.borderTop = '5px solid transparent';
  }