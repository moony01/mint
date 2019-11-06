package mint.member.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;
@Data
@Component
public class MemberDTO {
    private String name;
    private String id;
    private String pwd;
    private String email;
    private String tel;
    private String addr1;
    private String addr2;
    private int gender;
    private String birthday;
    private int isStaff;
    private int point;
    private int isAgreedSMS;
    private int memLevel;
    private String authSecurity;
    private Date logtime;

}
