<%-- 
    Document   : traductor2
    Created on : 11/06/2019, 03:24:18 PM
    Author     : C-01
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="icon" type="image/png" href="js/favicon.png" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript --> 
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>


<script src='https://code.responsivevoice.org/responsivevoice.js'></script>
        <title>Traductor</title>
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

    </style>

    <body style="background-color: #d71a1f">


        <!-- Modal -->
        <div class="modal fade" id="myModal2"  data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
                        <h4 class="modal-title" id="myModalLabel">Subtitulado</h4>
                    </div>
                    <div class="modal-body">
                         <!--contenido-->
                         <textarea  >
                             
                         </textarea>
                       
                    </div>
                    
                </div>
            </div>
        </div>

        <div class="fondo" >
            <img src="images/crosscurricular-en-blanco-png.png" width=100% height="100%">        
        </div>
        <div>
            <button data-toggle="modal" data-target="#myModal2" class="btn btn-outline-light btn-block iconos">ESPAÑOL</button>
        </div
        <div>
            <button class="btn btn-outline-light btn-block iconos" style="margin-top: 300px;">INGLES</button>
        </div>
        <div>
            <button class="btn btn-outline-light btn-block iconos" style="margin-top: 400px;">INGLES - ESPAÑOL</button>
        </div>
        <div>
            <button class="btn btn-outline-light btn-block iconos" style="margin-top: 500px;">ESPAÑOL - INGLES</button>
        </div>
    </body>
</html>
