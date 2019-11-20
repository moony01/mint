package mint.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mint.orderAndSales.bean.OrderAndSalesDTO;
import mint.product.bean.ProductDTO;

@Transactional
@Repository("productManageDAO")
public class ProductManageMybatis implements ProductManageDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void productWrite(ProductDTO productDTO) {
		sqlSession.insert("productManageSQL.productWrite", productDTO);
	}

	// 상품 리스트 조회
	@Override
	public List<ProductDTO> getProductList(Map<String, String> map) {
		return sqlSession.selectList("productManageSQL.getProductList", map);
	}

	@Override
	public List<Map<String, String>> getSalesData() {
		return sqlSession.selectList("productManageSQL.getSalesData");
	}

	@Override
	public List<Map<String, String>> getProductData() {
		return sqlSession.selectList("productManageSQL.getProductData");
	}

	@Override
	public int getCntProductList(Map<String, String> map) {
		return sqlSession.selectOne("productManageSQL.getCntProductList", map);
	}

	@Override
	public List<ProductDTO> getHeaderProductList(Map<String, String> map) {
		return sqlSession.selectList("productManageSQL.getHeaderProductList", map);
	}
	
	@Override
	public List<ProductDTO> productSearch(String sword) {
		return sqlSession.selectList("productManageSQL.productSearch", sword);
	}

	@Override
	public ProductDTO getProductInfo(Map<String, String> map) {
		return sqlSession.selectOne("productManageSQL.getProductInfo",map);
	}

	@Override
	public List<ProductDTO> getSameSubcategoryProductList(Map<String, String> map) {
		return sqlSession.selectList("productManageSQL.getSameSubcategoryProductList",map);
	}

}
