package mint.member.service;

import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 * 191106
 * 홍소연(@hhhongso)
 */

@Service("mmss")
public class MemberMailSendService {
	@Autowired 
	private JavaMailSender mailSender;
	private int size; 
	
	private String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}
	
	//인증코드 난수 발생
	private String getAuthCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0; 
		
		while(buffer.length() < size) {
			num = random.nextInt(10);
			buffer.append(num);
		}
		
		return buffer.toString();
	}
	
	public String mailSendWithUserKey(String email, String id) {
		//6자리 난수 인증번호 생성
		String authKey = getKey(6);

		//인증메일 보내기
		MimeMessage mail = mailSender.createMimeMessage();
		String mailContent = "<img src='https://i.pinimg.com/236x/b4/54/f7/b454f721310bbec9d41aa75fdb2ca4d5--typography-logo-design-typography.jpg' alt='' style='width : 200px;'>"
				+"<h2> Market In Taste, MINT 입니다.  </h2><br>"
				+ "회원님의 인증번호는 [" + authKey + "] 입니다. ";
		
		try {
			mail.setSubject("[MINT] MINT 인증메일입니다. ", "utf-8");
			mail.setText(mailContent, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return authKey;
	}
	
	

}
