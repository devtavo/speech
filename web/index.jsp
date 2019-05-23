

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SUBIR ARCHIVO AL SERVIDOR</title>
    </head>
    <body>
        <form action="uploadfile.jsp" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>
                        <input type="file" name="file"/>
                        <input type="submit" value="SUBIR ARCHIVO"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
