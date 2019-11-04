package mint.suggestBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mint.suggestBoard.bean.SuggestBoardDTO;
import mint.suggestBoard.service.SuggestBoardService;

@Controller
public class SuggestBoardController {
	@Autowired
	private SuggestBoardService suggestBoardService;
	
	//제안 문의 글쓰기
	@RequestMapping("/suggestBoardWriteForm")
	public String suggestBoardWriteForm(Model model) {
		model.addAttribute("display", "/suggestBoardWriteForm.jsp");
		return "/main";
	}
	
	@RequestMapping("/suggestBoardWrite")
	@ResponseBody
	public void suggestBoardWrite(@ModelAttribute SuggestBoardDTO suggestBoardDTO) {
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
	@RequestMapping("/getSuggestBoardList")
	public ModelAndView getSuggestBoardList(ModelAndView mav) {
		return mav; 
	}
	
	//제안 문의 글보기
	@RequestMapping("/getSuggestBoardView")
	public ModelAndView getSuggestBoardView(ModelAndView mav) {
		return mav; 
	}

}
