package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.*;
import dao.ProductDao;
import entities.Orderdetails;
import entities.Orders;
import entities.Products;
import model.CartItem;

@Controller
@RequestMapping(value = "/home")
public class MainController {

	@Autowired
	private ProductDao productDao;

	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private  OrderDetailDao  orderdetailDao;
	
	@Autowired
	private CustommerDao custommerDao;

	@RequestMapping(method = RequestMethod.GET)
	public String home(Model model) {
		List<Products> listProduct = productDao.getAll();
		int index = 0;
		model.addAttribute("listProduct", listProduct);
		model.addAttribute("index", index);
		return "index";
	}

	@RequestMapping(value = "/view-detail-product", method = RequestMethod.GET)
	public String viewProduct(Model model, @RequestParam(value = "id", defaultValue = "0") int id) {
		if (id == 0) {
			return "redirect:/home";
		}
		Products product = productDao.getProductById(id);
		model.addAttribute("product", product);
		return "viewProduct";
	}

	@RequestMapping(value = "/add-product-shopcart", method = RequestMethod.GET)
	public String addProductShopCart(Model model, HttpSession session,
			@RequestParam(value = "id", defaultValue = "0") int id) {
		long Sum = 0;
		Products product = productDao.getProductById(id);
		List<CartItem> cart = null;
		// Kiểm tra sản phẩm có tồn tại không
		if (product != null) {
			CartItem cartitem = new CartItem();
			cartitem.setProduct(product);
			cartitem.setQuantity(1);
			cartitem.setAmount(cartitem.getQuantity() * cartitem.getProduct().getProductPrice());
			// Tạo giỏ hàng nếu chưa có
			if (session.getAttribute("cart") == null) {
				cart = new ArrayList<CartItem>();
				cart.add(cartitem);
				session.setAttribute("cart", cart);
			} else {
				cart = (List<CartItem>) session.getAttribute("cart");
				int index = CheckShopCart(cart, product);
				if (index == -1) {
					cart.add(cartitem);
				} else {
					int quantity = cart.get(index).getQuantity() + 1;
					cart.get(index).setQuantity(quantity);
					cart.get(index).setAmount(quantity * cart.get(index).getProduct().getProductPrice());
				}
			}
		}
		for (int i = 0; i < cart.size(); i++) {
			Sum = Sum + cart.get(i).getAmount();
		}

		model.addAttribute("Sum", Sum);

		return "shopCart";
	}

	// Cập nhật giỏ hàng
	@RequestMapping(value = "/update-order", method = RequestMethod.POST)
	public String updateShopCart(Model model, HttpSession session, HttpServletRequest request) {
		// Lấy giá trị từ giỏ hàng người dùng
		String[] quantity = request.getParameterValues("quantity");
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		long Sum = 0;
		for (int i = 0; i < cart.size(); i++) {
			// Cập nhật số lượng
			cart.get(i).setQuantity(Integer.parseInt(quantity[i]));
			// Cập nhật đơn giá
			cart.get(i).setAmount((Integer.parseInt(quantity[i]) * cart.get(i).getProduct().getProductPrice()));
			Sum = Sum + cart.get(i).getAmount();
		}

		model.addAttribute("Sum", Sum);

		return "shopCart";
	}

	@RequestMapping(value = "/shop-cart", method = RequestMethod.GET)
	public String viewShopCart() {
		return "shopCart";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	// Xử lý đăng nhập
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String DangNhap(Model model, HttpSession session,
			@RequestParam(value = "username", defaultValue = "") String username,
			@RequestParam(value = "pass", defaultValue = "") String pass) {
		Boolean check = custommerDao.CheckLogin(username, pass);
		if (check == true) {
			session.setAttribute("username", username);
			return "redirect:/home";
		}
		
		return "login";
	}
	
	//Xử lý đăng xuất
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String Logout(Model model, HttpSession session) {
			session.removeAttribute("username");
			return "redirect:/home";
	}

	@RequestMapping(value = "/send-order", method = RequestMethod.GET)
	public String saveOrder(HttpSession session, Model model) {
		
		//Kiểm tra đăng nhập
		if (session.getAttribute("username") == null) {
			return "redirect:/home/login";
		}
		//Xử lý lưu đơn hàng vào csdl
		else {
			
			//Lấy giỏ hàng
			List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
			long TongTien =0;
			int TongSanPham = 0;
			for(int i = 0; i < cart.size(); i++) {
				TongTien += cart.get(i).getAmount(); 
				TongSanPham +=  cart.get(i).getQuantity();
			}
			// Khởi tạo giá trị cho đơn
			Orders order = new Orders();
			order.setCustomerUsername(session.getAttribute("username").toString());
			order.setOrderAmount(TongTien);
			order.setOrderDate(new Date());
			order.setOrderNumber(TongSanPham);
			order.setOrderStatus(0);
			//Lưu đơn hàng
			orderDao.SaveOrder(order);
			//Lấy id đơn vừa lưu
			Orders odSave =orderDao.getAll().get(orderDao.getAll().size() -1);
			long IdDon = odSave.getOrderId();
			// Lưu từng sản phẩm trong giỏ vào csdl
			for(int i = 0; i < cart.size(); i++) {
				Orderdetails od = new Orderdetails();
				od.setOrderId(IdDon);
				od.setOrderdetailQuantity(cart.get(i).getQuantity());
				od.setOrderdetailPrice(cart.get(i).getAmount());
				od.setProductId(cart.get(i).getProduct().getProductId());
				System.out.print("" + od.getOrderdetailPrice() + od.getOrderdetailQuantity() + od.getProductId() + od.getOrderId());
				//Lưu chi tiết từng sản phẩm
				orderdetailDao.SaveOrderDetail(od);
			}
			session.removeAttribute("cart");
			model.addAttribute("ThongBao", "Gửi đơn hàng thành công!");
		}

		return "shopCart";
	}

	// Kiểm tra sảm phẩm đã có trong giỏ hàng chưa
	private int CheckShopCart(List<CartItem> cart, Products product) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getProductId() == product.getProductId()) {
				return i;
			}
		}
		return -1;
	}
}
