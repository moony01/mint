package mint.member.service;

import mint.member.bean.MemberDTO;

public interface MemberService {

	public void writeMember(MemberDTO memberDTO);

	public MemberDTO getUserById(String id);

}
