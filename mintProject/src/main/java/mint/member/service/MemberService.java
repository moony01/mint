package mint.member.service;

import java.util.List;
import java.util.Map;

import mint.member.bean.MemberDTO;
import mint.member.bean.SupplierDTO;
import mint.product.bean.ProductDTO;

public interface MemberService {

	public void writeMember(Object memberDTO);

	public MemberDTO getUserBy(Map<String, String> map);

	public void insertAttendance(String id);

	public String getAttDates(String id);

	public String findUserBy(Map<Object, Object> map);

	public void updateInfo(Map<String, String> map);

	public void modifyMember(MemberDTO memberDTO);

	public void deleteMember(String id);

	public SupplierDTO getSupplierBy(Map<String, String> map);

	public List<Map<String, String>> getList(Map<String, String> map);

	public List<ProductDTO> getProductList(Map<String, String> map);

	public void updateByAdmin(Map<String, Object> map);

	public void updateProductStatus(Map<String, Object> map);

	public List<Map<String, String>> getMyOrderInfo(Map<String, String> map);

	public List<Map<String, String>> getMyOrderDetails(String orderNumber);

}
