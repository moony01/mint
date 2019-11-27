package mint.order.dao;

import java.util.List;
import java.util.Map;

import mint.member.bean.MemberDTO;
import mint.order.bean.OrderInfoDTO;

public interface OrderDAO {

	public MemberDTO getUserData(Map<String, Object> map);

	public Object updateCartCount(Map<String, Object> map);

	public Map<String, Object> getProductCartData(Map<String, Object> map);
	
	public List<Map<String, String>> getMyOrderInfo(Map<String, String> map);

	public List<Map<String, String>> getMyOrderProductList(String ordernumber);

	public List<OrderInfoDTO> getOrderList(Map<String, Object> map);

	public List<Map<String, String>> getOrderView(Map<String, String> map);

	public void updateOrderStatus(Map<String, Object> map);

	public void insertOrderInfo(Map<String, Object> order);

	public void insertOrderDetail(Map<String, Object> map);

	public void updateProductStock(Map<String, Object> map);

	public int deleteCartList(Map<String, Object> map);

	public Map<String, String> getMyOrderDetails(String ordernumber);

}
