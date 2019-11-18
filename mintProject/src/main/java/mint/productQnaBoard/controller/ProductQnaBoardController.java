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

import mint.productQnaBoard.bean.ProductQnaBoardDTO;
import mint.productQnaBoard.service.ProductQnaBoardService;

@Controller
public class ProductQnaBoardController {
	@Autowired
	private ProductQnaBoardService productQnaBoardService;
	
	@RequestMapping(value="/shop/service/productQnaWriteForm", method = RequestMethod.GET)
	public String productQnaWriteForm(@RequestParam String productCode, Model model, HttpSession session) {
		model.addAttribute("productCode", productCode);
		model.addAttribute("memId", (String) session.getAttribute("memId"));
		model.addAttribute("display","/shop/service/productQnaWriteForm.jsp");
		return "/shop/main/index";
	}
	
	@RequestMapping(value="/shop/service/imageUpload", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String handleFileUpload(@RequestParam("uploadFile") MultipartFile multiPartFile) {
		String filePath = "/mintProject/src/main/wepapp/storage";
		String fileName = multiPartFile.getOriginalFilename();
		File file = new File (filePath, fileName);
		try {
			FileCopyUtils.copy(multiPartFile.getInputStream(), new FileOutputStream(file)); // spring저장소에서 storage로 복사
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	@RequestMapping(value="/shop/service/productQnaWrite", method = RequestMethod.POST)
	@ResponseBody // ajax쓰지말까 고민
	public void productQnaWrite(@RequestParam Map<String, String> map) { // @ModelAttribute
		if(map.get("secretStatusBox")==null) {
			map.put("secretStatusBox","0");
		}
//		productQnaBoardService.writeProductQnaBoard(map);
	}
	
	@RequestMapping(value="/shop/service/productQnaBoardList")
	public ModelAndView productQnaBoardList(@RequestParam (required = false, defaultValue = "1")String pg, String productCode, HttpSession session) {
		// 1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("productCode", productCode);
		
//		List<ProductQnaBoardDTO> list = productQnaBoardService.getProductQnaBoardList(map);
		
		// 페이징 처리 ... 나중에
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
//		mav.addObject("list",list);
//		mav.addObject("",); 페이징
		mav.addObject("display", "/shop/service/productQnaBoardList.jsp");
		mav.setViewName("/shop/main/index");
		
		return mav;
	}
	
	@RequestMapping(value="/shop/service/productQnaBoardModifyForm")
	public String productQnaModifyForm(@RequestParam String productCode, String seq, Model model, HttpSession session) { // 여기서 seq는 rn이 아니가 pk seq
		Map<String, String> map = new HashMap<String, String>();
		map.put("productCode", productCode);
		map.put("seq", seq);
		
//		ProductQnaBoardDTO productQnaBoardDTO = productQnaBoardService.getProductQnaBoard(map);
		
		model.addAttribute("productCode", productCode);
		model.addAttribute("seq", seq); // rn이 아니라 productQnaBoard에서 pk로 정해진 seq
//		model.addAttribute("productQnaBoardDTO", productQnaBoardDTO);
		model.addAttribute("memId", (String) session.getAttribute("memId"));
		model.addAttribute("display","/shop/service/productQnaModifyForm.jsp");
		return "/shop/main/index";
	}
	
	@RequestMapping(value="/shop/service/productQnaBoardModify")
	@ResponseBody
	public void productQnaModify(@RequestParam Map<String, String> map) {
		if(map.get("secretCheckBox")==null) { // 비밀글 체크 안했을때
			 map.put("secretCheckBox", "0"); 
		}
//		productQnaBoardService.modifyProductQnaBoard(map);
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
