package mint.order.bean;

import org.springframework.stereotype.Component;
import lombok.Data;

@Data
@Component
public class OrderDetailsDTO {
	private String orderNumber;
	private String productCode;
	private int qty;
}
