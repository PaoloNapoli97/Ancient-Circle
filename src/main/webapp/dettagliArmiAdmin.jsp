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
        <a href="armiAdmin" class="link-url">Torna all'elenco delle armi</a>
    <h1>Dettagli delle armi</h1>

    <div class="armi-container">
        <img src="<%= armi.get("immagini") %>" alt="Immagine Armi">
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
    <div style="text-align: center;">
        <input type="button" class="btn" value="Modifica" onclick="attivArmi()">
    <br>
    <br>
    <div id="armi" class="armi" style="display: none;">
        <form method="get" action="modificaarma">
        <table>
            <tr>
                <td>
                    id
                </td>
                <td>
                    <input type="text" id="id" name="id" value="<%= armi.get("id") %>">
                </td>
            </tr>
            <tr>
                <td>
                Nome Arma
                </td>
                <td>
                <input type="text" name="nome" value="<%= armi.get("nome") %>">
                </td>
            </tr>
            <tr>
                <td>
                Tipologia danno inflitto
                </td>
                <td>
                <input type="text" name="danno" value="<%= armi.get("danno") %>">
                </td>
            </tr>
            
            <tr>
                <td>Descrizione</td>
                <td><input type="text" name="descrizione" id="descrizione" value="<%= armi.get("descrizione") %>"></td>
            </tr>
            <tr>
                <td>
                Danno inflitto
                </td>
                <td>
                <select name="tipoDanno">
                <option value="<%= armi.get("tipoDanno") %>" selected hidden>scegli il tipo di danno</option>
                    <option value="<%= armi.get("danno") %>"></option>
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
                Immagine
                </td>
                <td>
                <input type="text" name="immagini"value="<%= armi.get("immagini") %>">
                </td>
            </tr>
            <tr>
                <td>
                <input type="submit" value="SALVA" onclick="salvaArma(nome.value,tipoDanno.value,descrizione.value,danno.value,immagine.value);">
                </td>
                <td>
                <input type="button" onclick="pulisciform1()" value="PULISCI">
                </td>
            </tr>
        </table>
        </form>
    </div>
    </div>
</body>
<script src="dettagliAdmin.js"></script>
</body>
</html>