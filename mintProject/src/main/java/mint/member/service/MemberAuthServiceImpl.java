package mint.member.service;

import java.util.ArrayList;
import java.util.List;

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

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		//DB에서 유저 정보를 불러오는 메소드
				System.out.println("hi loadUserByUserName: " + id);
				MemberDTO memberDTO = memberService.getUserById(id);
				System.out.println("successfully get memberDTO");
				
				UserDetails user = (UserDetails) memberDTO;
				
				if(memberDTO == null) {
					throw new UsernameNotFoundException("No user found with username " + memberDTO.getName());
				}
				
				List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
				
				if(memberDTO.getId().equals("admin")) {
					roles.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
						
				} else {
					roles.add(new SimpleGrantedAuthority("ROLE_USER"));
					
				}
				
				System.out.println("add role to " + user.getUsername());
				for (int i = 0; i < roles.size(); i++) {
					System.out.println("role: "+roles.get(i));
					
				}
		return user;
	}

}
