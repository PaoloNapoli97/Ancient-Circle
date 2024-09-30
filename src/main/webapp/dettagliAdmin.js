function attivNemici() {
    document.getElementById("nemici").style.display = "block";
}

var idN = [];
var nomeN = [];
var hpN = [];
var attaccoN = [];
var tipologiaN = [];
var specieN = [];
var descrizioneN = [];
var isBoss = [];
var immaginiN = [];

function SalvaNemico(id, nome, hp, attacco, tipologia, specie, descrizione, boss, immagini) {
    idN.push(id);
    nomeN.push(nome);
    hpN.push(hp);
    attaccoN.push(attacco);
    tipologiaN.push(tipologia);
    specieN.push(specie);
    descrizioneN.push(descrizione);
    isBoss.push(boss);
    immaginiN.push(immagini);
}

function attivArmi() {
    document.getElementById("armi").style.display = "block";
}

// Variabili per salvare i dati delle armi
var nomeArmi = [];
var tipoDannoArmi = [];
var descrizioneArmi = [];
var dannoArmi = [];
var immaginiArmi = [];

function SalvaArmi(nome, tipoDanno, descrizione, danno, immagini) {
    nomeArmi.push(nome);
    tipoDannoArmi.push(tipoDanno);
    descrizioneArmi.push(descrizione);
    dannoArmi.push(danno);
    immaginiArmi.push(immagini);

    console.log("Armi Salvate:", {
        nomeArmi,
        tipoDannoArmi,
        descrizioneArmi,
        dannoArmi,
        immaginiArmi
    });
}

// Funzione per mostrare il form di modifica delle armature
function attivArmatura() {
    var armaturaForm = document.getElementById("armature");
    if (armaturaForm) {
        armaturaForm.style.display = "block";
    } else {
        console.error("Elemento con id 'armature' non trovato.");
    }
}

// Funzione per pulire i campi del form (opzionale)
function pulisci() {
    document.querySelectorAll('#armature input').forEach(input => {
        input.value = '';
    });
}


// Variabili per salvare i dati dell'armatura
var nomeArmatura = [];
var tipoArmatura = [];
var difesaArmatura = [];
var descrizioneArmatura = [];
var immaginiArmatura = [];

function SalvaArmatura(nome, tipo, difesa, descrizione, immagini) {
    nomeArmatura.push(nome);
    tipoArmatura.push(tipo);
    difesaArmatura.push(difesa);
    descrizioneArmatura.push(descrizione);
    immaginiArmatura.push(immagini);

    console.log("Armature Salvate:", {
        nomeArmatura,
        tipoArmatura,
        difesaArmatura,
        descrizioneArmatura,
        immaginiArmatura
    });
}

