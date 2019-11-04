package mint.qnaBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mint.qnaBoard.bean.QnaBoardDTO;
import mint.qnaBoard.service.QnaBoardService;

@Controller
public class QnaBoardController {
	@Autowired
	private QnaBoardService qnaBoardService;

	// 1:1 문의 보드 보드 값 조회
	@RequestMapping(value = "/qnaboard/getQnaBoardList")
	public ModelAndView getQnaBoardList(HttpSession session) {
		String id = (String) session.getAttribute("memId");

		// 1페이지당 5개씩
//		int endNum = Integer.parseInt(pg)*5;
//		int startNum = endNum-4;
//				
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("memId", id);

//		map.put("startNum", startNum);
//		map.put("endNum", endNum);

		List<QnaBoardDTO> list = qnaBoardService.getQnaBoardList(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/shop/service/qna.jsp");
		mav.setViewName("/shop/main/index");
		return mav;
	}

}
