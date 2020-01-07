package dao;

import java.util.List;

import entities.Products;
import model.ProductInfo;

public interface ProductDao {
 
    public List<Products> getAll();
    public void SaveProduct(ProductInfo product);
    public Boolean CheckProductWithName(String name);
    public List<Products> getByCategoryId(int idcategory);
    public void deleteProductById(long idproduct);
    public Products getProductById(int idProduct);
}