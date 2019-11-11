package mint.member.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	@Autowired //이메일 인증 구현을 위한 클래스.
	private MemberMailSendService mmss; 
	@Autowired 
	private MemberService memberService;
	@Autowired // spring security 구현을 위한 클래스. 
	private MemberAuthServiceImpl memberAuthServiceImpl; 
	@Autowired // 비밀번호 암호화를 위한 클래스.
	private PasswordEncoder passwordEncoder;  
	
	//회원가입
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
		String pwd = passwordEncoder.encode(memberDTO.getPwd()); //비밀번호 암호화
		memberDTO.setPwd(pwd);
		memberDTO.setBirthday(birthday);
		//memberDTO.setAuthRole(null);	
		
		memberService.writeMember(memberDTO);
	}
	
	//아이디 & 이메일 중복확인 
	@RequestMapping("/shop/member/isDuplicated")
	@ResponseBody
	public boolean isDuplicated(@RequestParam Map<String, String> map, ModelAndView mav) {
		boolean isDuplicated = false; 
		
		Set<String> set = map.keySet(); 
		for (String key : set) {
			map.put("key", key); //key="id" or "email", value=해당값
			map.put("value", map.get(key));
		}

		MemberDTO memberDTO = memberService.getUserBy(map);
		if(memberDTO != null) {
			isDuplicated = true;
		}
		
		mav.setViewName("jsonView");
		return isDuplicated;
	}
	
	//이메일 인증번호 요청
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
	
	//로그인
	@RequestMapping(value="/shop/member/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/member/login.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	@RequestMapping(value="/shop/member/loginOk", method = RequestMethod.POST)
	@ResponseBody
	public String loginOk(@RequestParam Map<String, String> map,
						HttpSession session, HttpServletRequest request) {
		
		for(String key : map.keySet()) {
			System.out.println("key:" + key + "/ value: " + map.get(key));
		}
			
		MemberDTO memberDTO = (MemberDTO) memberAuthServiceImpl.loadUserByUsername(map.get("id"));
		if(passwordEncoder.matches(map.get("pwd"), memberDTO.getPwd())) { //비밀번호 복호화
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memEmail", memberDTO.getEmail());
			return "success";
		} else {
			return "fail";
		}
		
	}
	
	//kakao API 로그인 
	@RequestMapping(value="/shop/member/kakaoLogin")
	@ResponseBody
	public void kakaoLogin(@RequestParam String email, HttpSession session, Map<String, String> map) {
		map.put("key", "email");
		map.put("value", email);
		MemberDTO memberDTO = memberService.getUserBy(map);
		if(memberDTO.getEmail().equals(email)) {
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memEmail", memberDTO.getEmail());
		}
	}
		
	//로그아웃: spring security 가 인터셉트하여 처리하기 때문에,컨트롤러를 거치지 않음 =>세션 삭제 후 메인 인덱스로 이동시킴.
	
	// 중복 로그인 시 
	@RequestMapping("/shop/member/loginError")
	public String loginError() {
		System.out.println("팅겨");
		return "/shop/member/loginError";
	}
	/*
	 * 1. Spring security References:
	 * 	1) https://sjh836.tistory.com/165
	 * 	2) https://hamait.tistory.com/325
	 * 	3) https://zgundam.tistory.com/47?category=430446
	 * 
	 * 2. CSRF Token References: 
	 *  1) https://itstory.tk/entry/CSRF-%EA%B3%B5%EA%B2%A9%EC%9D%B4%EB%9E%80-%EA%B7%B8%EB%A6%AC%EA%B3%A0-CSRF-%EB%B0%A9%EC%96%B4-%EB%B0%A9%EB%B2%95
	 */
	
	// 회원정보 수정
	@RequestMapping("/shop/member/myinfo_pwd_check")
	public ModelAndView myinfo_pwd_check(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/member/myinfo_pwd_check.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	@RequestMapping("/shop/member/myinfo_pwd_check_result")
	@ResponseBody
	public ModelAndView myinfo_pwd_check(@RequestParam String pwd, HttpSession session, Map<String, String> map) {
		map.put("key", "id");
		map.put("value", (String) session.getAttribute("memId"));
		MemberDTO memberDTO = memberService.getUserBy(map);
		ModelAndView mav = new ModelAndView();
		if(passwordEncoder.matches(pwd, memberDTO.getPwd())) { //비밀번호 복호화
			mav.addObject("result", "success");
		} else {
			mav.addObject("result", "fail");
		}
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping("/shop/member/myinfo")
	public ModelAndView myinfo(HttpSession session, Map<String, String> map) {
		map.put("key", "id");
		map.put("value", (String) session.getAttribute("memId"));
		MemberDTO memberDTO = memberService.getUserBy(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDTO", memberDTO);
		mav.addObject("display","/shop/member/myinfo.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	// 출석체크 
	@RequestMapping(value="/shop/member/attendance", method = RequestMethod.GET)
	public ModelAndView attendance() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/member/attendance.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	@RequestMapping(value="/shop/member/attendance_checkin", method = RequestMethod.POST)
	@ResponseBody
	public String attendance(HttpSession session, SimpleDateFormat sdf) {
		memberService.insertAttendance((String)session.getAttribute("memId")); // 첫 출첵
		return new SimpleDateFormat("yyyy-MM-dd").format(Timestamp.valueOf(LocalDate.now().atStartOfDay()));
	}
	
	@RequestMapping(value="/shop/member/getAttDates", method = RequestMethod.POST)
	public ModelAndView getAttdates(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String[] attDates = memberService.getAttDates((String)session.getAttribute("memId")).replaceAll("/", "-").split(",");
		mav.addObject("attDates",attDates);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/shop/member/attendance_isAlready", method = RequestMethod.POST)
	@ResponseBody
	public String attendanceForSure(HttpSession session, SimpleDateFormat sdf) {
		String isAlready = null;
		String[] attDates = memberService.getAttDates((String)session.getAttribute("memId")).replaceAll("/", "-").split(",");
		if(("20"+attDates[attDates.length-1]).equals(new SimpleDateFormat("yyyy-MM-dd").format(Timestamp.valueOf(LocalDate.now().atStartOfDay())))) {
			isAlready = "already";
		} else {
			isAlready = "yet";
		}
		return isAlready;
	}
	
	// 아이디/비밀번호 찾기 
	@RequestMapping("/shop/member/findId")
	public ModelAndView findId(ModelAndView mav) {
		mav.addObject("display", "/shop/member/findId.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	@RequestMapping("/shop/member/findPwd")
	public ModelAndView findPwd(ModelAndView mav) {
		mav.addObject("display", "/shop/member/findPwd.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	@RequestMapping("/shop/member/findIdOk")
	@ResponseBody
	public String findIdOk(@RequestParam Map<String, String> map) {
		Object[] key =  map.keySet().toArray(); 
		Object[] value = map.values().toArray();
		
		Map<Object, Object> map2 = new HashMap<Object, Object>();
		map2.put("key", key);
		map2.put("value", value);
		String id = memberService.findUserBy(map2);
		return id;
	}
	
	@RequestMapping("/shop/member/updateInfo")
	public ModelAndView updateInfo(@RequestParam Map<String, String> map, ModelAndView mav) {
		System.out.println(map);
		
		String pwd = passwordEncoder.encode(map.get("pwd")); //비밀번호 암호화
		map.put("pwd", pwd);
		
		memberService.updateInfo(map);
		mav.addObject("display","/shop/template/body.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}

	
}
