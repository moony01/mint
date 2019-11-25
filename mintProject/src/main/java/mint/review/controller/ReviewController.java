package mint.review.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mint.review.bean.Order;
import mint.review.bean.Review;
import mint.review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired private ReviewService rs;
	
	// 마이페이지  - 상품후기
	@RequestMapping("/shop/mypage/review")
	public ModelAndView reviewPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/mypage/myReview.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	// 마이페이지 - 상품후기 - 상세
	@RequestMapping(value="/shop/mypage/review/detail", method = RequestMethod.GET)
	public ModelAndView reviewDetailPage(HttpSession session, @RequestParam String seq) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/mypage/reviewDetail.jsp");
		mav.addObject("seq",seq);
		mav.setViewName("/shop/main/index");
		return mav;
	}
	// 마이페이지 - 상품후기 - 상품후기 작성 후
	@RequestMapping("/shop/mypage/review/finish")
	public ModelAndView reviewFinishPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/mypage/myReviewFinish.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	// 로그인 한 아이디로 주문 내역 찾기
	@RequestMapping("/api/order")
	@ResponseBody
	public List<Map<String, Object>> getOrder(HttpSession session) {
		return rs.getOrder((String) session.getAttribute("memId"));
	}
	// 마이페이지 - 상품후기 - 상세
	@RequestMapping("/api/review/detail")
	@ResponseBody
	public List<Review> getReviewDetail(@RequestParam String seq) {
		return rs.getReviewDetail(seq);
	}
	// 상품 상세 페이지 - 해당 상품후기 불러오기
	@RequestMapping("/api/review/product")
	@ResponseBody
	public List<Review> getReviewByProduct(
			@RequestParam(value = "productCode") String productCode,
			@RequestParam(value = "sort") String sort
			) {
		if ("NEW".equals(sort)) {
			return rs.getReviewByProduct(productCode);
		}
		else {
			return rs.getReviewByProductStar(productCode);			
		}
	}
	// 해당 상품의 평균 별점
	@RequestMapping(value="/api/review/star/avg", method = RequestMethod.POST)
	public ModelAndView gerReviewStar(@RequestParam String productCode, Map<String,String> map) {
		ModelAndView mav = new ModelAndView();
		map = rs.getReviewStar(productCode);
		mav.addObject("map", map);
		mav.setViewName("jsonView");
		return mav;
	}
	// 마이페이지 - 상품후기 작성폼 페이지
	@RequestMapping("/shop/mypage/review/write")
	public ModelAndView reviewWritePage(@RequestParam String productCode, @RequestParam String orderNumber) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/mypage/myReviewWrite.jsp");
		mav.addObject("orderNumber", orderNumber);
		mav.addObject("productCode", productCode);
		mav.setViewName("/shop/main/index");
		return mav;
	}
	// 마이페이지 - 상품후기 작성
	@RequestMapping(value = "/api/review/write", method= RequestMethod.POST)
	public String reviewWrite(@ModelAttribute Review review, @RequestParam(value = "img", required = false) MultipartFile img, HttpSession session) throws IOException {
		String fileName = "";
		if (!img.isEmpty()) {
			String filePath = "C:/Users/bitcamp/Documents/GitHub/mint/mintProject/src/main/webapp/shop/storage/member/review/";
			fileName = img.getOriginalFilename();			
			File file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		review.setImgName(fileName);
		review.setId((String) session.getAttribute("memId"));
		System.out.println(review);
		rs.addReview(review);
		return "redirect:/shop/mypage/review/finish";
	}
	
	//=============================================================================
	
	// 관리자 - 상품후기 관리 페이지
	@RequestMapping("/admin/service/review")
	public ModelAndView adminReviewPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/admin/service/review.jsp");
		mav.setViewName("/admin/main/admin");
		return mav;
	}
	
	// 관리자 - 상품후기 전체 가져오기
	@RequestMapping("/api/review")
	@ResponseBody
	public List<Review> getReview() {
		return rs.getReview();
	}
	
	@RequestMapping("/api/review/delete")
	@ResponseBody
	public int deleteReview(@RequestParam(value = "id")int id) {
		return rs.deleteReview(id);
	}
}
