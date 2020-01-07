package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import dao.CategoryDao;
import dao.ProductDao;
import entities.Categories;
import entities.Products;
import model.CategoryInfo;
import model.ProductInfo;
import model.UploadFile;

@EnableWebMvc
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	private CategoryDao categoryDao;

	@Autowired
	private ProductDao productDao;

	@RequestMapping(method = RequestMethod.GET)
	public String TrangChu() {
		return "admin";
	}

	@RequestMapping(value = "/add-product", method = RequestMethod.GET)
	public String viewProduct(Model model) {
		AddAttributelistCategory(model);
		ProductInfo productInfo = new ProductInfo();
		model.addAttribute("productInfo", productInfo);
		return "addProduct";
	}

	

	@RequestMapping(value = "/add-product", method = RequestMethod.POST)
	public String SaveProduct(Model model, @Valid @ModelAttribute("productInfo") ProductInfo productInfo,
			BindingResult bindingresult, HttpServletRequest request) {
		//Gửi model listCategory về jsp
		AddAttributelistCategory(model);
		//Check name đã tồn tại hay chưa?
		if (productDao.CheckProductWithName(productInfo.getProductName()) == true) {
			bindingresult.rejectValue("productName", "productInfo", "Product name already exists");

		}
		//Check giá >0
		if (productInfo.getProductPrice() <= 0) {
			bindingresult.rejectValue("productPrice", "productInfo", "Product price must > 0 $");

		}
		//Check ảnh
		if (productInfo.getProductImage().getOriginalFilename().equals("")) {
			bindingresult.rejectValue("productImage", "productInfo", "Pls Choose Photo");
		}
		//Validate hasErr
		if (bindingresult.hasErrors()) {
			return "addProduct";
		}
		//Save product
		productDao.SaveProduct(productInfo);
		//Up image
		UploadFile uploadFile = new UploadFile();
		uploadFile.processFile(productInfo.getProductImage());

		return "redirect:/admin/see-list-products";
	}

	//Xem danh sách sản phẩm theo id danh mục ( categoryid )
	@RequestMapping(value = "/see-list-products", method = RequestMethod.GET)
	public String seeListProduct(Model model,
			@RequestParam(value = "idcategory", defaultValue = "0") int idcategory) {
		List<Products> listProduct = null;
		// Nếu lấy được categoryId
		if(idcategory != 0)
		{
			
			listProduct = productDao.getByCategoryId(idcategory);
			// Add addAttribute để chọn Danh mục từ select | option 
			// Lấy danh sách product với categoryId
			model.addAttribute("idcategory", idcategory);
		}
		else {
			// Nếu không có categoryId lấy Danh mục đầu tiên trong Categories 
			listProduct = productDao.getByCategoryId(categoryDao.getListCategory().get(0).getCategoryId());
		}
		model.addAttribute("listProduct", listProduct);
		AddAttributelistCategory(model);
		
		return "listProduct";
	}
	
	@RequestMapping(value = "/delete-product", method = RequestMethod.GET)
	public String deleteProduct(Model model, @RequestParam(value = "id", defaultValue = "0") int idProduct) {
		if (idProduct > 0) {
			// Nếu tồn tại category => Xóa
			if (productDao.getProductById(idProduct) != null) {
				long id = idProduct;
				productDao.deleteProductById(id);
			}
		}
		List<Categories> listCategory = categoryDao.getListCategory();
		model.addAttribute("listCategory", listCategory);

		return "redirect:/admin/see-list-products";
	}
	
	
	@RequestMapping(value = "/add-category", method = RequestMethod.GET)
	public String addCategory(Model model) {
		CategoryInfo categoryInfo = new CategoryInfo();
		model.addAttribute("categoryInfo", categoryInfo);
		return "addCategory";
	}

	@RequestMapping(value = "/add-category", method = RequestMethod.POST)
	public String addCategorySave(Model model, @Valid @ModelAttribute("categoryInfo") CategoryInfo categoryInfo,
			BindingResult bindingresult) {

		if (bindingresult.hasErrors()) {
			return "addCategory";
		}
		categoryDao.Save(categoryInfo);
		System.out.println("Save " + categoryInfo.getCategoryName());

		return "redirect:/admin/see-list-categories";
	}

	@RequestMapping(value = "/see-list-categories", method = RequestMethod.GET)
	public String seeListCategories(Model model, @RequestParam(value = "id", defaultValue = "") String idCategory) {
		if (idCategory != null && idCategory.length() > 0) {
			// Nếu tồn tại category => Xóa
			if (categoryDao.getCategoryById(idCategory) != null) {
				int id = Integer.parseInt(idCategory);
				categoryDao.deleteCategoryById(id);
			}
		}
		List<Categories> listCategory = categoryDao.getListCategory();
		model.addAttribute("listCategory", listCategory);

		return "listCategory";
	}

	private void AddAttributelistCategory(Model model) {
		List<Categories> listCategory = categoryDao.getListCategory();
		model.addAttribute("listCategory", listCategory);
	}

}
