<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    Map<String, String> armature = (Map<String, String>) request.getAttribute("armaturedatabase");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dettagli armature</title>
<link rel="stylesheet" href="dettagliArmatura.css">
</head>
<body>
	<div> 
    	<a class="link-url" href="armature">Torna alla pagina precedente</a>
    </div>
    
    <h1>Dettagli delle armature</h1>

    <div class="armature-container">
        <div class="img-container">
            <img src="<%= armature.get("immagini") %>" alt="Immagine Armature">
        </div>
                         <p><%= armature.get("nome") %></p>
        <table>
            <thead>
                <tr>
                    <th>DIFESA</th>
                    <th>DANNO</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                    	<p><%= armature.get("difesa") %></p>
                    </td>
                    <td>
                    	<p><%= armature.get("dmgReduction") %></p>
                    </td>
                </tr>
            </tbody>
            			<p><%= armature.get("descrizione") %></p>
       </table>
    </div>

</body>
</html>