package mint.noticeBoard.bean;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NoticeBoardDTO {
	private int seq;
	private String id;
	private String subject;
	private String content;
	private int hit;
	private String fileName;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date logtime;
}
