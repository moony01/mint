package mint.member.controller;

import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mint.member.bean.SupplierDTO;
import mint.member.service.MemberService;

@Controller
public class MemberAdminController {
	@Autowired 
	private MemberService memberService;	
	
	@RequestMapping("/admin/member/supplierForm")
	public ModelAndView getSupplierForm(ModelAndView mav) {
		mav.addObject("display", "/admin/member/supplierForm.jsp");
		mav.setViewName("/admin/main/admin");
		
		return mav;
	}
	
	@RequestMapping("/admin/member/writeSupplier")
	public ModelAndView writeSupplier(@ModelAttribute SupplierDTO supplierDTO, ModelAndView mav) {
		memberService.writeMember(supplierDTO);
		mav.addObject("display", "/admin/main/main.jsp");
		mav.setViewName("/admin/main/admin");
		return mav; 
	}
	
	@RequestMapping("/admin/member/isDuplicated")
	@ResponseBody
	public boolean isDuplicated(@RequestParam Map<String, String> map, ModelAndView mav) {
		boolean isDuplicated = false; 
		
		Set<String> set = map.keySet(); 
		for (String key : set) {
			map.put("key", key);
			map.put("value", map.get(key));
		}

		SupplierDTO supplierDTO = memberService.getSupplierBy(map);
		if(supplierDTO != null) {
			isDuplicated = true;
		}
		
		mav.setViewName("jsonView");
		return isDuplicated;
	}
	
	@RequestMapping("/admin/member/supplierList")
	public ModelAndView getSupplierList(ModelAndView mav){
		
		mav.addObject("display", "/admin/member/supplierList.jsp");
		mav.setViewName("/admin/main/admin");
		
		return mav;
	}
	
	@RequestMapping("/admin/member/memberList")
	public ModelAndView getMemberList(ModelAndView mav){
		
		mav.addObject("display", "/admin/member/memberList.jsp");
		mav.setViewName("/admin/main/admin");
		
		return mav;
	}
	
}
