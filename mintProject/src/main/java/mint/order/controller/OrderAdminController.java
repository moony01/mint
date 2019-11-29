package mint.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import mint.order.bean.OrderInfoDTO;
import mint.order.service.OrderService;

@RestController
public class OrderAdminController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/admin/sales/order")
	public ModelAndView getOrderListForm(ModelAndView mav) {
		mav.addObject("display", "/admin/order/orderList.jsp");
		mav.setViewName("/admin/main/admin");
		
		return mav; 
	}
	
	@RequestMapping(value="/admin/sales/order/{searchValue}/{option}", method = RequestMethod.POST)
	public ModelAndView getOrderList(@PathVariable String option, 
									@PathVariable String searchValue, 
									@RequestParam(required = false, defaultValue = "1") String pg, ModelAndView mav) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", Integer.parseInt(option));

		if(searchValue.contains("-")) {
			searchValue = searchValue.replace(".", "");
			map.put("from", searchValue.substring(0, 6));
			map.put("to", searchValue.substring(9));
		}
		int totalArticle = orderService.getOrderTotalArticle();
		int endNum = Integer.parseInt(pg) *10;
		int startNum = endNum -9; 
		
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		List<OrderInfoDTO> list = orderService.getOrderList(map);
		mav.addObject("pg", pg);
		mav.addObject("totalArticle", totalArticle);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav; 
	}

	@RequestMapping("/admin/sales/orderView/{id}/{orderNumber}")
	public ModelAndView getOrderView(@PathVariable String id, @PathVariable String orderNumber,
									ModelAndView mav) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("orderNumber", orderNumber);
		
		List<Map<String, String>> list = orderService.getOrderView(map);
		
		mav.addObject("list", list);
		mav.addObject("display", ""
				+ "/admin/order/orderView.jsp");
		mav.setViewName("/admin/main/admin");
		return mav; 
		
	}
	
	@RequestMapping(value="/admin/sales/orderUpdate/{id}/{orderNumber}", method = RequestMethod.POST)
	public void updateOrderStatus(@PathVariable String id, @PathVariable String orderNumber) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("orderNumber", orderNumber);
		orderService.updateOrderStatus(map);

	}

}
