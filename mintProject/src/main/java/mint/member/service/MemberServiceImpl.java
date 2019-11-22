package mint.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.member.bean.MemberDTO;
import mint.member.bean.SupplierDTO;
import mint.member.dao.MemberDAO;
import mint.product.bean.ProductDTO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO; 

	@Override
	public void writeMember(Object memberDTO) {
		memberDAO.writeMember(memberDTO);
		
	}

	@Override
	public MemberDTO getUserBy(Map<String, String> map) {
		return memberDAO.getUserBy(map);
	}

	@Override
	public void insertAttendance(String id) {
		memberDAO.insertAttendance(id);
		
	}

	@Override
	public String getAttDates(String id) {
		return memberDAO.getAttDates(id);
	}
	
	@Override
	public String findUserBy(Map<Object, Object> map) {
		return memberDAO.findUserBy(map);
	}

	@Override
	public void updateInfo(Map<String, String> map) {
		memberDAO.updateInfo(map);
	}

	@Override
	public void modifyMember(MemberDTO memberDTO) {
		memberDAO.modifyMember(memberDTO);
		
	}

	@Override
	public void deleteMember(String id) {
		memberDAO.deleteMember(id);
		
	}

	@Override
	public SupplierDTO getSupplierBy(Map<String, String> map) {
		return memberDAO.getSupplierBy(map);
	}

	@Override
	public List<Map<String, String>> getList(Map<String, String> map) {
		return memberDAO.getList(map);
	}

	@Override
	public List<ProductDTO> getProductList(Map<String, String> map) {
		return memberDAO.getProductList(map);
	}

	@Override
	public void updateByAdmin(Map<String, Object> map) {
		memberDAO.updateByAdmin(map);
		
	}

	@Override
	public void updateProductStatus(Map<String, Object> map) {
		memberDAO.updateProductStatus(map);
		
	}

	@Override
	public List<Map<String, String>> getMyOrderInfo(Map<String, String> map) {
		return memberDAO.getMyOrderInfo(map);
	}

	@Override
	public List<Map<String, String>> getMyOrderDetails(String orderNumber) {
		return memberDAO.getMyOrderDetails(orderNumber);
	}


}
