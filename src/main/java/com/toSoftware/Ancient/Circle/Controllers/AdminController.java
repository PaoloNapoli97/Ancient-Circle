package com.toSoftware.Ancient.Circle.Controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.toSoftware.Ancient.Circle.dao.DaoArmature;
import com.toSoftware.Ancient.Circle.dao.DaoArmi;
import com.toSoftware.Ancient.Circle.dao.DaoNemici;
import com.toSoftware.Ancient.Circle.dao.DaoUtente;

@Controller
public class AdminController {
    @Autowired
    private DaoUtente daoUtente;
    
    @GetMapping("admin")
    public String admin() 
    {
    	return "admin.html";
    }
    
    // getmapping che mi reinderizza al form per inserire un nuovo admin
    @GetMapping("nuovoadmin")
    public String formAdminNew(Model model) {
		List<Map<String,String>> listUsers = daoUtente.readAllUsers();
		model.addAttribute("listaUtenti", listUsers);
        return "controlloadmin.jsp";
    }

    // getmapping per inserire un nuovo admin
    @GetMapping("newadmin")
    public String getMethodName(@RequestParam("user") String newUtente, @RequestParam("password") String newPassword, @RequestParam("isAdmin") String newIsAdmin) {
        if (daoUtente.checkIfUserExist(newUtente)) {      
            if (daoUtente.create(newUtente, newPassword, newIsAdmin))
                return "redirect:nuovoadmin";
            else
                return "redirect:errore.html";
        }
        else
            return "redirect: nuovoadmin";
    }

    @GetMapping("modificaadmin")
    public String modificaUser(@RequestParam Map<String,String> mappa) {
            if (daoUtente.update(mappa)) {
                System.out.println(mappa);
                return "redirect:nuovoadmin";
            }
        else
            return "redirect:errore.html";
    }
	// getmapping modifica user
	@GetMapping("modificauser")
	public String modificaUser(@RequestParam("user") String user) {
		if (daoUtente.checkIfUserExist(user)) {
			return "home";
		}
		else
			return "redirect:errore.html";
	}
	

    @GetMapping("elencouser")
    public String elencoUser(Model model){
        List<Map<String,String>> list = daoUtente.readAllUsers();
        model.addAttribute("lista", list);
        return "elencouser.jsp";
    }
    

    // getmapping per elminare un user
    @GetMapping("deleteuser")
    public String deleteUser(@RequestParam("id") int id) {
        if (daoUtente.delete(id))
            return "redirect:nuovoadmin";
        else
            return "error on delete";
    }

    @GetMapping("nuovoarma")
		public String nuovoArma(@RequestParam Map<String,String> mappa) 
		{
			if(DaoArmi.getInstance().create(mappa)) {
				System.out.println(mappa);
				return "redirect:admin.html";
			}
			else
				return "errore nell'inserimento";
			
		}

    @GetMapping("modificaarma")
		public String modifica (@RequestParam Map<String,String> mappa)
		{
			if(DaoArmi.getInstance().update(mappa)) {
				System.out.println("modifica effettuata"+mappa);
				return "redirect:armiAdmin";
			}
			else
				return "Errore nella modifica";
			
		}

		@GetMapping("armiAdmin")
        public String armiA(Model model) 
      {
            List<Map<String, String>> lista = DaoArmi.getInstance().leggiTutti();
            model.addAttribute("armidatabase", lista);
            return "armiAdmin.jsp";
        }


        @GetMapping("cercaarmiadmin")
            public String cercaarmi(@RequestParam("id")int id, Model model) {
                if(DaoArmi.getInstance().cercaPerId(id) != null) {
                    Map<String,String>arma=DaoArmi.getInstance().cercaPerId(id);
                    model.addAttribute("armidatabase",arma);
                    System.out.println(arma);
                    return "dettagliArmiAdmin.jsp";
                } else {
                    return "errorearma";
                }
			}

		@GetMapping("elimina")
		public String elimina(@RequestParam ("id") int id) {
			if(DaoArmi.getInstance().delete(id))
				return "redirect:admin.html";
			else
				return "Errore nella rimozione";
		}

        @GetMapping("ElencoArmature")
	    public String armature(Model model) {        
	        List<Map<String, String>> lista = DaoArmature.getInstance().leggiTutti();
	        model.addAttribute("armaturedatabase", lista);
	        return "ElencoArmature.jsp";
	    }
	    
	    @GetMapping("nuovoarmatura")
	    public String nuovoArmatura(@RequestParam Map<String, String> mappa) {
	        if (DaoArmature.getInstance().create(mappa)) {
	        	System.out.println(mappa);
	        	return "redirect:admin.html";
	        } else {
	            return "redirect:erroreInserimento";
	        }
	    }
	    
	    @GetMapping("modificaarmatura")
	    public String modificaArmatura(@RequestParam Map<String, String> mappa) {
	        if (DaoArmature.getInstance().update(mappa)) {
	            return "redirect:armatureAdmin";
	        } else {
	            return "erroreModifica";
	        }
	    }

		@GetMapping("armatureAdmin")
            public String armatureAdmin(Model model) {
                List<Map<String, String>> lista = DaoArmature.getInstance().leggiTutti();
                model.addAttribute("armaturedatabase", lista);
                return "armatureAdmin.jsp";
            }

			@GetMapping("cercaarmatureadmin")
            public String cercaarmatureadmin(@RequestParam("id")int id, Model model)
            {
                if(DaoArmature.getInstance().cercaPerId(id) != null) {
	                Map<String,String>armature=DaoArmature.getInstance().cercaPerId(id);
	                model.addAttribute("armaturedatabase",armature);
	                System.out.println(armature);
	                return "dettagliArmatureAdmin.jsp";

                } else {
                    return "errorearmatura";
                }
			}
	    
	    @GetMapping("eliminaarmatura")
	    public String eliminaArmatura(@RequestParam("id") int id) {
	        if (DaoArmature.getInstance().delete(id)) {
	            return "redirect:admin.html";
	        } else {
	            return "erroreRimozione"; 
	        }
	    }        

        @GetMapping("nuovonemico")
        public String nuovonemico(@RequestParam Map<String,String> mappa) {
            if(DaoNemici.getInstance().create(mappa)) {
            	System.out.println(mappa);
				return "redirect:admin.html";
            }
			else
				return "errore nell'inserimento";
        }

		@GetMapping("nemiciadmin")
		public String nemiciAdmin(Model model)
		{		
			List<Map<String,String>> lista = DaoNemici.getInstance().leggiTutti();
			model.addAttribute("nemicidatabase",lista);
			return "nemiciAdmin.jsp";
	 	}

		 @GetMapping("cercanemicoadmin")
		 public String cercanemicoAdmin(@RequestParam("id")int id, Model model) {
			 if(DaoNemici.getInstance().cercaPerId(id) != null)
			 {
					 Map<String,String>nemico=DaoNemici.getInstance().cercaPerId(id);
				 model.addAttribute("nemicidatabase",nemico);
				 System.out.println(nemico);
				 return "dettagliNemicoAdmin.jsp";
				 
			 } else {
				 return "erroreNemico";
			 }	 
	}
		 @GetMapping("modificanemico")
			public String modificaNemico (@RequestParam Map<String,String> mappa)
			{	
				if(DaoNemici.getInstance().update(mappa)) 
				{
					System.out.println("modifica effettuata"+mappa);
					return "redirect:nemiciadmin";
				}
				else
					return "Errore nella modifica";
				
			}
		 
}