<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript --> 
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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
        .ratio:hover{

            transform: scale(1.3);
        }
        .boton{
            text-decoration:none;
            color:#ffffff;
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
        .videocla{
            margin: 0 auto;
            position: relative;
            border: 3px dashed white;
            align-self: center;
        }
        .area{
            width: 500px;
            height:300px;
            background-color: darkgrey;
        }
        .selidioma{
            color: black;
        }
        #caption {
            position: relative;
            width: 100%;
            bottom: 0;
            bottom:30px; /* space for the video controls */
            left: 0;
            text-align: center;
            font-family: sans-serif;
/*            font-weight: bold;*/
            color: white;
            text-shadow: black 1px 1px 3px;
            padding-bottom: .5em;
            font-size: 10px;
        }
        #transcript span {display:table-row;}
        #transcript [data-begin]:before{
            content: " [" attr(data-begin) "s-" attr(data-end)"s]   ";
            font-size:25%;
            display:table-cell;
            padding-right:1em;
        }
    </style>

    <body  style="background-color: #304597; color: white;">

        <!-- Modal -->
        <div class="modal fade" id="myModal2" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
                        <h4 class="modal-title selidioma" translate="false" id="myModalLabel">Eleccion del idioma del video</h4>
                    </div>
                    <div class="modal-body">

                        <div id="idiomaelec">
                            <button id="idio" name="idio" class="btn btn-success btn-block iconos"  onclick="idiomaes()" value="es">ESPAÑOL</button>
                            <button id="idio" name="idio" class="btn btn-success btn-block iconos"  onclick="idiomaen()" value="es">INGLES</button>
                        </div>
                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>
        <!--        <div class="modal fade" id="myModal3" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Progreso.....</h4>
                            </div>
                            <div class="modal-body">
        
                                <div id="myProgresss">
                                    <div id="myBarr"></div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="cerrar_prog" disabled="true" class="btn btn-default" data-dismiss="modal" onclick="tranfe()">Close</button>
        
                            </div>
                        </div>
                    </div>
                </div>-->

        <script type="text/javascript">
            function googleTranslateElementInit() {
                new google.translate.TranslateElement({
                    includedLanguages: 'en,es', layout: google.translate.TranslateElement.FloatPosition.TOP_RIGHT,
                    defaultLanguage: idiomatras}, 'google_translate_element');
            }
        </script>

        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        <%

            String archivourl = "C:\\Users\\C-02\\Desktop\\sistemas\\speech\\speech\\web\\video";
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(2048);
            factory.setRepository(new File(archivourl));
            ServletFileUpload upload = new ServletFileUpload(factory);
            String ruta_archivo = "";
            try {
                List<FileItem> partes = upload.parseRequest(request);

                for (FileItem items : partes) {
                    File file = new File(archivourl, items.getName());
                    items.write(file);
                    ruta_archivo = items.getName();
                }
            } catch (Exception e) {
                //.print("Exception: " + e.getMessage() + "");
            }

//            String tipo= request.getParameter("tipo");

        %>

        <div class="bd-example">
            <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel" data-interval="2000">
                <ol class="carousel-indicators">
                    <!--      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                          <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>-->

                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active" >
                        <img src="images/baneer-de--activacion-2.jpg" class="d-block w-100" width="100%" height="139px">
                        <div class="carousel-caption d-none d-md-block">
                            <!--          <h5>First slide label</h5>-->
                            <!--          <a href="audiototext.jsp" class="btn btn-light btn-outline-danger" > SUBIR AUDIO</a>
                                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                      <a href="p52.jsp" class="btn btn-light btn-outline-danger" > TRADUCTOR EN LINEA</a>-->

                        </div>
                    </div>
                    <div class="carousel-item" >
                        <img src="images/baner-de-activacion-2.jpg" class="d-block w-100" width="100%" height="139px" >
                        <div class="carousel-caption d-none d-md-block">
                            <!--          <h5>Second slide label</h5>-->
                            <!--          <a href="audiototext.jsp" class="btn btn-light btn-outline-danger" > SUBIR AUDIO</a>
                                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                      <a href="p52.jsp" class="btn btn-light btn-outline-danger" > TRADUCTOR EN LINEA</a>-->
                        </div>
                    </div>
                </div>
                <!--    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>-->
            </div>
        </div>

        <div class="panel panel-default ">
            <!--<div class="panel-heading" ><h4 align="center" >SPEECH TO TEXT - JUVENTUD GLOBALIZADA</h4><button class="btn btn-info" Data-toggle="tooltip" data-placement="top" title="Ayuda"> <span class="glyphicon glyphicon-question-sign"></span>Ayuda</button> </div>-->

            <div class="panel-body">
                <table>
                    <tr> <td> <a href="index.html" class="boton">Regresar a menu</a></td>
                        <td><h5 Style="margin-top: 20px">Importar Archivo:</h5></td>
                        <td width="300">
                            <jsp:include page="videototext.jsp" flush="true"/></td>


                        <td><h4 Style="margin-top: 20px"><span class="glyphicon glyphicon-music"></span>Nombre del archivo:<%=ruta_archivo%><span class="glyphicon glyphicon-music"></span></h4> </td>
                        <td>

                        </td>
                    </tr>
                </table>
                <div id="video" class="w-50 p-3 embed-responsive embed-responsive-16by9 offset-3">

                    <video id="videos" controls ontimeupdate="timeupdate()"
                           style="background:black" autobuffer preload="auto">
                        <source src="video/<%=ruta_archivo%>" width="320" height="220" type="video/mp4" />
                    </video>
                </div>
                <div id="transcript">
                    <h3>Transcript</h3>
                    <!--            <p>
                                    <span data-begin=1 data-end=6>Hi, my name's Dr Archimedes Einstein and I'm a Doctor of Science at the University of Science</span>
                                    <span data-begin=6 data-end=9>in a very famous town that you're too stupid to have heard of.</span>
                                    <span data-begin=9.5 data-end=11.5>Anyway, today we're going to talk about "synergies".</span>
                                    <span data-begin=12 data-end=15>A lot of people are worried about synergies, but I can tell you that</span>
                                     ... 
                                </p>-->
                </div>
                <br>
                <button id='empezar_grabar' translate="no" class="btn btn-outline-danger offset-5"><span class="glyphicon glyphicon-play" data-toggle="tooltip" data-placement="top" title="Empieza a reproducir y grabar a la vez"></span> <strong>Empezar a grabar</strong></button>
                <button id='exportar' onclick="exportar()" translate="no" class="btn btn-outline-light"><span class="glyphicon glyphicon-play" data-toggle="tooltip" data-placement="top" title="Empieza a reproducir y grabar a la vez"></span> <strong>Exportar a SRT</strong></button>

                <table  class="table table-striped" style="color: white; text-align: center;">
                    <tr>
                        <td><h4>TRANSFERIDO</h4> </td><td><h4>TRADUCIDO</h4></td>
                    </tr>
                    <tr>  
                        <td><textarea placeholder="Aqui estara los traducido" id='traduc' style="width: 500px;height:300px"></textarea><div id="textArea2" style="color: white; font-size: 2px"></div></td>
                        <td><textarea id='textArea' placeholder="Aqui estara los traducido" class="area" ></textarea></td>

                    </tr>
                    <tr>
                        <td>

                            <textarea id='srt' placeholder="aqui se colocara el contenido srt" style="width: 500px;height:300px" ></textarea>
                            <!--                            <button onclick="exportar()">expoooo</button>-->
                        </td>
                    </tr>
                </table>

                <script>
                    jQuery.noConflict();
                    var idioma = "";
                    var idiomatras = "es";
                    var name = "myModalenglish";
                    var genero = "";
                    var genero = "";
                    function genero3() {
                        genero = "US English Male";
                        console.log(genero);
                    }
                    function genero2() {
                        genero = "US English Female";
                        console.log(genero);
                    }
                    $(document).ready(function () {
                        estado1 = localStorage.getItem("estado");
                        if (estado1 == 0) {
                            $("#myModal2").modal('show');
                        }
                    });
                    function idiomaes() {
                        // localStorage.setItem("idioma", "Spanish Latin American Female");
                        idiomatras = "es";
                        document.cookie = "googtrans=/auto/" + idiomatras + "; expires=N/A;path=/";
//                        estado = localStorage.getItem("estado");
                        localStorage.setItem("key", "español");
//                        if (estado == "0") {
                        location.reload();
                        localStorage.setItem("estado", "1");
//                        }
                    }

                    function idiomaen() {

                        //localStorage.setItem("idioma", "US English Female");
                        idiomatras = "en";
                        document.cookie = "googtrans=/auto/" + idiomatras + "; expires=N/A;path=/";
//                        estado = localStorage.getItem("estado");
                        localStorage.setItem("key", "ingles");
//                        if (estado == "0") {

                        location.reload();
                        localStorage.setItem("estado", "1");
//                        }
                    }
                    var captions = [];
                    window.onload = function () {
                        //creamos el div
                        var caption = document.createElement('div');
                        caption.id = 'caption';
                        // Cargamos el primer elemento
                        var ref = document.getElementsByTagName('video')[0];
                        ref.parentNode.insertBefore(caption, ref.nextSibling);
                        // Cargamos todos los subtítulos
//                        var nodes = document.querySelectorAll('#transcript span');
//                        for (var i = 0; i < nodes.length; i++) {
//                            // Generamos un objeto con la información de cada línea
//                            var c = {
//                                'start': parseFloat(nodes[i].getAttribute('data-begin')),
//                                'end': parseFloat(nodes[i].getAttribute('data-end')),
//                                'text': nodes[i].textContent
//                            };
//                            console.log(c);
//                            captions.push(c);
//                        }
                    };
// Función que actualizar el texto dependiendo del tiempo
                    function timeupdate() {
                        var v = document.querySelector('video');
                        var now = v.currentTime;
                        var too = hora(now);
                        //console.log(too);
                        var tt = typeof now;
//                console.log(tt);
//                console.log(now);
                        var text = "";
                        for (var i = 0; i < captions.length; i++) {
                            if (now >= captions[i].start && now <= captions[i].end)
                            {
                                text = captions[i].text;
                               
                                break;
                            }
                        
                        if(now==captions[i].start){
                             responsiveVoice.speak(text, "US English Female", {pitch: 1}, {rate: 0});
                        }
                    }
                        document.getElementById('caption').innerHTML = text;
                    }
                    document.write('<style>#transcript{display:none}</style>');
                </script>

                <br><br>
                <span id="grabando"></span>
                <!--                <h2>Seleccione el Genero de salida del audio, luego Clic en reproducir</h2>
                
                                <label for="genero" class="ratio" >
                                    <img src="images/icono-hombre-1.png" onclick="genero3()">
                                </label> 
                
                                <input type="radio" id="genero" name="genero" value="US English Male" style="display: none"></input>
                
                                <label for="genero" class="ratio" >
                                    <img src="images/icono-mujer-1.png" onclick="genero2()"  >
                                </label> 
                
                                <input type="radio" id="genero" name="genero" value="US English Female" style="display: none"></input>
                
                
                                <button id='reproducir' data-toggle="modal" data-target="#myModal3" onclick="move()"><span class="glyphicon glyphicon-download-alt"></span>EXPORTAR</button>-->
                <!--                <button id='parar' ><span class="glyphicon glyphicon-stop"></span>parar</button>
                                <button id='exportar' ><span class="glyphicon glyphicon-stop"></span>exportar</button>-->
                <br><br>
                <!--                <button id='reproducirtras' class="btn btn-primary btn-xs" Data-toggle="tooltip" data-placement="top" title="1°- Tranfiere el texto captado y lo tranfiere al traductor"><span class="glyphicon glyphicon-stop" ></span>Transferir</button> 
                                <button id='reproducire' class="btn btn-primary btn-xs" Data-toggle="tooltip" data-placement="top" title="2°- Traduce lo tranferido al idioma seleccionado" onclick="otrotras()"><span class="glyphicon glyphicon-stop"></span>Traducir</button><br><br>  -->
                <br><br>

                <div id="otro" style="color: white; font-size: 2px"></div>
                <div id="bb" style="color: #304597; font-size: 1px">
                </div>
                <!--                <table  class="table table-striped">
                                    <tr>#304597
                                        <td>TRANFERIDO</td><td>TRADUCIDO</td>
                                    </tr>
                                    <tr>  
                                        <td><div id="textArea2" style="color: white; font-size: 2px"></div></td>
                                        <td><div id="otro" style="color: white; font-size: 2px"></div></td>
                                    </tr>
                                </table>-->

            </div>
            <script type="text/javascript">
                jQuery.noConflict();
                function setcookie() {
                    document.cookie = "googtrans=/auto/en; expires=N/A;path=/";
                }
                function hora(segundos) {
                    var d = new Date(segundos * 1000);
                    //console.log(d);
                    // Ajuste de las 23 horas
                    //var hora = (d.getHours() === 0) ? 23 : d.getHours() - 1;
                    var hora = 00;
                    //var hora2 = (hora < 9) ? "0" + hora : hora;
                    var minuto = (d.getMinutes() < 9) ? "0" + d.getMinutes() : d.getMinutes();
                    var segundo = (d.getSeconds() < 9) ? "0" + d.getSeconds() : d.getSeconds();
                    var mili = (d.getMilliseconds() < 99) ? "00" + d.getMilliseconds() : d.getMilliseconds();
                    return hora + ":" + minuto + ":" + segundo + "," + mili;
                }

                var word = [];
                var wordd = [];
                var wt=[];
                var est = 1;
                var videop;
                function move() {
                    var elem = "";
                    var elem = document.getElementById("myBarr");
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
                            $('#myModal3').modal('hide');
                            $('.modal-backdrop').remove();
                            recorder.stop();
                            responsiveVoice.cancel();
                            save(soundFile, 'mySound');
                        }
                    }
                }


                //$('#myModal2').modal({backdrop: 'static', keyboard: false});
                var mic, recorder, soundFile;
                var statev = 0;
                var traducido = "";
                //////////////////////p5.js
                var vid;
                var tipo = 0;
                function vidLoad() {
                    vid.loop();
                    vid.volume(1);
                    document.getElementById("video").innerHTML = vid;
//        vid.position(300,300);    
                }
                function setup() {

                    // var tipo = "/<%=ruta_archivo%>";
                    //  var tipo2 = tipo.substr(-3);
                    //  console.log(tipo2);
//                    noCanvas();
//                    var vc = createCanvas(500, 500);
                    // vid = createVideo(['video/<%=ruta_archivo%>'], vidLoad);
                    //                      vc.position(800,400);

                    //vid.size(800,800);                 

                }


                var speechresult = '';
                class Queue {
                    constructor() {
                        this.queue = [];
                    }
                    enqueue(element) {
                        this.queue.push(element);
                        return this.queue;
                    }
                    dequeue() {
                        return this.queue.shift();
                    }
                    peek() {
                        return this.queue[0];
                    }
                    size() {
                        return this.queue.length;
                    }
                    isEmpty() {
                        return this.queue.length === 0;
                    }
                    print() {
                        return this.queue;
                    }
                }

                const queue = new Queue();
                const queue2 = new Queue();
                const audiopl = new Audio();
                var text2 = '';
                text2 = document.getElementById("textArea2");
                textArea = document.getElementById("textArea");
                var speech = new webkitSpeechRecognition();
                speech.continuous = true;
                speech.interimResults = true;
                speech.lang = "es-ES";
                var inte = "";
                var ini = 0;
                speech.onstart = function ()
                {
                    console.log("inicio speech");
                    document.getElementById("grabando").innerHTML = "grabando";
                }
                traduc = document.getElementById("traduc");
                let finalTranscript = "";
                speech.onresult = function (event)
                {
                    var len = event.results.length - 1;
                    //inte += event.results[len][0].transcript;
                    let interimTranscript = "";
                    for (let i = event.resultIndex, len = event.results.length; i < len; i++) {
                        let transcript = event.results[i][0].transcript;
                        if (event.results[i].isFinal) {
                            finalTranscript += transcript;
                            ini = 0;
                            var a = "";
                            a = event.results[i][0].transcript;
                            queue.enqueue(a);
                            text2.innerHTML = queue.peek();
                            queue.dequeue();
                            var f = videop.currentTime;
                            var final = hora(f);
                            word.push(final);
                            wt.push(f);
                            console.log(word);
                            test = 1;
                            if (test == 1) {
                                test = 0;
                                window.setTimeout('obtener()', 1500);
                            }
                        } else {
                            interimTranscript += transcript;
                            var con = interimTranscript.length;
                            if (con >= 0) {

                                if (ini == 0) {
                                    var inic = videop.currentTime;
                                    var inicio = hora(inic);
                                    word.push(inicio);
                                    wt.push(inic);
                                    console.log(word);
                                }
                                ini++;
                            }


                        }
                    }
                    document.querySelector("#traduc").innerHTML = finalTranscript + interimTranscript;
//                    if (event.results[len].isFinal) {
//                        var a = "";
//
//                        a = event.results[len][0].transcript;
//                        queue.enqueue(a);
//                        text2.innerHTML = queue.peek();
//                        queue.dequeue();
//                        var f = videop.currentTime;
//                        var final = hora(f);
//                        word.push(final);
//                        console.log(word);
//                        test = 1;
//                        if (test == 1) {
//                            test = 0;
//                            window.setTimeout('obtener()', 900);
//
//                        }
//                    }
                };
                function obtener() {

                    traducido = document.getElementById("textArea2").textContent;
                    queue2.enqueue(traducido);
                    console.log(traducido);
                    wordd.push(traducido);
                    console.log(wordd);
                    tra = queue2.peek();
                    queue2.dequeue();
                    textArea.innerHTML += tra;
                    // responsiveVoice.speak(tra, idioma, {pitch: 1}, {rate: 0});

                }
                var n = 0

                function exportar() {
                    var max = 1 + word.length;
                    var max2 = wordd.length;
                    var box = document.getElementById("srt");
                    var x = 0;
                    for (var o = 1; o <= max / 2; o++) {
                        box.innerHTML += o + "\n";
                        for (var u = 0; u < 1; u++) {

                            box.innerHTML += word[x] + " --> " + word[x + 1] + "\n";
                            var c = {
                                'start': parseFloat(wt[x]),
                                'end': parseFloat(wt[x + 1]),
                                'text': wordd[o - 1]
                            };
                            captions.push(c);
                            console.log(c);
                            x += 2;
                        }
                        box.innerHTML += "<font size='15px'>" + wordd[o - 1] + "\n" + "\n";
                    }




                }
//                speech.onspeechstart = function () {
//                var n=videop.currentTime;
//                console.log(n);
//                console.log("comenzo hablar");
//                     };
//                     
//                speech.onspeechend = function () {
//                var m=videop.currentTime;
//                console.log(m);
//                console.log("finalizo hablar");
//                    };

//                var i = 0;
//                speech.onspeechstart = function () {
//
//                    var t = videop.currentTime;
//
//                    var tim = hora(t);
//                    word.push(tim);
////                    wor = {
////                        star: tim,
////                        end: tim,
////                        text: "hola mundo"
////                    };
//                    //word.push(wor);
//                    console.log(word);
//
//                };
//                speech.onspeechend = function () {
//                    var t = videop.currentTime;
//
//                    var tim = hora(t);
//
//                    word.push(tim);
//
//                    console.log(word);
//
//                };
//        var textArea = document.getElementById("textArea");
//
//                    textArea.innerHTML += event.results[event.results.length - 1][0].transcript;
//                    // textArea.replace("\n", "<br>");
//                    document.getElementById("textArea2").innerHTML = textArea.textContent;
//
//                    speechresult = textArea.value;
//                    console.log(textArea);

                speech.onend = function ()
                {
                    console.log("Fin speech");
                    console.log(word);
                    if (est == 1) {
                        est = 0;
                        speech.start();
                    }

                };
//                document.querySelector('#reproducir').addEventListener('click', function () {
////                    genero = document.querySelector('img[name="genero"]:checked').value;
//                    console.log(genero);
//
//                    responsiveVoice.speak(traducido, genero, {
//                        pitch: 1
//                    }, {
//                        rate: 1
//                    });
//                    mic.start();
//                    recorder.record(soundFile);
//
//                });

                document.querySelector('#empezar_grabar').addEventListener('click', function () {
                    videop = document.getElementById("videos");
                    speech.start();
                    //mySound.play();
                    videop.play();
                    //vid.play();
                    var ti = videop.duration;
//                    var tii = videop.currentTime;
                    //console.log(tii);

                    videop.addEventListener("timeupdate", function (ev) {
                        a = videop.currentTime;
                        //var tim = hora(a);

                        //aa = typeof a;
                        //console.log(aa);
                        //var x = Math.floor(a);
                        //console.log(x);


                        if (ti == a) {
                            speech.stop();
                        }
                    }, true);
                });
//                    (function me() {
//                        // $('#myModal2').modal({backdrop: 'static', keyboard: false});
//                        var elem = document.getElementById("myBar");
//                        var width = 1;
//                        var tiempo = videop.duration;
//
//                        var id = setInterval(frame, tiempo * 10);
//
//                        function frame() {
//                            if (width >= 100) {
//                                clearInterval(id);
//                            } else {
//                                width++;
//                                elem.style.width = width + '%';
//                            }
//                            if (width === 100) {
//                                $('#myModal2').modal('hide');
//                                $('.modal-backdrop').remove();
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




//                document.querySelector('#textArea').addEventListener('onchange', function () {
//                    var ooo = document.getElementById("textArea2").innerHTML = speechresult;
//                });
//
//                var text2 = '';
//
//                function tranfe() {
//                    var ooo = document.getElementById("textArea2").innerHTML = speechresult;
//
//                }
//                function otrotras1() {
//                    var ori = document.getElementById("textArea2");
//                    traducido = document.getElementById("otro").innerHTML = ori.textContent;
//                    console.log(ori.textContent);
//                }

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
                        save(soundFile, 'mySound');
                        statev++;
                    }
                }





            </script>


    </body>
</html>
