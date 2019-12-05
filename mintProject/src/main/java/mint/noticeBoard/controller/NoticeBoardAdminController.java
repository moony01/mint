package mint.noticeBoard.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mint.faqBoard.bean.FAQBoardDTO;
import mint.noticeBoard.bean.NoticeBoardDTO;
import mint.noticeBoard.bean.NoticeBoardPaging;
import mint.noticeBoard.service.NoticeBoardService;

@Controller
public class NoticeBoardAdminController {
	@Autowired
	private NoticeBoardService noticeBoardService;
	@Autowired
	private NoticeBoardPaging noticeBoardPaging;
	
	@RequestMapping(value="/admin/service/notice")
	public ModelAndView noticeBoardList(@RequestParam(required=false, defaultValue="1") String pg,
										ModelAndView mav) {
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<NoticeBoardDTO> list = noticeBoardService.noticeBoardList(map);
		
		//페이징 처리
		int totalNotice = noticeBoardService.getTotalNotice();
		noticeBoardPaging.setCurrentPage(Integer.parseInt(pg));
		noticeBoardPaging.setPageBlock(10);
		noticeBoardPaging.setPageSize(10);
		noticeBoardPaging.setTotalNotice(totalNotice);
		noticeBoardPaging.makePagingHTML();
		
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("noticeBoardPaging", noticeBoardPaging);
		mav.addObject("display", "/admin/service/notice.jsp");
		mav.setViewName("/admin/main/admin");
		return mav;
	}
	
	@RequestMapping(value="/admin/service/noticeBoardDelete", method=RequestMethod.POST)
	@ResponseBody
	public void noticeBoardDelete(@RequestParam Map<String,Object>map) {

		noticeBoardService.noticeBoardDelete(map);
	}
	
	@RequestMapping(value="/admin/service/noticeWrite")
	public ModelAndView noticeWrite(ModelAndView mav) {
		
		mav.addObject("display", "/admin/service/noticeWrite.jsp");
		mav.setViewName("/admin/main/admin");
		return mav;
	}
	
	@RequestMapping(value="/admin/service/noticeBoardWrite", method=RequestMethod.POST)
	@ResponseBody
	public void noticeBoardWrite(@RequestParam Map<String, String> map,
								 HttpSession session) {
		String id = (String)session.getAttribute("memId");
		
		map.put("id", id);
		System.out.println(map);
		noticeBoardService.noticeBoardWrite(map);
	}
	
	/* NOTICEBOARD 관리자 게시물 열람 페이지 이동 */
	@RequestMapping(value="/admin/service/noticeView", method=RequestMethod.GET)
	public String noticeView(@RequestParam int seq,
							 @RequestParam int pg,
							 Model model) {
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/admin/service/noticeView.jsp");
		return "/admin/main/admin";
	}
	
	/* NOTICEBOARD 게시물 정보 가져오기 (열람, 수정) */
	@RequestMapping(value="/admin/service/getNoticeView", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getNoticeView(@RequestParam String seq,
									  @RequestParam String pg,
									  HttpSession session) {
		NoticeBoardDTO noticeBoardDTO = noticeBoardService.getNoticeBoardArticle(Integer.parseInt(seq));
		String id = (String)session.getAttribute("memId");

		ModelAndView mav = new ModelAndView();
		// 나중에 id로 먹일 것
		mav.addObject("id", id);
		mav.addObject("pg", pg);
		mav.addObject("seq", seq);
		mav.addObject("dto", noticeBoardDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	/* NOTICEBOARD 게시물 수정 페이지 이동 */
	@RequestMapping(value="/admin/service/noticeModifyForm", method=RequestMethod.GET)
	public String noticeModifyForm(@RequestParam String seq,
								   @RequestParam String pg,
								   @RequestParam String type,
								   Model model) {
		NoticeBoardDTO noticeBoardDTO = noticeBoardService.getNoticeBoardArticle(Integer.parseInt(seq));
		System.out.println(noticeBoardDTO);
		model.addAttribute("pg", pg);
		model.addAttribute("seq", seq);
		model.addAttribute("type", type);
		model.addAttribute("dto", noticeBoardDTO);
		model.addAttribute("display", "/admin/service/noticeWrite.jsp");
		return "/admin/main/admin";
	}
	
	/* NOTICEBOARD 게시물 수정 기능 */
	@RequestMapping(value="/admin/service/noticeBoardModify", method=RequestMethod.POST)
	@ResponseBody
	public void noticeBoardModify(@RequestParam Map<String, String> map) {
		System.out.println(map);
		noticeBoardService.noticeBoardModify(map);
	}
	
	/* 써머노트 이미지 업로드 */
	@RequestMapping(value = "/admin/service/imageUpload", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String handleFileUpload(@RequestParam("uploadFile") MultipartFile multiPartFile) {
		//String filePath = "C:/Users/bitcamp/Documents/GitHub/mint/mintProject/src/main/webapp/shop/storage/member/noticeboard/"; // 원하는위치 (storage로 잡아주세요)
		String filePath = "C:/Users/hanmoonhee/Documents/github/mint/mintProject/src/main/webapp/shop/storage/member/noticeboard/"; // 원하는위치 (storage로 잡아주세요)
		String fileName = multiPartFile.getOriginalFilename();
		File file = new File(filePath, fileName);
		try {
			FileCopyUtils.copy(multiPartFile.getInputStream(), new FileOutputStream(file)); // spring저장소에서 storage로 복사
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
}













