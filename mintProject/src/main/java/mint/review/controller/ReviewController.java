package mint.review.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
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
	
	// 마이페이지  - 상품후기 (상품후기 작성 가능)
	@RequestMapping("/shop/mypage/review")
	public ModelAndView reviewPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/mypage/myReview.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	// 상품상세 - 상품후기 - 상품후기 상세 폼
	@RequestMapping(value="/shop/mypage/review/detail", method = RequestMethod.GET)
	public ModelAndView reviewDetailPage(HttpSession session, @RequestParam String seq) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/shop/mypage/reviewDetail.jsp");
		mav.addObject("seq",seq);
		mav.setViewName("/shop/main/index");
		return mav;
	}
	// 마이페이지 - 상품후기 - 상품후기 (작성된 상품후기)
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
	// 상품상세 - 상품후기 - 상품후기 상세 폼
	@RequestMapping("/api/review/detail")
	@ResponseBody
	public List<Review> getReviewDetail(@RequestParam String seq) {
		return rs.getReviewDetail(seq);
	}
	// 상품 상세 페이지 - 해당 상품후기 전체 불러오기
	@RequestMapping("/api/review/product")
	public ModelAndView getReview(@RequestParam(value = "productCode", required = false, defaultValue = "undefined") String productCode,
											@RequestParam(value = "sort") String sort,
											@RequestParam(required = false, defaultValue = "1") String pg) {
		ModelAndView mav = new ModelAndView();
		int totalArticle = 0;
		List<Map<String, Object>> list = null;
		Map<String, Object> map = new HashMap<String, Object>();
		if(!productCode.equals("undefined")) { // 상품 상세 페이지에서 해당 상품의 상품후기글 요청 - productCode 필요
			map.put("productCode", productCode);
		}
		totalArticle = rs.getReviewTotalArticle(map);
		setPagingNumber(pg, map);
		map.put("option", sort);
		list = rs.getReviewByOption(map);
		mav.addObject("pg",pg);
		mav.addObject("totalArticle",totalArticle);
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		return mav;
	}
	// 상품 상세 페이지 - 해당 상품의 평균 별점
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
	
	// 관리자 - 상품후기 관리 페이지 폼
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
		return rs.getReviewDetail("undefined");
	}
	
	@RequestMapping("/api/review/delete")
	@ResponseBody
	public int deleteReview(@RequestParam(value = "id")int id) {
		return rs.deleteReview(id);
	}
	
	// [사용자, 관리자 페이지 공통 함수] ==================================================================================================
	public  void setPagingNumber(String pg, Map<String, Object> map) {
		int endNum = Integer.parseInt(pg) *5;
		int startNum = endNum -4; 
		
		map.put("endNum", endNum);
		map.put("startNum", startNum);
	}
}
