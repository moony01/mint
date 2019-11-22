package mint.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import mint.member.bean.MemberDTO;

/**
 * 191108
 * 홍소연(@hhhongso)
 */
public class MemberAuthenticationProvider implements AuthenticationProvider{
	@Autowired
	private UserDetailsService memberAuthServiceImpl;
	@Autowired // 비밀번호 암호화를 위한 클래스.
	private PasswordEncoder passwordEncoder;  
		
	@Override 
	// loadUserByUsername() 후 넘어옴. 인증 토큰을 생성하고 password 값을 비교하여 권한을 부여하는 메소드.
	// 메소드 수행 후  인증 성공/실패 여부에 따라 security-context.xml 에서 지정한 url 경로로 이동한다. 
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		//유저가 입력한 정보를 아이디, 비밀번호로 토큰을 생성한다. (로그인 한 유저 정보를 저장)
		UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication;
		
		//UserDetailService(DB)의 유저 정보를 가져온다. 
		MemberDTO memberDTO = (MemberDTO) memberAuthServiceImpl.loadUserByUsername(authToken.getName());
		
		//DB에 일치하는 사용자가 없을 경우, exception 을 날림
		if(memberDTO == null) {
			throw new UsernameNotFoundException("cannot find username " + authToken.getName());
		}
		
		//비밀번호 복호화
		if(!passwordEncoder.matches(authToken.getCredentials()+"", memberDTO.getPwd())) { 
			throw new BadCredentialsException("cannot match password");		
		}
		
		
		
		//권한 부여: memberDTO의 getAuthorities() 메소드에서 담당. 
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) memberDTO.getAuthorities();
		return new UsernamePasswordAuthenticationToken(memberDTO, memberDTO.getPwd(), authorities);
		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
	

}
