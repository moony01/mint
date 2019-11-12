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
 * @version 1.3
 * @author LimChangHyun 
 *
 *	구현된 기능 :  리스트  가져오기
 *				페이징 처리
 *				카테고리 선택
 *				검색 기능
 *				답변 display기능
 *	앞으로 구현되어야 하는 것 : 관리자페이지
 *						리스트 가져오기
 *						페이징 처리
 *						카테고리 선택
 *						관리자용 검색 기능(필터 추가)
 *						게시물 열람 - 수정 기능
 *						체크박스 일괄 삭제
 *	
 *	유의 : faq.jsp에서 카테고리 select option '선택'시 임의 value를 9로 두었음
 *		FAQ관리 페이지 url은 임시로 세팅해두었음. 추후 수정 예정.
 *		관리자 페이지 작업을 위해 임시로 admin.jsp를 controller 연결하고 있음 
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
	
	/* FAQ게시판 리스트 가져오기 (사용자, 관리자 공통)*/
	@RequestMapping(value="/shop/service/faq/getBoardList", method=RequestMethod.POST)
	public ModelAndView getFAQBoardList(@RequestParam(required=false, defaultValue="1") String pg) {
		// 1페이지당 15개씩
		int endNum = Integer.parseInt(pg)*15;
		int startNum = endNum-14;
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
	
	/* FAQ게시판 검색시 리스트 가져오기 */
	@RequestMapping(value="/shop/service/faq/getSearchBoardList", method=RequestMethod.POST)
	public ModelAndView getFAQBoardSearch(@RequestParam Map<String, Object> map) {
		//System.out.println(map.get("category"));
		//System.out.println(map.get("keyword"));
		
		// 1페이지당 15개씩
		int endNum = Integer.parseInt((String) map.get("pg"))*15;
		int startNum = endNum-14;
		
		map.put("startNum", startNum);
		map.put("endNum", endNum);
				
		List<FAQBoardDTO> list = faqBoardService.faqBoardSearch(map);
		//System.out.println(list);
		
		// 게시판 페이징 처리
		// 총 글수
		int totalArticle = faqBoardService.getSearchTotalArticle(map);
		//System.out.println(totalArticle);
		faqBoardPaging.setCurrentPage(Integer.parseInt((String) map.get("pg")));
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
	
	
	///////////////////////관리자//////////////////////////
	/* FAQ관리자 페이지 이동 (임시) */
	// 나중에 url주소 확정되면 고치겠습니다
	
	/*
	 * 임시(커밋할 때 꼭 주석처리 할 것)
	@RequestMapping(value="/admin/admin", method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display","/admin/faq.jsp");
		mav.setViewName("/admin/admin");
		return mav;
	}
	 */
	
	/* 나중에 진짜 쓰일 것
	@RequestMapping(value="/admin/faq", method=RequestMethod.GET)
	public String faqAdmin(@RequestParam(required=false, defaultValue="1") String pg,
						Model model) {
		model.addAttribute("display", "/admin/faq.jsp");
		model.addAttribute("pg", pg);
		return "/admin/admin";
	}
	*/
	
	
	
	/* FAQ관리자 게시물 등록 */
	/* FAQ관리자 게시물 열람 */
	/* FAQ게시판 게시물 수정시 게시물 정보 가져오기 */
	/* FAQ게시판 게시물 수정 기능 */
	/* FAQ게시판 게시물 삭제 기능 */
	
}
