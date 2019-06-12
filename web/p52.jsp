<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Last-Modified" content="-1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript --> 
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>        <script src='https://code.responsivevoice.org/responsivevoice.js'></script>
        <script language="javascript" type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/p5.js"></script>
        <script language="javascript" type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/addons/p5.dom.js"></script>
        <script language="javascript" type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/addons/p5.sound.js"></script>
        <script src="js/p5speech.js" type="text/javascript"></script>
        <title>Voice live</title>
    </head>
    <style>
        .fondo{

            margin-top:300px;
            margin-left: 300px;
            padding: 5px 10px;
            background-color: #d71a1f;

            position: absolute;
            opacity: 0.3;

        }
        .iconos{
            width: 350px;
            margin-left: 600px;
            margin-top: 200px;
            position: absolute;
            font-size: 25px;
            font-weight: bold;
            border-radius: 50px;


        }
        .modal-dialog {
            margin: 20px;
            width: 100%; 
        }
        .modal-content{
            width: 1550px;
            margin-top: 50px;
        }
         .boton{
            text-decoration:none;
/*font-weight: 600;
font-size: 20px;*/
color:#ffffff;
/*padding-top:15px;
padding-bottom:15px;
padding-left:40px;
padding-right:40px;*/
background-color: transparent;
border-width: 1px;
border-style: solid;
border-color: #ffffff; border-radius:5px;
position: absolute;


margin-left: 1450px;
    
        }
        .boton:hover{
            background-color: white;
            color: black;
            
        }

    </style>
    <body onload="setcookie()" style="background-color: #d71a1f">

        <script type="text/javascript">
            function googleTranslateElementInit() {
                new google.translate.TranslateElement({
                    includedLanguages: 'en',
                    defaultLanguage: 'en'}, 'google_translate_element');
            }
        </script>
        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">
        </script>

        <!-- Modal -->
        <div class="modal fade" id="myModalspanish"  data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
                        <h6 class="modal-title" id="myModalLabel"> Subtitulado</h6>
                        <button id='empezar_grabar'  translate="no" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-play" data-toggle="tooltip" data-placement="top" title="Empieza a reproducir y grabar a la vez"></span> Empezar a grabar</button>
                    </div>
                    <div class="modal-body">
                        <!--contenido-->

                        <div class="panel panel-default">
                            <div class="panel-body" >
                           
                                <br><br>
                                <br>
                                <textarea placeholder="Aquí se convertirá el audio en texto" id='textArea' style="width: 1506px;height:500px;border-radius: 20px;border-width: 5px;padding-left: 10px"></textarea>                             
                                <br><br>
                                <!--           
                                <span id="grabando"></span>
                                            <h2>Seleccione el Genero de salida del audio, luego Clic en reproducir</h2>
                                            <input type="radio" id="genero" name="genero" value="US English Male">Hombre</input>
                                            <input type="radio" id="genero" name="genero" value="US English Female">Mujer</input>
                                            <button id='reproducir' data-toggle="modal" data-target="#myModal2" onclick="move()"><span class="glyphicon glyphicon-download-alt"></span>EXPORTAR</button>
                                            <br><br>-->
                                <br><br>
                                <div id="textArea2"  style="color: black; font-size: 2px"></div>
                                <div id="otro" style="color: black; font-size: 2px"></div>
                            </div></div>    


                    </div>

                </div>
            </div>
        </div>

        <div class="fondo" >
            <img src="images/crosscurricular-en-blanco-png.png" width=100% height="100%">        
        </div>
        <div>
            <button data-toggle="modal" data-target="#myModalspanish" class="btn btn-outline-light btn-block iconos">ESPAÑOL</button>
        </div
        <div>
            <button data-toggle="modal" data-target="#myModalenglish" class="btn btn-outline-light btn-block iconos" style="margin-top: 300px;">INGLES</button>
        </div>
        <div>
            <button data-toggle="modal" data-target="#myModalenglish_spanish" class="btn btn-outline-light btn-block iconos" style="margin-top: 400px;">INGLES - ESPAÑOL</button>
        </div>
        <div>
            <button data-toggle="modal" data-target="#myModalspanish_english" class="btn btn-outline-light btn-block iconos" style="margin-top: 500px;">ESPAÑOL - INGLES</button>
        </div>
        <div>
            <a href="nuevospeech.html" class="boton">Regresar a menu</a>
        </div>

        <script type="text/javascript">
            function setcookie() {
                document.cookie = "googtrans=/auto/en; expires=N/A;domain=192.168.1.26:8084;path=/";
            }


            var mic, recorder, soundFile;
            var statev = 0;
            var traducido = "";
            //////////////////////p5.js
            var myRec = new p5.SpeechRec();
            var tipo = 0;
            function setup() {
                // create an audio in
                mic = new p5.AudioIn();
                myRec.continuous = true;
                myRec.interimResults = true;
                myRec.defaultLanguage = "en-US";
                myRec.onResult = showResult;
                var ttt = "";
                var textArea = "";
                var tradd = "";
                var tre = "";
                function showResult()
                {
                    if (myRec.resultValue === true) {
                        if (myRec.resultConfidence >= 0.89 && myRec.resultConfidence <= 0.91) {

                            ttt = ttt + myRec.resultString;
                            textArea = document.getElementById("textArea");
                            textArea.innerHTML = " " + ttt;
                            document.getElementById("textArea2").innerHTML = myRec.resultString;
                            myRec.resultString = "";
                            window.setTimeout(obtener, 800);
                        }
                    }
                }
                function obtener() {

                    traducido = document.getElementById("textArea2").textContent;
                    tre = tre + traducido;

                    tradd = document.getElementById("traduc");
                    tradd.innerHTML = tre + " ";

                    responsiveVoice.speak(traducido, "US English Female", {pitch: 0}, {rate: 0});
                    document.getElementById("textArea2").innerHTML = myRec.resultString;
                }
                recorder = new p5.SoundRecorder();
                // connect the mic to the recorder
                recorder.setInput(mic);
                soundFile = new p5.SoundFile();
            }
            var genero = "";


            document.querySelector('#empezar_grabar').addEventListener('click', function () {
                myRec.start();
            });

            document.querySelector('#textArea').addEventListener('onchange', function () {
                var ooo = document.getElementById("textArea2").innerHTML = speechresult;
            });

            var text2 = '';

            function tranfe() {
                var ooo = document.getElementById("textArea2").innerHTML = speechresult;

            }
            function otrotras1() {
                var ori = document.getElementById("textArea2");
                traducido = document.getElementById("otro").innerHTML = ori.textContent;
                console.log(ori.textContent);
            }

        </script>


    </body>
</html>
