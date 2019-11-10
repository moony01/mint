package mint.cart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CartController {

	@RequestMapping(value="/shop/goods/cart", method=RequestMethod.GET)
	public String cartList(Model model) {
		model.addAttribute("display", "/shop/goods/cart.jsp");
		return "/shop/main/index";
	}
	
	@RequestMapping(value="/shop/goods/getCartList")
	public String getCartList(Model model,
							  HttpSession session) {
		
		String id = (String)session.getAttribute("memId");
		
		return "";
	}
}
