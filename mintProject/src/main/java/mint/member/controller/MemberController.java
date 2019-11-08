package mint.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mint.member.bean.MemberDTO;
import mint.member.service.MemberAuthServiceImpl;
import mint.member.service.MemberMailSendService;
import mint.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired 
	private MemberMailSendService mmss;
	@Autowired 
	private MemberService memberService;
	@Autowired
	private MemberAuthServiceImpl memberAuthServiceImpl;
	
	@RequestMapping(value="/shop/member/join", method = RequestMethod.GET)
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/member/join.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	@RequestMapping("/shop/member/joinOk")
	@ResponseBody
	public void writeMember(@ModelAttribute MemberDTO memberDTO, @RequestParam Map<String, String> map) {
		String birthday = map.get("year") + map.get("month") + map.get("day");
		memberDTO.setBirthday(birthday);
		memberDTO.setAuthSecurity("Y"); //추후 spring security 로 설정 예정.
		memberService.writeMember(memberDTO);
	}
	
	@RequestMapping(value="/shop/member/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/member/login.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	@RequestMapping("/shop/member/loginOk")
	@ResponseBody
	public void loginOk(@RequestParam String id, @RequestParam String pwd, HttpSession session) {
		System.out.println("hi security");
		MemberDTO memberDTO = (MemberDTO) memberAuthServiceImpl.loadUserByUsername(id);
		System.out.println("memberDTO(userDetail) 가져오기");
		if(memberDTO == null) {
			System.out.println("확인되지 않은 사용자입니다. ");
		} else {
			System.out.println("welcome !!! ");
			System.out.println(memberDTO.getId());
			session.setAttribute("memDTO", memberDTO);
		}
		
	}
	
	//인증번호 요청
	@RequestMapping("/shop/member/auth")
	@ResponseBody
	public void sendEmailAuth(@RequestParam String id, @RequestParam String email, 
							HttpServletResponse response, Model model) {	
		//인증번호 생성
		String authKey = mmss.mailSendWithUserKey(email, id);
		
		Cookie cookie = new Cookie(id, authKey); //사용자의 아이디 = key, 인증번호 = value 로 쿠키를 생성한다. 
		cookie.setMaxAge(60*3); //발급받은 인증번호는 3분동안 유효하다.
		response.addCookie(cookie);
	}

	//인증번호 확인
	@RequestMapping("/shop/member/certiAuthKey")
	@ResponseBody
	public String certiAuthKey(@RequestParam String id, @RequestParam String certiAuthKey, HttpServletRequest request){
		String isAuthorized = "false"; 
		
		Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals(id) && cookies[i].getValue().equals(certiAuthKey)) {
				isAuthorized = "true"; //사용자가 입력한 아이디(key), 인증번호(value)와 일치하는 쿠키가 있으면 "true" 를 리턴. 
				return isAuthorized;
			}
		}
		
		return isAuthorized;
	}
	
}
