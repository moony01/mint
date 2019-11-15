package mint.event.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;


@Data
@Component
public class EventDTO {
	private String subject;
	private Date startDate;
	private Date endDate;
	private Date logtime;
	private String productCode;
	private int eventStatus;
}
