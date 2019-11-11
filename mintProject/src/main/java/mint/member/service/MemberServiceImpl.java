package mint.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.member.bean.MemberDTO;
import mint.member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO; 

	@Override
	public void writeMember(MemberDTO memberDTO) {
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


}
