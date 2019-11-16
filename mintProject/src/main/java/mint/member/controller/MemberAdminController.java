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
	
	// [회원, 판매자] ajax로 리스트 불러오기 ==================================================
	@RequestMapping("/admin/member/{table}/{dateId}/{option}")
	public ModelAndView getList(@PathVariable String table, 
						@PathVariable String dateId, 
						@PathVariable String option, ModelAndView mav) {
		
		System.out.println(table + "/ " + dateId + "/ " + option);
		String orderbyValue = null; 
		
		Map<String, String> map = new HashMap<String, String>();
		orderbyValue = setMapValues(table, option, orderbyValue);
		
		map.put("table", table);
		map.put("orderbyValue", orderbyValue);
		
		List<Map<String, String>> list = memberService.getList(map);
		System.out.println("list<Map>: " + list);
		
		//페이징 처리를 script에서 처리하기 위해 pg, totalArticle, addr 를 함께 싣어 보내준다. 
		//mav.addObject("pg", pg);
		//mav.addObject("totalArticle", totalArticle);
		mav.addObject("addr", "/admin/member/"+table+"List");
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav; 
		/* 기본 
		 * <select id="aa" parameterType="java.util.Map" resultType="">
		 * select * from ${table} order by ${orderbyValue} 
		 * <if test="#{orderbyValue } == '1'">
		 * asc </if>
		 * <if test="#{orderbyValue } == '2'">
		 * desc </if>
		 * 
		 * SMS 동의(Y):
		 * select * from ${table} where ${orderbyValue} = 1;
		 * 
		 * date / id로 검색 조건 추가 시: 
		 * 1) 날짜 검색
		 * select * from ${table} where ${searchOption} in (#{from}, #{to}) order by ${orderbyValue} 
		 * 2) 아이디 검색
		 * select * from ${table} where ${searchOption} like '%'||#{searchValue}||'%' order by ${orderbyValue} 
		 *  
		 * 
		 */

		
		
	}

	private String setMapValues(String table, String option, String orderbyValue) {
		if(table.equals("member")) { 
			if(option.equals("1")) { orderbyValue = "id"; //1 supplierId / id 오름차순
			} else if(option.equals("2")) { orderbyValue = "memLevel"; // 별점 / 회원레벨 내림차순
			} else if(option.equals("3")) { orderbyValue = "isAgreedSMS"; // SMS 동의(Y)인 사람만
			} else if(option.equals("0") || option.equals("4")) {orderbyValue = "logtime";
			}
			
		} else if(table.equals("supplier")) {
			if(option.equals("1")) { orderbyValue = "supplierId";
			} else if(option.equals("2")) { orderbyValue = "star";
			} else if(option.equals("3")) {	orderbyValue = "status"; //status 내림차순 
			} else if(option.equals("0") || option.equals("4")) {	orderbyValue = "logtime"; //logtime 내림차순
			}
		}
		
		return orderbyValue;
		
	}
	
}
