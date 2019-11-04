package mint.qnaBoard.bean;

import java.util.Date;

import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Controller
@Data
public class QnaBoardDTO {
	private int seq;
	private String id;
	private String subject;
	private String content;
	private String fileName; 
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="YYYY-MM-DD")
	private Date logtimeQ;
	private int category;
	private int replyStatus;
	private String replyContent;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="YYYY-MM-DD")
	private Date logtimeA;
}
