<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Áreas de trabajo</title>
  <link rel="stylesheet" href="./css/header.css">
  <link rel="stylesheet" href="./css/workspaces.css">  
  <link rel="stylesheet" href="./css/footer.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>

<body>
  <!-- Header -->
  <?php include './php/header.php'; ?>

  <h1>ÁREAS DE TRABAJO</h1>
  <p>
    Bienvenido a Abogado Elias Antonio Aguilar Romero. Al utilizar nuestro sitio, aceptas cumplir con los términos y
    condiciones establecidos en esta Política de Usuario. Asumimos que utilizarás nuestro sitio de manera legal y
    autorizada. No interferirás con su correcto funcionamiento. Si decides crear una cuenta, eres responsable de
    mantener la confidencialidad de tu información y notificarnos sobre cualquier uso no autorizado. Al subir contenido
    al sitio, nos concedes una licencia para utilizarlo de manera específica. El manejo de la información personal está
    sujeto a nuestra Política de Privacidad.
  </p>

  <!-- Galería de imagenes -->
  <div class="galeria">
    <div class="imagen" onclick="mostrarAsesoria('familiar')" id='i_fa'>
      <img src="./imgs/familiar.png" alt="Familiar">
      <div class="desc">FAMILIAR</div>
    </div>

    <div class="imagen" onclick="mostrarAsesoria('agrario')" id='i_ag'>
      <img src="./imgs/agrario.png" alt="Agrario">
      <div class="desc">AGRARIO</div>
    </div>

    <div class="imagen" onclick="mostrarAsesoria('penal')" id='i_pe'>
      <img src="./imgs/penal.png" alt="Penal">
      <div class="desc">PENAL</div>
    </div>
  </div>

  <article class="asesorias" id="familiar">
    <h1>FAMILIAR</h1>
    <p>
    Siempre he dicho lo impactante que es descubrir lo que sucede detrás de la puerta de un hogar, de una familia o de una pareja, porque al final del día, haya sido poco o mucho el tiempo de relación ya sea sentimental o familiar, el propósito de todo es ´proteger los derechos que te han sido vulnerados, pero, sobre todo, si son derechos de personas menores de edad, pues son ellos quienes recienten el resultado de un proceso legal, por eso mi deber ético y profesional es orientarte a tomar la mejor decisión para que puedas resolver tu problema legal, de tal forma que en conjunto logremos resolver el conflicto, garantizando en todo momento el respeto a los derechos humanos de las niñas niños y adolescentes, para que dentro del marco legal, podamos resanar la fractura familiar que te atañe.
    </p>
  </article>

  <article class="asesorias" id="agrario">
    <h1>AGRARIO</h1>
    <p>
      Con más de 15 años de experiencia en el ámbito del derecho familiar, el abogado Juan Pérez se ha destacado por su
      dedicación y profesionalismo en la resolución de casos complejos de divorcio, custodia de menores, adopciones y
      mediación familiar. Su enfoque centrado en el cliente y su profundo conocimiento de la legislación vigente le han
      permitido ofrecer asesoría jurídica personalizada y eficiente, garantizando así la mejor protección de los
      derechos e intereses de sus clientes en momentos cruciales de sus vidas. Además de su destacada capacidad para
      litigar en tribunales, Juan Pérez es conocido por su habilidad para negociar acuerdos equitativos fuera de la
      corte, lo que frecuentemente resulta en soluciones más rápidas y menos conflictivas para las partes involucradas.
      Su trayectoria y éxito en numerosos casos avalan su reputación como un defensor confiable y comprometido en el
      campo del derecho familiar, proporcionando una representación legal que combina empatía, ética y excelencia
      profesional.
    </p>
  </article>

  <article class="asesorias" id="penal">
    <h1>PENAL</h1>
    <p>
    Dentro de mi ética profesional no te puedo prometer alguna sentencia “justa” o absolutoria, pues ningún buen abogado te puede garantizar un resultado dentro de un proceso penal, pero si te garantizo por mi parte compromiso, honestidad, confidencialidad y profesionalismo para que, en buena lid, tus derechos y garantías se respeten en todo momento en el proceso penal, cuéntame tu caso.
    </p>
  </article>

  <!-- Footer -->
  <?php include './php/footer.php'; ?>

  <script src="./js/workspaces.js"></script>
</body>

</html>