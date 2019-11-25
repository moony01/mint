package mint.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mint.member.bean.MemberDTO;
import mint.order.bean.OrderInfoDTO;


@Repository
public class OrderDAOMybatis implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO getUserData(Map<String, Object> map) {
		return sqlSession.selectOne("orderSQL.getUserData", map);
	}

	@Override
	public Object updateCartCount(Map<String, Object> map) {
		return sqlSession.update("orderSQL.updateCartCount", map);
	}

	@Override
	public Map<String, Object> getProductCartData(Map<String, Object> map) {
		return sqlSession.selectOne("orderSQL.getProductCartData", map);
	}

	@Override
	public List<Map<String, String>> getMyOrderInfo(Map<String, String> map) {
		return sqlSession.selectList("orderSQL.getMyOrderInfo", map);
	}

	@Override
	public List<Map<String, String>> getMyOrderDetails(String ordernumber) {
		return sqlSession.selectList("orderSQL.getMyOrderDetails", ordernumber);
	}
	
	@Override
	public List<OrderInfoDTO> getOrderList(Map<String, Object> map) {
		return sqlSession.selectList("orderSQL.getOrderList", map);
	}

	@Override
	public List<Map<String, String>> getOrderView(Map<String, String> map) {
		return sqlSession.selectList("orderSQL.getOrderView" , map);
	}

	@Override
	public void updateOrderStatus(Map<String, Object> map) {
		sqlSession.update("orderSQL.updateOrderStatus", map);
	}

	@Override
	public List<OrderInfoDTO> getOrderListByDate(Map<String, Object> map) {
		return sqlSession.selectList("orderSQL.getOrderListByDate", map);
	}
}
