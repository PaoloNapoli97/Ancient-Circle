<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    List<Map<String, String>> listona = (List<Map<String, String>>) request.getAttribute("armaturedatabase");
    if (listona == null)
    {
        out.println("<html><body><h3>Nessun dato disponibile.</h3></body></html>");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Elenco armature</title>
    <link rel="stylesheet" href="armature.css">
</head>
<body>
	<div>
    	<a class="link-url" href="utente">Torna alla pagina precedente</a>
    </div>
    
    <h1>Elenco Armature</h1>
    <div class="container">
        <% for (Map<String, String> mappina : listona) { %>
            <div class="armature-container">
                <a href="cercaarmature?id=<%= mappina.get("id") %>">
                   <div class="immagine"> 
                   		<img src="<%= mappina.get("immagini") %>" alt="Immagine armature">
                   </div>
                   
                   <div class="text">
                    	<p><%= mappina.get("nome") %></p>
                  </div>
                </a>
            </div>
        <% } %>
    </div>
    
</body>
</html>