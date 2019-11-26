package mint.review.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Review {
	private int seq;
	private String orderNumber;
	private String productCode;
	private String id;
	private String subject;
	private String content;
	private String imgName;
	private int star;
	private String logtime;
}
