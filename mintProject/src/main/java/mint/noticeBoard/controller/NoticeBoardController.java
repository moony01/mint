package mint.noticeBoard.controller;

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
import org.springframework.web.servlet.ModelAndView;

import mint.noticeBoard.bean.NoticeBoardDTO;
import mint.noticeBoard.bean.NoticeBoardPaging;
import mint.noticeBoard.service.NoticeBoardService;


@Controller
public class NoticeBoardController {
	@Autowired
	private NoticeBoardService noticeBoardService;
	@Autowired
	private NoticeBoardPaging noticeBoardPaging;
	
	@RequestMapping(value="/shop/service/notice")
	public String noticeBoardList(@RequestParam(required=false, defaultValue="1") String pg,
								  Model model,
								  HttpSession session) {
		
		//1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<NoticeBoardDTO> list = noticeBoardService.noticeBoardList(map);
		
		//페이징 처리
		int totalNotice = noticeBoardService.getTotalNotice();//총글수
		noticeBoardPaging.setCurrentPage(Integer.parseInt(pg));
		noticeBoardPaging.setPageBlock(10);
		noticeBoardPaging.setPageSize(10);
		noticeBoardPaging.setTotalNotice(totalNotice);
		noticeBoardPaging.makePagingHTML();
		
		model.addAttribute("pg", pg);
		model.addAttribute("list", list);
		model.addAttribute("noticeBoardPaging", noticeBoardPaging);
		model.addAttribute("display", "/shop/service/notice.jsp");
		return "/shop/main/index";
	}
	
	@RequestMapping(value="/shop/service/noticeBoardSearch", method=RequestMethod.POST)
	public ModelAndView noticeBoardSearch(@RequestParam Map<String, Object> map,
										  @RequestParam String[] check) {
		System.out.println("map before = "+map);
		
		//1페이지당 5개씩
		int endNum = Integer.parseInt((String)map.get("pg"))*5;
		int startNum = endNum-4;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("checkbox", check);
		
		System.out.println("map after = "+map);
		
		List<NoticeBoardDTO> list = noticeBoardService.noticeBoardSearch(map);
		System.out.println("list = "+list);
		
		//페이징 처리
		int totalNotice = noticeBoardService.getSearchTotalNotice(map);//총글수
		noticeBoardPaging.setCurrentPage(Integer.parseInt((String) map.get("pg")));
		noticeBoardPaging.setPageBlock(5);
		noticeBoardPaging.setPageSize(5);
		noticeBoardPaging.setTotalNotice(totalNotice);
		noticeBoardPaging.makeSearchPagingHTML();
		
		System.out.println(noticeBoardPaging);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("noticeBoardPaging", noticeBoardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/shop/service/noticeView", method=RequestMethod.GET)
	public String noticeBoardView(@RequestParam String seq,
								  @RequestParam String pg,
								  Model model,
								  HttpSession session) {
		
		NoticeBoardDTO noticeBoardDTO = noticeBoardService.getNoticeBoardView(seq);
		
		//이전글 다음글 불러오기
		//String[] nextPrevNotice = noticeBoardService.getNextPrevNotice(seq);
		
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("noticeBoardDTO", noticeBoardDTO);
		model.addAttribute("display", "/shop/service/noticeView.jsp");
		return "/shop/main/index";
	}
}
















