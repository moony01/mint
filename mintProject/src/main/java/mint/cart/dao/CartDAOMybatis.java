package mint.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mint.product.bean.ProductDTO;

@Repository
public class CartDAOMybatis implements CartDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String,String>> getCartList(Map<String, String> map) {
		return sqlSession.selectList("cartSQL.getCartList", map);
	}

	@Override
	public void cartListDelete(Map<String, String> map) {
		sqlSession.delete("cartSQL.cartListDelete", map);
	}
}
