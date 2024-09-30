package com.toSoftware.Ancient.Circle.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

public class DaoUtente 
{
	    @Autowired
	    private Database db;
	
	    public Map<String,String> cercaUtente(String username, String password)
	    {
			String query = "select * from utenti where user = ? and password = ?";
			Map<String,String> u = db.row(query, username, password);
			return u == null ? null : u;
	    }
		
		public boolean create(String username, String password, String isAdmin)
		{
			String query = "insert into utenti (user,password,isAdmin) values (?,?,?)";
			return db.update(query, username, password, isAdmin);
		}
		
		    public boolean delete(int id)
		    {
		        String query = "delete from utenti where id = ?";
		        return db.update(query, id+"");
		    }
		
		    public boolean checkIfNull(String username, String password)
		    {
		        if (username == "" || password == "")
		            return false;
		        else
		            return true;
		    }
		
		    public boolean checkIfUserExist(String username)
		{
		String query = "select * from utenti where user = ?";
		Map<String,String> u = db.row(query, username);
		        if (u == null)
		            return true;
		        else return false;
		}
		    
		    public List<Map<String,String>> readAllUsers()
		    {
		        return db.rows("select * from utenti");
		    }
		    
		    public boolean update(Map<String, String> mappa) {
		        String query = "update utenti set user = ?, password = ?, isAdmin = ? where id = ?";
		        return db.update(query, mappa.get("user"), mappa.get("password"), mappa.get("isAdmin"), mappa.get("id"));
		    }
		    // public List<Map<String,String>> read(String query, String... params){
		    //     List<Map<String,String>> lista = new ArrayList<>();
		    //     lista = db.rows(query, params);
		    //     return lista;
		    // }
		
		
		    // public Map<String,String> readUserId(int id){
		    //     String query = "select * from utenti where id = ?";
		    //     return db.row(query, id+"");
		    // }
		
		    // public String printUserList(List<Map<String,String>> list){
		    //     String ris = "";
		    //     for (Map<String,String> map : list) {
		    //         ris += map.toString() + "\n";
		    //     }
		    //     return ris;
		    // }
}