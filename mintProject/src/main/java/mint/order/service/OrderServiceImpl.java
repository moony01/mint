package mint.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.member.bean.MemberDTO;
import mint.order.dao.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public MemberDTO getUserData(Map<String, String> map) {
		return orderDAO.getUserData(map);
	}
}
