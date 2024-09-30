package com.toSoftware.Ancient.Circle.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

public class DaoCalcolatore {
    @Autowired
    private Database db;

    public List<Map<String,String>> armaturaMigliore(String nomeNemico){
        String query = "select armatura.id,armatura.nome as nome_armatura, armatura.difesa, armatura.dmgReduction, armatura.immagini, nemici.nome, nemici.tipologia from armatura inner join nemici on armatura.difesa = nemici.tipologia where nemici.nome = ?";
        List<Map<String,String>> ris = db.rows(query, nomeNemico);
        return ris;
    }

    public List<Map<String,String>> armaMigliore(String nomeNemico){
        String queryNemico = "select nemici.nome, nemici.tipologia from nemici where nemici.nome = ?";
        Map<String,String> risNemico = db.row(queryNemico, nomeNemico);

        String queryArmi = "select armi.id,armi.nome, armi.tipoDanno, armi.danno, armi.immagini from armi";
        List<Map<String,String>> risArmi = db.rows(queryArmi);
        // qui verranno aggiunte tutte le armi superefficaci e saranno mandate al controller
        List<Map<String, String>> armiSuperefficaci = new ArrayList<>();
        // cicla su tutte le armi e controlla che siano superefficaci, non è il massimo per le performance ma non ho idea di come fare
        for (Map<String,String> map : risArmi) {
            String tipoArma = map.get("tipoDanno");
            if (isSuperEfficace(tipoArma, risNemico.get("tipologia")).equals("SE")) {
                armiSuperefficaci.add(map);
            }
        }
        return armiSuperefficaci;
    }

    public Map<String,String> nemicoPerNome(String nome){
		String query = "select * from nemici where nome = ?;";
		return db.row(query, nome+"");
	}

    public List<Map<String,String>> listaArmi(){
        return db.rows("select * from armi");
	}

    public List<Map<String,String>> listaArmature(){
        return db.rows("select * from armatura");
	}

    public List<Map<String,String>> listaNemici(){
        return db.rows("select * from nemici");
    }

    public String isSuperEfficace(String tipoArma, String tipoNemico){
        String ris = "";
        switch (tipoNemico.toLowerCase()) {
            case "volante":
                    ris = ifSuper(tipoArma, tipoNemico, "sanguinamento", "gelo");
                break;
            
            case "gelo":
                    ris = ifSuper(tipoArma, tipoNemico, "volante", "fuoco");
                break;

            case "fuoco":
                    ris = ifSuper(tipoArma, tipoNemico, "gelo", "magia");
                break;

            case "magia":
                    ris = ifSuper(tipoArma, tipoNemico, "fuoco", "fisico");
                break;

            case "fisico":
                    ris = ifSuper(tipoArma, tipoNemico, "magia", "sanguinamento");
                break;

            case "sanguinamento":
                    ris = ifSuper(tipoArma, tipoNemico, "fisico", "volante");
            break;

            default:
                    ris = "Normal";
                break;
        }
        return ris;
    }

    public String ifSuper(String tipoArma, String tipoNemico, String tipoNemicoNE,String TipoNemicoSE){
        if (tipoArma.equalsIgnoreCase(tipoNemico) || tipoArma.equalsIgnoreCase(tipoNemicoNE))
            return "NE";
        if (tipoArma.equalsIgnoreCase(TipoNemicoSE))
            return "SE";
        else return "Normal";
    }

    /*
     * Volante
     * Gelo
     * Fuoco
     * Magia
     * Fisico
     * Sanguinamento
     */
}