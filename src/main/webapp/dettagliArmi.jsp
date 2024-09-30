<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    Map<String, String> armi = (Map<String, String>) request.getAttribute("armidatabase");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dettagli armi</title>
<link rel="stylesheet" href="dettagliArmi.css">
</head>
<body>
	  <!-- Un bottone per tornare alla lista di tutti i nemici -->
        <a href="armi" class="link-url">Torna all'elenco dei nemici</a>
    <h1>Dettagli delle armi</h1>

    <div class="armi-container">
        <img src="<%= armi.get("immagini") %>" alt="Immagine Nemico">
                    <h2 style="color: white;"><%= armi.get("nome") %></h2>
                    <table>
                        <thead>
                            <tr>
                                <th>TIPOLOGIA</th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th>DANNO</th>
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><p><%= armi.get("tipoDanno") %></p></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><p><%= armi.get("danno") %></p></td>
                        </tr>
                        </tbody>
                 </table>
            <p><%= armi.get("descrizione") %></p>
      
    </div>
</body>
</html>