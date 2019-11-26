package mint.review.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.review.bean.Order;
import mint.review.bean.Review;
import mint.review.dao.ReviewDao;

@Service
public class ReviewService {
	@Autowired
	private ReviewDao rd;

	public List<Review> getReview() {
		return rd.getReview();
	}
	public List<Review> getReviewDetail(String seq) {
		return rd.getReviewDetail(seq);
	}
	public List<Map<String, Object>> getOrder(String id) {
		return rd.getOrder(id);
	}
	public void addReview(Review r) {
		rd.addReview(r);
	}
	public int deleteReview(int id) {
		return rd.deleteReview(id);
	}
	public List<Review> getReviewByProduct(String productCode) {
		return rd.getReviewByProduct(productCode);
	}
	public List<Review> getReviewByProductStar(String productCode) {
		return rd.getReviewByProductStar(productCode);
	}
	public Map<String, String> getReviewStar(String productCode) {
		return rd.getReviewStar(productCode);
	}
	public int getReviewTotalArticle(Map<String, Object> map) {
		return rd.getReviewTotalArticle(map);
	}
	public List<Map<String, Object>> getReviewByOption(Map<String, Object> map) {
		return rd.getReviewByOption(map);
	}
}
