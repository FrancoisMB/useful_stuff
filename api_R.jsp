<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Script R</title>
</head>
<body>
<pre>
<%
String idsimu = request.getParameter("idsimu");
String lat = request.getParameter("lat");
String longitude = request.getParameter("long");
if(idsimu==null||lat==null || longitude==null)
{
    out.println("Missing parameters idsimu/lat/long");
    return;
}
String command = "Rscript /home/isochrone/3_isochrone2postgres_wgs84_diamond.R "+idsimu+" "+lat+" "+longitude;
response.addHeader("Access-Control-Allow-Origin", "*");
out.println("* Execute "+command);
java.lang.Process p = Runtime.getRuntime().exec(command);
p.waitFor();
String output = org.apache.commons.io.IOUtils.toString(p.getInputStream());
String errorOutput = org.apache.commons.io.IOUtils.toString(p.getErrorStream());
out.println("* stdout: "+output);
out.println("* stderr: "+errorOutput);
%>
</pre>
</body>
