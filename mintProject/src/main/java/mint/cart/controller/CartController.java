package mint.cart.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mint.cart.bean.CartDTO;
import mint.cart.service.CartService;
import mint.noticeBoard.bean.NoticeBoardDTO;
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
		
		List<Map<String,String>> list = cartService.getCartList(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/shop/goods/cartListDelete", method=RequestMethod.POST)
	@ResponseBody
	public void cartListDelete(@RequestParam Map<String,String>map,
							   Model model,
							   HttpSession session) {
		String id = (String)session.getAttribute("memId");
		map.put("id", id);
		
		System.out.println("load map : "+map);
		int memcart = cartService.cartListDelete(map);
		session.setAttribute("memCart", memcart);
	}
	
	@RequestMapping(value="/shop/goods/addCartList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView addCartList(@RequestParam Map<String,String>map,HttpSession session) {
		System.out.println("addCartList map : " + map);
		ModelAndView mav = new ModelAndView();
		
		//카드 담을때 같은 상품이 있나 확인
		//아이디 추가_20191202
		String memId = (String) session.getAttribute("memId");
		map.put("memId", memId);
		
		int cnt  = cartService.getSameCart(map);
		
		if(cnt > 0) {
			mav.addObject("gubun", 1);
			mav.setViewName("jsonView");
		}else {
			String id = (String)session.getAttribute("memId");
			map.put("id", id);
			
			int count = cartService.addCartProduct(map);
			session.setAttribute("memCart", count);
			
			mav.addObject("memCart", session.getAttribute("memCart"));
			mav.addObject("gubun", 2);
			mav.setViewName("jsonView");
		}
		return mav;
	}
	
	@RequestMapping(value="/shop/goods/cartSoldOutDelete", method=RequestMethod.POST)
	@ResponseBody
	public void cartSoldOutDelete(@RequestBody Map<String,Object> map,
								  HttpSession session) {
		String id = (String)session.getAttribute("memId");
		
		System.out.println("map : "+map);
		System.out.println("id : "+id);
		
		ArrayList<String> productCode = (ArrayList<String>) map.get("productCode");
		map.remove("productCode");
		System.out.println(productCode);
		System.out.println(map);
		
		for(int i=0; i<productCode.size(); i++) {
			map.put("productCode", productCode.get(i));
			System.out.println(map);
			int memcart = cartService.cartSoldOutDelete(map);
			session.setAttribute("memCart", memcart);
		}
		
		
	}
	
}




























