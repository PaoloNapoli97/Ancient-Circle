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
        <a class="link-url" href="armatureAdmin">Torna alla pagina precedente</a>
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
                    <td><p><%= armature.get("difesa") %></p></td>
                    <td><p><%= armature.get("dmgReduction") %></p></td>
                </tr>
            </tbody>
        </table>
        <p><%= armature.get("descrizione") %></p>
    </div>

    <div style="text-align: center;">
        <input type="button" class="btn" value="Modifica" onclick="attivArmatura()">
    </div>
    <br><br>

    <div id="armature" class="armature" style="display: none;">
        <form method="get" action="modificaarmatura">
            <table>
                <tr>
                    <td>id</td>
                    <td><input type="text" id="id" name="id" value="<%= armature.get("id") %>"></td>
                </tr>
                <tr>
                    <td>Nome Armatura</td>
                    <td><input type="text" name="nome" value="<%= armature.get("nome") %>"></td>
                </tr>
                <tr>
                    <td>Tipologia di difesa</td>
                    <td>
                        <select name="difesa">
                           <option value="<%= armature.get("difesa") %>" selected hidden>scegli il tipo di nemico</option>
                            <option value="<%= armature.get("difesa") %>"><%= armature.get("difesa") %></option>
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
                    <td>Descrizione</td>
                    <td><input type="text" name="descrizione" value="<%= armature.get("descrizione") %>"></td>
                </tr>
                <tr>
                    <td>Riduzione del danno</td>
                    <td><input type="number" name="dmgReduction" value="<%= armature.get("dmgReduction") %>"></td>
                </tr>
                <tr>
                    <td>Immagine</td>
                    <td><input type="text" name="immagini" value="<%= armature.get("immagini") %>"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="SALVA"></td>
                    <td><input type="button" onclick="pulisci()" value="PULISCI"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
<script src="dettagliAdmin.js"></script>
</html>
