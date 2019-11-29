package mint.product.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class StockAlarmDTO {
	private String productCode;
	private String waitListEmail;
	private String mainSubject;
}
