package mint.event.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mint.event.service.EventService;

/**
 *	EventController
 * 	이벤트 컨트롤러
 * 
 * @version 1.0
 * @author LimChangHyun 
 *
 *	구현된 기능 : 
 *	앞으로 구현되어야 하는 것 : 관리자페이지
 *						등록, 수정, 삭제, 연동 이벤트 적용, 일일특가
 *						
 *	
 *	유의 : datetimepicker 사용. 아직 불완전한 부분이 있어 더 공부 필요.
 */

@Controller
public class EventController {
	@Autowired
	private EventService eventService;
	
	/* 이벤트 관리 페이지 이동 */
	@RequestMapping(value="/admin/service/event", method=RequestMethod.GET)
	public String eventAdmin(Model model) {
		model.addAttribute("display", "/admin/service/event.jsp");
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
	public ModelAndView eventWrite(@RequestParam Map<String, Object> map
									) {
		System.out.println(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("jsonView");
		return mav;
	}
	
}
