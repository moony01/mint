package mint.member.dao;

import java.util.Map;

import mint.member.bean.MemberDTO;

public interface MemberDAO {
	public void writeMember(MemberDTO memberDTO);

	public MemberDTO getUserBy(Map<String, String> map);

	public void insertAttendance(String id);

	public String getAttDates(String id);
	
	public String findUserBy(Map<Object, Object> map);

	public void updateInfo(Map<String, String> map);

}
