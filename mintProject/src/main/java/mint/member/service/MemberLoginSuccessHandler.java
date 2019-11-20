package mint.member.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import mint.member.bean.MemberDTO;

public class MemberLoginSuccessHandler implements AuthenticationSuccessHandler {
	//인증에 성공했다면 successHandler 클래스로 넘어오게 됨. 여기서 session을 부여한 뒤, 원하는 페이지로 리다이렉트 시켜준다. 
	
	private RequestCache requestCache = new HttpSessionRequestCache();  //RequestCache 객체 생성
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy(); //RedirectStrategy 객체 생성
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		HttpSession session = request.getSession();
		session.setAttribute("memId", memberDTO.getId());
		session.setAttribute("memName", memberDTO.getName());
		session.setAttribute("memEmail", memberDTO.getEmail());
		
		SavedRequest savedRequest = requestCache.getRequest(request, response); // savedRequest 가져옴 
		
		if(savedRequest != null) {
			String targetUrl = savedRequest.getRedirectUrl(); // 브라우저 세션에 저장된 url을 가져옴
			redirectStrategy.sendRedirect(request, response, targetUrl); // 인증에 성공하면 해당 url로  돌려보내주고 (redirect)
		} else { 
			redirectStrategy.sendRedirect(request, response, "/shop/main/index"); //그렇지 않다면 default 로 메인 인덱스로 보냄 
		}
		
		clearAuthenticationAttributes(request); //로그인에 성공했다면, 이전 로그인 시도(실패 시) 에러 세션 지우기
	}
	
	
	//로그인을 하는 과정에서 한번만에 로그인에 성공할 수도 있지만, 실패를 한 후 로그인에 성공하는 경우도 있다. 
	//이처럼 로그인에 실패하는 상황이 한번이라도 발생한다면, 에러가 세션에 저장되어 남아있게 된다. 로그인에 성공했다고 하지만 이렇게 세션에 에러가 남겨진 채로 넘어갈 수는 없다. 
	//따라서 로그인 성공 핸들러에서 에러 세션을 지우는 작업을 해줘야 한다. [references: https://to-dy.tistory.com/94]
	public void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session == null) return;  //세션이 null이면 (세션에 에러가 없다면) 그냥 리턴하고
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION); // 그렇지 않다면 authentication_exception이라는 이름 값으로 정의된 세션을 지운다. 
		
	}

}
