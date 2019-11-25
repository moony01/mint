package mint.review.dao;

import java.util.List;
import java.util.Map;

import mint.review.bean.Order;
import mint.review.bean.Review;


public interface ReviewDao {
	public List<Review> getReview();
	
	public List<Review> getReviewDetail(String seq);

	public List<Map<String, Object>> getOrder(String id);

	public void addReview(Review r);

	public int deleteReview(int id);
	
	public List<Review> getReviewByProduct(String productCode);

	public List<Review> getReviewByProductStar(String productCode);
	
	public Map<String, String> getReviewStar(String productCode);
	
}
