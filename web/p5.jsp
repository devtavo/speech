<html>
    <head>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.4.5/p5.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.4.5/addons/p5.dom.js"></script>
        <script src="js/p5speech.js" type="text/javascript"></script>
      
       <script type="text/javascript">
             var lenguaje="";
             function setcookie() {
                    document.cookie = "googtrans=/auto/en; expires=N/A;domain=localhost;path=/";

                }
             function googleTranslateElementInit() {
                new google.translate.TranslateElement({
                    includedLanguages: 'en',
                    defaultLanguage: 'es'}, 'google_translate_element');
            }


        </script>


        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        <script>
            var myRec = new p5.SpeechRec(); // new P5.SpeechRec object
            
            function setup()
            {
                // graphics stuff:
                createCanvas(800, 400);
                background(255, 255, 255);
                fill(0, 0, 0, 255);
                // instructions:
                textSize(32);
                textAlign(CENTER);
                text("Diga algo", width / 2, height / 2);
                myRec.continuous = true;
                myRec.interimResults = true;
                //    myRec.lang()="en-US";
                myRec.defaultLanguage = "en-US";
                myRec.onResult = showResult;
               // myRec.start();
             
            }
            function showResult()
            {
                if (myRec.resultValue == true) {
                    background(192, 255, 192);
                    text(myRec.resultString, width / 2, height / 2);
                    var ttt = "";
                    ttt = ttt + myRec.resultString;
                    console.log(myRec.resultString);
                    console.log(ttt);
                }
            }
           </script>
    </head>

    <jsp:include page="nuevospeech.html" ></jsp:include> 
    <body  onload="setcookie()">
          
<!--        <h2>Seleccione idioma a traducir</h2>
        <input type="radio" id="idioma" name="genero" value="en" checked="true">Ingles</input>
        <input type="radio" id="idioma" name="genero" value="es" checked="false">Español</input>-->
 <button id='empezar_grabar' translate="no" class="btn btn-success" data-toggle="modal" data-target="#myModal2" >
 <span class="glyphicon glyphicon-play" data-toggle="tooltip" data-placement="top" title="Empieza a reproducir y grabar a la vez">
 </span> Empezar a grabar</button>
 
<br>
        
        <div class="modal-body">
                        <div id="google_translate_element"></div>

                    </div>
    </body >
    <script>
         
     document.querySelector('#empezar_grabar').addEventListener('click', function () {
                lenguaje= genero = document.querySelector('input[name="genero"]:checked').value;
        console.log(lenguaje);
             myRec.start();
               
            });
            
        </script>
</html>