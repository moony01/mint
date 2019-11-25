package mint.order.bean;

import java.util.Date;
import org.springframework.stereotype.Component;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

@Data
@Component
public class OrderInfoDTO {
	private String orderNumber;
	private String id;
	private String logtime;
	private int status;
}
