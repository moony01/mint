package mint.main.controller;


import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mint.member.bean.MemberDTO;

@Controller
public class MainController {
	@RequestMapping(value="/shop/main/index", method=RequestMethod.GET)
	public ModelAndView index(Authentication auth, HttpSession session) {
		if(auth != null) {
			MemberDTO memberDTO = (MemberDTO) auth.getPrincipal();
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memEmail", memberDTO.getEmail());
			
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display","/shop/template/body.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
}
