package mint.event.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class EventProductDTO {
	private String productCode;
	private Object discountRate;

}
