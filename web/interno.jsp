<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%
            String archivourl = "C:\\Users\\C-01\\Documents\\NetBeansProjects\\speech\\web\\audios";
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(1024);
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
                out.print("Exception: " + e.getMessage() + "");
            }
            
//            String tipo= request.getParameter("tipo");
            
        %> <%@include  file="audiototext.jsp" %> 
        <%=ruta_archivo %>