<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    Map<String, String> nemici = (Map<String, String>) request.getAttribute("nemicidatabase");
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Dettagli Nemico</title>
	<link rel="stylesheet" href="dettagliNemico.css">
	</head>
	<body>
		<div class="back">
	        <a href="nemici" class="link-url">Torna all'elenco dei nemici</a>
	    </div>
	    <h1 style="text-align: center; color: white;">Dettagli del Nemico</h1>
	
	    <div class="nemico-container">
	       	<div class="img-nemico">
				<img src="<%= nemici.get("immagini") %>" alt="Immagine Nemico">
			</div>

	         <h2  style="color: white;"><%= nemici.get("nome") %></h2>
	        <table>
			    <thead>
			        <tr>
			            <th>HP</th>
						<th></th>
	                    <th></th>
	                    <th></th>
			            <th>ATTACCO</th>
						<th></th>
	                    <th></th>
	                    <th></th>
			            <th>DIFESA</th>
						<th></th>
	                    <th></th>
	                    <th></th>
			            <th>TIPOLOGIA</th>
						<th></th>
	                    <th></th>
	                    <th></th>
			            <th>SPECIE</th>
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			            <td><p><%= nemici.get("hp") %></p></td>
						<td></td>
	                    <td></td>
	                    <td></td>
			            <td><p><%= nemici.get("attacco") %></p></td>
						<td></td>
	                    <td></td>
	                    <td></td>
			            <td><p><%= nemici.get("difesa") %></p></td>
						<td></td>
	                    <td></td>
	                    <td></td>
			            <td><p><%= nemici.get("tipologia") %></p></td>
						<td></td>
	                    <td></td>
	                    <td></td>
			            <td><p><%= nemici.get("specie") %></p></td>
			        </tr>
			    </tbody>
			</table>
						<div class="des">
							<p><%= nemici.get("descrizione") %></p>
						</div>
							<div class="calcolatore">
							 	<a href="calcolatore?nomeNemico=<%= nemici.get("nome") %>">VAI AL CALCOLATORE DANNI</a>
							</div>
			</div>
	</body>
</html>
