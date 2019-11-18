package mint.order.service;

import java.util.Map;

import mint.member.bean.MemberDTO;

public interface OrderService {

	public MemberDTO getUserData(Map<String, String> map);
	
}
