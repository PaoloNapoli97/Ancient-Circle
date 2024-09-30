package com.toSoftware.Ancient.Circle.dao;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DaoNemici 
{
    private Database db;
    private static DaoNemici newInstance;

    private DaoNemici()
    {
        db = new Database("ancientcircle");
    }
    public static DaoNemici getInstance() {
        if(newInstance==null)
            newInstance = new DaoNemici();
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
        return db.rows("select * from nemici;");
    }
    public Map<String,String> cercaPerId(int id)
    {
        String query ="select * from nemici where id = ?;";
        return db.row(query,id+"");
    }
public boolean create (Map<String,String> mappa) {
        String query="insert into nemici (nome,hp,attacco,difesa,tipologia,specie,descrizione,isBoss,immagini) values (?,?,?,?,?,?,?,?,?);";
        return db.update(query, mappa.get("nome"),
                                mappa.get("hp"),
                                mappa.get("attacco"),
                                mappa.get("difesa"),
                                mappa.get("tipologia"),
                                mappa.get("specie"),
                                mappa.get("descrizione"),
                                mappa.get("isBoss"),
                                mappa.get("immagini")
                                );
    }
    public boolean update(Map<String,String> mappa)
    {
String query="update nemici set nome=?, hp=?, attacco=?, difesa=?, tipologia=?, specie=?, descrizione=?, isBoss=?, immagini=? where id=?;";
        return db.update(query, mappa.get("nome"),
                                mappa.get("hp"),
                                mappa.get("attacco"),
                                mappa.get("difesa"),
                                mappa.get("tipologia"),
                                mappa.get("specie"),
                                mappa.get("descrizione"),                       
                                mappa.get("isBoss"),
                                mappa.get("immagini"),
                                mappa.get("id")
                                );
    }

    public boolean delete(int id) {
        String query="delete from nemici where id = ?;";
                return db.update(query,String.valueOf(id));
    }
    
    public String stampaLista(List<Map<String,String>> lista) {
        String ris="";
        for(Map<String,String> mappa : lista)
            ris+=mappa.toString()+"\n";
        return ris;
    }
}