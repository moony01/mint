package mint.member.service;

import java.util.ArrayList;
import java.util.Collection;
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
	private boolean enabled = true; 
	private boolean accountNonExpired = true; 
	private boolean credentialsNonExpired = true; 
	private boolean accountNonLocked = true;
	private Collection authorities;
	
	//implements UserDetailsService 하여 override된 메소드. 
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		//DB에서 유저 정보를 불러오는 메소드
		
		System.out.println("[UserDetails]  "+id);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", "id");
		map.put("value", id);
		
		MemberDTO memberDTO = memberService.getUserBy(map);
		
		//DB에 일치하는 사용자가 없을 경우, exception 을 날림
		if(memberDTO == null) {
			throw new UsernameNotFoundException("아이디 혹은 비밀번호가 잘못되었습니다. ");
		}

		Collection memAuth = memberDTO.getAuthorities();
		memAuth  = authorities(memberDTO);
		//memberDTO.setAuthRole(authorities);
		
//		memberDTO = new MemberDTO(memberDTO.getUsername(), memberDTO.getPassword(), 
//				enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, 
//				authorities(memberDTO), memberDTO.getEmail(), memberDTO.getId());
//		
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
		authentication.getAuthorities();
		return null;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return false;
	}
	
	private Collection authorities(MemberDTO memberDTO) {
		authorities = new ArrayList();
		if(memberDTO.getId().equals("admin")) {
			authorities.add(new SimpleGrantedAuthority("hasRole('ROLE_ADMIN')"));
		} else {
			authorities.add(new SimpleGrantedAuthority("hasRole('ROLE_USER')"));
		}
		System.out.println("권한 부여 완료" + authorities);
		return authorities;
	}

}
