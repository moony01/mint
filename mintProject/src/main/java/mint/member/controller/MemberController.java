package mint.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@RequestMapping(value="/shop/member/join", method = RequestMethod.GET)
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/member/join.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	@RequestMapping(value="/shop/member/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/member/login.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
}
