package mint.cart.bean;

import java.sql.Date;

import lombok.Data;

@Data
public class CartDTO {
	private String id;
	private String productCode;
	private int ctCount;
	private Date ctDateTime;
}
