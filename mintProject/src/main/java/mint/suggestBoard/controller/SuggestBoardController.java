package mint.suggestBoard.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mint.suggestBoard.bean.SuggestBoardDTO;
import mint.suggestBoard.service.SuggestBoardService;

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
		
		suggestBoardDTO.setId("hong");
		//추후 session 값으로 받아옴. suggestBoardDTO.setId((String) session.getAttribute("memId"));
		
		//file 경로: 상대경로로 지정되어야 함 (보완예정)
		String filePath = "C:\\Users\\user\\Desktop\\soyeon\\Spring\\mint\\mintProject\\src\\main\\webapp\\shop\\storage";
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
	public ModelAndView deleteSuggestBoard(@RequestParam String seq, ModelAndView mav) {
		suggestBoardService.deleteSuggestBoard(Integer.parseInt(seq));
		return getSuggestBoardList("1", mav);
	}
	
	//제안 문의 글목록
	@RequestMapping("/shop/service/offer")
	public ModelAndView getSuggestBoardList(@RequestParam(required = false, defaultValue = "1") String pg,
											ModelAndView mav) {
		int endNum = Integer.parseInt(pg) *3;
		int startNum = endNum -2; 
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		int totalArticle = suggestBoardService.getSuggestBoardTotArticle();
		List<SuggestBoardDTO> list = suggestBoardService.getSuggestBoardList(map);
		
		//페이징 처리를 script에서 처리하기 위해 pg, totalArticle, addr 를 함께 싣어 보내준다. 
		mav.addObject("pg", pg);
		mav.addObject("totalArticle", totalArticle);
		mav.addObject("addr", "../service/offer");
		mav.addObject("list", list);
		mav.addObject("display", "/shop/service/offer.jsp");
		mav.setViewName("/shop/main/index");
		
		return mav; 
	}
	
}
