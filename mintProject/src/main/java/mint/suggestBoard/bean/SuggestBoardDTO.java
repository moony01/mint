package mint.suggestBoard.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class SuggestBoardDTO {
	private String id;
	private String category;
	private String subject;
	private String content;
	private String imgName;
	private Date logtime;

}
