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
	
	@RequestMapping(value="/notice/noticeBoardList")
	public String noticeBoardList(@RequestParam(required=false, defaultValue="1") String pg,
								  Model model,
								  HttpSession session) {
		
		//String memId = (String)session.getAttribute("memId");
		
		//1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<NoticeBoardDTO> list = noticeBoardService.noticeBoardList(map);
		
		//페이징 처리
		int totalNotice = noticeBoardService.getTotalNotice();//총글수
		noticeBoardPaging.setCurrentPage(Integer.parseInt(pg));
		noticeBoardPaging.setPageBlock(3);
		noticeBoardPaging.setPageSize(5);
		noticeBoardPaging.setTotalNotice(totalNotice);
		noticeBoardPaging.makePagingHTML();
		
		model.addAttribute("pg", pg);
		model.addAttribute("list", list);
		model.addAttribute("noticeBoardPaging", noticeBoardPaging);
		model.addAttribute("display", "/shop/service/notice.jsp");
		return "/shop/main/index";
	}
	
	@RequestMapping(value="/notice/noticeBoardSearch", method=RequestMethod.POST)
	public ModelAndView noticeBoardSearch(@RequestParam Map<String, Object> map, 
										  @RequestParam String[] check) {
		
		System.out.println("check 1번째 : " +check[0]);
		System.out.println("check 2번째 : " +check[1]);
		
		for(int i=0; i<check.length; i++) {
			map.put("checkBox", check[i]);
			
		}
		System.out.println("map" +map);
		System.out.println("pg:" +map.get("pg"));
		
		//1페이지당 5개씩
		int endNum = Integer.parseInt((String)map.get("pg"))*5;
		int startNum = endNum-4;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<NoticeBoardDTO> list = noticeBoardService.noticeBoardSearch(map);
		System.out.println("list : " +list);
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
















