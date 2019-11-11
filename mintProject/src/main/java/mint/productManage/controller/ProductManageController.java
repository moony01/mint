package mint.productManage.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mint.productManage.bean.ProductManageDTO;
import mint.productManage.service.ProductManageService;
import mint.qnaBoard.bean.QnaBoardDTO;

@Controller
public class ProductManageController {
	@Autowired
	private ProductManageService productManageService;
	
	//상품등록 페이지 이동
//	@RequestMapping(value = "/qnaboard/getQnaBoardList")
//	public ModelAndView ProductManageWriteForm(HttpSession session) {
//		
//		
//		
//		return null;
//	}
	
	//써머노트 
	@RequestMapping(value="/admin/imageUpload", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String handleFileUpload(@RequestParam("uploadFile") MultipartFile multiPartFile){
		String filePath = "C:\\Users\\bitcamp\\Documents\\GitHub\\mint\\mintProject\\src\\main\\webapp\\shop\\storage"; // 원하는 위치 (storage로 잡아주세요)
		String fileName = multiPartFile.getOriginalFilename();
		File file = new File (filePath, fileName);
		try {
			FileCopyUtils.copy(multiPartFile.getInputStream(), new FileOutputStream(file)); // spring저장소에서 storage로 복사
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	} 
	
	@RequestMapping(value = "/productManage/productManageWrite", method = RequestMethod.POST)
	public ModelAndView productManageWrite(@ModelAttribute ProductManageDTO productManageDTO, @RequestParam MultipartFile thumbnail,
			HttpSession session) {

	
		return null;
	}
	
}
