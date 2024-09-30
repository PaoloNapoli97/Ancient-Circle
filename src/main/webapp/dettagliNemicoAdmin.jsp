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
		<div>
	        <a href="nemiciadmin" class="link-url">Torna all'elenco dei nemici</a>
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
		</div>
		<div style="text-align: center;"><p><%= nemici.get("descrizione") %></p>
							<input type="button" class="btn" value="Modifica" onclick="attivNemici()">
		</div>
		<br>		
		<br>
		<div id="nemici" style="display: none;">
			<form method="get" action="modificanemico" name="nemico">
				<table>
					<tr>
						<td>
							<input type="button" value="x" class="chiudi" onclick="chiudiForm()">
						</td>
					</tr>
					<tr>
						<td>
							id
						</td>
						<td>
							<input type="text" id="id" name="id" value="<%= nemici.get("id") %>">
						</td>
					</tr>
					<tr>
						<td>
							Nome nemico
						</td>
						<td>
							<input type="text" name="nome" value="<%= nemici.get("nome") %>">
						</td>
					</tr>
					<tr>
						<td>
							Vita nemico
						</td>
						<td>
							<input type="number" name="hp" value="<%= nemici.get("hp") %>">
						</td>
					</tr>
					<tr>
						<td>
							Attacco
						</td>
						<td>
							<input type="number" name="attacco" value="<%= nemici.get("attacco") %>">
						</td>
					</tr>
					<tr>
						<td>
							Difesa
						</td>
						<td>
							<input type="number" name="difesa"value="<%= nemici.get("difesa") %>">
						</td>
					</tr>
					<tr>
						<td>
							Tipologia nemico
						</td>
						<td>
							<select name="tipologia" >
							<option value="<%= nemici.get("tipologia") %>" selected hidden>scegli il tipo di nemico</option>
								<option value="volante">VOLANTE</option>
								<option value="gelo">GELO</option>
								<option value="fuoco">FUOCO</option>
								<option value="magia">MAGIA</option>
								<option value="fisico">FISICO</option>
								<option value="sanguinamento">SANGUINAMENTO</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>
							Specie nemico
						</td>
						<td>
							<input type="text" name="specie" value="<%= nemici.get("specie") %>">
						</td>
					</tr>
					<tr>
						<td>
							Descrizione
						</td>
						<td>
							<input type="text" name="descrizione" value="<%= nemici.get("descrizione") %>">
						</td>
					</tr>
					<tr>
						<td>
							Boss
						</td>
						<td>
						   <select name="isBoss" id="isBoss" value="<%= nemici.get("isBoss") %>">
								<option value="1">SI</option>
								<option value="0">NO</option>
						   </select>
						</td>
					</tr>
					<tr>
						<td>
							Immagine
						</td>
						<td>
							<input type="text" name="immagini"value="<%= nemici.get("immagini") %>">
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="SALVA" onclick="salvaNemico(id.value,nome.value,hp.value,attacco.value,tipologia.value,specie.value,descrizione.value,isBoss.value,immagini.value);">
						</td>
						<td>
							<input type="button" onclick="pulisci()" value="PULISCI">
					   </td>
					</tr>
				</table>
			</form>
		</div>

	</body>
	<script src="dettagliAdmin.js"></script>
</html>