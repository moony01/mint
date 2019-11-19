package mint.order.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mint.member.bean.MemberDTO;
import mint.order.service.OrderService;
import mint.product.bean.ProductDTO;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/shop/goods/order", method=RequestMethod.GET)
	public String orderList(@ModelAttribute ProductDTO productDTO,//프론트에서 submit한 데이터를 modelAttribute로 자동으로 메핑
							@RequestParam String discountPrice,
							@RequestParam String price2,
							@RequestParam String savingPrice,
							Map<String,String> map,
							Model model,
							HttpSession session) {
		
		String id = (String)session.getAttribute("memId");
		map.put("id", id);
		
		
		MemberDTO memberDTO = orderService.getUserData(map);
		System.out.println(memberDTO);
		System.out.println(productDTO);
		
		model.addAttribute("productDTO", productDTO);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("discountPrice", discountPrice);
		model.addAttribute("price2", price2);
		model.addAttribute("savingPrice", savingPrice);
		model.addAttribute("display", "/shop/goods/order.jsp");
		return "/shop/main/index";
	}
}
