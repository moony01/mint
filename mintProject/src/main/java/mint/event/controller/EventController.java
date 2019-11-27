package mint.event.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
 * @version 1.8
 * @author LimChangHyun 
 *
 *	기능
 *	이벤트 등록, 페이징 처리, 리스트 처리, 이벤트 삭제
 *  이벤트 상품 리스트, 이벤트 수정, 이벤트 검색, 이벤트 연동, 일일특가
 *
 *	앞으로 구현되어야 하는 것 : 상품 검색(상품관리쪽과 겹침), 상품 추가, 상품 삭제
 *	이슈    1. 기간설정 없는 상시이벤트를 수정하려는 경우 startDate endDate 입력 input이 disabled 되지 않음
 *
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
	
	/* 이벤트 PrevDiscountRate 가져오기 */
	@RequestMapping(value="/admin/service/getPrevDiscountRate", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getPrevDiscountRate(@RequestParam String seq) {
		
		ModelAndView mav = new ModelAndView();
		// mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/* 이벤트 상품 리스트 가져오기 */
	@RequestMapping(value="/admin/service/getProductList", method=RequestMethod.POST)
	@ResponseBody
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
		List<EventProductDTO> eventProductList = eventService.getEventProduct(Integer.parseInt(seq));

		// Response
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("eventProductList", eventProductList);
		mav.setViewName("jsonView");
		return mav;
	}	

	/* 이벤트 등록 기능 */
	@RequestMapping(value="/admin/service/eventWrite", method=RequestMethod.POST)
	@ResponseBody
	public void eventWrite(@RequestParam Map<String, Object> map) {
		
		// 임시 (나중에 productCode 가져올 수 있으면 지울 것)
		map.put("productCode", "125");
		eventService.eventWrite(map);
	}
	
	/* 이벤트 수정 기능 */
	@RequestMapping(value="/admin/service/eventModify", method=RequestMethod.POST)
	@ResponseBody
	public void eventModify(@RequestParam Map<String, Object> map) {
		// System.out.println(map);
		eventService.eventModify(map);
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
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<EventDTO> list = eventService.eventSearch(map);
		
		// 게시판 페이징 처리
		// 총 글수
		int totalEvent = eventService.getSearchTotalEvent(map);
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
	
	/* 이벤트 실행 (product table discountRate update) */
	@RequestMapping(value="/admin/service/eventProductUpdate", method=RequestMethod.POST)
	@ResponseBody
	public void eventProductUpdate(@RequestParam String productCode,
								   @RequestParam String discountRate) {
		/**
		 * 각각 toString() 된 상태로 'a, b, c' 의 형태로 패러미터 값이 넘어와야한다
		 */
		// split으로 배열화
		String[] productCodeArray = productCode.split(",");
		String[] discountRateArray = discountRate.split(",");
		
		// Service단까지 들고갈 list 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			// 상품 개수만큼 Map생성 후 productCode, discountRate집어넣고
			for(int i=0; i<productCodeArray.length; i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("productCode", productCodeArray[i]);
				map.put("discountRate", Integer.parseInt(discountRateArray[i]));
				// 최종적으로 list에 넣기
				list.add(i, map);
				eventService.eventProductUpdate(list);
			}
			return;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			list.clear();
		}
	}
	
	/* 이벤트 종료 (product table discountRate update) */
	@RequestMapping(value="/admin/service/eventEndProductUpdate", method=RequestMethod.POST)
	@ResponseBody
	public void eventEndProductUpdate(@RequestParam String productCode,
								   @RequestParam String prevDiscountRate) {
		/**
		 * 각각 toString() 된 상태로 'a, b, c' 의 형태로 패러미터 값이 넘어와야한다
		 */
		// split으로 배열화
		String[] productCodeArray = productCode.split(",");
		String[] prevDiscountRateArray = prevDiscountRate.split(",");
		
		// Service단까지 들고갈 list 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			// 상품 개수만큼 Map생성 후 productCode, discountRate집어넣고
			for(int i=0; i<productCodeArray.length; i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("productCode", productCodeArray[i]);
				map.put("prevDiscountRate", Integer.parseInt(prevDiscountRateArray[i]));
				// 최종적으로 list에 넣기
				list.add(i, map);
				eventService.eventEndProductUpdate(list);
			}
			return;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			list.clear();
		}
	}
	
}
