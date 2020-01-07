package dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import dao.CustommerDao;
import entities.Custommers;
import entities.Products;

public class CustommerDaoImpl implements CustommerDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Boolean CheckLogin(String username, String pass) {
		List<Custommers> list =  this.getAll();
		for(Custommers c :list) {
			if((c.getCustomerUsername().trim().equals(username)) 
					&& (c.getCustomerPass().trim().equals(pass))){
				return true;
			}
		}
		
		return false;
	}

	@Override
	public List<Custommers> getAll() {
		List<Custommers> list = null;
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Criteria cr = session.createCriteria(Custommers.class);
		list = cr.list();
		session.getTransaction().commit();
		
		return list;
	}


}
