package mint.cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mint.cart.bean.CartDTO;
import mint.cart.service.CartService;
import mint.product.bean.ProductDTO;

@Controller
public class CartController {
	@Autowired
	private CartService cartService;
	
	
	@RequestMapping(value="/shop/goods/cart", method=RequestMethod.GET)
	public String cartList(Model model) {
		model.addAttribute("display", "/shop/goods/cart.jsp");
		return "/shop/main/index";
	}
	
	@RequestMapping(value="/shop/goods/getCartList", method=RequestMethod.GET)
	public ModelAndView getCartList(Map<String,String> map,
									HttpSession session) {
		
		String id = (String)session.getAttribute("memId");
		map.put("id", id);
		
		List<ProductDTO> list = cartService.getCartList(map);
		System.out.println("list : "+list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
}
