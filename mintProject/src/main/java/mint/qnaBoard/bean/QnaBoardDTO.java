package mint.qnaBoard.bean;

import java.util.Date;
import org.springframework.stereotype.Component;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

@Component
@Data
public class QnaBoardDTO {
	private int seq;
	private String id;
	private String orderNumber;
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
