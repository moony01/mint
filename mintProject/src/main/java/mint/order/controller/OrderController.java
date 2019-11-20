package mint.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mint.member.bean.MemberDTO;
import mint.order.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/shop/goods/order", method=RequestMethod.GET)
	public String orderList(@RequestParam String ctCount,
							@RequestParam String productCode,
							@RequestParam String totalPoint,
							Map<String, Object> resultMap,
							Model model,
							HttpSession session) {
		
		String id = (String)session.getAttribute("memId");
		Map<String,Object> map = new HashMap<String,Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		//카트 수량 조절
		String[] ctCountWord = ctCount.split(",");
		String[] productCodetWord = productCode.split(",");
		for (int i = 0; i < ctCountWord.length; i++) {
			map.put("ctCount", ctCountWord[i]);
			map.put("productCode", productCodetWord[i]);
			map.put("id", id);
			orderService.updateCartCount(map);
			resultMap = orderService.getProductCartData(map);
			list.add(resultMap);
		}

		MemberDTO memberDTO = orderService.getUserData(map);
		
		System.out.println("list :"+list);
		System.out.println("memberDTO :"+memberDTO);
		
		model.addAttribute("totalPoint", totalPoint);
		model.addAttribute("list", list);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("display", "/shop/goods/order.jsp");
		return "/shop/main/index";
	}
}
