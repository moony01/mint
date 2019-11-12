package mint.product.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mint.product.bean.ProductDTO;

@Transactional
@Repository("productManageDAO")
public class ProductManageMybatis implements ProductManageDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void productWrite(ProductDTO productDTO) {
		sqlSession.insert("productManageSQL.productWrite",productDTO);
		
	}
	
	
}
