package mint.faqBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mint.faqBoard.bean.FAQBoardDTO;
import mint.faqBoard.bean.FAQBoardPaging;
import mint.faqBoard.service.FAQBoardService;

/**
 *	FAQBoardController
 * 	자주 묻는 질문 게시판 컨트롤러
 * 
 *  /shop/service/faq.jsp
 * @version 1.0
 * @author LimChangHyun 
 *
 *	구현된 기능 : 리스트  가져오기(페이징 처리)
 *	앞으로 구현되어야 하는 것 : 글쓰기(관리자페이지 연동)
 *						수정(관리자페이지 연동)
 *						삭제(관리자페이지 연동)
 *						검색(페이징 처리)
 *						카테고리 선택(페이징 처리)
 *	뷰는 faq.js에서 ajax로 할 예정
 *						
 */

@Controller
public class FAQBoardController {
	@Autowired
	private FAQBoardService faqBoardService;
	@Autowired
	private FAQBoardPaging faqBoardPaging;
	
	/* FAQ게시판으로 이동 */
	@RequestMapping(value="/shop/service/faq", method=RequestMethod.GET)
	public String faq(@RequestParam(required=false, defaultValue="1") String pg,
						Model model) {
		model.addAttribute("display", "/shop/service/faq.jsp");
		model.addAttribute("pg", pg);
		return "/shop/main/index";
		
	}
	
	/* FAQ게시판 리스트 불러오기 */
	@RequestMapping(value="/faqBoard/getFAQBoardList", method=RequestMethod.POST)
	public ModelAndView getFAQBoardList(@RequestParam(required=false, defaultValue="1") String pg) {
		//1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;

		// 게시물 리스트 가져오기
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<FAQBoardDTO> list = faqBoardService.getBoardList(map);
		
		// 게시판 페이징 처리
		// 총 글수
		int totalArticle = faqBoardService.getTotalArticle();
		faqBoardPaging.setCurrentPage(Integer.parseInt(pg));
		faqBoardPaging.setPageBlock(5);
		faqBoardPaging.setPageSize(15);
		faqBoardPaging.setTotalArticle(totalArticle);
		faqBoardPaging.makePagingHTML();
		// Response
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("faqBoardPaging", faqBoardPaging);
		mav.setViewName("jsonView");
		return mav;

	}
}
