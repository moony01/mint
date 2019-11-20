package mint.order.dao;

import java.util.List;
import java.util.Map;

import mint.member.bean.MemberDTO;

public interface OrderDAO {

	public MemberDTO getUserData(Map<String, Object> map);

	public Object updateCartCount(Map<String, Object> map);

	public Map<String, Object> getProductCartData(Map<String, Object> map);
}
