<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<% List<Map<String,String>> listArmiMigliori = (List<Map<String,String>>) request.getAttribute("armiData"); %>
<% List<Map<String,String>> listaArmi = (List<Map<String,String>>) request.getAttribute("listaArmi"); %>
<% List<Map<String,String>> listaArmature = (List<Map<String,String>>) request.getAttribute("listaArmature"); %>
<% List<Map<String,String>> listArmatureMigliori = (List<Map<String,String>>) request.getAttribute("armatureData"); %>
<% Map<String,String> nemico = (Map<String,String>) request.getAttribute("nomeNemico"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="calculator.css">
</head>
<script src="calculator.js"></script>
<body>
    
    <div class="nav">
        <a href="home.html">Home </a>
        <h1>Calcolatore Danni</h1>
        <a href="cercanemici?id=<%= nemico.get("id") %>">Torna indietro</a>
    </div>
    <div class="recommendedContainer">
        <div class="recommendedEquipContainer">
            <h2>Armi consigliate per <%= nemico.get("nome")%></h2>
            <% if(!listArmiMigliori.isEmpty()) {%>

                    <% for(Map<String,String> map : listArmiMigliori) {%>
                        <div class="equipContainer">
                            <div class="box boxArma"><img src="<%= map.get("immagini") %>" alt="immagine"></div>
                            <div class="box"><span class="over">Nome Arma:</span> <%= map.get("nome") %></div>
                            <div class="box"><span class="over">Tipo Danno:</span> <%= map.get("tipoDanno").toUpperCase() %></div>
                            <div class="box"><span class="over">Danno:</span> <%= map.get("danno") %></div>
                            <div class="box"> <a href="cercaarmi?id=<%= map.get("id") %>">Clicca per più informazioni</a></div>
                        </div>
                    <%} %>

            <% } else {%>
                    <p>Nessuna arma trovata</p>
            <% } %>   
        </div>
        <div class="recommendedEquipContainer">
            <h2>Armature consigliate per <%= nemico.get("nome")%></h2>
            <% if(!listArmatureMigliori.isEmpty()) {%>

                <% for(Map<String,String> map : listArmatureMigliori) {%>
                    <div class="equipContainer">
                        <div class="box boxArmatura"><img src="<%= map.get("immagini") %>" alt="Immagine"></div>
                        <div class="box"><span class="over">Nome Armatura:</span><%= map.get("nome_armatura") %></div>
                        <div class="box"><span class="over">Riduzione danno</span><%= map.get("dmgReduction") %> %</div>
                        <div class="box"><span class="over">Tipo Armatura</span><%= map.get("difesa").toUpperCase() %></div>
                        <div class="box"> <a href="cercaarmature?id=<%= map.get("id") %>">Clicca per più informazioni</a></div>
                    </div>
                <%} %>
            <% } else {%>
                    <p>Nessuna armatura trovata.</p>
            <% } %>
        </div>
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

                    <div class="statNemico" id="nemico" data-hp="<%= nemico.get("hp") %>" data-attacco="<%= nemico.get("attacco") %>" data-difesa="<%= nemico.get("difesa") %>" data-tipologia="<%= nemico.get("tipologia") %>" data-isboss="<%= nemico.get("isBoss") %>">
                        <h3><%= nemico.get("nome")%></h3>
                        <div class="contenitoreStat">
                            <div class="boxStatnemico">
                                <span>HP</span>
                                <span><%= nemico.get("hp")%></span>
                            </div>
        
                            <div class="boxStatnemico">
                                <span>ATTACCO</span>
                                <span><%= nemico.get("attacco")%></span>
                            </div>
        
                            <div class="boxStatnemico">
                                <span>DIFESA</span> 
                                <span><%= nemico.get("difesa")%></span>
                            </div>
        
                            <div class="boxStatnemico">
                                <span>TIPOLOGIA</span> 
                                <span><%= nemico.get("tipologia").toUpperCase()%></span>
                            </div>
                        </div>
                    </div>

                    <div class="imgNemico">
                        <img src="<%= nemico.get("immagini") %>" alt="">
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
            <div style="text-align: center; padding-bottom: 20px;"><a style="font-size: 20px; color: white;" href="calcolatoreGenerale">Calcolatore Generale</a></div>
        </div>
    </div>
</body>

</html>