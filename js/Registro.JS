function validar() {
    /*Creción de variables con los nombres del archivo Registo.html*/
    var nom, pat, mat, car, usu, pas, pas_2, correo, contrasenia;

  
    /*Asignación de variables del archivo registro.html*/
    nom = document.getElementById('nom').value;
    pat = document.getElementById('pat').value;
    mat = document.getElementById('mat').value;
    car = document.getElementById('car').value;
    usu = document.getElementById('usu').value;
    pas = document.getElementById('pas').value;
    pas_2 = document.getElementById('pas_2').value;


    /*usu = document.getElementsByName('Usuario').value;
    p1 = document.getElementsByName('Password').value;
    p2 = document.getElementsByName('Password2').value;*/
  
    /*Indicamos la validadcion de correo electronico
    donde: email es la variable, va recibir cualquier caracter especial con la digonal invertida y concatenará
    con el arroba (@) y llevará el dominio del correro a insertar*/
  correo=/\w+@+[a-z]+\.+[a-z]/;  /*zapatitos@gmail.com*/
  contrasenia=/[A-Z]{1}[a-z]{5}[0-9]{2}/;
  
    /*Validacion para la contraseña donde llevara 1 mayuscula, 5 minuscula y 2 numeros*/
    /*contra = /[A-Z]{1}[a-z]{5}[0-9]{2}/;*/
    /*const contra = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){5,10}$/;
  
    /*Validación para que todos los campos sean llenados por el Usuario
    Las dos lineas verticales indican un "O"*/

    if (nom !== "" && pat !== "" && mat !== "" && car !== "" && usu !== "" && pas !== "" && pas_2 !== "") {
        Swal.fire({
          icon: 'success',
          title: 'Éxito',
          text: 'Todos los campos se han llenado correctamente',
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


    if (Number(nom)) {
      alert("El nombre no es valido");
      return false;
    }
    if (Number(pat)) {
      alert("El apellido paterno no es valido");
      return false;
    }
    if (Number(mat)) {
      alert("El apellido materno no es valido");
      return false;
    }
    if (Number(car)) {
      alert("Cargo solo contiene letras");
      return false;
    }
    if (Number(usu)) {
      alert("No es valido el usuario");
      return false;
    }
    /*Hacemos una comparacion donde el numero de caracteres no superen los que estan permitidos en nuestra BD
    Para no poner muchos if, usamos la doble lienea para los atributos que contienen el mismo numero de caracteres permitidos*/
    if (!isNaN(asu) || !isNaN(edo) || !isNaN(mun))  {
      alert("Estos campos exceden el numero de caracteres permitidos");
      return false;
    }
    /*la palabra "length" indica el largo,o sea,que si es mayor al numero indicado mandará un mensaje
    y el usuario no podra avanzar*/
    if (ap.length>20 || am.length>20) {
      alert("Numero de caracteres superado");
      return  false;
    }
    if (cal.length>30) {
      alert("Numero de caracteres superado");
      return false;
    }
    if (mun.length>45 || usu.length>45 || p1.length>45 || p2.length>45) {
      alert("El campo municipio, usuario o contraseña han superado el limite de caracteres");
      return false;
    }
    if (tel.length>10) {
      alert("El telefono excede de 10 dígitos");
      return false;
    }
    if (isNaN(tel)) { /*La palabra isNAN es igual a decir "Si no es numero"*/
      alert("El telefono solo aceptan números");
      return false;
    }
    /*Se usa ! para indicar que si el email no coincide con la variable, manda la alerta*/
    if (!email.test(corr)) { /*Validar el email con la variable de correo*/
      alert("Formato incorrecto");
      return false;
    }
    if (!contra.test(pas)) { /*Validar las contraseñas, de lo contrario mandará la alerta*/
      alert("La contraseña debe contener una letra mayuscula, minuscula, no debe haber espacios vacios");
      return false;
    }
    if (!contra.test(pas_2)) {
      alert("La contraseña debe contener una letra mayuscula, minuscula, no debe haber espacios vacios");
      return false;
    }
  }
  