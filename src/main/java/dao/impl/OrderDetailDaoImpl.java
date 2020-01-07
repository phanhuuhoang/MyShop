package dao.impl;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import dao.OrderDetailDao;
import entities.Orderdetails;

public class OrderDetailDaoImpl implements  OrderDetailDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void SaveOrderDetail(Orderdetails od) {
		// TODO Auto-generated method stub

				Session session = sessionFactory.getCurrentSession();
				session.beginTransaction();
				session.persist(od);
				session.getTransaction().commit();	
	}

}
