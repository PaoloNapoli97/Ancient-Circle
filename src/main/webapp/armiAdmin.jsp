<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    List<Map<String, String>> listona = (List<Map<String, String>>) request.getAttribute("armidatabase");
    if (listona == null) {
        out.println("<html><body><h3>Nessun dato disponibile.</h3></body></html>");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Elenco armi</title>
    <link rel="stylesheet" href="armi.css">
</head>
<body>
	  <div>
    	<a class="link-url" href="admin">Torna alla pagina precedente</a>
    </div>
    
    <h1>ELENCO ARMI</h1>
    <div class="container">
        <% for (Map<String, String> mappina : listona) { %>
            <div class="armi-container">
                <a href="cercaarmiadmin?id=<%= mappina.get("id") %>">
                    <img src="<%= mappina.get("immagini") %>" alt="Immagine arma">
                    <p class="link-url"><%= mappina.get("nome") %></p>
                </a>
            </div>
        <% } %>
    </div>
</body>
</html>