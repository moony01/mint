package mint.faqBoard.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class FAQBoardDTO {
	private int seq;
	private String id;
	private String subject;
	private String content;
	private String category;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date logtime;
}
