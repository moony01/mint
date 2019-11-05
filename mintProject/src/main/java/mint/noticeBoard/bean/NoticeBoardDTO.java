package mint.noticeBoard.bean;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class NoticeBoardDTO {
	private int seq;
	private String id;
	private String subject;
	private String content;
	private int hit;
	private String fileName;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date logtime;
	//private String logtime;
}
