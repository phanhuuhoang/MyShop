package dao;

import java.util.List;

import entities.Custommers;
import entities.Products;

public interface CustommerDao {
	public Boolean CheckLogin(String username, String pass);
    public List<Custommers> getAll();
}
