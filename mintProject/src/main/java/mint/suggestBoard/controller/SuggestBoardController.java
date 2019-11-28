package mint.suggestBoard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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
import mint.suggestBoard.bean.SuggestBoardDTO;
import mint.suggestBoard.service.SuggestBoardService;

/**
 * 191101
 * 홍소연(@hhhongso)
 */
@Controller
public class SuggestBoardController {
	@Autowired
	private SuggestBoardService suggestBoardService;
	
	//제안 문의 글쓰기 (form)
	@RequestMapping("/shop/service/offerWrite")
	public String getSuggestBoardWriteForm(Model model) {
		model.addAttribute("display", "/shop/service/offerWrite.jsp");
		return "/shop/main/index";
	}
	
	//제안 문의 글쓰기 & 글수정(작성)
	@RequestMapping(value="/shop/service/offerWriteOk", method = RequestMethod.POST)
	@ResponseBody
	public String writeSuggestBoard(@RequestParam(required = false) String viewSeq,
								@RequestParam(required = false, defaultValue = "1") String pg,
								@ModelAttribute SuggestBoardDTO suggestBoardDTO, 
								@RequestParam MultipartFile img, HttpSession session, Model model) {
		
		
		suggestBoardDTO.setId((String) session.getAttribute("memId"));
		
		//file 경로: 상대경로로 지정되어야 함 (보완예정)
		String filePath = "C:/Users/bitcamp/Documents/GitHub/mint/mintProject/src/main/webapp/shop/storage/member/offer";
		String fileName = img.getOriginalFilename();
		File file = new File(filePath, fileName);

		if(!fileName.equals("")) {
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			}catch (IOException e) {
				e.printStackTrace();
			}
			suggestBoardDTO.setImgName(fileName);
			
		} else {
			suggestBoardDTO.setImgName("");
		}
		
		
		
		if(viewSeq.equals("")) //hidden value viewSeq 값이 없을 경우 = 글 작성
			suggestBoardService.writeSuggestBoard(suggestBoardDTO);
		else { //hidden value viewSeq 값이 있을 경우 = 글 수정
			suggestBoardDTO.setSeq(Integer.parseInt(viewSeq));
			suggestBoardService.updateSuggestBoard(suggestBoardDTO);
		}
		return pg;
	}
	
	//제안 문의 글수정 (form)
	@RequestMapping("/shop/service/offerModify")
	public String getSuggestBoardModifyForm(@RequestParam String seq, @RequestParam String pg, Model model) {
		SuggestBoardDTO suggestBoardDTO = suggestBoardService.getSuggestBoard(Integer.parseInt(seq));
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("suggestBoardDTO", suggestBoardDTO);
		model.addAttribute("display", "/shop/service/offerWrite.jsp");
		return "/shop/main/index";
	}
	
	//제안 문의 글삭제. 삭제 후 바로 /offer(목록) 로 이동.
	@RequestMapping("/shop/service/offerDelete")
	public ModelAndView deleteSuggestBoard(@RequestParam String seq, HttpSession session, ModelAndView mav) {
		suggestBoardService.deleteSuggestBoard(Integer.parseInt(seq));
		return getSuggestBoardList("1", session, mav);
	}
	
	//제안 문의 글목록
	@RequestMapping("/shop/service/offer")
	public ModelAndView getSuggestBoardList(@RequestParam(required = false, defaultValue = "1") String pg, 
											HttpSession session, ModelAndView mav) {
		String id = (String) session.getAttribute("memId");
		Map<String, Object> map = new HashMap<String, Object>();	
		map.put("key", "id");
		map.put("value", id);
		
		int totalArticle = suggestBoardService.getSuggestBoardTotArticle(map);

		setPagingNumber(pg, map);
		List<SuggestBoardDTO> list = suggestBoardService.getSuggestBoardList(map);
		
		//페이징 처리를 script에서 처리하기 위해 pg, totalArticle, addr 를 함께 싣어 보내준다. 
		mav.addObject("pg", pg);
		mav.addObject("totalArticle", totalArticle);
		mav.addObject("addr", "/mintProject/shop/service/offer");
		mav.addObject("list", list);
		mav.addObject("display", "/shop/service/offer.jsp");
		mav.setViewName("/shop/main/index");
		
		return mav; 
	}
	
	
	//[관리자 페이지]==============================================================================================================
	//제안 문의 글목록 - 처음 로드 시 status = [문의 답변 전] 인 글의 list 를 가져오며, 이후 선택 옵션에 따라 status = [문의답변 완료] 인 글을 가져온다. 
	
	
	//처음 로드 할 때 폼을 먼저 띄우고
	@RequestMapping("/admin/service/offer")
	public ModelAndView getSuggestBoardListForm(ModelAndView mav) {
		mav.addObject("display", "/admin/service/offer.jsp");
		mav.setViewName("/admin/main/admin");
		
		return mav;
	}
	
	//바로 list 를 가져올 수 있도록 ajax 처리. 
	@RequestMapping("/admin/service/getOffer")
	public ModelAndView getSuggestBoardList(@RequestParam(required = false, defaultValue = "1") String pg, 
									@RequestParam(required = false, defaultValue = "2") String replyStatus, 
									ModelAndView mav) {
		int status = Integer.parseInt(replyStatus);
		int totalArticle = 0;
		List<SuggestBoardDTO> list = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(status == 2) { // 답변상태: 전체선택일 시 
			totalArticle= suggestBoardService.getAllSuggestBoardTotArticle();
			
			setPagingNumber(pg, map);
			list = suggestBoardService.getAllSuggestBoardList(map);
			
		}else { // 답변상태: 답변중 or 답변완료
			map.put("key", "replyStatus");
			map.put("value", status);
			
			totalArticle = suggestBoardService.getSuggestBoardTotArticle(map);

			setPagingNumber(pg, map);
			list = suggestBoardService.getSuggestBoardList(map);
			
		}
			
		//페이징 처리를 script에서 처리하기 위해 pg, totalArticle, addr 를 함께 싣어 보내준다. 
		mav.addObject("pg", pg);
		mav.addObject("totalArticle", totalArticle);
		mav.addObject("addr", "/admin/service/getOffer");
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	@RequestMapping("/admin/service/offerAnswer")
	public String getOfferAnswer(@RequestParam(required = false, defaultValue = "1") String pg,
								@RequestParam String seq, Model model) {
		
		SuggestBoardDTO suggestBoardDTO = suggestBoardService.getSuggestBoard(Integer.parseInt(seq));
		
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("suggestBoardDTO", suggestBoardDTO);
		model.addAttribute("display", "/admin/service/offerAnswer.jsp");
		return "/admin/main/admin"; 
		
	}
	
	@RequestMapping("/admin/service/updateReply")
	public ModelAndView updateReply(@RequestParam Map<String, String> map, ModelAndView mav) {
		System.out.println("map: " + map);
		suggestBoardService.updateReplySuggestBoard(map);	
		return getSuggestBoardListForm(mav);
		
	}
	
	// [사용자, 관리자 페이지 공통 함수] ==================================================================================================
	public void setPagingNumber(String pg, Map<String, Object> map) {
		int endNum = Integer.parseInt(pg) *5;
		int startNum = endNum -4; 
		
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
	}
	
}
