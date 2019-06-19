<!DOCTYPE html>
<html lang="en-US">
    <head>
        <title>Juventud globalizada</title>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="js/favicon.png" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript --> 
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src='https://code.responsivevoice.org/responsivevoice.js'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    </head>
    <body>
        <style>
            .subir{
                margin-top:10px;
                padding: 5px 10px;
                /*                background: inactiveborder;
                                color: black;
                /*                border:1px solid #fff;*/


            }
            .subir:hover{
                margin-top:10px;
                padding: 5px 10px;
                /*                background: gray;
                                color: #000640;*/
                /*                border:1px ;*/
                transform:scale(1.2);

            }

            .subird{
                padding: 5px 10px;
                /*                background: #f55d3e;
                                color:#fff;*/
                border:0px solid #fff;
            }
        </style>
        <script>

            function cambiar() {
                var pdrs = document.getElementById('file2').files[0].name;
                document.getElementById('info').innerHTML = pdrs;
            }
            function an() {
                var w = document.getElementById("file2").value;

                var z = w.substr(-3);

                if (z !== "") {
                    if (z == "mp3" || z == "mp4" || z == "MP3" || z == "MP4") {

                        document.getElementById("subir").disabled = false;
                    }

                }
            }
        </script>

        <form id="formulario" method="post" action="uploadfile.jsp" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>
                        <!--<input type="hidden" value="1" name="tipo" id="tipo"></input>--> 
                        <label for="file2" class="subir">

                            <img src="images/subir-archivo-2.png" alt=""/>
                        </label> 
                        
                        <input type="file" id="file2" name="file2" onchange="cambiar(), an()" style="display: none;"/>

                        <input type="submit" class="btn btn-outline-light" id="subir" value="SUBIR ARCHIVO"  disabled="true" />
                        <div id="info" style="display: none"></div>
                    </td>
                </tr>
            </table>
        </form>

        <div id="rta">
        </div>


</html>