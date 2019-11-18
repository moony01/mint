package mint.productQnaBoard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mint.productQnaBoard.bean.ProductQnaBoardDTO;

@Transactional
@Repository("productQnaBoardDAO")
public class ProductQnaBoardDAOMyBatis implements ProductQnaBoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getAllProductQnaBoardTotArticle() {
		return sqlSession.selectOne("productQnaBoardSQL.getAllProductQnaBoardTotArticle");
	}

	@Override
	public List<ProductQnaBoardDTO> getAllProductQnaBoardList(Map<String, Object> map) {
		return sqlSession.selectList("productQnaBoardSQL.getAllProductQnaBoardList", map);
	}

	@Override
	public int getProductQnaBoardTotArticle(Map<String, Object> map) {
		return sqlSession.selectOne("productQnaBoardSQL.getProductQnaBoardTotArticle",map);
	}

	@Override
	public List<ProductQnaBoardDTO> getProductQnaBoardList(Map<String, Object> map) {
		return sqlSession.selectList("productQnaBoardSQL.getProductQnaBoardList", map);
	}

	@Override
	public void reply(Map<String, String> map) {
		sqlSession.update("productQnaBoardSQL.reply",map);
		
	}
}
