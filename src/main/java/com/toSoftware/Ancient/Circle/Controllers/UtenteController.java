package com.toSoftware.Ancient.Circle.Controllers;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.toSoftware.Ancient.Circle.dao.DaoArmature;
import com.toSoftware.Ancient.Circle.dao.DaoArmi;
import com.toSoftware.Ancient.Circle.dao.DaoNemici;

@Controller
public class UtenteController {

	 @GetMapping("nemici")
		public String nemici(Model model)
		{		
			List<Map<String,String>> lista = DaoNemici.getInstance().leggiTutti();
			model.addAttribute("nemicidatabase",lista);
			return "nemici.jsp";
			
	 	}
	 
	 @GetMapping("cercanemici")
     public String cercanemico(@RequestParam("id")int id, Model model) {
     	if(DaoNemici.getInstance().cercaPerId(id) != null)
     	{
	     		Map<String,String>nemico=DaoNemici.getInstance().cercaPerId(id);
	     	model.addAttribute("nemicidatabase",nemico);
	     	System.out.println(nemico);
	     	return "dettaglinemico.jsp";
     		
     	} else {
     		return "erroreNemico";
     	}
     }
	  @GetMapping("armi")
	    public String armiU(Model model) 
	  {        
	        List<Map<String, String>> lista = DaoArmi.getInstance().leggiTutti();
	        model.addAttribute("armidatabase", lista);
	        return "armi.jsp";
	    }

	@GetMapping("cercaarmi")
	        public String cercaarmi(@RequestParam("id")int id, Model model) {
	            if(DaoArmi.getInstance().cercaPerId(id) != null) {
		            Map<String,String>arma=DaoArmi.getInstance().cercaPerId(id);
		            model.addAttribute("armidatabase",arma);
		            System.out.println(arma);
		            return "dettagliArmi.jsp";
	            } else {
	                return "errorearma";
	            }
	        }
	

			@GetMapping("armature")
            public String armature(Model model) {
                List<Map<String, String>> lista = DaoArmature.getInstance().leggiTutti();
                model.addAttribute("armaturedatabase", lista);
                return "armature.jsp";
            }

            @GetMapping("cercaarmature")
            public String cercaarmature(@RequestParam("id")int id, Model model)
            {
                if(DaoArmature.getInstance().cercaPerId(id) != null) {
	                Map<String,String>armature=DaoArmature.getInstance().cercaPerId(id);
	                model.addAttribute("armaturedatabase",armature);
	                System.out.println(armature);
	                return "dettagliArmatura.jsp";

                } else {
                    return "errorearmatura";
                }
			}
		@GetMapping("utente")
		public String utente() {
			return "utente.html";
		}
		
}
