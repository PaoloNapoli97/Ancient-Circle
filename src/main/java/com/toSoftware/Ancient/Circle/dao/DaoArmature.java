package com.toSoftware.Ancient.Circle.dao;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

public class DaoArmature 
{
	@Autowired
	private Database db;
	private static DaoArmature newInstance;
	
	private DaoArmature()
	{
		db = new Database("ancientcircle");
	}
	public static DaoArmature getInstance() {
		if(newInstance==null)
			newInstance = new DaoArmature();
		return newInstance;
	}
	
	
	public List<Map<String,String>> read(String query, String...params)
	{
		List<Map<String,String>> lista=new ArrayList<>();
		lista=db.rows(query, params);
		return lista;
	}
	
	public List<Map<String,String>> leggiTutti()
	{
		return db.rows("select * from armatura;");
	}
	
	public Map<String,String> cercaPerId(int id)
	{
		String query ="select * from armatura where id = ?;";
		return db.row(query,id+"");
	}
	
	public boolean create (Map<String,String> mappa) {
		String query="insert into armatura(nome,difesa,descrizione,dmgReduction,immagini) values (?,?,?,?,?);";
		return db.update(query, mappa.get("nome"),
								mappa.get("difesa"),
								mappa.get("descrizione"),
								mappa.get("dmgReduction"),
								mappa.get("immagini")
								);
	}
	
	public boolean update(Map<String,String> mappa)
	{
		String query="update armatura set nome=?,difesa=?,descrizione=?,dmgReduction=?,immagini=? where id = ?;";
		return db.update(query,
				mappa.get("nome"),
				mappa.get("difesa"),
				mappa.get("descrizione"),
				mappa.get("dmgReduction"),
				mappa.get("immagini"),
				mappa.get("id")
				);
	}
	
	public boolean delete(int id) {
		String query="delete from armatura where id = ?;";
				return db.update(query,String.valueOf(id));
	}
	public String stampaLista(List<Map<String,String>> lista) {
		String ris="";
		for(Map<String,String> mappa : lista)
			ris+=mappa.toString()+"\n";
		return ris;
	}
}
