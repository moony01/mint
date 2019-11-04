package mint.noticeBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mint.noticeBoard.bean.NoticeBoardDTO;
import mint.noticeBoard.service.NoticeBoardService;


@Controller
@RequestMapping(value="/shop/service/")
public class NoticeBoardController {
	@Autowired
	private NoticeBoardService noticeBoardService;
	
	@RequestMapping(value="notice")
	public String noticeBoardList(@RequestParam(required=false, defaultValue="1") String pg,
								 Model model,
								 HttpSession session) {
		
		//String memId = (String)session.getAttribute("memId");
		System.out.println("hello");
		//1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		//List<NoticeBoardDTO> list = noticeBoardService.noticeBoardList(map);
		//System.out.println("list : " +list);
		
		model.addAttribute("pg", pg);
		//model.addAttribute("display", "/service/notice.jsp");
		return "/shop/service/notice";
	}
}
















