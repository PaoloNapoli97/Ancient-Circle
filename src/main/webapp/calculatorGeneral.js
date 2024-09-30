function calcola(attaccogiocatore, difesaGiocatore) {
    var hpNemico = parseInt(document.getElementById("hpNemico").innerHTML);
    var attaccoNemico = parseInt(document.getElementById("attaccoNemico").innerHTML);
    var difesaNemico = parseInt(document.getElementById("difesaNemico").innerHTML);
    var tipologiaNemico = document.getElementById("tipologiaNemico").innerHTML;
    var nemiciSelect = document.getElementById("selectNemici");
    var selectedOptionNemici = nemiciSelect.options[nemiciSelect.selectedIndex];
    var isBoss = selectedOptionNemici.dataset.isboss;
    console.log(hpNemico);
    console.log(attaccoNemico);
    console.log(difesaNemico);
    console.log(tipologiaNemico);
    console.log(isBoss);

    var armaSelect = document.getElementById("selectArmi");
    var selectedOptionArma = armaSelect.options[armaSelect.selectedIndex];
    var dannoArma = parseInt(selectedOptionArma.dataset.danno);
    var tipoDannoArma = selectedOptionArma.dataset.tipodanno;

    var armaturaSelect = document.getElementById("selectArmatura");
    var selectedOptionArmatura = armaturaSelect.options[armaturaSelect.selectedIndex];
    var dmgReductionArmatura = parseFloat(selectedOptionArmatura.dataset.dmgreduction);
    var difesaArnatura = selectedOptionArmatura.dataset.difesa;
    
    console.log("Selected Option:", selectedOptionArma);
    console.log("Selected Option:", selectedOptionArmatura);

    
    var danniRicevutiFInali = danniRicevuti(attaccoNemico,dmgReductionArmatura,tipologiaNemico,difesaArnatura,controlloGiocatoreDifesa(difesaGiocatore),isBoss)
    var danniInflittiFinali =  danniInflitti(controlloGiocatoreAttacco(attaccogiocatore),dannoArma,tipoDannoArma,difesaNemico,tipologiaNemico,isBoss);
    var colpiPerUccidere = colpiNecessari(hpNemico,danniInflittiFinali)
    console.log(colpiPerUccidere);

   // if (isNaN(danniRicevutiFInali)){}
       // danniRicevutiFInali = "SELEZIONA NEMICO";

    if (isNaN(danniInflittiFinali))
        danniInflittiFinali = "SELEZIONA NEMICO";

    if (isNaN(colpiPerUccidere) && colpiPerUccidere != "ONESHOT!!!")
        colpiPerUccidere = "SELEZIONA NEMICO";
    

    document.getElementById("calcola").innerHTML = danniRicevutiFInali;
    document.getElementById("calcola2").innerHTML = danniInflittiFinali;
    document.getElementById("calcola3").innerHTML = colpiPerUccidere
    console.log("Danni ricevuti:", danniRicevutiFInali);
    console.log("Danni inflitti:", danniInflittiFinali);
}

function danniRicevuti(attaccoNemico,dmgreduction,tipologiaNemico,difesa,difesaGiocatore,isboss){
    var danniRicevuti = attaccoNemico * (1 - (dmgreduction/100))
    console.log("first " + danniRicevuti);
    danniRicevuti -= difesaGiocatore;
    console.log("difesa flat " + danniRicevuti);
    if (isSuperEfficace(tipologiaNemico,difesa) == "NE") {
        danniRicevuti *= (1 - 0.25);
        console.log("ridotti " + danniRicevuti);
    }
    else if (isSuperEfficace(tipologiaNemico,difesa) == "SE") {
        danniRicevuti *= 1.25;
        console.log("maggiorati " + danniRicevuti);
    }
    if (isboss == 1) {
        danniRicevuti *= 2.5;
        console.log("boss " + danniRicevuti);
    }
    console.log("finali " + danniRicevuti);
    if(danniRicevuti <= 1)
        danniRicevuti = 1;
    return parseFloat(danniRicevuti.toFixed(2));
}

function danniInflitti(attaccogiocatore,dannoArma,tipoDannoArma,difesaNemico,tipologiaNemico,isboss){
    var newAttacco = parseInt(attaccogiocatore);
    var newDannoArma = parseInt(dannoArma);

    var danniInflitti = newAttacco + newDannoArma;
    console.log("first " + danniInflitti);
    if (isSuperEfficace(tipoDannoArma, tipologiaNemico) == "SE") {
        danniInflitti *= 2;
        console.log("super " + danniInflitti);
    }
    else if (isSuperEfficace(tipoDannoArma, tipologiaNemico) == "NE") {
        danniInflitti *= (1 - 0.25);
        console.log("ridotto " + danniInflitti);
    }
    if (isboss == 1){
        danniInflitti *= (1 - 0.05);
        console.log("boss " + danniInflitti);
    }
    danniInflitti -= difesaNemico/2;
    if (danniInflitti <= 0) {
        danniInflitti = 1;
    }
    console.log("difesa flat " + danniInflitti);
    return parseFloat(danniInflitti.toFixed(2));
}

function isSuperEfficace(tipo, tipologiaNemico){
    var ris = "";
    switch (tipologiaNemico) {
        case "volante":
                ris = ifSuper(tipo, tipologiaNemico, "sanguinamento", "gelo");
            break;
        
        case "gelo":
                ris = ifSuper(tipo, tipologiaNemico, "volante", "fuoco");
            break;

        case "fuoco":
                ris = ifSuper(tipo, tipologiaNemico, "gelo", "magia");
            break;

        case "magia":
                ris = ifSuper(tipo, tipologiaNemico, "fuoco", "fisico");
            break;

        case "fisico":
                ris = ifSuper(tipo, tipologiaNemico, "magia", "sanguinamento");
            break;

        case "sanguinamento":
                ris = ifSuper(tipo, tipologiaNemico, "fisico", "volante");
        break;

        default:
                ris = "Normal";
            break;
    }
    return ris;
}

function controlloGiocatoreDifesa(difesaGiocatore) {
    if (difesaGiocatore == "" || difesaGiocatore == null || difesaGiocatore == 0) {
        difesaGiocatore = 1;
    }
    else if (difesaGiocatore > 100)
        difesaGiocatore = 100;
    return difesaGiocatore;
}

function controlloGiocatoreAttacco(attaccogiocatore) {
    if (attaccogiocatore == "" || attaccogiocatore == null || attaccogiocatore == 0 || attaccogiocatore == NaN) {
        attaccogiocatore = 1;
    }
    else if (attaccogiocatore > 100)
        attaccogiocatore = 100;
    return attaccogiocatore;
}

function ifSuper(tipoDannoArma, tipologiaNemico, tipoNemicoNE, TipoNemicoSE) {
    if (tipoDannoArma == tipologiaNemico || tipoDannoArma == tipoNemicoNE) {
        return "NE";
    }
    if (TipoNemicoSE == tipoDannoArma) {
        return "SE";
    } else {
        return "Normal";
    }
}

function selectimg() {
    var armaturaSelect = document.getElementById("selectArmatura");
    var selectedOptionArmatura = armaturaSelect.options[armaturaSelect.selectedIndex];
    var img = selectedOptionArmatura.dataset.immagini;
    console.log(selectedOptionArmatura);
    
    console.log(img);
    
    document.getElementById('imgGiocatore').src = img;
}

function selectNem(){
    var nemiciSelect = document.getElementById("selectNemici");
    var selectedOptionNemici = nemiciSelect.options[nemiciSelect.selectedIndex];
    var nomeNemico = selectedOptionNemici.dataset.nome;
    var hpNemico = selectedOptionNemici.dataset.hp;
    var attaccoNemico = selectedOptionNemici.dataset.attacco;
    var difesaNemico = selectedOptionNemici.dataset.difesa;
    var tipologiaNemico = selectedOptionNemici.dataset.tipologia;
    var immagineNemico = selectedOptionNemici.dataset.immagini;

    console.log(selectedOptionNemici);

    document.getElementById("nomeNemico").innerHTML = nomeNemico;
    document.getElementById("hpNemico").innerHTML = hpNemico;
    document.getElementById("attaccoNemico").innerHTML = attaccoNemico;
    document.getElementById("difesaNemico").innerHTML = difesaNemico;
    document.getElementById("tipologiaNemico").innerHTML = tipologiaNemico;
    document.getElementById('immagineNemico').src = immagineNemico;
}

function colpiNecessari(hpNemico, danniInflittiFinali){
    var colpiPerUccidere = hpNemico / danniInflittiFinali
    if (colpiPerUccidere <= 1) {
        return "ONESHOT!!!";
    }
    else
        return Math.ceil(colpiPerUccidere);
}