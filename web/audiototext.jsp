<!DOCTYPE html>
<html lang="en-US">
    <head>
        <title>Juventud globalizada</title>
        <meta charset="UTF-8">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src='https://code.responsivevoice.org/responsivevoice.js'></script>

    </head>


    <!--<body oncontextmenu="return false" onkeydown="return false">-->
    <body>
        <jsp:include page="nuevospeech.html"></jsp:include>

        <div class="panel panel-default">
            <div class="panel-heading" ><h4 align="center">SPEECH TO TEXT - JUVENTUD GLOBALIZADA</h4></div>

            <form action="uploadfile.jsp" method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td>
                            <!--<input type="hidden" value="1" name="tipo" id="tipo"></input>--> 

                            <input type="file" id="file" name="file" onchange="an()"/>
                            <input type="submit" id="sub" value="SUBIR ARCHIVO" disabled="true" />

                        </td>
                    </tr>
                </table>
            </form>
            <script>
                function an(){

                    var w=document.getElementById("file").value;
                    
                    var z=w.substr(-3);
                    
                if (z!== "") {
                   if(z=="mp3" || z=="mp4" || z=="MP3" || z=="MP4") {
                       
                   document.getElementById("sub").disabled=false;
                    }

                }
                }
            </script>


</html>