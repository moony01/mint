package mint.qnaBoard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mint.qnaBoard.bean.OrderAndSalesDTO;
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

	@RequestMapping(value = "/qnaboard/getQnaBoardWriteForm")
	public ModelAndView getQnaBoardWriteForm(HttpSession session) {
		// qndWrite실행시킬때 주문목록 값 미리 가져가기 email로 조회
		String email = (String) session.getAttribute("memEmail");

		List<OrderAndSalesDTO> list = qnaBoardService.getOrderList(email);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/shop/service/qnaWrite.jsp");

		mav.setViewName("/shop/main/index");
		return mav;
	}

//	name="img"가 1개일 경우
	@RequestMapping(value = "/qnaboard/qnaBoardWrite", method = RequestMethod.POST)
	public ModelAndView qndBoardWrite(@ModelAttribute QnaBoardDTO qnaBoardDTO, @RequestParam MultipartFile img,
			HttpSession session) {

		System.out.println(qnaBoardDTO.getContent());
		System.out.println(qnaBoardDTO.getSubject());
		System.out.println(qnaBoardDTO.getCategory());

		if (!img.isEmpty()) {
			System.out.println("파일 집어넣었다!!!!!!!!");
			String filePath = "C:\\Users\\bitcamp\\Documents\\GitHub\\mint\\mintProject\\src\\main\\webapp\\shop\\storage";
			String fileName = img.getOriginalFilename();
			File file = new File(filePath, fileName);
			System.out.println(fileName);

			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			qnaBoardDTO.setFileName(fileName);
		} else {
			System.out.println("파일 안집어넣었다!!!!!!!!");
			qnaBoardDTO.setFileName("");
		}

		// 일단 임시..
		// String id = (String) session.getAttribute("memId");
		String id = "sonsangz";

		qnaBoardDTO.setId(id);
		qnaBoardService.qnaBoardWrite(qnaBoardDTO);

		ModelAndView mav = new ModelAndView();

		mav.addObject("display", "/shop/service/qnaWriteOk.jsp");
		mav.setViewName("/shop/main/index");
		return mav;

	}

	@RequestMapping(value = "/qnaboard/qnaBoardModifyForm")
	public ModelAndView qnaBoardModifyForm(@RequestParam int seq, HttpSession session) {
		// qndWrite실행시킬때 주문목록 값 미리 가져가기 email로 조회
		String email = (String) session.getAttribute("memEmail");

		List<OrderAndSalesDTO> list = qnaBoardService.getOrderList(email);
		// 수정할 정보 seq로 조회해서 가져오기
		QnaBoardDTO qnaBoardDTO = qnaBoardService.getQnaModify(seq);

		ModelAndView mav = new ModelAndView();

		mav.addObject("qnaBoardDTO", qnaBoardDTO);
		mav.addObject("list", list);
		mav.addObject("display", "/shop/service/qnaModify.jsp");
		mav.setViewName("/shop/main/index");

		return mav;
	}

	// qna 수정
	@RequestMapping(value = "/qnaboard/qnaBoardModify", method = RequestMethod.POST)
	public ModelAndView qnaBoardModify(@ModelAttribute QnaBoardDTO qnaBoardDTO, @RequestParam MultipartFile img,
			HttpSession session) {

		System.out.println("qnaBoardDTO : " + qnaBoardDTO);
		System.out.println("img : " + img);

		if (!img.isEmpty()) {
			System.out.println("파일 집어넣었다!!!!!!!!");
			String filePath = "C:\\Users\\bitcamp\\Documents\\GitHub\\mint\\mintProject\\src\\main\\webapp\\shop\\storage";
			String fileName = img.getOriginalFilename();
			File file = new File(filePath, fileName);
			System.out.println(fileName);

			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			qnaBoardDTO.setFileName(fileName);
		} else {
			System.out.println("파일 안집어넣었다!!!!!!!!");
		}

		qnaBoardService.qnaBoardModify(qnaBoardDTO);
		ModelAndView mav = new ModelAndView();

		mav.addObject("display", "/shop/service/qnaModifyOk.jsp");
		mav.setViewName("/shop/main/index");

		return mav;
	}

	// 삭제
	@RequestMapping(value = "/qnaboard/qnaBoardDelete", method = RequestMethod.POST)
	@ResponseBody
	public void qnaBoardDelete(@RequestParam int seq, HttpSession session) {
		System.out.println("삭제할 seq : " + seq);
		qnaBoardService.qnaBoardDelete(seq);
	}

}
