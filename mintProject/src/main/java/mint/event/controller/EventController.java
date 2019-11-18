package mint.event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mint.event.bean.EventDTO;
import mint.event.bean.EventPaging;
import mint.event.service.EventService;

/**
 *	EventController
 * 	이벤트 컨트롤러
 * 
 * @version 1.1
 * @author LimChangHyun 
 *
 *	구현된 기능 : 페이징 처리, 리스트 처리, 이벤트 삭제
 *	불완전 기능 : 이벤트 등록, 이벤트 수정
 *	앞으로 구현되어야 하는 것 : 관리자페이지
 *						검색, 연동 이벤트 적용, 일일특가
 *						상품 검색(상품관리쪽과 겹침), 상품 추가, 상품 삭제
 *						
 *	문제 : 1. 이벤트 등록시 기간 설정을 하지 않으면 SQL not enough values 오류 발생.
 *		(무슨 문제인지 모르겠음)
 */

@Controller
public class EventController {
	@Autowired
	private EventService eventService;
	@Autowired
	private EventPaging eventPaging;
	
	/* 이벤트 관리 페이지 이동 */
	@RequestMapping(value="/admin/service/event", method=RequestMethod.GET)
	public String eventAdmin(@RequestParam(required=false, defaultValue="1") String pg,
							Model model) {
		model.addAttribute("display", "/admin/service/event.jsp");
		model.addAttribute("pg", pg);
		return "/admin/main/admin";
	}
	
	/* 이벤트 등록 페이지 이동 */
	@RequestMapping(value="/admin/service/eventWriteForm", method=RequestMethod.GET)
	public String eventWriteForm(Model model) {
		model.addAttribute("display", "/admin/service/eventWrite.jsp");
		return "/admin/main/admin";
	}
	
	/* 이벤트 등록 기능 */
	@RequestMapping(value="/admin/service/eventWrite", method=RequestMethod.POST)
	@ResponseBody
	public void eventWrite(@RequestParam Map<String, Object> map) {
		map.put("productCode", "PX004");
		eventService.eventWrite(map);
	}
	
	/* 이벤트 리스트 가져오기 */
	@RequestMapping(value="/admin/service/getEventList", method=RequestMethod.POST)
	public ModelAndView getEventList(@RequestParam(required=false, defaultValue="1") String pg) {
		// 1페이지당 15개씩
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		// 게시물 리스트 가져오기
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<EventDTO> list = eventService.getEventList(map);
		
		// 게시판 페이징 처리
		// 총 이벤트 수
		int totalEvent = eventService.getTotalEvent();
		eventPaging.setCurrentPage(Integer.parseInt(pg));
		eventPaging.setPageBlock(5);
		eventPaging.setPageSize(10);
		eventPaging.setTotalEvent(totalEvent);
		eventPaging.makePagingHTML();
		
		// Response
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("eventPaging", eventPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/* FAQ게시판 게시물 삭제 기능 */
	@RequestMapping(value="/admin/service/eventDelete", method=RequestMethod.POST)
	@ResponseBody
	public void eventDelete(@RequestParam String[] check) {
		Map<String, String[]> map = new HashMap<String,String[]>();
		map.put("array", check);
		eventService.eventDelete(map);
	}
}
