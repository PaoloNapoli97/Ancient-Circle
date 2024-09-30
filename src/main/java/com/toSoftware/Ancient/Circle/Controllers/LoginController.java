package com.toSoftware.Ancient.Circle.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.*;

import com.toSoftware.Ancient.Circle.dao.DaoUtente;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
    @Autowired
    private DaoUtente daoUtente;

    // PostMapping per accedere
    @PostMapping("login")
    public String login(@RequestParam("user") String user, @RequestParam("password") String password,
            HttpSession session) {
        // se nel form di registrazione non vengono inseriti i dati allora mi
        // reinderizza alla pagina di errore
        if (daoUtente.cercaUtente(user, password) == null) {
            return "redirect:errore.html";
        }
        // altrimenti cercherà l'utente nel database per vedere se l'utente esiste
        // all'interno del database
        else {
            Map<String, String> userLogged = daoUtente.cercaUtente(user, password);
            session.setAttribute("loggato", "ok");
            session.setAttribute("utente", userLogged);
            // se l'utente esiste allora il login andrà a buon fine
            System.out.println("Utente loggato: " + userLogged);
            System.out.println("Loggato: " + session.getAttribute("loggato"));
            return "redirect:persona";
        }
    }

    // getmapping per sloggare l'utente una volta che è all'interno della pagina
    // dove ha loggato
    @GetMapping("logout")
    public String logout(HttpSession session) {
        session.setAttribute("loggato", null);
        session.setAttribute("utente", null);

        return "redirect:home";
    }

    @GetMapping("newuser")
    public String newUser(@RequestParam("user") String newUtente, @RequestParam("password") String newPassword) {
        if (daoUtente.checkIfUserExist(newUtente) && daoUtente.checkIfNull(newUtente, newPassword)) {
            if (daoUtente.create(newUtente, newPassword, "0"))
                return "redirect:home.html";
            else
                return "redirect:errore.html";
        }
        else 
            return "redirect:errore.html";
    }
    /*
     * @GetMapping("register")
     * public String formNewUser(){
     * return "accedi.html";
     * }
     */
}