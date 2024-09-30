<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% List<Map<String,String>> listUsers = (List<Map<String,String>>) request.getAttribute("listaUtenti"); %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Nuovo Admin</title>
	<link rel="stylesheet" href="controlloadmin.css">
	<script src="controlloadmin.js"></script>
	</head>
		<body>
			
			<h1>NUOVO ADMIN</h1>
			<a href="admin">torna alla pagina precedente</a>
			<div>
				<form action="newadmin"> 
					<table>
						<tr>
							<td>
								username
							</td>
							<td>
								<input type="text" name=user>
							</td>
						</tr>
						<tr>
							<td>
								password
							</td>
							<td>
								<input type="password" name=password>
							</td>
						</tr>
						<tr>
							<td>
								ruolo
							</td>
							<td>
								<select name="isAdmin" id="admin">
								<option value = "" disabled selected hidden>scegli il tipo di utente</option>
								<option value="1">admin</option>
								<option value="0">utente</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" value=REGISTRA>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="elencoAdmin">
				<div class="boxUsers">
					<h2>Elenco Utenti</h2>
					<% if(listUsers != null && !listUsers.isEmpty()) { %>
						<% for(Map<String,String> map : listUsers) { %>
							<% if(map.get("isAdmin").equals("0")) { %>
								<div class="userContainer">
									<div class="box">ID: <%= map.get("id") %></div>
									<div class="box"><%= map.get("user") %></div>
									<div class="box">Utente</div>
									<div class="box">
										<a id="elimina" href="deleteuser?id=<%= map.get("id")%>">Elimina</a>
										<a id="modifica" onclick="attivaReg('<%= map.get("id") %>')">Modifica</a>
										<div class="form" id="form-modifica-<%= map.get("id") %>" style="display:none;">
											<form action="modificaadmin?id=<%=map.get("id")%>" method="get" onsubmit="return prosegui()">
												<input type="button" value="x" class="chiudi" onclick="chiudiForm('<%= map.get("id") %>')">
												<div class="formMod">
													<div class="boxInput">
														<div>USERNAME</div>
														<input type="text" name="user" value="<%= map.get("user") %>" placeholder="<%= map.get("user") %>">
													</div>
													<div class="boxInput">
														<div>PASSWORD</div>
														<input type="password" name="password" value="<%= map.get("password") %>">
													</div>
													<div class="boxInput">
														<div>Ruolo</div>
														<select name="isAdmin">
															<option value="<%= map.get("isAdmin") %>" selected hidden>SEGLI RUOLO</option>
															<option value="1">admin</option>
															<option value="0">user</option>
														</select>
													</div>
													<input type="text" hidden="" name="id" value="<%= map.get("id") %>">
													<input class="buttonModifica" type="submit" value="Modifica">
												</div>
											</form>
										</div>
									</div>
								</div>
							<%} %>
						<%} %>
					<%} %>
				</div>
				<div class="boxUsers">
					<h2>Elenco Admin</h2>
					<% if(listUsers != null && !listUsers.isEmpty()) { %>
						<% for(Map<String,String> map : listUsers) { %>
							<% if(map.get("isAdmin").equals("1")) { %>
								<div class="userContainer">
									<div class="box">ID: <%= map.get("id") %></div>
									<div class="box"><%= map.get("user") %></div>
									<div class="box">Admin</div>
									<div class="box">
										<a id="elimina" href="deleteuser?id=<%= map.get("id")%>">Elimina</a>
										<a id="modifica" onclick="attivaReg('<%= map.get("id") %>')">Modifica</a>
										<div class="form" id="form-modifica-<%= map.get("id") %>" style="display:none;">
											<form action="modificaadmin?id=<%=map.get("id")%>" method="get" onsubmit="return prosegui()">
												<input type="button" value="x" class="chiudi" onclick="chiudiForm('<%= map.get("id") %>')">
												<div class="formMod">
													<div class="boxInput">
														<div>USERNAME</div>
														<input type="text" name="user" value="<%= map.get("user") %>" placeholder="<%= map.get("user") %>">
													</div>
													<div class="boxInput">
														<div>PASSWORD</div>
														<input type="password" name="password" value="<%= map.get("password") %>">
													</div>
													<div class="boxInput">
														<div>IS ADMIN</div>
														<select name="isAdmin">
															<option value="<%= map.get("isAdmin") %>" selected hidden>scegli il tipo di utente</option>
															<option value="1">admin</option>
															<option value="0">user</option>
														</select>
													</div>
													<input type="text" hidden="" name="id" value="<%= map.get("id") %>">
													<input class="buttonModifica" type="submit" value="Modifica">
												</div>
											</form>
										</div>
									</div>
								</div>
							<% } %>
						<% } %>
					<% } %>
				</div>
			</div>

		</body>
</html>