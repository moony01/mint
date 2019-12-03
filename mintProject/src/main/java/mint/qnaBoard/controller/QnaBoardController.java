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

import mint.order.bean.OrderAndSalesDTO;
import mint.qnaBoard.bean.QnaBoardDTO;
import mint.qnaBoard.service.QnaBoardService;

@Controller
public class QnaBoardController {
	@Autowired
	private QnaBoardService qnaBoardService;

	// 1:1 문의 보드 보드 값 조회
	@RequestMapping(value = "/qnaboard/getQnaBoardList")
	public ModelAndView getQnaBoardList(HttpSession session) {
		// 1페이지당 5개씩
//		int endNum = Integer.parseInt(pg)*5;
//		int startNum = endNum-4;
//				
		Map<String, String> map = new HashMap<String, String>();

		String id = (String) session.getAttribute("memId");
		map.put("memId", id);

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
		// qndWrite실행시킬때 주문목록 값 미리 가져가기 id로 조회
		String memId = (String) session.getAttribute("memId");

		List<Map<String,String>> list = qnaBoardService.getOrderList(memId);
		
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
		if (!img.isEmpty()) {
			System.out.println("파일 집어넣었다!!!!!!!!");
			String filePath = "C:\\Users\\bitcamp\\Documents\\GitHub\\mint\\mintProject\\src\\main\\webapp\\shop\\storage\\member\\qnaboard";
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

		String id = (String) session.getAttribute("memId");
//		String id = "sonsangz";

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
		String memId = (String) session.getAttribute("memId");

		List<Map<String, String>> list = qnaBoardService.getOrderList(memId);
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

	// 관리자 1:1 문의 보드 보드 값 조회
	@RequestMapping(value = "/admin/service/getAdminQnaBoardList")
	public ModelAndView getAdminQnaBoardList(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		// 총 갯수
		int totalArticle = qnaBoardService.getAdminQnaBoardCnt(map);
		setPagingNumber(map);
		System.out.println("map : " + map);

		List<QnaBoardDTO> list = qnaBoardService.getAdminQnaBoardList(map);

		// 셀렉트 박스 구분
		if (map.get("selectGubun") == "" || map.get("selectGubun") == null) {
			mav.addObject("selectGubun", "9");
		} else {
			mav.addObject("selectGubun", map.get("selectGubun"));
		}
		
		//맨 아래 셀렉트 박스 구분
		if (map.get("searchOption") == null) {
			mav.addObject("searchOption", "0");
			mav.addObject("keyword", "");
		} else {
			mav.addObject("searchOption", map.get("searchOption"));
			mav.addObject("keyword", map.get("keyword"));
		}
		
		// 페이지
		mav.addObject("pg", map.get("pg"));
		mav.addObject("list", list);
		mav.addObject("display", "/admin/service/qna.jsp");
		mav.addObject("totalArticle", totalArticle);
		mav.addObject("addr", "/mintProject/admin/service/getAdminQnaBoardList");
		
		mav.setViewName("/admin/main/admin");

		return mav;
	}

	// 관리자 1:1 문의 답변 창 불러오기
	@RequestMapping(value = "/admin/service/getAdminQnaReplyForm")
	public ModelAndView getAdminQnaReplyForm(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();

		QnaBoardDTO qndBoardDTO = qnaBoardService.getAdminQnaReply(map);

		mav.addObject("qndBoardDTO", qndBoardDTO);
		mav.addObject("pg", map.get("pg"));
		mav.addObject("display", "/admin/service/qnaAnswer.jsp");
		mav.setViewName("/admin/main/admin");

		return mav;
	}
	
	// 관리자 1:1 문의 답변 달기
	@RequestMapping(value = "/admin/service/adminQnaReplyUpdate",method = RequestMethod.POST)
	public ModelAndView adminQnaReplyUpdate(@RequestParam Map<String,String> map) {
		ModelAndView mav = new ModelAndView();
		//String content, @RequestParam String pg
		System.out.println("content : " + map.get("content"));
		System.out.println("pg : " + map.get("pg"));
		System.out.println("seq : " + map.get("seq"));
		
		//관리자 1:1문의 답변달기
		int cnt = qnaBoardService.updateAdminReply(map);
		
		if(cnt == 1) {
			mav.addObject("pg", map.get("pg"));
			mav.addObject("display", "/admin/service/qnaAnswerOk.jsp");
			mav.setViewName("/admin/main/admin");
		}

		return mav;
	}
	
	// 관리자 1:1 문의 답변 삭제
		@RequestMapping(value = "/admin/service/adminQnaDelete",method = RequestMethod.GET)
		public ModelAndView adminQnaDelete(@RequestParam Map<String,String> map) {
			ModelAndView mav = new ModelAndView();
			//String content, @RequestParam String pg
			System.out.println("삭제할 seq : " + map.get("seq"));
			qnaBoardService.qnaBoardDelete(Integer.parseInt(map.get("seq")));
			
			mav.addObject("display", "/admin/service/qnaDeleteOk.jsp");
			mav.setViewName("/admin/main/admin");

			return mav;
		}

	// [사용자, 관리자 페이지 공통 함수]
	// ==================================================================================================
	public void setPagingNumber(Map<String, String> map) {
		int endNum = Integer.parseInt((String) map.get("pg")) * 9;
		int startNum = endNum - 8;

		map.put("endNum", endNum + "");
		map.put("startNum", startNum + "");

	}

}
