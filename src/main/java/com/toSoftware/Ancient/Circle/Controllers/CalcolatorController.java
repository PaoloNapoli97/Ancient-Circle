package com.toSoftware.Ancient.Circle.Controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.toSoftware.Ancient.Circle.dao.DaoCalcolatore;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class CalcolatorController {
    @Autowired
    private DaoCalcolatore daoCalcolatore;


    @GetMapping("calcolatore")
    public String equipaggiamentoOttimale(@RequestParam("nomeNemico") String nomeNemico, Model model) {
        List<Map<String,String>> mappaArmi = daoCalcolatore.armaMigliore(nomeNemico);
        List<Map<String,String>> mappaArmatura = daoCalcolatore.armaturaMigliore(nomeNemico);
        List<Map<String,String>> listaArmi = daoCalcolatore.listaArmi();
        List<Map<String,String>> listaArmature = daoCalcolatore.listaArmature();
        Map<String,String> nemico = daoCalcolatore.nemicoPerNome(nomeNemico);

        model.addAttribute("armiData", mappaArmi);
        model.addAttribute("armatureData", mappaArmatura);
        model.addAttribute("nomeNemico", nemico);
        model.addAttribute("listaArmi", listaArmi);
        model.addAttribute("listaArmature", listaArmature);
        // Verifica stampa dati da console--
        System.out.println(nemico);
        System.out.println(mappaArmi);
        System.out.println(mappaArmatura);

        return "calculator.jsp";
    }
    @GetMapping("calcolatoreGenerale")
    public String calcolatoreGenerale(Model model) {
        List<Map<String,String>> listaArmi = daoCalcolatore.listaArmi();
        List<Map<String,String>> listaArmature = daoCalcolatore.listaArmature();
        List<Map<String,String>> listaNemici = daoCalcolatore.listaNemici();
        model.addAttribute("listaArmi", listaArmi);
        model.addAttribute("listaArmature", listaArmature);
        model.addAttribute("listaNemici", listaNemici);
        // Verifica stampa dati da console--

        return "calculatorGeneral.jsp";
    }
}
