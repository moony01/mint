package mint.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
							@RequestParam String deleveryPrice,
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
		
		// System.out.println("list :"+list);
		// System.out.println("memberDTO :"+memberDTO);
		
		model.addAttribute("totalPoint", totalPoint);
		model.addAttribute("deleveryPrice", deleveryPrice);
		model.addAttribute("list", list);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("display", "/shop/goods/order.jsp");
		return "/shop/main/index";
	}
	
	// 마이페이지 - 주문내역 페이지
	@RequestMapping(value="/shop/mypage/myOrderList", method = RequestMethod.GET)
	public ModelAndView myOrderList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/mypage/myOrderList.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	// 마이페이지 - 주문내역
	@RequestMapping(value="/shop/mypage/getOrderInfo", method = RequestMethod.POST)
	public ModelAndView getOrderInfo(@RequestParam String dateOption, HttpSession session, Map<String, String> map, ModelAndView mav) {
		if(dateOption.contains("-")) {
			dateOption = dateOption.replace("/", "");
			map.put("from", dateOption.substring(0,6));
			map.put("to", dateOption.substring(9));
		}
		map.put("id", (String) session.getAttribute("memId"));
		List<Map<String, String>> list = orderService.getMyOrderInfo(map);
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		return mav;
		
	}
	// 마이페이지 - 주문내역 페이지 - 주문내역 상세보기
	@RequestMapping(value="/shop/mypage/myOrderDetails", method = RequestMethod.GET)
	public ModelAndView getMyOrderDetails(@RequestParam String ordernumber, HttpSession session, Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		
		List<Map<String, String>> productList = orderService.getMyOrderProductList(ordernumber);
		Map<String, String> orderDetails = orderService.getMyOrderDetails(ordernumber);
		
		System.out.println(productList);
		System.out.println(orderDetails);
		
		if(!((String) session.getAttribute("memId")).equals(productList.get(0).get("ID"))) {
			String result = "주문자 아이디와 현재 로그인중인 아이디가 일치하지 않습니다.";
			mav.addObject("result",result);
		} else {
			mav.addObject("productList",productList);
			mav.addObject("orderDetails",orderDetails);
		}
		mav.addObject("display","/shop/mypage/myOrderDetails.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	@RequestMapping(value="/shop/goods/redirectServer", method= RequestMethod.POST)
	@ResponseBody
	public void redirectSuccess(@RequestBody Map<String, Object> order,
								Model model,
								HttpSession session) {
		
		String id = (String)session.getAttribute("memId");
		ArrayList<String> productCode = (ArrayList<String>) order.get("productCode");
		ArrayList<String> qty = (ArrayList<String>) order.get("qty");
		ArrayList<String> price = (ArrayList<String>) order.get("price");
		ArrayList<String> discountRate = (ArrayList<String>) order.get("discountRate");
		
		order.remove("productCode");
		order.remove("qty");
		order.remove("price");
		order.remove("discountRate");
		order.put("id", id);
		System.out.println("order : "+order);
		orderService.insertOrderInfo(order);
		
		Map<String, Object> map = new HashMap<String, Object>();
		for(int i=0; i<productCode.size(); i++) {
			map.put("productCode", productCode.get(i));
			map.put("qty", qty.get(i));
			map.put("price", price.get(i));
			map.put("discountRate", discountRate.get(i));
			map.put("id", id);
			orderService.insertOrderDetail(map);
			orderService.updateProductStock(map);
			int memcart = orderService.deleteCartList(map);
			session.setAttribute("memCart", memcart);
		}
	}
	
}
