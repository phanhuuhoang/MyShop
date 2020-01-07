package model;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class ProductInfo{

	private long productId;

	private int categoryId;
	
	@NotBlank(message = "Name product description cannot be empty")
	@NotNull(message = "Name product description cannot be empty")
	@Size(min= 5,message = "Name product description must more 5 Characters")
	private String productDescription;
	
	@NotBlank(message = "Name  productcannot be empty")
	@NotNull(message = "Name product name cannot be empty")
	@Size(min= 5,message = "Name product name must more 5 Characters")
	private String productName;
	
	@NotNull(message = "Name product image cannot be empty")
	private MultipartFile productImage;
	
	@NotNull(message = "Name product price cannot be empty")
	private long productPrice;
	
	@NotBlank(message = "Name product detail cannot be empty")
	@NotNull(message = "Name product detail cannot be empty")
	@Size(min= 30,message = "Name product detail must more 30 Characters")
	private String productDetail;

	public ProductInfo() {
	}

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public long getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(long productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}

	
}
