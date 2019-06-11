<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Last-Modified" content="-1">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="icon" type="image/png" href="js/favicon.png" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src='https://code.responsivevoice.org/responsivevoice.js'></script>
        <script language="javascript" type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/p5.js"></script>
        <script language="javascript" type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/addons/p5.dom.js"></script>
        <script language="javascript" type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/addons/p5.sound.js"></script>
        <script src="js/p5speech.js" type="text/javascript"></script>
        <title>Voice live</title>
    </head>
    
    <body onload="setcookie()" >
        <img src="images/crosscurricular-en-blanco-png.png" class="d-block w-100" width="800px" height="760px">
        <script type="text/javascript">
            function googleTranslateElementInit() {
                new google.translate.TranslateElement({
                    includedLanguages: 'en',
                    defaultLanguage: 'en'}, 'google_translate_element');
            }
        </script>

        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        <div class="panel panel-default">
            <div class="panel-body">

                <button id='empezar_grabar' translate="no" class="btn btn-success" data-toggle="modal" data-target="#myModal2" ><span class="glyphicon glyphicon-play" data-toggle="tooltip" data-placement="top" title="Empieza a reproducir y grabar a la vez"></span> Empezar a grabar</button>
                <br><br>
                <br>
                <table  class="table table-striped">
                    <tr>
                        <td>TRANSFERIDO </td><td>TRADUCIDO</td>
                    </tr>
                    <tr>  

                        <td><textarea placeholder="Aquí se convertirá el audio en texto" id='textArea' style="width: 500px;height:300px"></textarea></td>
                        <td><textarea placeholder="Aqui estara los traducido" id='traduc' style="width: 500px;height:300px"></textarea></td>
                    </tr>
                </table>
                <br><br>
<!--                <span id="grabando"></span>
                <h2>Seleccione el Genero de salida del audio, luego Clic en reproducir</h2>
                <input type="radio" id="genero" name="genero" value="US English Male">Hombre</input>
                <input type="radio" id="genero" name="genero" value="US English Female">Mujer</input>
                <button id='reproducir' data-toggle="modal" data-target="#myModal2" onclick="move()"><span class="glyphicon glyphicon-download-alt"></span>EXPORTAR</button>
                <br><br>-->
                <br><br>
                <div id="textArea2"  style="color: black; font-size: 12px"></div>
                <div id="otro" style="color: black; font-size: 12px"></div>
              </div>
            <script type="text/javascript">
                var myvideo;
                let playing = false;
                let fingers;
                let button;
                function setcookie() {
                    document.cookie = "googtrans=/auto/en; expires=N/A;domain=192.168.1.26:8084;path=/";
                }
                function move() {
                    var elem = document.getElementById("myBar");
                    var width = 1;
                    var tiempo = mySound.duration();
                    var id = setInterval(frame, tiempo * 10);
                    function frame() {
                        if (width >= 100) {
                            clearInterval(id);
                        } else {
                            width++;
                            elem.style.width = width + '%';
                        }
                        if (width === 100) {
                           
                            $('#myModal2').modal('hide');

                            recorder.stop();
                            responsiveVoice.cancel();
                            save(soundFile, 'mySound');
                        }
                    }
                }
                //inicializa el ToolTip
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip();
                })

                $('#myModal').modal({backdrop: 'static', keyboard: false});
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
                    var tradd="";
                    var tre="";
                    function showResult()
                    {
                        if (myRec.resultValue === true) {
                            if (myRec.resultConfidence >= 0.89 && myRec.resultConfidence <= 0.91) {

                                ttt = ttt + myRec.resultString;
                                textArea = document.getElementById("textArea");
                                textArea.innerHTML = " "+ttt;
                                document.getElementById("textArea2").innerHTML = myRec.resultString;
                                myRec.resultString = "";
                                window.setTimeout(obtener, 800);
                            }
                        }
                    }
                    function obtener() {

                        traducido = document.getElementById("textArea2").textContent;
                        tre=tre+traducido;
                        
                        tradd=document.getElementById("traduc");
                        tradd.innerHTML=tre+" ";
                        
                        responsiveVoice.speak(traducido, "US English Female", {pitch: 0}, {rate: 0});
                        document.getElementById("textArea2").innerHTML = myRec.resultString;
                    }

                    recorder = new p5.SoundRecorder();

                    // connect the mic to the recorder
                    recorder.setInput(mic);
                    soundFile = new p5.SoundFile();
                }
                var speechresult = '';
                const audiopl = new Audio();
                var speech = new webkitSpeechRecognition();
                speech.continuous = true;
                speech.interimResults = false;
                speech.lang = "en-US";
                speech.onstart = function ()
                {
                    console.log("inicio speech");
                    document.getElementById("grabando").innerHTML = "grabando";
                }

                speech.onresult = function (event)
                {
                    var textArea = document.getElementById("textArea");

                    textArea.innerHTML += event.results[event.results.length - 1][0].transcript;
                   document.getElementById("textArea2").innerHTML = textArea.textContent;
                    speechresult = textArea.value;
                    console.log(textArea);
                }
                speech.onend = function ()
                {
                    console.log("Fin speech");
                    document.getElementById("grabando").innerHTML = "No se reconocio voz alguna, se termino de grabar";
                }
                var genero = "";
//                document.querySelector('#reproducir').addEventListener('click', function () {
//                    genero = document.querySelector('input[name="genero"]:checked').value;
//                    console.log(genero);
//                    responsiveVoice.speak(traducido, genero, {
//                        pitch: 1
//                    }, {
//                        rate: 1.5
//                    });
//                    mic.start();
//                    recorder.record(soundFile);
//
//                });

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
