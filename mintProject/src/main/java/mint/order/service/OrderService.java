package mint.order.service;

import java.util.List;
import java.util.Map;

import mint.member.bean.MemberDTO;

public interface OrderService {

	public MemberDTO getUserData(Map<String, Object> map);

	public void updateCartCount(Map<String, Object> map);

	public Map<String, Object> getProductCartData(Map<String, Object> map);

	public List<Map<String, String>> getMyOrderInfo(Map<String, String> map);

	public List<Map<String, String>> getMyOrderDetails(String ordernumber);
	
}
