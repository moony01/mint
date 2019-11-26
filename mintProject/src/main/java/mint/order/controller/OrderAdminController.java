package mint.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
									@PathVariable String searchValue, ModelAndView mav) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<OrderInfoDTO> list = null; 
		map.put("status", Integer.parseInt(option));

		if(searchValue.contains("-")) {
			searchValue = searchValue.replace(".", "");
			map.put("from", searchValue.substring(0, 6));
			map.put("to", searchValue.substring(9));
			System.out.println(map);
			list = orderService.getOrderListByDate(map);
		} else {
			list = orderService.getOrderList(map);
		}
		
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		System.out.println("map: " + map);
		System.out.println("list: " + list);
		
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
		mav.addObject("display", "/admin/order/orderView.jsp");
		mav.setViewName("/admin/main/admin");
		return mav; 
		
	}
	
	@RequestMapping(value="/admin/sales/orderUpdate/{orderNumber}", method = RequestMethod.POST)
	public void updateOrderStatus(@PathVariable String orderNumber) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderNumber", orderNumber);
		orderService.updateOrderStatus(map);

	}

}
