<?php include_once 'main_header.html'; ?>
<body>
   <div class="card-deck">
        <div class="card" id="respuestas_c_nc">
            <div class="card-body">
              <h5 class="card-title"> Número de respuestas contestadas y no contestadas</h5>
              <p class="card-text">Respuestas contesadas:</p>
              <p class="card-text" id="respuesta_c"><small class="text-muted"></small></p>
              <p class="card-text">Respuestas no contestadas:</p>
              <p class="card-text" id="respuesta_nc"><small class="text-muted"></small></p>
            </div>
          </div>
        <div class="card" id="respuesta_mnv">
            <div class="card-body">
              <h5 class="card-title">Respuesta con menor número de vistas</h5>
              <p class="card-text" id="respuesta_mnv"></p>
            </div>
        </div>
    </div>
    <br>
    <div class="card-deck">
        <div class="card">
            <div class="card-body">
              <h5 class="card-title"> Respuesta más vieja y más actual</h5>
              <p class="card-text " >Respuesta más vieja:</p>
              <p class="card-text" id="respuesta_mv"><small class="text-muted"></small></p>
              <p class="card-text">Respuesta más actual:</p>
              <p class="card-text" id="respuesta_ma"><small class="text-muted"></small></p>
            </div>
          </div>
        <div class="card">
            <div class="card-body">
              <h5 class="card-title">Respuesta del owner que tenga una mayor reputación</h5>
              <p class="card-text" id="respusta_omr"></p>
            </div>
        </div>
    </div>



    <?php include_once 'main_footer.html'; ?>
    <script src="/../XalDigital_Prueba/controllers/connection_url.js"></script>

</body>