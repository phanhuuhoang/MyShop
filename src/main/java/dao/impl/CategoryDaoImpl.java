package dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import dao.CategoryDao;
import entities.Categories;
import model.CategoryInfo;

public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void Save(CategoryInfo CategoryInfo) {
		// TODO Auto-generated method stub
		Categories category = new Categories();
		category.setCategoryName(CategoryInfo.getCategoryName());
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		// Save category
		session.persist(category);
		session.getTransaction().commit();
	}

	@Override
	public List<Categories> getListCategory() {
		List<Categories> list = null;

		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Criteria cr = session.createCriteria(Categories.class);
		list = cr.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public Categories getCategoryById(String idCategory) {
		// TODO Auto-generated method stub
		List<Categories> list = null;
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Criteria cr = session.createCriteria(Categories.class, idCategory);
		list = cr.list();
		session.getTransaction().commit();
		return list.get(0);
	}

	@Override
	public void deleteCategoryById(int idCategory) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql = "DELETE FROM Categories " + "WHERE id = :category_id";
		Query query = session.createQuery(hql);
		query.setParameter("category_id", idCategory);
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);
		session.getTransaction().commit();
	}

	@Override
	public void updateCategoryById(Categories category) {

		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql = "UPDATE Categories set categoryName = :categoryName " + "WHERE categoryId = :categoryId";
		Query query = session.createQuery(hql);
		query.setParameter("categoryName", category.getCategoryName());
		query.setParameter("categoryId", category.getCategoryId());
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);
		session.getTransaction().commit();
	}

}
