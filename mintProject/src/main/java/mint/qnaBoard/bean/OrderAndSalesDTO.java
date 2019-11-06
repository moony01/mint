package mint.qnaBoard.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class OrderAndSalesDTO {
	private String orderNumber;
	private String email;
	private String productCode;
	private int price;
	private int qty;
	private int sales;
	private Date logtime;
	private String category;
	private String supplierId;
	private int status;
}
