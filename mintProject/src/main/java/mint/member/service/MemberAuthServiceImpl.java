package mint.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import mint.member.bean.MemberDTO;

public class MemberAuthServiceImpl implements UserDetailsService {
	@Autowired
	private MemberService memberService;
	
	@Override //DB에서 유저 정보를 불러오는 역할을 하는 메소드
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", "id");
		map.put("value", id);
		
		MemberDTO memberDTO = memberService.getUserBy(map); // DB에서 유저정보 조회
		
		return memberDTO;
	
	}

}
