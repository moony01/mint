package mint.order.dao;

import java.util.Map;

import mint.member.bean.MemberDTO;

public interface OrderDAO {

	public MemberDTO getUserData(Map<String, String> map);
}
