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
	public List<Map<String, String>> getMyOrderProductList(String ordernumber) {
		return sqlSession.selectList("orderSQL.getMyOrderProductList", ordernumber);
	}
	
	@Override
	public List<OrderInfoDTO> getOrderList(Map<String, Object> map) {
		if(map.containsKey("from")) {
			return sqlSession.selectList("orderSQL.getOrderListByDate", map);
		}
			
		return sqlSession.selectList("orderSQL.getOrderList", map);
	}

	@Override
	public List<Map<String, String>> getOrderView(Map<String, String> map) {
		return sqlSession.selectList("orderSQL.getOrderView" , map);
	}

	@Override
	public void updateOrderStatus(Map<String, Object> map) {
		sqlSession.update("orderSQL.updateOrderStatus1", map); // 오더 상태 변경 (입금 전 - 입금 완료 - 배송 중 - 배송 완료 )
		Map<String, String> resultMap = sqlSession.selectOne("orderSQL.updateOrderStatus2", map); //해당 status = 3(배송완료) => 포인트 지급 
		
		String status = String.valueOf(resultMap.get("STATUS"));
		String memLevel = String.valueOf(resultMap.get("MEMLEVEL"));
		String totPrice = String.valueOf(resultMap.get("FPRICE"));
		String deliveryPrice = String.valueOf(resultMap.get("DPRICE"));
		
		int totalPrice = Integer.parseInt(totPrice) - Integer.parseInt(deliveryPrice);
		int point = 0; 
		
		if(status.equals("3")) {
			if(memLevel.equals("0")) {
				point = (int)(totalPrice * 0.05);
			} else if(memLevel.equals("1")) {
				point = (int)(totalPrice * 0.07);
			} else if(memLevel.equals("2")) {
				point = (int)(totalPrice * 0.10);
			}
			map.put("point", point);
			sqlSession.update("memberSQL.updatePoint", map);
		}
	}


	@Override
	public void insertOrderInfo(Map<String, Object> order) {
		sqlSession.insert("orderSQL.insertOrderInfo", order);
	}
	
	@Override
	public void insertOrderDetail(Map<String, Object> map) {
		sqlSession.insert("orderSQL.insertOrderDetail", map);
	}

	@Override
	public void updateProductStock(Map<String, Object> map) {
		sqlSession.update("orderSQL.updateProductStock", map);
	}

	@Override
	public int deleteCartList(Map<String, Object> map) {
		sqlSession.delete("orderSQL.deleteCartList", map);
		return sqlSession.selectOne("cartSQL.getCartCount", map);
	}

	@Override
	public Map<String, String> getMyOrderDetails(String ordernumber) {
		return sqlSession.selectOne("orderSQL.getMyOrderDetails",ordernumber);
	}

	@Override
	public int getOrderTotalArticle() {
		return sqlSession.selectOne("orderSQL.getOrderTotalArticle");
	}

}
