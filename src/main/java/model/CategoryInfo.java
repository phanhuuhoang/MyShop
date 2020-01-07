package model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class CategoryInfo {

	
	@NotBlank(message = "Name category cannot be empty")
	@NotNull(message = "Name category cannot be empty")
	@Size(min= 5,message = "Name category must more 5 Characters")
	private String categoryName;
	private int categoryId;
	public CategoryInfo() {
	}
	public CategoryInfo(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
}
