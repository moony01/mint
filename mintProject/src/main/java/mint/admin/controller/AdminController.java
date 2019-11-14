package mint.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@RequestMapping(value="/admin/main/admin", method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display","/shop/template/body.jsp");
		mav.setViewName("/admin/main/admin");
		return mav;
	}
	
	@RequestMapping(value="/admin/sales", method=RequestMethod.GET)
	public ModelAndView sales() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display","/admin/service/chart.jsp");
		mav.setViewName("/admin/main/admin");
		return mav;
	}
}
