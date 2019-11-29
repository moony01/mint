package mint.noticeBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mint.noticeBoard.bean.NoticeBoardDTO;
import mint.noticeBoard.bean.NoticeBoardPaging;
import mint.noticeBoard.service.NoticeBoardService;

@Controller
public class NoticeBoardAdminController {
	@Autowired
	private NoticeBoardService noticeBoardService;
	@Autowired
	private NoticeBoardPaging noticeBoardPaging;
	
	@RequestMapping(value="/admin/service/notice")
	public ModelAndView noticeBoardList(@RequestParam(required=false, defaultValue="1") String pg,
										ModelAndView mav) {
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<NoticeBoardDTO> list = noticeBoardService.noticeBoardList(map);
		
		//페이징 처리
		int totalNotice = noticeBoardService.getTotalNotice();
		noticeBoardPaging.setCurrentPage(Integer.parseInt(pg));
		noticeBoardPaging.setPageBlock(5);
		noticeBoardPaging.setPageSize(5);
		noticeBoardPaging.setTotalNotice(totalNotice);
		noticeBoardPaging.makePagingHTML();
		
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("noticeBoardPaging", noticeBoardPaging);
		mav.addObject("display", "/admin/service/notice.jsp");
		mav.setViewName("/admin/main/admin");
		return mav;
	}
	
	@RequestMapping(value="/admin/service/noticeBoardDelete", method=RequestMethod.POST)
	@ResponseBody
	public void noticeBoardDelete(@RequestParam Map<String,Object>map) {

		noticeBoardService.noticeBoardDelete(map);
	}
	
	
}













