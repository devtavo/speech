<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Last-Modified" content="-1">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src='https://code.responsivevoice.org/responsivevoice.js'></script>
        <script language="javascript" type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/p5.js"></script>
        <script language="javascript" type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/addons/p5.dom.js"></script>
        <script language="javascript" type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/addons/p5.sound.js"></script>
        <script src="js/p5speech.js" type="text/javascript"></script>
        <title>SUBIENDO ARCHIVO...</title>
    </head>
    <style>
        #myProgress {
            width: 100%;
            background-color: #ddd;
        }
        #myProgresss {
            width: 100%;
            background-color: #ddd;
        }
        #myBar {
            width: 1%;
            height: 30px;
            background-color: #4CAF50;
        }
        #myBarr {
            width: 1%;
            height: 30px;
            background-color: #4CAF50;
        }
    </style>
    <body onload="setcookie()">

        <jsp:include page="nuevospeech.html"></jsp:include>
        <!-- Modal -->
        <div class="modal fade" id="myModal23" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Listado de Idiomas</h4>
                    </div>
                    <div class="modal-body">
                        <div id="google_translate_element"></div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <!--        <div class="modal fade" id="myModal2" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Progreso.....</h4>
                            </div>
                            <div class="modal-body">
        
                                <div id="myProgress">
                                    <div id="myBar"></div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="cerrar_prog" disabled="true" class="btn btn-default" data-dismiss="modal" onclick="tranfe()">Close</button>
        
                            </div>
                        </div>
                    </div>
                </div>-->

        <!--        <div class="modal fade" id="myModal3" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabell">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabell">Progreso.....</h4>
                            </div>
                            <div class="modal-body">
        
                                <div id="myProgresss">
                                    <div id="myBarr"></div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                                        <button type="button" id="cerrar_prog" disabled="true" class="btn btn-default" data-dismiss="modal">Close</button>
        
                            </div>
                        </div>
                    </div>
                </div>-->
        <script type="text/javascript">
            function googleTranslateElementInit() {
                new google.translate.TranslateElement({
                    includedLanguages: 'en',
                    defaultLanguage: 'en'}, 'google_translate_element');
            }


        </script>


        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>



        <div class="panel panel-default">
            <!--<div class="panel-heading" ><h4 align="center" >SPEECH TO TEXT - JUVENTUD GLOBALIZADA</h4><button class="btn btn-info" Data-toggle="tooltip" data-placement="top" title="Ayuda"> <span class="glyphicon glyphicon-question-sign"></span>Ayuda</button> </div>-->

            <div class="panel-body">

                <!-- Button trigger modal -->
                <!--                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                    CAMBIA EL IDIOMA
                                </button>   -->
                <button id='empezar_grabar' translate="no" class="btn btn-success" data-toggle="modal" data-target="#myModal2" ><span class="glyphicon glyphicon-play" data-toggle="tooltip" data-placement="top" title="Empieza a reproducir y grabar a la vez"></span> Empezar a grabar</button>
                <!--<button id='terminar_grabar'  class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Para la reproducción y la grabación"><span class="glyphicon glyphicon-stop"></span>Terminar de grabar</button>-->
                <!--<h4><span class="glyphicon glyphicon-music"></span>Nombre del archivo:><span class="glyphicon glyphicon-music"></span></h4>-->
                <br><br>
                <br>
                <table  class="table table-striped">
                    <tr>
                        <td>TRANSFERIDO </td><td>TRADUCIDO</td>
                    </tr>
                    <tr>  

                        <td><textarea  placeholder="Aquí se convertirá el audio en texto" id='textArea' style="width: 500px;height:300px"></textarea></td>
                        <td> <textarea placeholder="Aqui estara los traducido" id='traduc' style="width: 500px;height:300px"></textarea></td>
                    </tr>
                </table>
                <!--                <button id="video" onclick="vidLoad()">video</button>-->


                <br><br>
                <span id="grabando"></span>
                <h2>Seleccione el Genero de salida del audio, luego Clic en reproducir</h2>
                <input type="radio" id="genero" name="genero" value="US English Male">Hombre</input>
                <input type="radio" id="genero" name="genero" value="US English Female">Mujer</input>
                <button id='reproducir' data-toggle="modal" data-target="#myModal2" onclick="move()"><span class="glyphicon glyphicon-download-alt"></span>EXPORTAR</button>
                <!--                <button id='parar' ><span class="glyphicon glyphicon-stop"></span>parar</button>
                                <button id='exportar' ><span class="glyphicon glyphicon-stop"></span>exportar</button>-->
                <br><br>
                <!--                <button id='reproducirtras' class="btn btn-primary btn-xs" Data-toggle="tooltip" data-placement="top" title="1°- Tranfiere el texto captado y lo tranfiere al traductor"><span class="glyphicon glyphicon-stop" ></span>Transferir</button> 
                                <button id='reproducire' class="btn btn-primary btn-xs" Data-toggle="tooltip" data-placement="top" title="2°- Traduce lo tranferido al idioma seleccionado" onclick="otrotras()"><span class="glyphicon glyphicon-stop"></span>Traducir</button><br><br>  -->
                <br><br>
                <div id="textArea2"  style="color: black; font-size: 12px"></div>
                <div id="otro" style="color: black; font-size: 12px"></div>
                <!--                <table  class="table table-striped">
                                    <tr>
                                        <td>TRANFERIDO</td><td>TRADUCIDO</td>
                                    </tr>
                                    <tr>  
                                        <td><div id="textArea2" style="color: white; font-size: 2px"></div></td>
                                        <td><div id="otro" style="color: white; font-size: 2px"></div></td>
                                    </tr>
                                </table>-->

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
                    //$('#myModal2').modal({backdrop: 'static', keyboard: false})
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
                            // document.getElementById("cerrar_prog").disabled=false;
                            $('#myModal2').modal('hide');

                            recorder.stop();
                            responsiveVoice.cancel();
                            save(soundFile, 'mySound.wav');
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
                    //          myRec.start();
                    myRec.onResult = showResult;

                    function showResult()
                    {
                        if (myRec.resultValue === true && myRec.resultConfidence >= 0.89) {
                            //background(192, 255, 192);
                            var ttt = "";
                            ttt = ttt + myRec.resultString;
                            var textArea = document.getElementById("textArea");
                            textArea.innerHTML = ttt;

                            document.getElementById("textArea2").innerHTML = speechresult = myRec.resultString;
                            traducido = document.getElementById("textArea2").textContent;
                            myRec.resultString = "";
                            window.setTimeout(obtener, 1000);
                            console.log(myRec.resultConfidence);

                            function obtener() {

                                //traducido = document.getElementById("textArea2").textContent;
                                traducido = document.getElementById("textArea2").textContent;
                                responsiveVoice.speak(traducido, "US English Female", {pitch: 0}, {rate: 0});

                            }

                            // console.log(myRec.resultString);
//                             document.getElementById("textArea2").innerHTML=speechresult;
//
//
//                                window.setTimeout( 
//                                    function() {
//                                 
//                                    var ori = document.getElementById("textArea2");
//                                    traducido = document.getElementById("otro").innerHTML = ori.textContent;
//                                    document.getElementById("traduc").innerHTML = traducido;
//                                    console.log(ori.textContent);
//                                    responsiveVoice.speak(ori.textContent,"US English Female" , { pitch: 0}, {rate: 0});
//                                                }                     
//                                       , 800);
//                                 traducido=document.getElementById("textArea2").textContent;
//                                    //  responsiveVoice.speak(traducido,"US English Male" , { pitch: 1}, {rate: 1.5});
//                                 console.log(ttt);
//                                 console.log(traducido);
//
//                        }

                        }


//                    myRec.onResult = function (event)
//                    {
//                        var textArea = document.getElementById("textArea");
//
//                        textArea.innerHTML += event.results[event.results.length - 1][0].transcript;
//                        // textArea.replace("\n", "<br>");
//                        document.getElementById("textArea2").innerHTML = textArea.textContent;
//
//                        speechresult = textArea.value;
//                        console.log(textArea);
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
                    // textArea.replace("\n", "<br>");
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
                document.querySelector('#reproducir').addEventListener('click', function () {
                    genero = document.querySelector('input[name="genero"]:checked').value;
                    console.log(genero);
                    responsiveVoice.speak(traducido, genero, {
                        pitch: 1
                    }, {
                        rate: 1.5
                    });
                    mic.start();
                    recorder.record(soundFile);

                });



//                    document.querySelector('#textArea2').addEventListener('onchange', function () {
//                    //genero = document.querySelector('input[name="genero"]:checked').value;
//                    //console.log(genero);
//                    responsiveVoice.speak(traducido, "US English Male", {
//                        pitch: 1
//                    }, {
//                        rate: 1.5
//                    });
////                    mic.start();
////                    recorder.record(soundFile);
//
//                });

                document.querySelector('#empezar_grabar').addEventListener('click', function () {
                    //speech.start();
                    myRec.start();

//                    (function me() {
//                        var elem = document.getElementById("myBar");
//                        var width = 1;
                    /// var tiempo = mySound.duration();

//                        var id = setInterval(frame);

//                        function frame() {
//                            if (width >= 100) {
//                                clearInterval(id);
//                            } else {
//                                width++;
//                                elem.style.width = width + '%';
//                            }
//                            if (width === 100) {
//
//                                //document.getElementById("cerrar_prog").disabled=false;
//                                $('#myModal2').modal('hide');
//                                window.setTimeout(otrotras, 4000);
//                                function otrotras() {
//                                    var ori = document.getElementById("textArea2");
//                                    traducido = document.getElementById("otro").innerHTML = ori.textContent;
//                                    document.getElementById("traduc").innerHTML = traducido;
//                                    console.log(ori.textContent);
//                                }
//
//                            }
//                        }
//                    })();
//                    (function tr() {
//                        document.getElementById("textArea2").innerHTML = speechresult;
//                    })();

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
                function repro() {
                    // make sure user enabled the mic
                    document.getElementById("reproducir").innerHTML = "Parar";

                    mic.start();
                    if (statev === 0 && mic.enabled) {
                        recorder.record(soundFile);
                        statev++;
                        console.log(statev);

                        document.getElementById("reproducir").disabled = false;

                    } else if (statev === 1) {
                        recorder.stop();
                        responsiveVoice.cancel();
                        document.getElementById("reproducir").innerHTML = "exportar";
                        statev++;
                    } else if (statev === 2) {
                        //soundFile.play(); // play the result!
                        save(soundFile, 'mySound.wav');
                        statev++;
                    }
                }
            </script>


    </body>
</html>
