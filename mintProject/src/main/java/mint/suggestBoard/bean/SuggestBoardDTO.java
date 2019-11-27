package mint.suggestBoard.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class SuggestBoardDTO {
	private int seq;
	private String id;
	private String category;
	private String subject;
	private String content;
	private String imgName;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date logtimeQ;

	private String replyContent;
	private int replyStatus;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date logtimeA; 

}
