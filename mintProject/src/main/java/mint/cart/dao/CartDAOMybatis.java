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
	public int cartListDelete(Map<String, String> map) {
		sqlSession.delete("cartSQL.cartListDelete", map);
		return sqlSession.selectOne("cartSQL.getCartCount", map);
	}

	@Override
	public int getSameCart(Map<String, String> map) {
		return sqlSession.selectOne("cartSQL.getSameCart", map);
	}

	@Override
	public int addCartProduct(Map<String, String> map) {
		sqlSession.insert("cartSQL.addCartProduct", map);
		return sqlSession.selectOne("cartSQL.getCartCount", map);
	}

	@Override
	public int getCartCount(String id) {
		return sqlSession.selectOne("cartSQL.getCartCount", id);
	}

	@Override
	public int cartSoldOutDelete(Map<String, Object> map) {
		sqlSession.delete("cartSQL.cartSoldOutDelete", map);
		return sqlSession.selectOne("cartSQL.getCartCount", map);
	}
}
