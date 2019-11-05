package mint.productQnaBoard.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class ProductQnaBoardDTO {
	private int seq;
	private String productCode;
	private String id;
	private String subject;
	private String content;
	private int secretStatus;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date logtimeQ;
	private int replyStatus;
	private String replyContent;
}
