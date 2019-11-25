package mint.review.bean;

import org.springframework.stereotype.Component;

@Component
public class Order {
		private String title;
		private String img;
		private String orderNumber;
		private String reviewStatus;
		private String email;
		private String productCode;
		private int price;
		private int qty;
		private String logtime;
		private int status;
		public String getOrderNumber() {
			return orderNumber;
		}
		public void setOrderNumber(String orderNumber) {
			this.orderNumber = orderNumber;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getProductCode() {
			return productCode;
		}
		public void setProductCode(String productCode) {
			this.productCode = productCode;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public int getQty() {
			return qty;
		}
		public void setQty(int qty) {
			this.qty = qty;
		}
		public String getLogtime() {
			return logtime;
		}
		public void setLogtime(String logtime) {
			this.logtime = logtime;
		}
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
		}
		
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getImg() {
			return img;
		}
		public void setImg(String img) {
			this.img = img;
		}
		
		public Order(String title, String img, String orderNumber, String email, String productCode, int price, int qty,
				String logtime, int status) {
			super();
			this.title = title;
			this.img = img;
			this.orderNumber = orderNumber;
			this.email = email;
			this.productCode = productCode;
			this.price = price;
			this.qty = qty;
			this.logtime = logtime;
			this.status = status;
		}
		public Order() {
			// TODO Auto-generated constructor stub
		}
}
