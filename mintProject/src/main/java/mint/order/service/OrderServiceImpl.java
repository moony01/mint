package mint.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.member.bean.MemberDTO;
import mint.order.bean.OrderInfoDTO;
import mint.order.dao.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public MemberDTO getUserData(Map<String, Object> map) {
		return orderDAO.getUserData(map);
	}

	@Override
	public void updateCartCount(Map<String, Object> map) {
		orderDAO.updateCartCount(map);
	}

	@Override
	public Map<String, Object> getProductCartData(Map<String, Object> map) {
		return orderDAO.getProductCartData(map);
	}

	@Override
	public List<Map<String, String>> getMyOrderInfo(Map<String, String> map) {
		return orderDAO.getMyOrderInfo(map);
	}

	@Override
	public List<Map<String, String>> getMyOrderDetails(String ordernumber) {
		return orderDAO.getMyOrderDetails(ordernumber);
	}
	
	@Override
	public List<OrderInfoDTO> getOrderList(Map<String, Object> map) {
		return orderDAO.getOrderList(map);
	}

	@Override
	public List<Map<String, String>> getOrderView(Map<String, String> map) {
		return orderDAO.getOrderView(map);
	}

	@Override
	public void updateOrderStatus(Map<String, Object> map) {
		orderDAO.updateOrderStatus(map);
	}
	
	@Override
	public void insertOrderInfo(Map<String, Object> order) {
		orderDAO.insertOrderInfo(order);
	}
	
	@Override
	public void insertOrderDetail(Map<String, Object> map) {
		orderDAO.insertOrderDetail(map);
	}

	@Override
	public void updateProductStock(Map<String, Object> map) {
		orderDAO.updateProductStock(map);
	}

	@Override
	public int deleteCartList(Map<String, Object> map) {
		return orderDAO.deleteCartList(map);
	}
	
}
