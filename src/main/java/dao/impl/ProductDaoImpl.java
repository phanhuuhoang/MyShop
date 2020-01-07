package dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import dao.ProductDao;
import entities.Categories;
import entities.Products;
import model.ProductInfo;

public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Products> getAll() {
		List<Products> list = null;

		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Criteria cr = session.createCriteria(Products.class);
		list = cr.list();
		session.getTransaction().commit();

		return list;
	}

	@Override
	public void SaveProduct(ProductInfo productInfo) {
		// TODO Auto-generated method stub

		Products product = new Products();
		product.setCategoryId(productInfo.getCategoryId());
		product.setProductName(productInfo.getProductName());
		product.setProductDescription(productInfo.getProductDescription());
		product.setProductDetail(productInfo.getProductDetail());
		product.setProductImage(productInfo.getProductImage().getOriginalFilename());
		product.setCategoryId(productInfo.getCategoryId());
		product.setProductPrice(productInfo.getProductPrice());

		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.persist(product);

		session.getTransaction().commit();
	}

	@Override
	public Boolean CheckProductWithName(String name) {
		// TODO Auto-generated method stub
		List<Products> list = this.getAll();
		for(Products p :list) {
			if(p.getProductName().trim().equals(name)) {
				return true;
			}
		}
		
		return false;
	}
	
	

	@Override
	public List<Products> getByCategoryId(int idcategory) {
		// TODO Auto-generated method stub
		String hql = "FROM Products P WHERE P.categoryId = :idcategory";
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query query = session.createQuery(hql);
		query.setParameter("idcategory",idcategory);
		List results =  query.list();
		session.getTransaction().commit();
		System.out.println(results.size());
		return results;
	}

	@Override
	public void deleteProductById(long idproduct) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		String hql = "DELETE FROM Products " + "WHERE productId = :idproduct";
		Query query = session.createQuery(hql);
		query.setParameter("idproduct", idproduct);
		int result = query.executeUpdate();
		System.out.println("Rows affected: " + result);
		session.getTransaction().commit();
	}
	
	public Products getProductById(int idProduct) {
		long id = idProduct;
		// TODO Auto-generated method stub
		String hql = "FROM Products P WHERE P.productId = :idProduct";
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query query = session.createQuery(hql);
		query.setParameter("idProduct",id);
		Products p =(Products)query.list().get(0); 
		session.getTransaction().commit();
		return p ;
	}

}
