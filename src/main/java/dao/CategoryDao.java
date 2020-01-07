package dao;

import java.util.List;

import entities.Categories;
import model.CategoryInfo;

public interface CategoryDao {
 
    public void Save(CategoryInfo CategoryInfo);
    public Categories getCategoryById(String idCategory);
    public void deleteCategoryById(int idCategory);
    public void updateCategoryById(Categories category);
    public List<Categories> getListCategory();
}