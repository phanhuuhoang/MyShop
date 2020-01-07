package dao.impl;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import dao.OrderDao;
import entities.Orders;
import entities.Products;

public class OrderDaoImpl implements OrderDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void SaveOrder(Orders od) {
		// TODO Auto-generated method stub

		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.persist(od);

		session.getTransaction().commit();
	}
	
	@Override
	public List<Orders> getAll() {
		List<Orders> list = null;

		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Criteria cr = session.createCriteria(Orders.class);
		list = cr.list();
		session.getTransaction().commit();

		return list;
	}

}
