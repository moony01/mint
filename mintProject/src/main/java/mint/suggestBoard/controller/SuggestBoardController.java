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
	
	//임시 메인 인덱스 
	@RequestMapping("/shop/main/index")
	public String main(Model model) {
		model.addAttribute("display", "/shop/member/join.jsp");
		return "/shop/main/index";
	}
	
	
	//제안 문의 글쓰기
	@RequestMapping("/shop/service/offerWrite")
	public String suggestBoardWriteForm(Model model) {
		model.addAttribute("display", "/shop/service/offerWrite.jsp");
		return "/shop/main/index";
	}
	
	@RequestMapping(value="/shop/service/offerWriteOk", method = RequestMethod.POST)
	@ResponseBody
	public void suggestBoardWrite(@ModelAttribute SuggestBoardDTO suggestBoardDTO, 
								@RequestParam MultipartFile img, HttpSession session) {
		
			String filePath = "C:\\Users\\user\\Desktop\\soyeon\\Spring\\mint\\mintProject\\src\\main\\webapp\\shop\\storage";
			String fileName = img.getOriginalFilename();
			File file = new File(filePath, fileName);
			
		if(fileName == null) {
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			}catch (IOException e) {
				e.printStackTrace();
			}
			suggestBoardDTO.setImgName(fileName);
			
		} else {
			suggestBoardDTO.setImgName("");
		}
		suggestBoardDTO.setId("hong"); //추후 session 값으로 받아옴. 
		suggestBoardService.writeSuggestBoard(suggestBoardDTO);
		
	}
	
	//제안 문의 글수정
	@RequestMapping("/suggestBoardModifyForm")
	public ModelAndView suggestBoardModifyForm(ModelAndView mav) {
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping("/suggestBoardModify")
	@ResponseBody
	public void suggestBoardModify() {
		
	}
	
	//제안 문의 글삭제
	@RequestMapping("/suggestBoardDelete")
	@ResponseBody
	public void suggestBoardDelete() {
		
	}
	
	//제안 문의 글목록
	@RequestMapping("/shop/service/offer")
	public ModelAndView getSuggestBoardList(@RequestParam(required = false, defaultValue = "1") String pg,
											ModelAndView mav) {
		
		int endNum = Integer.parseInt(pg) *5;
		int startNum = endNum -4; 
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		
		int totalArticle = suggestBoardService.getSuggestBoardTotArticle();
		List<SuggestBoardDTO> list = suggestBoardService.getSuggestBoardList(map);
		
		mav.addObject("pg", pg);
		mav.addObject("totalArticle", totalArticle);
		mav.addObject("list", list);
		mav.addObject("display", "/shop/service/offer.jsp");
		mav.setViewName("/shop/main/index");
		
		return mav; 
	}
	
	//제안 문의 글보기
	@RequestMapping("/getSuggestBoardView")
	public ModelAndView getSuggestBoardView(ModelAndView mav) {
		return mav; 
	}

}
