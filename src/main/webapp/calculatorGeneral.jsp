<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<% List<Map<String,String>> listaArmi = (List<Map<String,String>>) request.getAttribute("listaArmi"); %>
<% List<Map<String,String>> listaArmature = (List<Map<String,String>>) request.getAttribute("listaArmature"); %>
<% List<Map<String,String>> listaNemici = (List<Map<String,String>>) request.getAttribute("listaNemici"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="calculator.css">
</head>
<script src="calculatorGeneral.js"></script>
<body>
    
    <div class="nav">
        <a href="home.html">Home </a>
        <h1>Calcolatore Danni</h1>
        <a href="utente">Torna indietro</a>
    </div>
    <div class="pageContainer"> 
        <div style="width: 100%;">
            <form action="" name="form1">
                <div class="calculatorContainer">
                    <div class="imgGiocatore">
                        <img id="imgGiocatore" src="https://eldenring.wiki.fextralife.com/file/Elden-Ring/wretch_class_elden_ring_wiki_guide_270px.png" alt="">
                    </div>

                    <div class="statGiocatore">
                        <h3>Statistiche personaggio</h3>
                        <div class="contenitoreStat">
                            <div class="inputGiocatore">
                                <span>ATTACCO</span> <input type="number" min="1" max="100" name="attaccogiocatore" placeholder="1">
                            </div>
        
                            <div class="inputGiocatore">
                                <span>DIFESA</span> <input type="number" min="1" max="100" name="difesagiocatore" placeholder="1">
                            </div>
        
                            <select name="armi" class="selectStyle" id="selectArmi">
                                <% if (listaArmi != null && !listaArmi.isEmpty()) { %>
                                        <option selected="true" disabled="disabled" data-danno="1">Scegli un arma</option>
                                    <% for(Map<String,String> map : listaArmi) { %>
                                        <option data-danno="<%= map.get("danno")%>" data-tipoDanno="<%= map.get("tipoDanno")%>"><%= map.get("nome") %></option>
                                    <% } %>
                                <% } else { %>
                                    <option value="">Nessuna arma trovata</option>
                                <% } %>
                            </select>                
        
                            <select name="armature" class="selectStyle" id="selectArmatura" onchange="selectimg()">
                                <% if (listaArmature != null && !listaArmature.isEmpty()) { %>
                                        <option selected="true" disabled="disabled" data-dmgReduction="1">Scegli un armatura</option>
                                    <% for(Map<String,String> map : listaArmature) { %>
                                        <option data-difesa="<%= map.get("difesa")%>" data-dmgReduction="<%= map.get("dmgReduction")%>" data-immagini="<%= map.get("immagini") %>"><%= map.get("nome") %></option>
                                    <% } %>
                                <% } else { %>
                                    <option value="">Nessuna armatura trovata</option>
                                <% } %>
                            </select>
                        </div>
                    </div>

                    <div class="statNemico" id="nemico">
                        <h3 id="nomeNemico">Nemico</h3>
                        <div class="contenitoreStat">
                            <div class="boxStatnemico">
                                <span>HP</span>
                                <span id="hpNemico"></span>
                            </div>
        
                            <div class="boxStatnemico">
                                <span>ATTACCO</span>
                                <span id="attaccoNemico"></span>
                            </div>
        
                            <div class="boxStatnemico">
                                <span>DIFESA</span> 
                                <span id="difesaNemico"></span>
                            </div>
        
                            <div class="boxStatnemico">
                                <span>TIPOLOGIA</span> 
                                <span id="tipologiaNemico" style="text-transform: uppercase;"></span>
                            </div>

                            <div>
                                <select name="nemici" class="selectStyle" id="selectNemici" onchange="selectNem()">
                                    <% if (listaNemici != null && !listaNemici.isEmpty()) { %>
                                            <option selected="true" disabled="disabled">Scegli un nemico</option>
                                        <% for(Map<String,String> map : listaNemici) { %>
                                            <option data-nome="<%= map.get("nome")%>" data-hp="<%= map.get("hp")%>" data-attacco="<%= map.get("attacco")%>" data-difesa="<%= map.get("difesa") %>" data-tipologia="<%= map.get("tipologia") %>" data-immagini="<%= map.get("immagini") %>" data-isboss="<%= map.get("isBoss")%>"><%= map.get("nome") %></option>
                                        <% } %>
                                    <% } else { %>
                                        <option value="">Nessun Nemico trovato</option>
                                    <% } %>
                                </select>
                            </div>
                            
                        </div>
                    </div>

                    <div class="imgNemico">
                        <img id="immagineNemico" src="https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/hollow-harmless-enemies-dark-souls-3-wiki-guide.jpg" alt="">
                    </div>
                </div>
                
                <hr style="color: lightgray;">
                
                <div class="containerCalcolo">
                    <div class="grid">
                        <span>CALCOLA</span>
                        <input type="button" value="Premi" onclick="calcola(attaccogiocatore.value,difesagiocatore.value)">
                    </div>
                    <div class="grid">
                        <div>DANNO RICEVUTO</div>
                        <div id="calcola"></div>
                    </div>
                    <div class="grid">
                        <div>DANNO INFLITTO</div>
                        <div id="calcola2"></div>
                    </div>
                    <div class="grid">
                        <div>COLPI NECESSARI</div>
                        <div id="calcola3"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>

</html>