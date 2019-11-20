package mint.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mint.member.bean.MemberDTO;
import mint.member.bean.SupplierDTO;
import mint.member.service.MemberService;
import mint.product.bean.ProductDTO;

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
	
	// [회원, 판매자] ajax로 리스트 불러오기 ==================================================
	@RequestMapping("/admin/member/{table}/{searchValue}/{option}")
	public ModelAndView getList(@PathVariable String table, 
						@PathVariable String searchValue, 
						@PathVariable String option, ModelAndView mav) {
		
		System.out.println(table + "/ " + searchValue + "/ " + option);
		String orderbyValue = null; 
		
		Map<String, String> map = new HashMap<String, String>();
		
		orderbyValue = setMapValues(table, option, orderbyValue);
		
		if(searchValue.contains("-")) { // 날짜로 검색 
			searchValue = searchValue.replace('.', '/');
			map.put("searchOption", "logtime");
			map.put("from", searchValue.substring(0, 8));
			map.put("to", searchValue.substring(11));
			
		} else if(!searchValue.equals("undefined")){ // 아이디로 검색
			map.put("searchOption", "id");
			map.put("searchValue", searchValue);
		}
		
		map.put("table", table);
		map.put("orderbyValue", orderbyValue);
	
		System.out.println(map);

		List<Map<String, String>> list = memberService.getList(map); // member
		System.out.println("list<Map>: " + list);
		
		//페이징 처리를 script에서 처리하기 위해 pg, totalArticle, addr 를 함께 싣어 보내준다. 
		//mav.addObject("pg", pg);
		//mav.addObject("totalArticle", totalArticle);
		mav.addObject("addr", "/admin/member/"+table+"List");
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav; 

		
	}

	//getList() 함수 수행 시 파라미터 값에 따라 value 값 설정
	private String setMapValues(String table, String option, String orderbyValue) {

		if(table.equals("member")) { 
			if(option.equals("1")) { orderbyValue = "id"; //1 id 오름차순
			} else if(option.equals("2")) { orderbyValue = "memLevel"; // 별점 / 회원레벨 내림차순
			} else if(option.equals("3")) { orderbyValue = "isAgreedSMS"; // SMS 동의(Y)인 사람만
			} else if(option.equals("0") || option.equals("4")) {orderbyValue = "logtime";
			}
			
		} else if(table.equals("supplier")) {
			if(option.equals("1")) { orderbyValue = "id";
			} else if(option.equals("2")) { orderbyValue = "star";
			} else if(option.equals("3")) {	orderbyValue = "status"; //status 내림차순 
			} else if(option.equals("0") || option.equals("4")) {	orderbyValue = "logtime"; //logtime 내림차순
			}
		}
		
		return orderbyValue;
		
	}
	
	//회원 상세보기 
	@RequestMapping("/admin/member/memberView")
	public ModelAndView getMemberView(String id, ModelAndView mav) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", "id");
		map.put("value", id);
		
		MemberDTO memberDTO = memberService.getUserBy(map);
		
		mav.addObject("memberDTO", memberDTO);
		mav.addObject("display", "/admin/member/memberView.jsp");
		mav.setViewName("/admin/main/admin");
		
		return mav;
		
	}
	
	//판매자 상세보기 
	@RequestMapping(value="/admin/member/supplierView", produces = "application/json; charset=UTF-8")
	public ModelAndView getSupplierView(String id, ModelAndView mav) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", "id");
		map.put("value", id);
		
		SupplierDTO supplierDTO = memberService.getSupplierBy(map); //판매자 기본정보
		List<ProductDTO> list = memberService.getProductList(map); //판매자 판매정보
		
		System.out.println("DTO: " + supplierDTO);
		System.out.println("list: "+ list);
		
		mav.addObject("supplierDTO", supplierDTO);
		mav.addObject("list", list);
		
		mav.addObject("display", "/admin/member/supplierView.jsp");
		mav.setViewName("/admin/main/admin");
		
		return mav;
	}
	
	//회원 & 판매자 업데이트: (회원: 포인트 적립, 판매자: 판매상태)
	@RequestMapping("/admin/member/update/{table}")
	public ModelAndView updateMember(@PathVariable String table, String id, String value) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(table.equals("member")) {
			map.put("updateKey", "point");
			map.put("updateValue", Integer.parseInt(value));
			
		} else if(table.equals("supplier")) {
			map.put("updateKey", "status");
			map.put("updateValue", value);
		}
		map.put("table", table);
		map.put("key", "id");
		map.put("value", id);
		
		System.out.println(map);
		memberService.updateByAdmin(map);
		
		if(table.equals("member")) {
			return getMemberList(mav);
			
		} 
		
		return getSupplierList(mav);
		
		
	}
}
