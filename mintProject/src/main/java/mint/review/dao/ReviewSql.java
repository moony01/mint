package mint.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mint.review.bean.Review;

@Repository(value="reviewDao")
public class ReviewSql implements ReviewDao {
	@Autowired
	private SqlSession sqlsession;
	@Override
	public List<Review> getReview() {
		return sqlsession.selectList("mint.review.dao.ReviewSql.getReview");
	}
	@Override
	public List<Review> getReviewDetail(String seq) {
		return sqlsession.selectList("mint.review.dao.ReviewSql.getReviewDetail",seq);
	}
	@Override
	public List<Map<String, Object>> getOrder(String id) {
		return sqlsession.selectList("mint.review.dao.ReviewSql.getOrder", id);
	}
	@Override
	public void addReview(Review r) {
		sqlsession.insert("mint.review.dao.ReviewSql.addreview", r);
		sqlsession.update("mint.review.dao.ReviewSql.updateOrderReviewStatus", r);
		sqlsession.update("mint.review.dao.ReviewSql.updateOrderReviewPoint", r);
	}
	@Override
	public int deleteReview(int id) {
		return sqlsession.update("mint.review.dao.ReviewSql.deleteReview", id);
	}
	@Override
	public List<Review> getReviewByProduct(String productCode) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mint.review.dao.ReviewSql.getReviewByProduct", productCode);
	}
	@Override
	public List<Review> getReviewByProductStar(String productCode) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("mint.review.dao.ReviewSql.getReviewByProductStar", productCode);
	}
	@Override
	public Map<String, String> getReviewStar(String productCode) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mint.review.dao.ReviewSql.getReviewStar", productCode);
	}
	@Override
	public int getReviewTotalArticle(Map<String, Object> map) {
		return sqlsession.selectOne("mint.review.dao.ReviewSql.getReviewTotalArticle",map);
	}
	@Override
	public List<Map<String, Object>> getReviewByOption(Map<String, Object> map) {
		return sqlsession.selectList("mint.review.dao.ReviewSql.getReviewByOption", map);
	}
	
	
	
}
