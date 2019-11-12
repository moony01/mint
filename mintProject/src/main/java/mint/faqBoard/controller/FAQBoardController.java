package mint.faqBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mint.faqBoard.bean.FAQBoardDTO;
import mint.faqBoard.bean.FAQBoardPaging;
import mint.faqBoard.service.FAQBoardService;

/**
 *	FAQBoardController
 * 	자주 묻는 질문 게시판 컨트롤러
 * 
 * @version 1.4
 * @author LimChangHyun 
 *
 *	구현된 기능 : 사용자 기능 모두 완료 (리스트 가져오기, 페이징 처리, 카테고리 선택, 검색 기능, 답변 Display)
 *			    관리자 기능 (리스트 가져오기, 페이징 처리, 등록, 게시물 열람)
 *	앞으로 구현되어야 하는 것 : 
 *						카테고리 선택
 *						관리자용 검색 기능(필터 추가)
 *						수정 기능
 *						체크박스 일괄 삭제
 *	
 *	유의 : faq.jsp에서 카테고리 select option '선택'시 임의 value를 9로 두었음
 *	문제 : summernote로 미디어 요소(이미지, 표 등) 추가시 사용자 측에서 전체적인 레이아웃이 깨져버림
 */

@Controller
public class FAQBoardController {
	@Autowired
	private FAQBoardService faqBoardService;
	@Autowired
	private FAQBoardPaging faqBoardPaging;
	
	/* FAQ게시판으로 이동 */
	@RequestMapping(value="/shop/service/faq", method=RequestMethod.GET)
	public String faqBoard(@RequestParam(required=false, defaultValue="1") String pg,
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
	/* FAQ관리자 페이지 이동 */
	@RequestMapping(value="/admin/faq", method=RequestMethod.GET)
	public String faqAdmin(@RequestParam(required=false, defaultValue="1") String pg,
						Model model) {
		model.addAttribute("display", "/admin/faq.jsp");
		model.addAttribute("pg", pg);
		return "/admin/admin";
	}
	
	
	
	/* FAQ관리자 게시물 등록 페이지 이동 */
	@RequestMapping(value="/admin/faqWriteForm", method=RequestMethod.GET)
	public String faqAdminWrite(Model model) {
		model.addAttribute("display", "/admin/faqWrite.jsp");
		return "/admin/admin";
	}
	
	/* FAQ관리자 게시물 등록 */
	@RequestMapping(value="/admin/faqWrite", method=RequestMethod.POST)
	@ResponseBody
	public void faqAdminExecuteWrite(@RequestParam Map<String, String> map,
													HttpSession session) {
		// String id = (String)session.getAttribute("memId");
		// 임시로 id 잡아두었음. 나중에 session 가져올 수 있으면 변경 예정
		map.put("id", "mint_admin");
		
		faqBoardService.faqBoardWrite(map);
	}
	
	/* FAQ관리자 게시물 열람 페이지 이동 */
	@RequestMapping(value="/admin/faqView", method=RequestMethod.GET)
	public String faqAdminView(@RequestParam int seq,
								@RequestParam int pg,
								Model model) {
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/admin/faqView.jsp");
		return "/admin/admin";
	}
	
	/* FAQ관리자 게시물 정보 가져오기 (열람, 수정) */
	@RequestMapping(value="/admin/getFAQView", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getFAQAdminView(@RequestParam int seq,
									@RequestParam int pg,
									HttpSession session) {
		FAQBoardDTO faqBoardDTO = faqBoardService.getFAQArticle(seq);
		// String id = (String)session.getAttribute("memId");
		
		ModelAndView mav = new ModelAndView();
		// 나중에 id로 먹일 것
		mav.addObject("memId", "mint_admin");
		mav.addObject("pg", pg);
		mav.addObject("seq", seq);
		mav.addObject("dto", faqBoardDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	

	/* FAQ게시판 게시물 수정 기능 */
	/* FAQ게시판 게시물 삭제 기능 */
	
}
