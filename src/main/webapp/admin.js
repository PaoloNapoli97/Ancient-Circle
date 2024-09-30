function attivArmi() {
    document.getElementById("armi").style.display = "block";
    document.getElementById("armature").style.display = "none";
    document.getElementById("nemici").style.display = "none";
}

function attivArmatura() {
    document.getElementById("armi").style.display = "none";
    document.getElementById("armature").style.display = "block";
    document.getElementById("nemici").style.display = "none";
}


function attivNemici() {
    document.getElementById("armi").style.display = "none";
    document.getElementById("armature").style.display = "none";
    document.getElementById("nemici").style.display = "block";
}

var nomeN = [];
var hpN=[];
var attaccoN = [];
var tipologiaN=[];
var difesaN = [];
var specieN = [];
var descrizioneN = [];
var isBossN = [];
var immaginiN=[];

function SalvaNemico(nome,hp,attacco,tipologia,difesa,specie,descrizione,isBoss,immagini)
{
	if(nome!=""&&hp!=""&&attacco!=""&&difesa!=""&&tipologia!=""&&specie!=""&&(descrizione !=""|| descrizione=="") &&isBoss!=""&&immagini!="")
		{
			nomeN.push(nome);
			hpN.push(hp);
			attaccoN.push(attacco);
			tipologiaN.push(tipologia);
			difesaN.push(difesa);
			specieN.push(specie);
			descrizioneN.push(descrizione)
			isBossN.push(isBoss);
			immaginiN.push(immagini);	
		}
}

function pulisci()
{
	var inputs = document.getElementsByTagName("input");
	for(var i = 0; i < inputs.length; i++)
		{
			if(inputs[i].type != "button")
			inputs[i].value = "";
		}
}

var nomiA=[];
var tipoDanniA=[];
var descrizioniA=[];
var danniA=[];
var immaginiA=[];

function salvaArma(nome,tipoDanno,descrizione,danno,immagini)
		{
			if(nome =! ""&&tipoDanno!=""&&(descrizione !=""|| descrizione=="") && danno!=""&& immagini=="")
			{
				nomiA.push(nome);
				tipoDanniA.push(tipoDanno);
				descrizioniA.push(descrizione);
				danniA.push(danno);
				immaginiA.push(immagini);
			}
			
		}
		
var nomiAr=[];
var tipologiadifesaAr=[];
var descrizioniAr=[];
var dmgReductionR=[];
var immaginiR=[];
							
function salvaArmatura(nome,tipologiadifesa,descrizione,dmgReduction,immagini)
{
	if(nome =! ""&&tipologiadifesa!=""&&(descrizione !=""|| descrizione=="") && dmgReduction!=""&&immagini!="")
	{
		nomiAr.push(nome);
		tipologiadifesaAr.push(tipologiadifesaAr);
		descrizioniAr.push(descrizione);
		dmgReductionR.push(dmgReduction);
		immaginiR.push(immagini);
							}			
}
	
function isBoss(isBoss)
{
	 if (isBoss ==true)
		 isBossN.push(1);
	 else
		isBoss==false;
}

function chiudiForm()
 {
    document.getElementById("armi").style.display = "none";
    document.getElementById("armature").style.display = "none";
    document.getElementById("nemici").style.display="none";

 }