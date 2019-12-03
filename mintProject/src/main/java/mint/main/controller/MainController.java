package mint.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mint.event.bean.EventDTO;
import mint.event.service.EventService;
import mint.product.bean.ProductDTO;
import mint.product.service.ProductManageService;

@Controller
public class MainController {
	@Autowired
	private ProductManageService productService; 
	@Autowired
	private EventService eventService;  
	
	@RequestMapping(value="/shop/main/index", method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		
		List<ProductDTO> recList = productService.getProductListMain(0); // 이상품 어떄요? 
		List<ProductDTO> newList = productService.getProductListMain(1); // 신상품
		List<ProductDTO> saleList = productService.getProductListMain(2); // 알뜰상품
		
		List<EventDTO> eventList = eventService.getEventListMain();
		
		mav.addObject("recList", recList);
		mav.addObject("newList", newList);
		mav.addObject("saleList", saleList);
		mav.addObject("eventList", eventList);
		mav.addObject("display","/shop/main/main.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
}
