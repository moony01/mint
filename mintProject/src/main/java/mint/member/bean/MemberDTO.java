package mint.member.bean;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;


import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter @Setter
@Component
@RequiredArgsConstructor
public class MemberDTO  implements UserDetails { //
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
 // private Collection authRole;
    private Date logtime;
    
	@Override
	public Collection<GrantedAuthority> getAuthorities() { 
        return null;
	}

	@Override
	public String getPassword() {
		return this.pwd;
	}

	@Override
	public String getUsername() {
		return this.id;
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
