package mint.member.bean;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
public class MemberDTO implements UserDetails { 
	//loadUserByUsername() 의 리턴값으로 캐스팅 하기 위해 UserDetails 를 implements 함. 실제 오버라이드 하여 사용하는 함수는 getAuthorities()뿐이며, 나머지는 사용하지 않음.
    private String name;
    private String id;
    private String pwd;
    private String email;
    private String tel;
    private String addr1;
    private String addr2;
    private int gender;
    private String birthday;
    private int point;
    private int isAgreedSMS;
    private int memLevel;
    private String attDate;
    private Date logtime;
    
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		if(this.id.equals("admin")) {
			authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		} else {
			authorities.add(new SimpleGrantedAuthority("ROLE_USER"));			
		}
		return authorities;
	}

	@Override
	public String getPassword() {
		return this.pwd;
	}


	@Override
	public String getUsername() {
		return this.pwd;
	}


	@Override
	public boolean isAccountNonExpired() {
		return true;
	}


	@Override
	public boolean isAccountNonLocked() {
		return true;
	}


	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}


	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
