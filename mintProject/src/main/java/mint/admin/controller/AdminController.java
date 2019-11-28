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
		mav.addObject("display","/admin/order/chart.jsp");
		mav.setViewName("/admin/main/admin");
		return mav;
	}

	@RequestMapping("/admin/main/denied")
	public String denied() {
		return "/admin/main/denied";
	}
}
