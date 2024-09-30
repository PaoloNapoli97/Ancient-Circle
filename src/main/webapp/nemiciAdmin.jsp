<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    List<Map<String, String>> listona = (List<Map<String, String>>) request.getAttribute("nemicidatabase");
    if (listona == null) {
        out.println("<html><body><h3>Nessun dato disponibile.</h3></body></html>");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Elenco Nemici</title>
    <link rel="stylesheet" href="nemici.css">
</head>
<body>
<div>
    <a class="link-url" href="admin">Torna alla pagina precedente</a>
   </div>
<div class="titolo">
    <h1>Elenco Nemici</h1>
    </div>
    <div  class=container>
        <% for (Map<String, String> mappina : listona) { %>
            <div class="nemico-container">
                <a href="cercanemicoadmin?id=<%= mappina.get("id") %>">
                <img src="<%= mappina.get("immagini") %>" alt="Immagine Nemico">
                 <p><%= mappina.get("nome") %></p>
                </a>
            </div>
        <% } %>
   </div>
</body>
</html>