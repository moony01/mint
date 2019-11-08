package mint.spring.conf;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;


@Configuration
public class MailAuthConfiguration {
	@Bean(name="mailSender")
	public JavaMailSender getJavaMailSender() {
		Properties properties = new Properties(); 
		properties.put("mail.smtp.auth", true);
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.starttls.required", true);
		properties.put("mail.debug", true);
		
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("marketintaste@gmail.com");
		mailSender.setPassword("mintproject1");
		mailSender.setDefaultEncoding("utf-8");
		mailSender.setJavaMailProperties(properties);
		
		return mailSender;
		
	}
	 
	// 스프링 이메일 인증 References:
	//1) https://blog.naver.com/PostView.nhn?blogId=vnemftnsska2&logNo=221413314636&parentCategoryNo=&categoryNo=29&viewDate=&isShowPopularPosts=false&from=postView
	//2) https://thiago6.tistory.com/38 
	//3) https://dlgkstjq623.tistory.com/351
	
}
