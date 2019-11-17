package mint.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mint.order.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/shop/goods/order", method=RequestMethod.GET)
	public String orderList(Model model) {
		model.addAttribute("display", "/shop/goods/order.jsp");
		return "/shop/main/index";
	}
}
