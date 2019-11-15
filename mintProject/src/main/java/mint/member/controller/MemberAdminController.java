package mint.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberAdminController {
	
	@RequestMapping("/admin/member/supplierForm")
	public ModelAndView getSupplierForm(ModelAndView mav) {
		mav.addObject("display", "/admin/member/supplierForm.jsp");
		mav.setViewName("/admin/main/admin");
		
		return mav;
	}
}
