package mint.orderAndSales.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class OrderAndSalesDTO {
	private String orderNumber;
	private String email;
	private String productCode;
	private int price;
	private int qty;
	private String logtime;
//	private Date logtime;
	private int status;
}
