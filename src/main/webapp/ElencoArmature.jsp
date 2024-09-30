<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%
List<Map<String,String>> listona = (List<Map<String,String>>) request.getAttribute("armaturedatabase");
if (listona == null) {
    out.println("Nessun dato disponibile.");
    return; 
}
%>


<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Elenco Armature</title>
	</head>
	<body>
		<h2>Armature Potenti</h2>
		<br><br>
		<% for(Map<String,String> mappina : listona) 
		{%>
		<tr>
			<td><%=mappina.get("nome") %></td>
			<td><%=mappina.get("difesa") %></td>
			<td><%=mappina.get("dmgReduction") %></td>
			<td><img src="<%= mappina.get("immagini") %>" alt="Immagine Nemico" style="width: 100px; height: auto;"></td>
			<a href="formmodificaarmatura?id=<%=mappina.get("id") %>">MODIFICA</a>
			<a href="eliminaarmatura?id=<%=mappina.get("id") %>">ELIMINA</a>
		</tr>
		<br>
		<%} %>

	</body>
</html>