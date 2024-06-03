function validar() {
    /*Creción de variables con los nombres del archivo Registo.html*/
    var use, pas, contra,email;
  
    /*Asignación de variables del archivo registro.html*/
    use = document.getElementById('use').value;
    pas = document.getElementById('pas').value;
    
  
    /*Indicamos la validadcion de correo electronico
    donde: email es la variable, va recibir cualquier caracter especial con la digonal invertida y concatenará
    con el arroba (@) y llevará el dominio del correro a insertar*/
  email=/\w+@+[a-z]+\.+[a-z]/;  /*zapatitos@gmail.com*/
  contra=/[A-Z]{1}[a-z]{5}[0-9]{2}/;
  
    /*Validacion para la contraseña donde llevara 1 mayuscula, 5 minuscula y 2 numeros*/
    /*contra = /[A-Z]{1}[a-z]{5}[0-9]{2}/;*/
    /*const contra = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){5,10}$/;
  
    /*Validación para que todos los campos sean llenados por el Usuario
    Las dos lineas verticales indican un "O"*/
    if (use !== "" && pas !== "") {
      Swal.fire({
        icon: 'success',
        title: 'Inicio de Sesión Exitoso',
        text: '',
        customClass: {
          popup: 'swal2-popup--elegant',
        },
      });
      // Puedes agregar aquí más acciones que deseas realizar cuando los campos están llenos correctamente
    } else {
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'Todos los campos son obligatorios',
        customClass: {
          popup: 'swal2-popup--elegant',
        },
      });
      return false;
    }


    if (Number(use)) {
      alert("El nombre no es valido");
      return false;
    }
    
    
   
    /*Se usa ! para indicar que si el email no coincide con la variable, manda la alerta*/
    if (!email.test(use)) { /*Validar el email con la variable de correo*/
      alert("Formato incorrecto con este email:" + use);
      return false;
    }
    
  

        

    
  }
  