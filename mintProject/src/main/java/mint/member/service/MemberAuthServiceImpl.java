package mint.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import mint.member.bean.MemberDTO;

public class MemberAuthServiceImpl implements UserDetailsService, AuthenticationProvider {
	@Autowired
	private MemberService memberService;
	
	//implements UserDetailsService 하여 override된 메소드. 
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		//DB에서 유저 정보를 불러오는 메소드
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", "id");
		map.put("value", id);
		
		MemberDTO memberDTO = memberService.getUserBy(map);
		
		//DB에 일치하는 사용자가 없을 경우, exception 을 날림
		if(memberDTO == null) {
			throw new UsernameNotFoundException("아이디 혹은 비밀번호가 잘못되었습니다. ");
		}
		
		//DB에 일치하는 사용자가 있을 경우, 해당 사용자에게 권한 부여. (관리자의 경우 admin 권한, 이외 일반 유저는 user 권한.) 
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		if(memberDTO.getId().equals("admin")) {
			roles.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			//memberDTO.setRole(roles);
		} else {
			roles.add(new SimpleGrantedAuthority("ROLE_USER"));
			//memberDTO.setRole(roles);			
		}
		
		//loadUserByUsername()의 리턴타입에 맞도록 UserDatails로 캐스팅. 
		UserDetails user = (UserDetails) memberDTO;
		
		return user;
	}
	
	// implements AuthenticationProvider하여 override된 메소드. 
	// 개발자에 따라 이 두 함수를 이용하여 권한부여 & User class에 세팅하는 경우도 있고, loadUserByUsername()에서 모두 처리하는 방법도 있는데, 
	// 저는 loadUserByUsername()에서 모두 처리했습니다. 
	// 우선은 이렇게 진행하고, 공부하다가 아래 메소드를 사용하는 게 더 효율적이라 판단되면 리팩토링 해볼게요. 
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		return null;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return false;
	}


}
