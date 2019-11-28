package mint.noticeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeBoardAdminController {

	@RequestMapping(value="/admin/service/notice")
	public ModelAndView noticeBoardList(ModelAndView mav) {
				
		mav.addObject("display", "/admin/service/notice.jsp");
		mav.setViewName("/admin/main/admin");
		return mav;
	}
}
