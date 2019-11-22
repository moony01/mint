package mint.event.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import mint.event.bean.EventProductDTO;
import mint.event.service.EventService;
import mint.product.bean.ProductDTO;

/**
 *	EventController
 * 	이벤트 컨트롤러
 * 
 * @version 1.5
 * @author LimChangHyun 
 *
 *	구현된 기능 : 이벤트 등록, 페이징 처리, 리스트 처리, 이벤트 삭제
 *			     이벤트 상품 리스트
 *	불완전 기능 : 이벤트 수정, 이벤트 검색, 이벤트 연동, 일일특가
 *	앞으로 구현되어야 하는 것 : 상품 검색(상품관리쪽과 겹침), 상품 추가, 상품 삭제
 *	이슈    1. 기간설정 없는 상시이벤트를 수정하려는 경우 startDate endDate 입력 input이 disabled 되지 않음
 *		 2. 이벤트 검색 기능 작동 안함(sql구문 문제인듯)
 *		 3. 이벤트 적용 상품이 두개 이상일 때 이벤트 수정 기능 작동 안함
 *
 */

@Controller
public class EventController {
	@Autowired
	private EventService eventService;
	@Autowired
	private EventPaging eventPaging;
	@Autowired
	private EventProductDTO eventProductDTO;
	
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
		
		// 임시 (나중에 productCode 가져올 수 있으면 지울 것)
		map.put("productCode", "125");
		eventService.eventWrite(map);
	}
	
	/* 이벤트 리스트 가져오기 */
	@RequestMapping(value="/admin/service/getEventList", method=RequestMethod.POST)
	public ModelAndView getEventList(@RequestParam(required=false, defaultValue="1") String pg) {
		// 1페이지당 10개씩
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		// 게시물 리스트 가져오기
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		// event seq가져가서 각각의 productCode를 가져와야함 HashMap?
		
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
	
	/* 이벤트 정보 가져오기 */
	@RequestMapping(value="/admin/service/getEvent", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getEvent(@RequestParam String seq) {
		EventDTO eventDTO = eventService.getEvent(Integer.parseInt(seq));
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", eventDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	/* 이벤트 상품 리스트 가져오기 */
	@RequestMapping(value="/admin/service/getProductList", method=RequestMethod.POST)
	public ModelAndView getProductList(@RequestParam(required=false, defaultValue="1") String pg,
									   @RequestParam String seq) {
		// EventDTO에서 productCode 가져오기
		EventDTO eventDTO = eventService.getEvent(Integer.parseInt(seq));
		// productcode를 배열로 변환하기
		String[] array = eventDTO.getProductCode().split(",");
		
		// 게시물 리스트 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("array", array);
		List<ProductDTO> list = eventService.getProductList(map);
		
		// Response
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/* 이벤트 수정 페이지 이동 */
	@RequestMapping(value="/admin/service/eventModifyForm", method=RequestMethod.GET)
	public String eventModifyForm(@RequestParam String seq,
								@RequestParam String pg,
								@RequestParam String type,
								Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("seq", seq);
		model.addAttribute("type", type);
		model.addAttribute("display", "/admin/service/eventWrite.jsp");
		return "/admin/main/admin";
	}
	

	/* 이벤트 수정 기능 */
	@RequestMapping(value="/admin/service/eventModify", method=RequestMethod.POST)
	@ResponseBody
	public void eventModify(@RequestParam Map<String, Object> map) {
		// event 정보 수정(subject, eventStatus, startDate, endDate)
		eventService.eventModify(map);
		
		// product관련 수정(productCode, discountRate)
		Map<String, String[]> map2 = new HashMap<String, String[]>();
		
		String[] productCode = ((String)map.get("productCode")).split(",");
		String[] discountRate = ((String)map.get("discountRate")).split(",");
		System.out.println(productCode[0]);
		System.out.println(discountRate[0]);
		map2.put("productCode", productCode);
		map2.put("discountRate", discountRate);
		// eventService.eventProductModify(map2);
	}
	
	/* 이벤트 삭제 기능 */
	@RequestMapping(value="/admin/service/eventDelete", method=RequestMethod.POST)
	@ResponseBody
	public void eventDelete(@RequestParam String[] check) {
		Map<String, String[]> map = new HashMap<String,String[]>();
		map.put("array", check);
		eventService.eventDelete(map);
	}
	
	/* 이벤트 검색 기능 */
	@RequestMapping(value="/admin/service/eventSearch", method=RequestMethod.POST)
	public ModelAndView getFAQBoardSearch(@RequestParam Map<String, Object> map) {
		// 1페이지당 10개씩
		int endNum = Integer.parseInt((String) map.get("pg"))*10;
		int startNum = endNum-9;
 
		List<EventDTO> list = eventService.eventSearch(map);
		System.out.println("SQL거쳐서 온 리스트 : "+list);
		// 게시판 페이징 처리
		// 총 글수
		int totalEvent = eventService.getSearchTotalEvent(map);
		System.out.println("SQL거쳐서 온 조건 부합 게시물 개수 : "+totalEvent);
		eventPaging.setCurrentPage(Integer.parseInt((String) map.get("pg")));
		eventPaging.setPageBlock(5);
		eventPaging.setPageSize(15);
		eventPaging.setTotalEvent(totalEvent);
		eventPaging.makePagingHTML();
		
		// Response
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("eventPaging", eventPaging);
		mav.setViewName("jsonView");
		return mav;
	}
}
