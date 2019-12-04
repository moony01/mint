package mint.event.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mint.event.bean.EventDTO;
import mint.event.bean.EventProductDTO;
import mint.event.service.EventService;
import mint.product.bean.ProductDTO;

/**
 *	EventController
 * 	이벤트 컨트롤러
 * 
 * @version 1.14
 * @author LimChangHyun 
 *
 *	구현된 기능 : 이벤트 등록, 이벤트 수정, 리스트 처리, 이벤트 삭제
 *  		     이벤트 상품 리스트, 이벤트 검색, 이벤트 연동, 일일특가
 *  		    상품 추가, 상품 삭제, 상품 검색
 *	불완전 기능 : 상품 페이징 처리
 *	이슈  1. 이벤트 등록/수정에 있는 상품 리스트 AJAX페이징 불완전함 (이전, 다음 버튼 기능 미구현)
 */

@Controller
public class EventController {
	@Autowired
	private EventService eventService;

	
	/* 이벤트 페이지 이동 */
	@RequestMapping(value="/shop/goods/event", method=RequestMethod.GET)
	public ModelAndView event() {
		List<EventDTO> list = eventService.getEventList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/shop/goods/event.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}
	
	/* 이벤트 관리 페이지 이동 */
	@RequestMapping(value="/admin/service/event", method=RequestMethod.GET)
	public String eventAdmin(Model model) {
		model.addAttribute("display", "/admin/service/event.jsp");
		return "/admin/main/admin";
	}
	
	/* 이벤트 등록 페이지 이동 */
	@RequestMapping(value="/admin/service/eventWriteForm", method=RequestMethod.GET)
	public String eventWriteForm(@RequestParam(required=false, defaultValue="1") String pg, Model model) {
		model.addAttribute("display", "/admin/service/eventWrite.jsp");
		model.addAttribute("pg", pg);
		return "/admin/main/admin";
	}
	
	/* 이벤트 수정 페이지 이동 */
	@RequestMapping(value="/admin/service/eventModifyForm", method=RequestMethod.GET)
	public String eventModifyForm(@RequestParam String seq,
								@RequestParam String type,
								Model model) {
		model.addAttribute("seq", seq);
		model.addAttribute("type", type);
		model.addAttribute("display", "/admin/service/eventWrite.jsp");
		model.addAttribute("filePath", "C:/Users/bitcamp/Documents/GitHub/mint/mintProject/src/main/webapp/shop/storage/mint/product/");
		return "/admin/main/admin";
	}
	
	/* 이벤트 리스트 가져오기 */
	@RequestMapping(value="/{temp}/service/getEventList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getEventList(@PathVariable String temp) {

		List<EventDTO> list = eventService.getEventList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/* 이벤트 페이지 상품 리스트 */
	@RequestMapping(value = "/shop/goods/eventProductList", method = RequestMethod.GET)
	public ModelAndView getProductList(@RequestParam Map<String, Object> map) {
		
		ModelAndView mav = new ModelAndView();
		
		// EventDTO에서 productCode 가져오기
		EventDTO eventDTO = eventService.getEvent(Integer.parseInt((String)map.get("seq")));

		// productcode를 배열로 변환하기
		String[] array = eventDTO.getProductCode().split(",");

		// 게시물 리스트 가져오기
		Map<String, Object> map2 = new HashMap<String, Object>();
		int endNum = Integer.parseInt((String) map.get("pg")) * 9;
		int startNum = endNum - 8;
		map2.put("array", array);
		map2.put("selectGubun", map.get("selectGubun"));
		map2.put("endNum", endNum + "");
		map2.put("startNum", startNum + "");

		List<ProductDTO> list = eventService.getEventProductListWithSort(map2);
				
		int totalArticle = list.size();
		
		// 신상품 : 1 //별점순 : 2 // 낮은 가격순 : 3 // 높은 가격순 : 4
		mav.addObject("selectGubun", map.get("selectGubun"));
		// 페이지
		mav.addObject("pg", map.get("pg"));
		// 조건에 따른 상품리스트 총 갯수
		mav.addObject("seq", map.get("seq"));
		mav.addObject("eventSubject", eventDTO.getSubject());
		mav.addObject("list", list);
		mav.addObject("totalArticle", totalArticle);
		mav.addObject("addr", "/mintProject/shop/goods/eventProductList");
		mav.addObject("display", "/shop/goods/eventProductList.jsp");
		mav.setViewName("/shop/main/index");

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
	
	/* 상품 리스트 가져오기 */
	@RequestMapping(value = "/admin/service/getProductList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getProductList(@RequestParam(required=false, defaultValue="1") String pg,
										String searchOption,
										String categorySelect,
										String keyword) {
		// 1페이지당 10개씩
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		// 게시물 리스트 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("searchOption", searchOption);
		map.put("categorySelect", searchOption);
		map.put("keyword", keyword);

		List<ProductDTO> list = eventService.getProductList(map);
		
		// 총 갯수
		int totalProduct = eventService.getTotalProduct(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("addr", "mintProject/admin/service/eventWriteForm");
		mav.addObject("totalProduct", totalProduct);
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	/* 상품 추가를 위해 선택한 상품 리스트 가져오기 */
	@RequestMapping(value="/admin/service/addProduct", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getProductList(@RequestParam String[] inputProductCode) {
		
		// 해당 상품 리스트 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("array", inputProductCode);
		List<ProductDTO> list = eventService.getEventProductList(map);
		
		// Response
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}	
	
	/* 이벤트 상품 리스트 가져오기 */
	@RequestMapping(value="/{temp}/service/getEventProductList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getEventProductList(@PathVariable String temp,
											@RequestParam String seq) {
		// EventDTO에서 productCode 가져오기
		EventDTO eventDTO = eventService.getEvent(Integer.parseInt(seq));
		
		// productcode를 배열로 변환하기
		String[] array = eventDTO.getProductCode().split(",");

		// 게시물 리스트 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("array", array);
		List<ProductDTO> list = eventService.getEventProductList(map);
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
	public void eventWrite(@ModelAttribute EventDTO eventDTO
						 , @RequestParam MultipartFile event_thumbnail_img
						 , @RequestParam String isPeriodOn) {
		// 위치
		String filePath = "C:/Users/bitcamp/Documents/GitHub/mint/mintProject/src/main/webapp/shop/storage/mint/event/"; // 원하는

		try {
			FileCopyUtils.copy(event_thumbnail_img.getInputStream(),
			new FileOutputStream(new File(filePath, event_thumbnail_img.getOriginalFilename())));
		} catch (IOException e) {
			e.printStackTrace();
		}
		eventDTO.setEventThumbnail(event_thumbnail_img.getOriginalFilename());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eventDTO", eventDTO);
		map.put("isPeriodOn", isPeriodOn);
		eventService.eventWrite(map);
	}
	
	/* 이벤트 수정 기능 */
	@RequestMapping(value="/admin/service/eventModify", method=RequestMethod.POST)
	@ResponseBody
	public void eventModify(@ModelAttribute EventDTO eventDTO
						  , @RequestParam MultipartFile event_thumbnail_img
						  , @RequestParam String isPeriodOn) {
		// 위치
		String filePath = "C:/Users/bitcamp/Documents/GitHub/mint/mintProject/src/main/webapp/shop/storage/mint/event/";
		if (!event_thumbnail_img.isEmpty()) {
			try {
				FileCopyUtils.copy(event_thumbnail_img.getInputStream(),
				new FileOutputStream(new File(filePath, event_thumbnail_img.getOriginalFilename())));
			} catch (IOException e) {
				e.printStackTrace();
			}
			eventDTO.setEventThumbnail(event_thumbnail_img.getOriginalFilename());
		}
		
		// 임시 input
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eventDTO", eventDTO);
		map.put("isPeriodOn", isPeriodOn);
		eventService.eventModify(map);
	}
	
	/* 이벤트 삭제 기능 */
	@RequestMapping(value="/admin/service/eventDelete", method=RequestMethod.POST)
	@ResponseBody
	public void eventDelete(@RequestParam String[] check) {
		// 파일 삭제도 추가해야함
		Map<String, String[]> map = new HashMap<String,String[]>();
		map.put("array", check);
		eventService.eventDelete(map);
	}
	
	/* 이벤트 검색 기능 */
	@RequestMapping(value="/admin/service/eventSearch", method=RequestMethod.POST)
	public ModelAndView getFAQBoardSearch(@RequestParam Map<String, Object> map) {
		List<EventDTO> list = eventService.eventSearch(map);
		
		// Response
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
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
				map.put("productCode", productCodeArray[i].trim());
				map.put("discountRate", Integer.parseInt(discountRateArray[i].trim()));
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
	public void eventEndProductUpdate(@RequestParam String seq
									, @RequestParam String productCode
									, @RequestParam String prevDiscountRate) {
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
				map.put("seq", seq);
				map.put("productCode", productCodeArray[i].trim());
				map.put("prevDiscountRate", Integer.parseInt(prevDiscountRateArray[i].trim()));
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
