package mint.productQnaBoard.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("productQnaBoardDAO")
public class ProductQnaBoardDAOMyBatis implements ProductQnaBoardDAO {
	@Autowired
	private SqlSession sqlSession;
}
