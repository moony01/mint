package mint.productQnaBoard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mint.member.bean.MemberDTO;
import mint.member.service.MemberService;
import mint.productQnaBoard.bean.ProductQnaBoardDTO;
import mint.productQnaBoard.service.ProductQnaBoardService;

@Controller
public class ProductQnaBoardController {
	@Autowired
	private ProductQnaBoardService productQnaBoardService;
	@Autowired
	private MemberService memberService;
	
	// 상품 문의글 작성 페이지
	@RequestMapping(value="/shop/service/productQnaWriteForm", method = RequestMethod.GET)
	public String productQnaWriteForm(@RequestParam String productCode,@RequestParam String subCategory, Model model, HttpSession session, Map<String, String> map) {
		map.put("key", "id");
		map.put("value", (String) session.getAttribute("memId"));
		MemberDTO memberDTO = memberService.getUserBy(map);
		model.addAttribute("productCode", productCode);
		model.addAttribute("subCategory", subCategory);
		model.addAttribute("memId", (String) session.getAttribute("memId"));
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("display","/shop/product/productQnaWrite.jsp");
		return "/shop/main/index";
	}
	
	// 상품 문의글 작성 페이지에서 summernote에 이미지가 올라오면 sotrage에 저장
	@RequestMapping(value="/shop/service/imageUpload", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String handleFileUpload(@RequestParam("uploadFile") MultipartFile multiPartFile) {
		String filePath = "C:/Users/Jisu/Documents/GitHub/mint/mintProject/src/main/webapp/shop/storage/member/productQna";
		String fileName = multiPartFile.getOriginalFilename();
		File file = new File (filePath, fileName);
		try {
			FileCopyUtils.copy(multiPartFile.getInputStream(), new FileOutputStream(file)); // spring저장소에서 storage로 복사
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	// 상품 문의글 작성
	@RequestMapping(value="/shop/service/productQnaWrite", method = RequestMethod.POST)
	public String productQnaWrite(@RequestParam Map<String, String> map) { 
		if(map.get("secretStatus")==null) { map.put("secretStatus","0"); }
		productQnaBoardService.writeProductQna(map);
		
		return "redirect:/shop/product/productView?productCode="+map.get("productCode")+"&subCategory="+map.get("subCategory");
	}
	
	@RequestMapping(value="/shop/product/productQnaBoardList")
	public String productQnaBoardList(@RequestParam (required = false, defaultValue = "1")String pg, String productCode, String subCategory, HttpSession session, Model model) {
		int totalArticle = 0;
		List<Map<String, Object>> list = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("key", "productCode");
		map.put("value", productCode);
		totalArticle = productQnaBoardService.getProductQnaBoardTotArticle(map);
		setPagingNumber(pg, map);
		list = productQnaBoardService.getProductQnaBoardList(map);
		
		model.addAttribute("pg", pg);
		model.addAttribute("totalArticle", totalArticle);
		model.addAttribute("addr", "/shop/product/productQnaBoardList");
		model.addAttribute("list", list);
		model.addAttribute("productCode", productCode);
		model.addAttribute("subCategory", subCategory);
		model.addAttribute("memId",(String)session.getAttribute("memId"));
		return "/shop/product/productView_productQna";
	}
	
	@RequestMapping(value="/shop/service/productQnaDelete")
	@ResponseBody
	public void productQnaDelete(@RequestParam String seq) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq", seq);
		productQnaBoardService.deleteProductQna(map);
	}
	
	//=======관리자=====================================================================================
	
	// 상뭄문의 관리 페이지 로드
	@RequestMapping(value="/admin/service/productQna", method=RequestMethod.GET)
	public ModelAndView getProductQnaBoardListForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display","/admin/service/productQna.jsp");
		mav.setViewName("/admin/main/admin");
		return mav;
	}
	
	@RequestMapping("/admin/service/getProductQna")
	public ModelAndView getProductQnaBoardList(@RequestParam(required = false, defaultValue = "1") String pg, 
													@RequestParam(required = false, defaultValue = "2") String replyStatus, 
													ModelAndView mav) {
		int totalArticle = 0;
		int status = Integer.parseInt(replyStatus);
		List<Map<String, Object>> list = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(status == 2) { // 전체
			totalArticle = productQnaBoardService.getAllProductQnaBoardTotArticle();
			setPagingNumber(pg,map);
			list = productQnaBoardService.getAllProductQnaBoardList(map);
		} else { // 답변대기, 답변완료
			map.put("key","replyStatus"); map.put("value",status);
			totalArticle = productQnaBoardService.getProductQnaBoardTotArticle(map);
			setPagingNumber(pg,map); 
			list = productQnaBoardService.getProductQnaBoardList(map);
		}
		
		//페이징 처리를 script에서 처리하기 위해 pg, totalArticle, addr
		mav.addObject("pg", pg);
		mav.addObject("totalArticle", totalArticle);
		mav.addObject("addr", "/admin/service/getProductQna");
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/admin/service/productQna_reply")
	@ResponseBody
	public void productQna_reply(@RequestParam String replyContent, String seq, Map<String, String> map) {
		System.out.println(seq+" "+replyContent);
		map.put("seq", seq);
		map.put("replyContent", replyContent);
		productQnaBoardService.reply(map);
	}
	
	// [사용자, 관리자 페이지 공통 함수] ==================================================================================================
		public  void setPagingNumber(String pg, Map<String, Object> map) {
			int endNum = Integer.parseInt(pg) *5;
			int startNum = endNum -4; 
			
			map.put("endNum", endNum);
			map.put("startNum", startNum);
		}
}
