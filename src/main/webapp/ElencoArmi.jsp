<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%List<Map<String,String>> listona = (List<Map<String,String>>)request.getAttribute("armidatabase"); %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Elenco Armi</title>
	</head>
	<body>
		<h2>Armi Potenti</h2>
		<br><br>
		<% for(Map<String,String> mappina : listona) 
		{%><tr>
			<td><%=mappina.get("nome") %></td>
			<td><%=mappina.get("tipoDanno")%></td>
			<td><%=mappina.get("danno") %></td>
			<td><img src="<%= mappina.get("immagini") %>" alt="Immagine Nemico" style="width: 100px; height: auto;"></td>
			<a href="formmodifica?id=<%=mappina.get("id") %>">MODIFICA</a>
			<a href="elimina?id=<%=mappina.get("id") %>">ELIMINA</a>
			</tr>
			<br>
		<%} %>

	</body>
</html>