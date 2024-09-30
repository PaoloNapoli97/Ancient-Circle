package com.toSoftware.Ancient.Circle.Controllers;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.toSoftware.Ancient.Circle.dao.DaoArmi;


import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@GetMapping ("home")
	public String Home(){
		return "home.html";
	}
	

	
	@GetMapping("nuovoutente")
	public String Utente() 
	{
		return "utente.html";
	}
	
	//getmapping che gestite il login
	  @GetMapping("persona")
	  public String home(HttpSession session)
	  {
		  if(session.getAttribute("loggato") == null)
			  return "redirect:home.html";
		  System.out.println("utenteLoggato in homecontroller: " + session.getAttribute("utente"));
		  @SuppressWarnings("unchecked")
		Map<String,String> m = (Map<String,String>) session.getAttribute("utente");
		  String ris = "";
		  //uso uno switch. in modo che se il case è 1 allora significa che l'utente è admin e allora verrà reindirizzato alla pagina admin
		  //se è 0 allora è un utente normale e verrà reindirizzato alla pagina dell'utente
		  switch(m.get("isAdmin").toLowerCase())
		  {
			  case "1":
				  return  "redirect:/admin.html";
			  default:
				  return "redirect:/utente.html";
			  
		  }
	  }
	  
	  @GetMapping("ElencoArmi")
		public String armi(Model model)
		{		
			List<Map<String,String>> lista = DaoArmi.getInstance().leggiTutti();
			model.addAttribute("armidatabase",lista);
			return "ElencoArmi.jsp";
			
	 	}
		
		@GetMapping("forminserimento")
		public String form()
		{
			return "forminserimento.html";
		}



		@Override
		public String toString()
		{
			return "HomeController []";
		}

}
