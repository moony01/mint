package mint.product.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mint.orderAndSales.bean.OrderAndSalesDTO;
import mint.product.bean.ProductDTO;
import mint.product.service.ProductManageService;
import mint.qnaBoard.bean.QnaBoardDTO;
import net.sf.json.JSONArray;

@Controller
public class ProductManageController {
	@Autowired
	private ProductManageService productManageService;

	// 써머노트
	@RequestMapping(value = "/admin/imageUpload", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String handleFileUpload(@RequestParam("uploadFile") MultipartFile multiPartFile) {
		String filePath = "C:/Spring/workSTS/springProject/src/main/webapp/storage/mint/product"; // 원하는 위치 (storage로 잡아주세요)
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
		String filePath = "C:/Spring/workSTS/springProject/src/main/webapp/storage/mint/product"; // 원하는 위치
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
			// 시작페이지와 끝 설정
			setPagingNumber(map);

			List<ProductDTO> list = productManageService.getProductList(map);

			if (list != null) {
				mav.addObject("list", list);
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

			if (list != null) {
				mav.addObject("list", list);
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
	
	@RequestMapping(value="/shop/product/productView")
	public ModelAndView productView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display","/shop/product/productView.jsp");
		mav.setViewName("/shop/main/index");
		mav.addObject("memId", (String) session.getAttribute("memId"));
		return mav;
	}
	
	
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
	
	//상품 전체검색
	@RequestMapping(value="/shop/product/productSearch", method = RequestMethod.GET)
	public ModelAndView productSearch(@RequestParam String sword) {
		List<ProductDTO> list = productManageService.productSearch(sword);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("resultCnt", list.size());
		mav.addObject("sword",sword);
		mav.addObject("display","/shop/product/productSearch.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	

	// [사용자, 관리자 페이지 공통 함수]
	// ==================================================================================================
	public void setPagingNumber(Map<String, String> map) {
		int endNum = Integer.parseInt((String) map.get("pg")) * 3;
		int startNum = endNum - 2;

		map.put("endNum", endNum + "");
		map.put("startNum", startNum + "");

	}

}
