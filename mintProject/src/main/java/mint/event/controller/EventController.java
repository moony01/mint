package mint.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mint.event.service.EventService;

@Controller
public class EventController {
	@Autowired
	private EventService eventService;
	
	/* 이벤트 관리 페이지 이동 */
	@RequestMapping(value="/admin/service/event", method=RequestMethod.GET)
	public String eventAdmin(Model model) {
		model.addAttribute("display", "/admin/service/event.jsp");
		return "/admin/service/event";
	}
}
