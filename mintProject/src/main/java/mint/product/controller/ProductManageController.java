package mint.product.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mint.product.bean.ProductDTO;
import mint.product.bean.StockAlarmDTO;
import mint.product.service.ProductManageService;
import mint.qnaBoard.bean.QnaBoardDTO;
import net.sf.json.JSONArray;

@Controller
public class ProductManageController {
	@Autowired
	private ProductManageService productManageService;
	@Autowired 
	private JavaMailSender mailSender;
	
	// 써머노트
	@RequestMapping(value = "/admin/imageUpload", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String handleFileUpload(@RequestParam("uploadFile") MultipartFile multiPartFile) {
		String filePath = "C:/Users/bitcamp/Documents/GitHub/mint/mintProject/src/main/webapp/shop/storage/mint/product/"; // 원하는위치 (storage로 잡아주세요)
		String fileName = multiPartFile.getOriginalFilename();
		File file = new File(filePath, fileName);
		try {
			FileCopyUtils.copy(multiPartFile.getInputStream(), new FileOutputStream(file)); // spring저장소에서 storage로 복사
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}

	@RequestMapping(value = "/productManage/productWriteForm", method = RequestMethod.GET)
	public ModelAndView productManageWrite() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/admin/service/productWrite.jsp");
		mav.setViewName("/admin/main/admin");
		return mav;
	}

	@RequestMapping(value = "/productManage/productWrite", method = RequestMethod.POST)
	@ResponseBody
	public void productWrite(@ModelAttribute ProductDTO productDTO, @RequestParam MultipartFile product_img,
			@RequestParam MultipartFile thumbnail_img) {
		String filePath = "C:/Users/bitcamp/Documents/GitHub/mint/mintProject/src/main/webapp/shop/storage/mint/product/"; // 원하는 위치
		try {
			FileCopyUtils.copy(thumbnail_img.getInputStream(),
					new FileOutputStream(new File(filePath, thumbnail_img.getOriginalFilename())));
			FileCopyUtils.copy(product_img.getInputStream(),
					new FileOutputStream(new File(filePath, product_img.getOriginalFilename())));
		} catch (IOException e) {
			e.printStackTrace();
		}
		productDTO.setThumbnail(thumbnail_img.getOriginalFilename());
		productDTO.setProductImage(product_img.getOriginalFilename());

		productManageService.productWrite(productDTO);
	}

	@RequestMapping(value = "/productList/getProductList", method = RequestMethod.GET)
	public ModelAndView getProductList(@RequestParam Map<String, String> map) {
		System.out.println("map : " + map);
		ModelAndView mav = new ModelAndView();

		// gubun이 1 또는 2일때
		if (map.get("gubun").equals("1") || map.get("gubun").equals("2")) {
			// 총 갯수 구하기
			int totalArticle = productManageService.getCntProductList(map);
			System.out.println("totalArticle: " + totalArticle);
			// 시작페이지와 끝 설정
			setPagingNumber(map);

			List<ProductDTO> list = productManageService.getProductList(map);

			if (list != null || list.equals("")) {
				mav.addObject("list", list);
			}else {
				mav.addObject("list", null);
			}
			// mainCategory : 1 //subCategory : 2 //headerGubun
			mav.addObject("gubun", map.get("gubun"));
			// 신상품 : 1 //별점순 : 2 // 낮은 가격순 : 3 // 높은 가격순 : 4
			mav.addObject("selectGubun", map.get("selectGubun"));
			//
			mav.addObject("headGubun", map.get("headGubun"));
			// 페이지
			mav.addObject("pg", map.get("pg"));
			// 조건에 따른 상품리스트 총 갯수

			mav.addObject("totalArticle", totalArticle);
			mav.addObject("addr", "/mintProject/productList/getProductList");
			mav.addObject("display", "/shop/product/productList.jsp");
			mav.setViewName("/shop/main/index");

			// gubun이 3일 떄
		} else {
			System.out.println("gubun이 3일 때....");
			System.out.println("map : " + map);
			// 총 갯수 ..일단 100개로만 한정함...
			// 시작페이지와 끝 설정
			setPagingNumber(map);
			List<ProductDTO> list = productManageService.getHeaderProductList(map);

			if (list != null || list.equals("")) {
				mav.addObject("list", list);
			}else {
				mav.addObject("list", null);
			}
			// mainCategory : 1 //subCategory : 2 //headerGubun
			mav.addObject("gubun", map.get("gubun"));
			// 신상품 : 1 //별점순 : 2 // 낮은 가격순 : 3 // 높은 가격순 : 4
			mav.addObject("selectGubun", map.get("selectGubun"));
			//
			mav.addObject("headGubun", map.get("headGubun"));
			// 페이지
			mav.addObject("pg", map.get("pg"));
			// 조건에 따른 상품리스트 총 갯수
			mav.addObject("totalArticle", 6);
			mav.addObject("addr", "/mintProject/productList/getProductList");
			mav.addObject("display", "/shop/product/productList.jsp");
			mav.setViewName("/shop/main/index");
		}
		return mav;
	}

	@RequestMapping(value = "/shop/product/productView")
	public ModelAndView productView(HttpSession session, @RequestParam Map<String, String> map) {
		System.out.println("productView 메서드");
		System.out.println("map : " + map);

		// 상품 1개 정보들
		ProductDTO productDTO = productManageService.getProductInfo(map);
		// 상품 상세 뷰 페이지 아래 같은 subCategory 상품 10개 최신순으로 불러오기
		List<ProductDTO> list = productManageService.getSameSubcategoryProductList(map);
		System.out.println("list : " + list);

		ModelAndView mav = new ModelAndView();

		mav.addObject("productDTO", productDTO);
		mav.addObject("list", list);
		mav.addObject("display", "/shop/product/productView.jsp");
		mav.setViewName("/shop/main/index");
		mav.addObject("memId", (String) session.getAttribute("memId"));
		
		if(session.getAttribute("memLevel") == null) {
			mav.addObject("memLevel", null);
		}else {
			mav.addObject("memLevel",String.valueOf(session.getAttribute("memLevel")));
		}
		 
		return mav;
	}

	// 관리자 상품 업데이트 화면 호출
	@RequestMapping(value = "/shop/product/updateProductForm")
	public ModelAndView updateProductForm(HttpSession session, @RequestParam Map<String, String> map) {
		System.out.println("updateProductForm 메서드");
		System.out.println("map : " + map);
		// 상품 1개 정보들
		ProductDTO productDTO = productManageService.getProductInfo(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("productDTO", productDTO);
//		mav.addObject("list", list);
//		mav.addObject("display", "/shop/product/productView.jsp");
//		mav.setViewName("/shop/main/index");
//		mav.addObject("memId", (String) session.getAttribute("memId"));

		mav.addObject("display", "/admin/service/productUpdate.jsp");
		mav.setViewName("/admin/main/admin");

		return mav;
	}

	// 관리자 상품 업데이트  - 상품 재고 0개인 수량을 수정하면 알림메일 같이 발송함
	@RequestMapping(value = "/shop/product/updateProduct", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updateProduct(@ModelAttribute ProductDTO productDTO, @RequestParam MultipartFile product_img,
			@RequestParam MultipartFile thumbnail_img, @RequestParam String orgStock ) {
		// 원하는 위치
		String filePath = "C:/Users/bitcamp/Documents/GitHub/mint/mintProject/src/main/webapp/shop/storage/mint/product/";

		// 메인사진
		if (thumbnail_img.isEmpty()) {
			System.out.println("thumbnail_img 값 안 넘어옴:" + thumbnail_img);
		} else {
			try {
				FileCopyUtils.copy(thumbnail_img.getInputStream(),
						new FileOutputStream(new File(filePath, thumbnail_img.getOriginalFilename())));
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println("thumbnail_img.getOriginalFilename() : " + thumbnail_img.getOriginalFilename());
			productDTO.setThumbnail(thumbnail_img.getOriginalFilename());

		}
		// 상품이미지사진(아래)
		if (product_img.isEmpty()) {
			System.out.println("product_img 값 안 넘어옴: " + product_img);
		} else {
			try {
				FileCopyUtils.copy(product_img.getInputStream(),
						new FileOutputStream(new File(filePath, product_img.getOriginalFilename())));
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println("product_img.getOriginalFilename() : " + product_img.getOriginalFilename());
			productDTO.setProductImage(product_img.getOriginalFilename());
		}

		int updateCnt = productManageService.productUpdate(productDTO);
		ModelAndView mav = new ModelAndView();
		if (updateCnt == 1) {
			System.out.println("일단 상품 수정 성공!");
			//재입고 메일로 알림 추가
			if(orgStock.equals("0")) {
				//상품 수정한 물품이 재입고 알림 테이블에 있는지 확인
				int productAlarmCnt = productManageService.getProductAlarmCnt(productDTO.getProductCode());
				//상품 수정한 물품이 재입고 알림 테이블에 있다면 
				if(productAlarmCnt > 0) {
					//그 상품이 재고를 추가했는지 확인
					int productStockCnt = productManageService.getProductStockCnt(productDTO.getProductCode());
					// 재고를 추가했다면
					if(productStockCnt > 0) {
						List<StockAlarmDTO> list = productManageService.getProductAlarmList(productDTO.getProductCode());
						//재입고 매일 보내기
						mailSendWithUserKey(list);
						//재입고 알리고 난 후 그 상품코드는 삭제
						productManageService.StockAlarmDelete(productDTO.getProductCode());
					}
				}
			}
			mav.addObject("display", "/admin/service/productUpdateOk.jsp");
			mav.setViewName("/admin/main/admin");
		}
		return mav;
	}
	
	//재입고 알람을 위한 메일전송 메서드
	public void mailSendWithUserKey(List<StockAlarmDTO> list) {
		for (int i = 0; i < list.size(); i++) {
			//인증메일 보내기   
			MimeMessage mail = mailSender.createMimeMessage();
			String mailContent = "<img src='https://i.pinimg.com/236x/b4/54/f7/b454f721310bbec9d41aa75fdb2ca4d5--typography-logo-design-typography.jpg' alt='' style='width : 200px;'>"
					+"<h2> Market In Taste, MINT 입니다.  </h2><br>"
					+ list.get(0).getMainSubject()+ " 품목이 재입고 되었습니다. 감사합니다";
			try {
				mail.setSubject("[MINT] MINT" + list.get(0).getMainSubject()+ " 재입고 알림 메일입니다. ", "utf-8");
				mail.setText(mailContent, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(list.get(i).getWaitListEmail()));
				mailSender.send(mail);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
	}
	
	//재입고 알림 신청
	@RequestMapping(value="/shop/product/setProductAlarm", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView setProductAlarm(@RequestParam Map<String,String>map,HttpSession session) {
		System.out.println("setProductAlarm map : " + map);
		ModelAndView mav = new ModelAndView();
		
		String memEmail = (String)session.getAttribute("memEmail");
		
		System.out.println("email : " + memEmail);
		map.put("memEmail", memEmail);
		
		//재입고 알림 신청 중복 방지
		int cnt = productManageService.getSameAlarmCnt(map);
		
		// cnt가 0보다 클 시 이미 등록되어 있는 재입고 알림.. 
		if(cnt > 0) {
			mav.addObject("gubun", 1);
		}else {
			productManageService.addStockAlarm(map);
			mav.addObject("gubun", 2);
		}
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	// 관리자 상품리스트 조회
	@RequestMapping(value = "/admin/productAdminList", method = RequestMethod.GET)
	public ModelAndView productAdminList(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		// 총 갯수
		int totalArticle = productManageService.getCntProductAdminList(map);
		System.out.println("totalArticle : " + totalArticle);
		// 시작페이지와 끝 설정
		setPagingNumber(map);

		List<ProductDTO> list = productManageService.getProductAdminList(map);
		// 페이지
		mav.addObject("pg", map.get("pg"));
		// 조건에 따른 상품리스트 총 갯수
		mav.addObject("totalArticle", totalArticle);
		// 셀렉트박스 구분
		if (map.get("categorySelect") == null) {
			mav.addObject("categorySelect", "9");
		} else {
			mav.addObject("categorySelect", map.get("categorySelect"));
		}
		// 맨 아래 셀렉트 박스 구분
		if (map.get("searchOption") == null) {
			mav.addObject("searchOption", "3");
			mav.addObject("keyword", "");
		} else {
			mav.addObject("searchOption", map.get("searchOption"));
			mav.addObject("keyword", map.get("keyword"));
		}

		mav.addObject("addr", "/mintProject/admin/productAdminList");
		mav.addObject("list", list);
		mav.addObject("display", "/admin/service/productAdminList.jsp");
		mav.setViewName("/admin/main/admin");

		return mav;
	}

	// 차트
	@RequestMapping(value = "/admin/sales_getTotalSales", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray getTotalSalesForChart() {
		List<Map<String, String>> list = productManageService.getSalesData();
		JSONArray jsonArray = JSONArray.fromObject(list);
		return jsonArray;
	}

	@RequestMapping(value = "/admin/sales_getProductSales", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray getProductSalesForChart() {
		List<Map<String, String>> list = productManageService.getProductData();
		JSONArray jsonArray = JSONArray.fromObject(list);
		return jsonArray;
	}

	@RequestMapping(value = "/admin/sales_getCategorySales", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray getCategorySalesForChart() {
		List<Map<String, String>> list = productManageService.getCategoryData();
		JSONArray jsonArray = JSONArray.fromObject(list);
		return jsonArray;
	}

	// 상품 전체검색
	@RequestMapping(value = "/shop/product/productSearch", method = RequestMethod.GET)
	public ModelAndView productSearch(@RequestParam String sword) {
		List<ProductDTO> list = productManageService.productSearch(sword);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("resultCnt", list.size());
		mav.addObject("sword", sword);
		mav.addObject("display", "/shop/product/productSearch.jsp");
		mav.setViewName("/shop/main/index");
		
		return mav;
	}

	// [사용자, 관리자 페이지 공통 함수]
	// ==================================================================================================
	public void setPagingNumber(Map<String, String> map) {
		int endNum = Integer.parseInt((String) map.get("pg")) * 9;
		int startNum = endNum - 8;

		map.put("endNum", endNum + "");
		map.put("startNum", startNum + "");

	}

}
