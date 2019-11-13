package mint.member.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.HashMap;
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
import mint.member.service.MemberMailSendService;
import mint.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired //이메일 인증 구현을 위한 클래스.
	private MemberMailSendService mmss; 
	@Autowired 
	private MemberService memberService;	
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
	public ModelAndView login(@RequestParam(required = false, defaultValue = "") String status) {
		ModelAndView mav = new ModelAndView();
		if(status.equals("fail")) {
			mav.addObject("status", "fail");
		} else if(status.equals("need")) {
			mav.addObject("status", "need");
		} else if(status.equals("duplicated")) {
			mav.addObject("status", "duplicated");
		}
		mav.addObject("display", "/shop/member/login.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	@RequestMapping("/shop/member/needLogin")
	public ModelAndView needLogin() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/member/needLogin.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	@RequestMapping("/shop/member/duplicatedLogin")
	public ModelAndView duplicatedLogin() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/member/duplicatedLogin.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
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

	// 회원정보 수정 - 비밀번호 확인 페이지
	@RequestMapping("/shop/mypage/myinfo_pwd")
	public ModelAndView myinfo_pwd_check(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/mypage/myinfo_pwd.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}

	// 회원정보 수정 - 비밀번호 확인 
	@RequestMapping("/shop/mypage/myinfo_pwd_conf")
	@ResponseBody
	public ModelAndView myinfo_pwd_check(@RequestParam String pwd, HttpSession session, Map<String, String> map) {
		map.put("key", "id");
		map.put("value", (String) session.getAttribute("memId"));
		MemberDTO memberDTO = memberService.getUserBy(map);
		ModelAndView mav = new ModelAndView();
		if (passwordEncoder.matches(pwd, memberDTO.getPwd())) { // 비밀번호 복호화
			mav.addObject("result", "success");
		} else {
			mav.addObject("result", "fail");
		}
		mav.setViewName("jsonView");
		return mav;
	}

	// 회원정보 수정 - 수정/탈퇴 페이지
	@RequestMapping("/shop/mypage/myinfo")
	public ModelAndView myinfo(HttpSession session, Map<String, String> map) {
		map.put("key", "id");
		map.put("value", (String) session.getAttribute("memId"));
		MemberDTO memberDTO = memberService.getUserBy(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDTO", memberDTO);
		mav.addObject("display","/shop/mypage/myinfo.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	// 출석체크 - 출석체크 페이지
	@RequestMapping(value="/shop/mypage/attendance", method = RequestMethod.GET)
	public ModelAndView attendance() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/member/attendance.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	// 출석체크 - 당일 출석체크
	@RequestMapping(value="/shop/mypage/attendance_checkin", method = RequestMethod.POST)
	@ResponseBody
	public String attendance(HttpSession session, SimpleDateFormat sdf) {
		memberService.insertAttendance((String)session.getAttribute("memId")); // 첫 출첵
		return new SimpleDateFormat("yyyy-MM-dd").format(Timestamp.valueOf(LocalDate.now().atStartOfDay()));
	}
	
	// 출석체크 - DB에 저장된 출석체크 정보
	@RequestMapping(value="/shop/mypage/getAttDates", method = RequestMethod.POST)
	public ModelAndView getAttdates(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String[] attDates = memberService.getAttDates((String)session.getAttribute("memId")).replaceAll("/", "-").split(",");
		mav.addObject("attDates",attDates);
		mav.setViewName("jsonView");
		return mav;
	}

	// 춣석체크 - 하루에 한번만 가능
	@RequestMapping(value = "/shop/mypage/attendance_checkdup", method = RequestMethod.POST)
	@ResponseBody
	public String attendanceCheckDup(HttpSession session, SimpleDateFormat sdf) {
		String att = null;
		String[] attDates = memberService.getAttDates((String) session.getAttribute("memId")).replaceAll("/", "-")
				.split(",");
		if (("20" + attDates[attDates.length - 1])
				.equals(new SimpleDateFormat("yyyy-MM-dd").format(Timestamp.valueOf(LocalDate.now().atStartOfDay())))) {
			att = "already";
		} else {
			att = "yet";
		}
		return att;
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
		String pwd = passwordEncoder.encode(map.get("pwd")); //비밀번호 암호화
		map.put("pwd", pwd);
		
		memberService.updateInfo(map);
		mav.addObject("display","/shop/template/body.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	// 마이페이지 - 개인정보 수정
	@RequestMapping("/shop/mypage/myinfo_modify")
	@ResponseBody
	public void myinfo_modify(@ModelAttribute MemberDTO memberDTO, @RequestParam Map<String, String> map) {
		String birthday = map.get("year") + map.get("month") + map.get("day");
		memberDTO.setBirthday(birthday);
		if(map.get("npwd") != "") {
			memberDTO.setPwd(passwordEncoder.encode(map.get("npwd")));
		}
		memberService.modifyMember(memberDTO);
	}
	
	// 마이페이지 - 탈퇴하기
	@RequestMapping(value="/shop/mypage/remove_account")
	@ResponseBody
	public String close_account(@RequestParam String pwd, HttpSession session, Map<String, String> map) {
		String result = null;
		map.put("key", "id");
		map.put("value", (String) session.getAttribute("memId"));
		MemberDTO memberDTO = memberService.getUserBy(map);
		if (passwordEncoder.matches(pwd, memberDTO.getPwd())) { // 비밀번호 복호화
			memberService.deleteMember((String) session.getAttribute("memId"));
			session.invalidate();
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}

}
